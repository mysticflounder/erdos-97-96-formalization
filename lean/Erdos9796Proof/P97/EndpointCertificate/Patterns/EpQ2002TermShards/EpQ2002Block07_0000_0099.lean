/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 7:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 7 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_07_0000_0099 : Poly :=
[
  term (-2 : Rat) [(0, 1)],
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0000 : Poly :=
[
  term ((401209262019515221020 : Rat) / 253528477699481291099) []
]

/-- Partial product 0 for generator 7. -/
def ep_Q2_002_partial_07_0000 : Poly :=
[
  term ((-802418524039030442040 : Rat) / 253528477699481291099) [(0, 1)],
  term ((401209262019515221020 : Rat) / 253528477699481291099) [(0, 2)],
  term ((401209262019515221020 : Rat) / 253528477699481291099) [(1, 2)],
  term ((802418524039030442040 : Rat) / 253528477699481291099) [(12, 1)],
  term ((-401209262019515221020 : Rat) / 253528477699481291099) [(12, 2)],
  term ((-401209262019515221020 : Rat) / 253528477699481291099) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 7. -/
theorem ep_Q2_002_partial_07_0000_valid :
    mulPoly ep_Q2_002_coefficient_07_0000
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0001 : Poly :=
[
  term ((-4039742732489230527245195334144 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1)]
]

/-- Partial product 1 for generator 7. -/
def ep_Q2_002_partial_07_0001 : Poly :=
[
  term ((-8079485464978461054490390668288 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (12, 1)],
  term ((4039742732489230527245195334144 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (12, 2)],
  term ((4039742732489230527245195334144 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (13, 2)],
  term ((-4039742732489230527245195334144 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 3), (5, 1)],
  term ((8079485464978461054490390668288 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (5, 1)],
  term ((-4039742732489230527245195334144 : Rat) / 1273790490336191187829975377157) [(0, 3), (1, 1), (5, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 7. -/
theorem ep_Q2_002_partial_07_0001_valid :
    mulPoly ep_Q2_002_coefficient_07_0001
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0002 : Poly :=
[
  term ((2534889949687781117878988436096 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1)]
]

/-- Partial product 2 for generator 7. -/
def ep_Q2_002_partial_07_0002 : Poly :=
[
  term ((5069779899375562235757976872192 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (12, 1)],
  term ((-2534889949687781117878988436096 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (12, 2)],
  term ((-2534889949687781117878988436096 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (13, 2)],
  term ((2534889949687781117878988436096 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 3), (7, 1)],
  term ((-5069779899375562235757976872192 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (7, 1)],
  term ((2534889949687781117878988436096 : Rat) / 1273790490336191187829975377157) [(0, 3), (1, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 7. -/
theorem ep_Q2_002_partial_07_0002_valid :
    mulPoly ep_Q2_002_coefficient_07_0002
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0003 : Poly :=
[
  term ((-5492601301641450569041159359264 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1)]
]

/-- Partial product 3 for generator 7. -/
def ep_Q2_002_partial_07_0003 : Poly :=
[
  term ((-10985202603282901138082318718528 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1), (12, 1)],
  term ((5492601301641450569041159359264 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1), (12, 2)],
  term ((5492601301641450569041159359264 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1), (13, 2)],
  term ((-5492601301641450569041159359264 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 3), (9, 1)],
  term ((10985202603282901138082318718528 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (9, 1)],
  term ((-5492601301641450569041159359264 : Rat) / 1273790490336191187829975377157) [(0, 3), (1, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 7. -/
theorem ep_Q2_002_partial_07_0003_valid :
    mulPoly ep_Q2_002_coefficient_07_0003
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0004 : Poly :=
[
  term ((-89672609289557259039953945717232 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1)]
]

/-- Partial product 4 for generator 7. -/
def ep_Q2_002_partial_07_0004 : Poly :=
[
  term ((-179345218579114518079907891434464 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1), (12, 1)],
  term ((89672609289557259039953945717232 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1), (12, 2)],
  term ((89672609289557259039953945717232 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1), (13, 2)],
  term ((-89672609289557259039953945717232 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 3), (11, 1)],
  term ((179345218579114518079907891434464 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (11, 1)],
  term ((-89672609289557259039953945717232 : Rat) / 1273790490336191187829975377157) [(0, 3), (1, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 7. -/
theorem ep_Q2_002_partial_07_0004_valid :
    mulPoly ep_Q2_002_coefficient_07_0004
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0005 : Poly :=
[
  term ((183546321707023842294576772754112 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (13, 1)]
]

/-- Partial product 5 for generator 7. -/
def ep_Q2_002_partial_07_0005 : Poly :=
[
  term ((367092643414047684589153545508224 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (12, 1), (13, 1)],
  term ((-183546321707023842294576772754112 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (12, 2), (13, 1)],
  term ((-183546321707023842294576772754112 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (13, 3)],
  term ((183546321707023842294576772754112 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 3), (13, 1)],
  term ((-367092643414047684589153545508224 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (13, 1)],
  term ((183546321707023842294576772754112 : Rat) / 1273790490336191187829975377157) [(0, 3), (1, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 7. -/
theorem ep_Q2_002_partial_07_0005_valid :
    mulPoly ep_Q2_002_coefficient_07_0005
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0006 : Poly :=
[
  term ((33601647908133130266888822718232221921104 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 6 for generator 7. -/
def ep_Q2_002_partial_07_0006 : Poly :=
[
  term ((67203295816266260533777645436464443842208 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (1, 1), (12, 1), (15, 1)],
  term ((-33601647908133130266888822718232221921104 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (1, 1), (12, 2), (15, 1)],
  term ((-33601647908133130266888822718232221921104 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (1, 1), (13, 2), (15, 1)],
  term ((33601647908133130266888822718232221921104 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (1, 3), (15, 1)],
  term ((-67203295816266260533777645436464443842208 : Rat) / 103601401347717117429703636119532782115) [(0, 2), (1, 1), (15, 1)],
  term ((33601647908133130266888822718232221921104 : Rat) / 103601401347717117429703636119532782115) [(0, 3), (1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 7. -/
theorem ep_Q2_002_partial_07_0006_valid :
    mulPoly ep_Q2_002_coefficient_07_0006
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0007 : Poly :=
[
  term ((71427522016 : Rat) / 7401317245) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 7. -/
def ep_Q2_002_partial_07_0007 : Poly :=
[
  term ((142855044032 : Rat) / 7401317245) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-71427522016 : Rat) / 7401317245) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-71427522016 : Rat) / 7401317245) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((71427522016 : Rat) / 7401317245) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term ((-142855044032 : Rat) / 7401317245) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((71427522016 : Rat) / 7401317245) [(0, 3), (1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 7. -/
theorem ep_Q2_002_partial_07_0007_valid :
    mulPoly ep_Q2_002_coefficient_07_0007
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0008 : Poly :=
[
  term ((6439181915715762621857499195456 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2)]
]

/-- Partial product 8 for generator 7. -/
def ep_Q2_002_partial_07_0008 : Poly :=
[
  term ((12878363831431525243714998390912 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (12, 1)],
  term ((-6439181915715762621857499195456 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (12, 2)],
  term ((-6439181915715762621857499195456 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (13, 2)],
  term ((6439181915715762621857499195456 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 4)],
  term ((-12878363831431525243714998390912 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 2)],
  term ((6439181915715762621857499195456 : Rat) / 1273790490336191187829975377157) [(0, 3), (1, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 7. -/
theorem ep_Q2_002_partial_07_0008_valid :
    mulPoly ep_Q2_002_coefficient_07_0008
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0009 : Poly :=
[
  term ((57114633522836183706024143868288 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 1)]
]

/-- Partial product 9 for generator 7. -/
def ep_Q2_002_partial_07_0009 : Poly :=
[
  term ((57114633522836183706024143868288 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (5, 1), (11, 1)],
  term ((114229267045672367412048287736576 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 1), (12, 1)],
  term ((-57114633522836183706024143868288 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 1), (12, 2)],
  term ((-57114633522836183706024143868288 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 1), (13, 2)],
  term ((-114229267045672367412048287736576 : Rat) / 1273790490336191187829975377157) [(0, 2), (5, 1), (11, 1)],
  term ((57114633522836183706024143868288 : Rat) / 1273790490336191187829975377157) [(0, 3), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 7. -/
theorem ep_Q2_002_partial_07_0009_valid :
    mulPoly ep_Q2_002_coefficient_07_0009
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0010 : Poly :=
[
  term ((-107557550883815516796500102186496 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (13, 1)]
]

/-- Partial product 10 for generator 7. -/
def ep_Q2_002_partial_07_0010 : Poly :=
[
  term ((-107557550883815516796500102186496 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (5, 1), (13, 1)],
  term ((-215115101767631033593000204372992 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (12, 1), (13, 1)],
  term ((107557550883815516796500102186496 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (12, 2), (13, 1)],
  term ((107557550883815516796500102186496 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (13, 3)],
  term ((215115101767631033593000204372992 : Rat) / 1273790490336191187829975377157) [(0, 2), (5, 1), (13, 1)],
  term ((-107557550883815516796500102186496 : Rat) / 1273790490336191187829975377157) [(0, 3), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 7. -/
theorem ep_Q2_002_partial_07_0010_valid :
    mulPoly ep_Q2_002_coefficient_07_0010
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0011 : Poly :=
[
  term ((735124433572387104387134023322073147961728 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 11 for generator 7. -/
def ep_Q2_002_partial_07_0011 : Poly :=
[
  term ((735124433572387104387134023322073147961728 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 2), (5, 1), (15, 1)],
  term ((1470248867144774208774268046644146295923456 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((-735124433572387104387134023322073147961728 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (12, 2), (15, 1)],
  term ((-735124433572387104387134023322073147961728 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (13, 2), (15, 1)],
  term ((-1470248867144774208774268046644146295923456 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (5, 1), (15, 1)],
  term ((735124433572387104387134023322073147961728 : Rat) / 1346818217520322526586147269553926167495) [(0, 3), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 7. -/
theorem ep_Q2_002_partial_07_0011_valid :
    mulPoly ep_Q2_002_coefficient_07_0011
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0012 : Poly :=
[
  term ((-17222453536 : Rat) / 7401317245) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 7. -/
def ep_Q2_002_partial_07_0012 : Poly :=
[
  term ((-17222453536 : Rat) / 7401317245) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-34444907072 : Rat) / 7401317245) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((17222453536 : Rat) / 7401317245) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((17222453536 : Rat) / 7401317245) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((34444907072 : Rat) / 7401317245) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-17222453536 : Rat) / 7401317245) [(0, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 7. -/
theorem ep_Q2_002_partial_07_0012_valid :
    mulPoly ep_Q2_002_coefficient_07_0012
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0013 : Poly :=
[
  term ((-35838745208392855232790833172192 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 13 for generator 7. -/
def ep_Q2_002_partial_07_0013 : Poly :=
[
  term ((-35838745208392855232790833172192 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (7, 1), (11, 1)],
  term ((-71677490416785710465581666344384 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((35838745208392855232790833172192 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1), (12, 2)],
  term ((35838745208392855232790833172192 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1), (13, 2)],
  term ((71677490416785710465581666344384 : Rat) / 1273790490336191187829975377157) [(0, 2), (7, 1), (11, 1)],
  term ((-35838745208392855232790833172192 : Rat) / 1273790490336191187829975377157) [(0, 3), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 7. -/
theorem ep_Q2_002_partial_07_0013_valid :
    mulPoly ep_Q2_002_coefficient_07_0013
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0014 : Poly :=
[
  term ((67491068813784397620094809377664 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 14 for generator 7. -/
def ep_Q2_002_partial_07_0014 : Poly :=
[
  term ((67491068813784397620094809377664 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (7, 1), (13, 1)],
  term ((134982137627568795240189618755328 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term ((-67491068813784397620094809377664 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (12, 2), (13, 1)],
  term ((-67491068813784397620094809377664 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (13, 3)],
  term ((-134982137627568795240189618755328 : Rat) / 1273790490336191187829975377157) [(0, 2), (7, 1), (13, 1)],
  term ((67491068813784397620094809377664 : Rat) / 1273790490336191187829975377157) [(0, 3), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 7. -/
theorem ep_Q2_002_partial_07_0014_valid :
    mulPoly ep_Q2_002_coefficient_07_0014
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0015 : Poly :=
[
  term ((660713555419972994318477863829433249304368 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 15 for generator 7. -/
def ep_Q2_002_partial_07_0015 : Poly :=
[
  term ((660713555419972994318477863829433249304368 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term ((1321427110839945988636955727658866498608736 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((-660713555419972994318477863829433249304368 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((-660713555419972994318477863829433249304368 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (13, 2), (15, 1)],
  term ((-1321427110839945988636955727658866498608736 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (7, 1), (15, 1)],
  term ((660713555419972994318477863829433249304368 : Rat) / 1346818217520322526586147269553926167495) [(0, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 7. -/
theorem ep_Q2_002_partial_07_0015_valid :
    mulPoly ep_Q2_002_coefficient_07_0015
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0016 : Poly :=
[
  term ((41983667284 : Rat) / 7401317245) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 7. -/
def ep_Q2_002_partial_07_0016 : Poly :=
[
  term ((41983667284 : Rat) / 7401317245) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((83967334568 : Rat) / 7401317245) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-41983667284 : Rat) / 7401317245) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-41983667284 : Rat) / 7401317245) [(0, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-83967334568 : Rat) / 7401317245) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((41983667284 : Rat) / 7401317245) [(0, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 7. -/
theorem ep_Q2_002_partial_07_0016_valid :
    mulPoly ep_Q2_002_coefficient_07_0016
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0017 : Poly :=
[
  term ((77655417981778808216619892293528 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 17 for generator 7. -/
def ep_Q2_002_partial_07_0017 : Poly :=
[
  term ((77655417981778808216619892293528 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (9, 1), (11, 1)],
  term ((155310835963557616433239784587056 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((-77655417981778808216619892293528 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (12, 2)],
  term ((-77655417981778808216619892293528 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (13, 2)],
  term ((-155310835963557616433239784587056 : Rat) / 1273790490336191187829975377157) [(0, 2), (9, 1), (11, 1)],
  term ((77655417981778808216619892293528 : Rat) / 1273790490336191187829975377157) [(0, 3), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 7. -/
theorem ep_Q2_002_partial_07_0017_valid :
    mulPoly ep_Q2_002_coefficient_07_0017
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0018 : Poly :=
[
  term ((-146239694729715460668287334228576 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 18 for generator 7. -/
def ep_Q2_002_partial_07_0018 : Poly :=
[
  term ((-146239694729715460668287334228576 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (9, 1), (13, 1)],
  term ((-292479389459430921336574668457152 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((146239694729715460668287334228576 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (12, 2), (13, 1)],
  term ((146239694729715460668287334228576 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (13, 3)],
  term ((292479389459430921336574668457152 : Rat) / 1273790490336191187829975377157) [(0, 2), (9, 1), (13, 1)],
  term ((-146239694729715460668287334228576 : Rat) / 1273790490336191187829975377157) [(0, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 7. -/
theorem ep_Q2_002_partial_07_0018_valid :
    mulPoly ep_Q2_002_coefficient_07_0018
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0019 : Poly :=
[
  term ((-772971510407633498736441043559074658111472 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 19 for generator 7. -/
def ep_Q2_002_partial_07_0019 : Poly :=
[
  term ((-772971510407633498736441043559074658111472 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((-1545943020815266997472882087118149316222944 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((772971510407633498736441043559074658111472 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((772971510407633498736441043559074658111472 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (13, 2), (15, 1)],
  term ((1545943020815266997472882087118149316222944 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (9, 1), (15, 1)],
  term ((-772971510407633498736441043559074658111472 : Rat) / 1346818217520322526586147269553926167495) [(0, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 7. -/
theorem ep_Q2_002_partial_07_0019_valid :
    mulPoly ep_Q2_002_coefficient_07_0019
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0020 : Poly :=
[
  term ((-69832201566 : Rat) / 7401317245) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 7. -/
def ep_Q2_002_partial_07_0020 : Poly :=
[
  term ((-69832201566 : Rat) / 7401317245) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-139664403132 : Rat) / 7401317245) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((69832201566 : Rat) / 7401317245) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((69832201566 : Rat) / 7401317245) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((139664403132 : Rat) / 7401317245) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-69832201566 : Rat) / 7401317245) [(0, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 7. -/
theorem ep_Q2_002_partial_07_0020_valid :
    mulPoly ep_Q2_002_coefficient_07_0020
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0021 : Poly :=
[
  term ((-134766769211008818673805283151296 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 21 for generator 7. -/
def ep_Q2_002_partial_07_0021 : Poly :=
[
  term ((-134766769211008818673805283151296 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((-269533538422017637347610566302592 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((134766769211008818673805283151296 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((134766769211008818673805283151296 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 3)],
  term ((269533538422017637347610566302592 : Rat) / 1273790490336191187829975377157) [(0, 2), (11, 1), (13, 1)],
  term ((-134766769211008818673805283151296 : Rat) / 1273790490336191187829975377157) [(0, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 7. -/
theorem ep_Q2_002_partial_07_0021_valid :
    mulPoly ep_Q2_002_coefficient_07_0021
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0022 : Poly :=
[
  term ((1163595390451560844393720997712545675160624 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 22 for generator 7. -/
def ep_Q2_002_partial_07_0022 : Poly :=
[
  term ((1163595390451560844393720997712545675160624 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((2327190780903121688787441995425091350321248 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1163595390451560844393720997712545675160624 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((-1163595390451560844393720997712545675160624 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (13, 2), (15, 1)],
  term ((-2327190780903121688787441995425091350321248 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (11, 1), (15, 1)],
  term ((1163595390451560844393720997712545675160624 : Rat) / 1346818217520322526586147269553926167495) [(0, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 7. -/
theorem ep_Q2_002_partial_07_0022_valid :
    mulPoly ep_Q2_002_coefficient_07_0022
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0023 : Poly :=
[
  term ((39443926462 : Rat) / 7401317245) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 7. -/
def ep_Q2_002_partial_07_0023 : Poly :=
[
  term ((39443926462 : Rat) / 7401317245) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((78887852924 : Rat) / 7401317245) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-39443926462 : Rat) / 7401317245) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-39443926462 : Rat) / 7401317245) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-78887852924 : Rat) / 7401317245) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((39443926462 : Rat) / 7401317245) [(0, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 7. -/
theorem ep_Q2_002_partial_07_0023_valid :
    mulPoly ep_Q2_002_coefficient_07_0023
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0024 : Poly :=
[
  term ((-135028704725573384111185361520 : Rat) / 8907625806546791523286541099) [(0, 1), (11, 2)]
]

/-- Partial product 24 for generator 7. -/
def ep_Q2_002_partial_07_0024 : Poly :=
[
  term ((-135028704725573384111185361520 : Rat) / 8907625806546791523286541099) [(0, 1), (1, 2), (11, 2)],
  term ((-270057409451146768222370723040 : Rat) / 8907625806546791523286541099) [(0, 1), (11, 2), (12, 1)],
  term ((135028704725573384111185361520 : Rat) / 8907625806546791523286541099) [(0, 1), (11, 2), (12, 2)],
  term ((135028704725573384111185361520 : Rat) / 8907625806546791523286541099) [(0, 1), (11, 2), (13, 2)],
  term ((270057409451146768222370723040 : Rat) / 8907625806546791523286541099) [(0, 2), (11, 2)],
  term ((-135028704725573384111185361520 : Rat) / 8907625806546791523286541099) [(0, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 7. -/
theorem ep_Q2_002_partial_07_0024_valid :
    mulPoly ep_Q2_002_coefficient_07_0024
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0025 : Poly :=
[
  term ((-1761970040619034839634056235276550192619816 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 25 for generator 7. -/
def ep_Q2_002_partial_07_0025 : Poly :=
[
  term ((-1761970040619034839634056235276550192619816 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((-3523940081238069679268112470553100385239632 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((1761970040619034839634056235276550192619816 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((1761970040619034839634056235276550192619816 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (13, 3), (15, 1)],
  term ((3523940081238069679268112470553100385239632 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (13, 1), (15, 1)],
  term ((-1761970040619034839634056235276550192619816 : Rat) / 1346818217520322526586147269553926167495) [(0, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 7. -/
theorem ep_Q2_002_partial_07_0025_valid :
    mulPoly ep_Q2_002_coefficient_07_0025
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0026 : Poly :=
[
  term ((70790263182 : Rat) / 7401317245) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 7. -/
def ep_Q2_002_partial_07_0026 : Poly :=
[
  term ((70790263182 : Rat) / 7401317245) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((141580526364 : Rat) / 7401317245) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-70790263182 : Rat) / 7401317245) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-70790263182 : Rat) / 7401317245) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term ((-141580526364 : Rat) / 7401317245) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((70790263182 : Rat) / 7401317245) [(0, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 7. -/
theorem ep_Q2_002_partial_07_0026_valid :
    mulPoly ep_Q2_002_coefficient_07_0026
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0027 : Poly :=
[
  term ((322268763567877964014842740662272 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2)]
]

/-- Partial product 27 for generator 7. -/
def ep_Q2_002_partial_07_0027 : Poly :=
[
  term ((322268763567877964014842740662272 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (13, 2)],
  term ((644537527135755928029685481324544 : Rat) / 1273790490336191187829975377157) [(0, 1), (12, 1), (13, 2)],
  term ((-322268763567877964014842740662272 : Rat) / 1273790490336191187829975377157) [(0, 1), (12, 2), (13, 2)],
  term ((-322268763567877964014842740662272 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 4)],
  term ((-644537527135755928029685481324544 : Rat) / 1273790490336191187829975377157) [(0, 2), (13, 2)],
  term ((322268763567877964014842740662272 : Rat) / 1273790490336191187829975377157) [(0, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 7. -/
theorem ep_Q2_002_partial_07_0027_valid :
    mulPoly ep_Q2_002_coefficient_07_0027
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0028 : Poly :=
[
  term ((1058352100917003998010495843637268340384264 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (15, 2)]
]

/-- Partial product 28 for generator 7. -/
def ep_Q2_002_partial_07_0028 : Poly :=
[
  term ((1058352100917003998010495843637268340384264 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 2), (15, 2)],
  term ((2116704201834007996020991687274536680768528 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (12, 1), (15, 2)],
  term ((-1058352100917003998010495843637268340384264 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (12, 2), (15, 2)],
  term ((-1058352100917003998010495843637268340384264 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (13, 2), (15, 2)],
  term ((-2116704201834007996020991687274536680768528 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (15, 2)],
  term ((1058352100917003998010495843637268340384264 : Rat) / 1346818217520322526586147269553926167495) [(0, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 7. -/
theorem ep_Q2_002_partial_07_0028_valid :
    mulPoly ep_Q2_002_coefficient_07_0028
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0029 : Poly :=
[
  term ((-42093590768 : Rat) / 7401317245) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 29 for generator 7. -/
def ep_Q2_002_partial_07_0029 : Poly :=
[
  term ((-42093590768 : Rat) / 7401317245) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((-84187181536 : Rat) / 7401317245) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((42093590768 : Rat) / 7401317245) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((42093590768 : Rat) / 7401317245) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((84187181536 : Rat) / 7401317245) [(0, 2), (15, 2), (16, 1)],
  term ((-42093590768 : Rat) / 7401317245) [(0, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 7. -/
theorem ep_Q2_002_partial_07_0029_valid :
    mulPoly ep_Q2_002_coefficient_07_0029
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0030 : Poly :=
[
  term ((-55190523055791048575059754208 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1)]
]

/-- Partial product 30 for generator 7. -/
def ep_Q2_002_partial_07_0030 : Poly :=
[
  term ((110381046111582097150119508416 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 1), (3, 1)],
  term ((-55190523055791048575059754208 : Rat) / 97983883872014706756151952089) [(0, 2), (1, 1), (3, 1)],
  term ((-110381046111582097150119508416 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (12, 1)],
  term ((55190523055791048575059754208 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (12, 2)],
  term ((55190523055791048575059754208 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (13, 2)],
  term ((-55190523055791048575059754208 : Rat) / 97983883872014706756151952089) [(1, 3), (3, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 7. -/
theorem ep_Q2_002_partial_07_0030_valid :
    mulPoly ep_Q2_002_coefficient_07_0030
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0031 : Poly :=
[
  term ((4935125640031359600506654782848 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1)]
]

/-- Partial product 31 for generator 7. -/
def ep_Q2_002_partial_07_0031 : Poly :=
[
  term ((-9870251280062719201013309565696 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (4, 1), (7, 1)],
  term ((4935125640031359600506654782848 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (4, 1), (7, 1)],
  term ((9870251280062719201013309565696 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (12, 1)],
  term ((-4935125640031359600506654782848 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (12, 2)],
  term ((-4935125640031359600506654782848 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (13, 2)],
  term ((4935125640031359600506654782848 : Rat) / 1273790490336191187829975377157) [(1, 3), (4, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 7. -/
theorem ep_Q2_002_partial_07_0031_valid :
    mulPoly ep_Q2_002_coefficient_07_0031
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0032 : Poly :=
[
  term ((2421270169913058464854566069600 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1)]
]

/-- Partial product 32 for generator 7. -/
def ep_Q2_002_partial_07_0032 : Poly :=
[
  term ((-4842540339826116929709132139200 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (4, 1), (9, 1)],
  term ((2421270169913058464854566069600 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (4, 1), (9, 1)],
  term ((4842540339826116929709132139200 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (12, 1)],
  term ((-2421270169913058464854566069600 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (12, 2)],
  term ((-2421270169913058464854566069600 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (13, 2)],
  term ((2421270169913058464854566069600 : Rat) / 1273790490336191187829975377157) [(1, 3), (4, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 7. -/
theorem ep_Q2_002_partial_07_0032_valid :
    mulPoly ep_Q2_002_coefficient_07_0032
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0033 : Poly :=
[
  term ((54834331379730455630786545916016 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1)]
]

/-- Partial product 33 for generator 7. -/
def ep_Q2_002_partial_07_0033 : Poly :=
[
  term ((-109668662759460911261573091832032 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (4, 1), (11, 1)],
  term ((54834331379730455630786545916016 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (4, 1), (11, 1)],
  term ((109668662759460911261573091832032 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (12, 1)],
  term ((-54834331379730455630786545916016 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (12, 2)],
  term ((-54834331379730455630786545916016 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (13, 2)],
  term ((54834331379730455630786545916016 : Rat) / 1273790490336191187829975377157) [(1, 3), (4, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 7. -/
theorem ep_Q2_002_partial_07_0033_valid :
    mulPoly ep_Q2_002_coefficient_07_0033
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0034 : Poly :=
[
  term ((-100490463835593717521424112278912 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (13, 1)]
]

/-- Partial product 34 for generator 7. -/
def ep_Q2_002_partial_07_0034 : Poly :=
[
  term ((200980927671187435042848224557824 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (4, 1), (13, 1)],
  term ((-100490463835593717521424112278912 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (4, 1), (13, 1)],
  term ((-200980927671187435042848224557824 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (12, 1), (13, 1)],
  term ((100490463835593717521424112278912 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (12, 2), (13, 1)],
  term ((100490463835593717521424112278912 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (13, 3)],
  term ((-100490463835593717521424112278912 : Rat) / 1273790490336191187829975377157) [(1, 3), (4, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 7. -/
theorem ep_Q2_002_partial_07_0034_valid :
    mulPoly ep_Q2_002_coefficient_07_0034
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0035 : Poly :=
[
  term ((-3844345053764790772032286535463219668736 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (4, 1), (15, 1)]
]

/-- Partial product 35 for generator 7. -/
def ep_Q2_002_partial_07_0035 : Poly :=
[
  term ((7688690107529581544064573070926439337472 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (1, 1), (4, 1), (15, 1)],
  term ((-3844345053764790772032286535463219668736 : Rat) / 103601401347717117429703636119532782115) [(0, 2), (1, 1), (4, 1), (15, 1)],
  term ((-7688690107529581544064573070926439337472 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (4, 1), (12, 1), (15, 1)],
  term ((3844345053764790772032286535463219668736 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (4, 1), (12, 2), (15, 1)],
  term ((3844345053764790772032286535463219668736 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (4, 1), (13, 2), (15, 1)],
  term ((-3844345053764790772032286535463219668736 : Rat) / 103601401347717117429703636119532782115) [(1, 3), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 7. -/
theorem ep_Q2_002_partial_07_0035_valid :
    mulPoly ep_Q2_002_coefficient_07_0035
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0036 : Poly :=
[
  term ((-35406196444 : Rat) / 7401317245) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 7. -/
def ep_Q2_002_partial_07_0036 : Poly :=
[
  term ((70812392888 : Rat) / 7401317245) [(0, 1), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((-35406196444 : Rat) / 7401317245) [(0, 2), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((-70812392888 : Rat) / 7401317245) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((35406196444 : Rat) / 7401317245) [(1, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((35406196444 : Rat) / 7401317245) [(1, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((-35406196444 : Rat) / 7401317245) [(1, 3), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 7. -/
theorem ep_Q2_002_partial_07_0036_valid :
    mulPoly ep_Q2_002_coefficient_07_0036
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0037 : Poly :=
[
  term ((6296679030432472048948395236592 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1)]
]

/-- Partial product 37 for generator 7. -/
def ep_Q2_002_partial_07_0037 : Poly :=
[
  term ((-12593358060864944097896790473184 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1)],
  term ((6296679030432472048948395236592 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (5, 1)],
  term ((12593358060864944097896790473184 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 1)],
  term ((-6296679030432472048948395236592 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 2)],
  term ((-6296679030432472048948395236592 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (13, 2)],
  term ((6296679030432472048948395236592 : Rat) / 1273790490336191187829975377157) [(1, 3), (5, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 7. -/
theorem ep_Q2_002_partial_07_0037_valid :
    mulPoly ep_Q2_002_coefficient_07_0037
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0038 : Poly :=
[
  term ((-2421270169913058464854566069600 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1)]
]

/-- Partial product 38 for generator 7. -/
def ep_Q2_002_partial_07_0038 : Poly :=
[
  term ((4842540339826116929709132139200 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (8, 1)],
  term ((-2421270169913058464854566069600 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (5, 1), (8, 1)],
  term ((-4842540339826116929709132139200 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (12, 1)],
  term ((2421270169913058464854566069600 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (12, 2)],
  term ((2421270169913058464854566069600 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (13, 2)],
  term ((-2421270169913058464854566069600 : Rat) / 1273790490336191187829975377157) [(1, 3), (5, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 7. -/
theorem ep_Q2_002_partial_07_0038_valid :
    mulPoly ep_Q2_002_coefficient_07_0038
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0039 : Poly :=
[
  term ((-1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 1)]
]

/-- Partial product 39 for generator 7. -/
def ep_Q2_002_partial_07_0039 : Poly :=
[
  term ((3679740337410575686854633771648 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (12, 1)],
  term ((-1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (5, 1), (12, 1)],
  term ((1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 1), (13, 2)],
  term ((-3679740337410575686854633771648 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 2)],
  term ((1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 3)],
  term ((-1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 3), (5, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 7. -/
theorem ep_Q2_002_partial_07_0039_valid :
    mulPoly ep_Q2_002_coefficient_07_0039
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0040 : Poly :=
[
  term ((-1204603110221925235828014603456 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1)]
]

/-- Partial product 40 for generator 7. -/
def ep_Q2_002_partial_07_0040 : Poly :=
[
  term ((2409206220443850471656029206912 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (6, 1), (9, 1)],
  term ((-1204603110221925235828014603456 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (6, 1), (9, 1)],
  term ((-2409206220443850471656029206912 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (12, 1)],
  term ((1204603110221925235828014603456 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (12, 2)],
  term ((1204603110221925235828014603456 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (13, 2)],
  term ((-1204603110221925235828014603456 : Rat) / 1273790490336191187829975377157) [(1, 3), (6, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 7. -/
theorem ep_Q2_002_partial_07_0040_valid :
    mulPoly ep_Q2_002_coefficient_07_0040
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0041 : Poly :=
[
  term ((2369240377868390092774574468352 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1)]
]

/-- Partial product 41 for generator 7. -/
def ep_Q2_002_partial_07_0041 : Poly :=
[
  term ((-4738480755736780185549148936704 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (6, 1), (11, 1)],
  term ((2369240377868390092774574468352 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (6, 1), (11, 1)],
  term ((4738480755736780185549148936704 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1), (12, 1)],
  term ((-2369240377868390092774574468352 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1), (12, 2)],
  term ((-2369240377868390092774574468352 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1), (13, 2)],
  term ((2369240377868390092774574468352 : Rat) / 1273790490336191187829975377157) [(1, 3), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 7. -/
theorem ep_Q2_002_partial_07_0041_valid :
    mulPoly ep_Q2_002_coefficient_07_0041
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0042 : Poly :=
[
  term ((-46748993949986447489493479162688 : Rat) / 268063527727966972480841957465) [(1, 1), (6, 1), (15, 1)]
]

/-- Partial product 42 for generator 7. -/
def ep_Q2_002_partial_07_0042 : Poly :=
[
  term ((93497987899972894978986958325376 : Rat) / 268063527727966972480841957465) [(0, 1), (1, 1), (6, 1), (15, 1)],
  term ((-46748993949986447489493479162688 : Rat) / 268063527727966972480841957465) [(0, 2), (1, 1), (6, 1), (15, 1)],
  term ((-93497987899972894978986958325376 : Rat) / 268063527727966972480841957465) [(1, 1), (6, 1), (12, 1), (15, 1)],
  term ((46748993949986447489493479162688 : Rat) / 268063527727966972480841957465) [(1, 1), (6, 1), (12, 2), (15, 1)],
  term ((46748993949986447489493479162688 : Rat) / 268063527727966972480841957465) [(1, 1), (6, 1), (13, 2), (15, 1)],
  term ((-46748993949986447489493479162688 : Rat) / 268063527727966972480841957465) [(1, 3), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 7. -/
theorem ep_Q2_002_partial_07_0042_valid :
    mulPoly ep_Q2_002_coefficient_07_0042
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0043 : Poly :=
[
  term ((-6274221872 : Rat) / 7401317245) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 7. -/
def ep_Q2_002_partial_07_0043 : Poly :=
[
  term ((12548443744 : Rat) / 7401317245) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-6274221872 : Rat) / 7401317245) [(0, 2), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-12548443744 : Rat) / 7401317245) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((6274221872 : Rat) / 7401317245) [(1, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((6274221872 : Rat) / 7401317245) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-6274221872 : Rat) / 7401317245) [(1, 3), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 7. -/
theorem ep_Q2_002_partial_07_0043_valid :
    mulPoly ep_Q2_002_coefficient_07_0043
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0044 : Poly :=
[
  term ((3538120905891652180976192523744 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1)]
]

/-- Partial product 44 for generator 7. -/
def ep_Q2_002_partial_07_0044 : Poly :=
[
  term ((-7076241811783304361952385047488 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1)],
  term ((3538120905891652180976192523744 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (7, 1)],
  term ((7076241811783304361952385047488 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 1)],
  term ((-3538120905891652180976192523744 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 2)],
  term ((-3538120905891652180976192523744 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (13, 2)],
  term ((3538120905891652180976192523744 : Rat) / 1273790490336191187829975377157) [(1, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 7. -/
theorem ep_Q2_002_partial_07_0044_valid :
    mulPoly ep_Q2_002_coefficient_07_0044
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0045 : Poly :=
[
  term ((-93577763173818043520220058752 : Rat) / 8907625806546791523286541099) [(1, 1), (7, 1), (8, 1)]
]

/-- Partial product 45 for generator 7. -/
def ep_Q2_002_partial_07_0045 : Poly :=
[
  term ((187155526347636087040440117504 : Rat) / 8907625806546791523286541099) [(0, 1), (1, 1), (7, 1), (8, 1)],
  term ((-93577763173818043520220058752 : Rat) / 8907625806546791523286541099) [(0, 2), (1, 1), (7, 1), (8, 1)],
  term ((-187155526347636087040440117504 : Rat) / 8907625806546791523286541099) [(1, 1), (7, 1), (8, 1), (12, 1)],
  term ((93577763173818043520220058752 : Rat) / 8907625806546791523286541099) [(1, 1), (7, 1), (8, 1), (12, 2)],
  term ((93577763173818043520220058752 : Rat) / 8907625806546791523286541099) [(1, 1), (7, 1), (8, 1), (13, 2)],
  term ((-93577763173818043520220058752 : Rat) / 8907625806546791523286541099) [(1, 3), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 7. -/
theorem ep_Q2_002_partial_07_0045_valid :
    mulPoly ep_Q2_002_coefficient_07_0045
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0046 : Poly :=
[
  term ((-169522660793611944107149069918776 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1)]
]

/-- Partial product 46 for generator 7. -/
def ep_Q2_002_partial_07_0046 : Poly :=
[
  term ((339045321587223888214298139837552 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 1), (11, 1)],
  term ((-169522660793611944107149069918776 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (8, 1), (11, 1)],
  term ((-339045321587223888214298139837552 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (12, 1)],
  term ((169522660793611944107149069918776 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (12, 2)],
  term ((169522660793611944107149069918776 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (13, 2)],
  term ((-169522660793611944107149069918776 : Rat) / 1273790490336191187829975377157) [(1, 3), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 7. -/
theorem ep_Q2_002_partial_07_0046_valid :
    mulPoly ep_Q2_002_coefficient_07_0046
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0047 : Poly :=
[
  term ((314812110558928514194686508976160 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (13, 1)]
]

/-- Partial product 47 for generator 7. -/
def ep_Q2_002_partial_07_0047 : Poly :=
[
  term ((-629624221117857028389373017952320 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 1), (13, 1)],
  term ((314812110558928514194686508976160 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (8, 1), (13, 1)],
  term ((629624221117857028389373017952320 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (12, 1), (13, 1)],
  term ((-314812110558928514194686508976160 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (12, 2), (13, 1)],
  term ((-314812110558928514194686508976160 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (13, 3)],
  term ((314812110558928514194686508976160 : Rat) / 1273790490336191187829975377157) [(1, 3), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 7. -/
theorem ep_Q2_002_partial_07_0047_valid :
    mulPoly ep_Q2_002_coefficient_07_0047
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0048 : Poly :=
[
  term ((280457968271685969858884321806534349618688 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 48 for generator 7. -/
def ep_Q2_002_partial_07_0048 : Poly :=
[
  term ((-560915936543371939717768643613068699237376 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (8, 1), (15, 1)],
  term ((280457968271685969858884321806534349618688 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (1, 1), (8, 1), (15, 1)],
  term ((560915936543371939717768643613068699237376 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (12, 1), (15, 1)],
  term ((-280457968271685969858884321806534349618688 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (12, 2), (15, 1)],
  term ((-280457968271685969858884321806534349618688 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (13, 2), (15, 1)],
  term ((280457968271685969858884321806534349618688 : Rat) / 1346818217520322526586147269553926167495) [(1, 3), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 7. -/
theorem ep_Q2_002_partial_07_0048_valid :
    mulPoly ep_Q2_002_coefficient_07_0048
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0049 : Poly :=
[
  term ((114574781274 : Rat) / 7401317245) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 7. -/
def ep_Q2_002_partial_07_0049 : Poly :=
[
  term ((-229149562548 : Rat) / 7401317245) [(0, 1), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((114574781274 : Rat) / 7401317245) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((229149562548 : Rat) / 7401317245) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-114574781274 : Rat) / 7401317245) [(1, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-114574781274 : Rat) / 7401317245) [(1, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((114574781274 : Rat) / 7401317245) [(1, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 7. -/
theorem ep_Q2_002_partial_07_0049_valid :
    mulPoly ep_Q2_002_coefficient_07_0049
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0050 : Poly :=
[
  term ((1269396019031954352912486130560 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1)]
]

/-- Partial product 50 for generator 7. -/
def ep_Q2_002_partial_07_0050 : Poly :=
[
  term ((-2538792038063908705824972261120 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1)],
  term ((1269396019031954352912486130560 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (9, 1)],
  term ((2538792038063908705824972261120 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 1)],
  term ((-1269396019031954352912486130560 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 2)],
  term ((-1269396019031954352912486130560 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (13, 2)],
  term ((1269396019031954352912486130560 : Rat) / 1273790490336191187829975377157) [(1, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 7. -/
theorem ep_Q2_002_partial_07_0050_valid :
    mulPoly ep_Q2_002_coefficient_07_0050
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0051 : Poly :=
[
  term ((40680097002920104030943652672 : Rat) / 115799135485108289802725034287) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 51 for generator 7. -/
def ep_Q2_002_partial_07_0051 : Poly :=
[
  term ((-81360194005840208061887305344 : Rat) / 115799135485108289802725034287) [(0, 1), (1, 1), (9, 1), (12, 1)],
  term ((40680097002920104030943652672 : Rat) / 115799135485108289802725034287) [(0, 2), (1, 1), (9, 1), (12, 1)],
  term ((-40680097002920104030943652672 : Rat) / 115799135485108289802725034287) [(1, 1), (9, 1), (12, 1), (13, 2)],
  term ((81360194005840208061887305344 : Rat) / 115799135485108289802725034287) [(1, 1), (9, 1), (12, 2)],
  term ((-40680097002920104030943652672 : Rat) / 115799135485108289802725034287) [(1, 1), (9, 1), (12, 3)],
  term ((40680097002920104030943652672 : Rat) / 115799135485108289802725034287) [(1, 3), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 7. -/
theorem ep_Q2_002_partial_07_0051_valid :
    mulPoly ep_Q2_002_coefficient_07_0051
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0052 : Poly :=
[
  term ((6358592813412618086399458764372 : Rat) / 97983883872014706756151952089) [(1, 1), (11, 1)]
]

/-- Partial product 52 for generator 7. -/
def ep_Q2_002_partial_07_0052 : Poly :=
[
  term ((-12717185626825236172798917528744 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 1), (11, 1)],
  term ((6358592813412618086399458764372 : Rat) / 97983883872014706756151952089) [(0, 2), (1, 1), (11, 1)],
  term ((12717185626825236172798917528744 : Rat) / 97983883872014706756151952089) [(1, 1), (11, 1), (12, 1)],
  term ((-6358592813412618086399458764372 : Rat) / 97983883872014706756151952089) [(1, 1), (11, 1), (12, 2)],
  term ((-6358592813412618086399458764372 : Rat) / 97983883872014706756151952089) [(1, 1), (11, 1), (13, 2)],
  term ((6358592813412618086399458764372 : Rat) / 97983883872014706756151952089) [(1, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 7. -/
theorem ep_Q2_002_partial_07_0052_valid :
    mulPoly ep_Q2_002_coefficient_07_0052
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0053 : Poly :=
[
  term ((109246983329997493839458513754864 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 53 for generator 7. -/
def ep_Q2_002_partial_07_0053 : Poly :=
[
  term ((-218493966659994987678917027509728 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1), (12, 1)],
  term ((109246983329997493839458513754864 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (11, 1), (12, 1)],
  term ((-109246983329997493839458513754864 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((218493966659994987678917027509728 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 2)],
  term ((-109246983329997493839458513754864 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 3)],
  term ((109246983329997493839458513754864 : Rat) / 1273790490336191187829975377157) [(1, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 7. -/
theorem ep_Q2_002_partial_07_0053_valid :
    mulPoly ep_Q2_002_coefficient_07_0053
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0054 : Poly :=
[
  term ((-15482369628179068790637272035008 : Rat) / 97983883872014706756151952089) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 54 for generator 7. -/
def ep_Q2_002_partial_07_0054 : Poly :=
[
  term ((30964739256358137581274544070016 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 1), (12, 1), (13, 1)],
  term ((-15482369628179068790637272035008 : Rat) / 97983883872014706756151952089) [(0, 2), (1, 1), (12, 1), (13, 1)],
  term ((15482369628179068790637272035008 : Rat) / 97983883872014706756151952089) [(1, 1), (12, 1), (13, 3)],
  term ((-30964739256358137581274544070016 : Rat) / 97983883872014706756151952089) [(1, 1), (12, 2), (13, 1)],
  term ((15482369628179068790637272035008 : Rat) / 97983883872014706756151952089) [(1, 1), (12, 3), (13, 1)],
  term ((-15482369628179068790637272035008 : Rat) / 97983883872014706756151952089) [(1, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 7. -/
theorem ep_Q2_002_partial_07_0054_valid :
    mulPoly ep_Q2_002_coefficient_07_0054
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0055 : Poly :=
[
  term ((888889340807001521095994285144650178871504 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 55 for generator 7. -/
def ep_Q2_002_partial_07_0055 : Poly :=
[
  term ((-1777778681614003042191988570289300357743008 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (12, 1), (15, 1)],
  term ((888889340807001521095994285144650178871504 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (1, 1), (12, 1), (15, 1)],
  term ((-888889340807001521095994285144650178871504 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((1777778681614003042191988570289300357743008 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 2), (15, 1)],
  term ((-888889340807001521095994285144650178871504 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 3), (15, 1)],
  term ((888889340807001521095994285144650178871504 : Rat) / 1346818217520322526586147269553926167495) [(1, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 7. -/
theorem ep_Q2_002_partial_07_0055_valid :
    mulPoly ep_Q2_002_coefficient_07_0055
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0056 : Poly :=
[
  term ((-43688758928 : Rat) / 7401317245) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 56 for generator 7. -/
def ep_Q2_002_partial_07_0056 : Poly :=
[
  term ((87377517856 : Rat) / 7401317245) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-43688758928 : Rat) / 7401317245) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((43688758928 : Rat) / 7401317245) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-87377517856 : Rat) / 7401317245) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((43688758928 : Rat) / 7401317245) [(1, 1), (12, 3), (15, 1), (16, 1)],
  term ((-43688758928 : Rat) / 7401317245) [(1, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 7. -/
theorem ep_Q2_002_partial_07_0056_valid :
    mulPoly ep_Q2_002_coefficient_07_0056
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0057 : Poly :=
[
  term ((-162962095404509309207357826459600 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1)]
]

/-- Partial product 57 for generator 7. -/
def ep_Q2_002_partial_07_0057 : Poly :=
[
  term ((325924190809018618414715652919200 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (13, 1)],
  term ((-162962095404509309207357826459600 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (13, 1)],
  term ((-325924190809018618414715652919200 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 1)],
  term ((162962095404509309207357826459600 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 2), (13, 1)],
  term ((162962095404509309207357826459600 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 3)],
  term ((-162962095404509309207357826459600 : Rat) / 1273790490336191187829975377157) [(1, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 7. -/
theorem ep_Q2_002_partial_07_0057_valid :
    mulPoly ep_Q2_002_coefficient_07_0057
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0058 : Poly :=
[
  term ((-98520618286321506099973507211419195531368 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (15, 1)]
]

/-- Partial product 58 for generator 7. -/
def ep_Q2_002_partial_07_0058 : Poly :=
[
  term ((197041236572643012199947014422838391062736 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (1, 1), (15, 1)],
  term ((-98520618286321506099973507211419195531368 : Rat) / 269363643504064505317229453910785233499) [(0, 2), (1, 1), (15, 1)],
  term ((-197041236572643012199947014422838391062736 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (12, 1), (15, 1)],
  term ((98520618286321506099973507211419195531368 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (12, 2), (15, 1)],
  term ((98520618286321506099973507211419195531368 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (13, 2), (15, 1)],
  term ((-98520618286321506099973507211419195531368 : Rat) / 269363643504064505317229453910785233499) [(1, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 7. -/
theorem ep_Q2_002_partial_07_0058_valid :
    mulPoly ep_Q2_002_coefficient_07_0058
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0059 : Poly :=
[
  term ((-13738840293 : Rat) / 1480263449) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 59 for generator 7. -/
def ep_Q2_002_partial_07_0059 : Poly :=
[
  term ((27477680586 : Rat) / 1480263449) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term ((-13738840293 : Rat) / 1480263449) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-27477680586 : Rat) / 1480263449) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((13738840293 : Rat) / 1480263449) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((13738840293 : Rat) / 1480263449) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-13738840293 : Rat) / 1480263449) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 7. -/
theorem ep_Q2_002_partial_07_0059_valid :
    mulPoly ep_Q2_002_coefficient_07_0059
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0060 : Poly :=
[
  term ((-6005291608358768717865779177136 : Rat) / 1273790490336191187829975377157) [(1, 2)]
]

/-- Partial product 60 for generator 7. -/
def ep_Q2_002_partial_07_0060 : Poly :=
[
  term ((12010583216717537435731558354272 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2)],
  term ((-6005291608358768717865779177136 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 2)],
  term ((-12010583216717537435731558354272 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1)],
  term ((6005291608358768717865779177136 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 2)],
  term ((6005291608358768717865779177136 : Rat) / 1273790490336191187829975377157) [(1, 2), (13, 2)],
  term ((-6005291608358768717865779177136 : Rat) / 1273790490336191187829975377157) [(1, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 7. -/
theorem ep_Q2_002_partial_07_0060_valid :
    mulPoly ep_Q2_002_coefficient_07_0060
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0061 : Poly :=
[
  term ((-295647249531632379195468479808 : Rat) / 97983883872014706756151952089) [(1, 2), (4, 1)]
]

/-- Partial product 61 for generator 7. -/
def ep_Q2_002_partial_07_0061 : Poly :=
[
  term ((591294499063264758390936959616 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 2), (4, 1)],
  term ((-295647249531632379195468479808 : Rat) / 97983883872014706756151952089) [(0, 2), (1, 2), (4, 1)],
  term ((-591294499063264758390936959616 : Rat) / 97983883872014706756151952089) [(1, 2), (4, 1), (12, 1)],
  term ((295647249531632379195468479808 : Rat) / 97983883872014706756151952089) [(1, 2), (4, 1), (12, 2)],
  term ((295647249531632379195468479808 : Rat) / 97983883872014706756151952089) [(1, 2), (4, 1), (13, 2)],
  term ((-295647249531632379195468479808 : Rat) / 97983883872014706756151952089) [(1, 4), (4, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 7. -/
theorem ep_Q2_002_partial_07_0061_valid :
    mulPoly ep_Q2_002_coefficient_07_0061
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0062 : Poly :=
[
  term ((11840801818686022289390980276128 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1)]
]

/-- Partial product 62 for generator 7. -/
def ep_Q2_002_partial_07_0062 : Poly :=
[
  term ((-23681603637372044578781960552256 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (8, 1)],
  term ((11840801818686022289390980276128 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 2), (8, 1)],
  term ((23681603637372044578781960552256 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (12, 1)],
  term ((-11840801818686022289390980276128 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (12, 2)],
  term ((-11840801818686022289390980276128 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (13, 2)],
  term ((11840801818686022289390980276128 : Rat) / 1273790490336191187829975377157) [(1, 4), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 7. -/
theorem ep_Q2_002_partial_07_0062_valid :
    mulPoly ep_Q2_002_coefficient_07_0062
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0063 : Poly :=
[
  term ((-581500691241191803372687643712 : Rat) / 97983883872014706756151952089) [(1, 2), (12, 1)]
]

/-- Partial product 63 for generator 7. -/
def ep_Q2_002_partial_07_0063 : Poly :=
[
  term ((1163001382482383606745375287424 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 2), (12, 1)],
  term ((-581500691241191803372687643712 : Rat) / 97983883872014706756151952089) [(0, 2), (1, 2), (12, 1)],
  term ((581500691241191803372687643712 : Rat) / 97983883872014706756151952089) [(1, 2), (12, 1), (13, 2)],
  term ((-1163001382482383606745375287424 : Rat) / 97983883872014706756151952089) [(1, 2), (12, 2)],
  term ((581500691241191803372687643712 : Rat) / 97983883872014706756151952089) [(1, 2), (12, 3)],
  term ((-581500691241191803372687643712 : Rat) / 97983883872014706756151952089) [(1, 4), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 7. -/
theorem ep_Q2_002_partial_07_0063_valid :
    mulPoly ep_Q2_002_coefficient_07_0063
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0064 : Poly :=
[
  term ((780293871912683753772467533416 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1)]
]

/-- Partial product 64 for generator 7. -/
def ep_Q2_002_partial_07_0064 : Poly :=
[
  term ((-1560587743825367507544935066832 : Rat) / 97983883872014706756151952089) [(0, 1), (3, 1), (11, 1)],
  term ((780293871912683753772467533416 : Rat) / 97983883872014706756151952089) [(0, 2), (3, 1), (11, 1)],
  term ((780293871912683753772467533416 : Rat) / 97983883872014706756151952089) [(1, 2), (3, 1), (11, 1)],
  term ((1560587743825367507544935066832 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (12, 1)],
  term ((-780293871912683753772467533416 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (12, 2)],
  term ((-780293871912683753772467533416 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 7. -/
theorem ep_Q2_002_partial_07_0064_valid :
    mulPoly ep_Q2_002_coefficient_07_0064
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0065 : Poly :=
[
  term ((-1469439487850719028929345402272 : Rat) / 97983883872014706756151952089) [(3, 1), (13, 1)]
]

/-- Partial product 65 for generator 7. -/
def ep_Q2_002_partial_07_0065 : Poly :=
[
  term ((2938878975701438057858690804544 : Rat) / 97983883872014706756151952089) [(0, 1), (3, 1), (13, 1)],
  term ((-1469439487850719028929345402272 : Rat) / 97983883872014706756151952089) [(0, 2), (3, 1), (13, 1)],
  term ((-1469439487850719028929345402272 : Rat) / 97983883872014706756151952089) [(1, 2), (3, 1), (13, 1)],
  term ((-2938878975701438057858690804544 : Rat) / 97983883872014706756151952089) [(3, 1), (12, 1), (13, 1)],
  term ((1469439487850719028929345402272 : Rat) / 97983883872014706756151952089) [(3, 1), (12, 2), (13, 1)],
  term ((1469439487850719028929345402272 : Rat) / 97983883872014706756151952089) [(3, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 7. -/
theorem ep_Q2_002_partial_07_0065_valid :
    mulPoly ep_Q2_002_coefficient_07_0065
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0066 : Poly :=
[
  term ((-107469766542164024938768326390821195803032 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (15, 1)]
]

/-- Partial product 66 for generator 7. -/
def ep_Q2_002_partial_07_0066 : Poly :=
[
  term ((214939533084328049877536652781642391606064 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 1), (15, 1)],
  term ((-107469766542164024938768326390821195803032 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (3, 1), (15, 1)],
  term ((-107469766542164024938768326390821195803032 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (3, 1), (15, 1)],
  term ((-214939533084328049877536652781642391606064 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (15, 1)],
  term ((107469766542164024938768326390821195803032 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 2), (15, 1)],
  term ((107469766542164024938768326390821195803032 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 7. -/
theorem ep_Q2_002_partial_07_0066_valid :
    mulPoly ep_Q2_002_coefficient_07_0066
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0067 : Poly :=
[
  term ((-9465368576 : Rat) / 7401317245) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 67 for generator 7. -/
def ep_Q2_002_partial_07_0067 : Poly :=
[
  term ((18930737152 : Rat) / 7401317245) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((-9465368576 : Rat) / 7401317245) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-9465368576 : Rat) / 7401317245) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-18930737152 : Rat) / 7401317245) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((9465368576 : Rat) / 7401317245) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((9465368576 : Rat) / 7401317245) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 7. -/
theorem ep_Q2_002_partial_07_0067_valid :
    mulPoly ep_Q2_002_coefficient_07_0067
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0068 : Poly :=
[
  term ((-69773723473192706345602896465696 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1)]
]

/-- Partial product 68 for generator 7. -/
def ep_Q2_002_partial_07_0068 : Poly :=
[
  term ((139547446946385412691205792931392 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (7, 1), (11, 1)],
  term ((-69773723473192706345602896465696 : Rat) / 1273790490336191187829975377157) [(0, 2), (4, 1), (7, 1), (11, 1)],
  term ((-69773723473192706345602896465696 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (7, 1), (11, 1)],
  term ((-139547446946385412691205792931392 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (12, 1)],
  term ((69773723473192706345602896465696 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (12, 2)],
  term ((69773723473192706345602896465696 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 7. -/
theorem ep_Q2_002_partial_07_0068_valid :
    mulPoly ep_Q2_002_coefficient_07_0068
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0069 : Poly :=
[
  term ((131396987950917900706007340412032 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 1)]
]

/-- Partial product 69 for generator 7. -/
def ep_Q2_002_partial_07_0069 : Poly :=
[
  term ((-262793975901835801412014680824064 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (7, 1), (13, 1)],
  term ((131396987950917900706007340412032 : Rat) / 1273790490336191187829975377157) [(0, 2), (4, 1), (7, 1), (13, 1)],
  term ((131396987950917900706007340412032 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (7, 1), (13, 1)],
  term ((262793975901835801412014680824064 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (12, 1), (13, 1)],
  term ((-131396987950917900706007340412032 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (12, 2), (13, 1)],
  term ((-131396987950917900706007340412032 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 7. -/
theorem ep_Q2_002_partial_07_0069_valid :
    mulPoly ep_Q2_002_coefficient_07_0069
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0070 : Poly :=
[
  term ((-14627876544464773848291636365666342162304 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 70 for generator 7. -/
def ep_Q2_002_partial_07_0070 : Poly :=
[
  term ((29255753088929547696583272731332684324608 : Rat) / 20720280269543423485940727223906556423) [(0, 1), (4, 1), (7, 1), (15, 1)],
  term ((-14627876544464773848291636365666342162304 : Rat) / 20720280269543423485940727223906556423) [(0, 2), (4, 1), (7, 1), (15, 1)],
  term ((-14627876544464773848291636365666342162304 : Rat) / 20720280269543423485940727223906556423) [(1, 2), (4, 1), (7, 1), (15, 1)],
  term ((-29255753088929547696583272731332684324608 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (7, 1), (12, 1), (15, 1)],
  term ((14627876544464773848291636365666342162304 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (7, 1), (12, 2), (15, 1)],
  term ((14627876544464773848291636365666342162304 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 7. -/
theorem ep_Q2_002_partial_07_0070_valid :
    mulPoly ep_Q2_002_coefficient_07_0070
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0071 : Poly :=
[
  term ((521212696 : Rat) / 211466207) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 71 for generator 7. -/
def ep_Q2_002_partial_07_0071 : Poly :=
[
  term ((-1042425392 : Rat) / 211466207) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((521212696 : Rat) / 211466207) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((521212696 : Rat) / 211466207) [(1, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((1042425392 : Rat) / 211466207) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-521212696 : Rat) / 211466207) [(4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-521212696 : Rat) / 211466207) [(4, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 7. -/
theorem ep_Q2_002_partial_07_0071_valid :
    mulPoly ep_Q2_002_coefficient_07_0071
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0072 : Poly :=
[
  term ((-34232367646131608217947215264200 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1)]
]

/-- Partial product 72 for generator 7. -/
def ep_Q2_002_partial_07_0072 : Poly :=
[
  term ((68464735292263216435894430528400 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (9, 1), (11, 1)],
  term ((-34232367646131608217947215264200 : Rat) / 1273790490336191187829975377157) [(0, 2), (4, 1), (9, 1), (11, 1)],
  term ((-34232367646131608217947215264200 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (9, 1), (11, 1)],
  term ((-68464735292263216435894430528400 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (12, 1)],
  term ((34232367646131608217947215264200 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (12, 2)],
  term ((34232367646131608217947215264200 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 7. -/
theorem ep_Q2_002_partial_07_0072_valid :
    mulPoly ep_Q2_002_coefficient_07_0072
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0073 : Poly :=
[
  term ((64465959034826407080272042906400 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 73 for generator 7. -/
def ep_Q2_002_partial_07_0073 : Poly :=
[
  term ((-128931918069652814160544085812800 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (9, 1), (13, 1)],
  term ((64465959034826407080272042906400 : Rat) / 1273790490336191187829975377157) [(0, 2), (4, 1), (9, 1), (13, 1)],
  term ((64465959034826407080272042906400 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (9, 1), (13, 1)],
  term ((128931918069652814160544085812800 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (12, 1), (13, 1)],
  term ((-64465959034826407080272042906400 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (12, 2), (13, 1)],
  term ((-64465959034826407080272042906400 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 7. -/
theorem ep_Q2_002_partial_07_0073_valid :
    mulPoly ep_Q2_002_coefficient_07_0073
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0074 : Poly :=
[
  term ((-513717708087051109202160798007224978931536 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 74 for generator 7. -/
def ep_Q2_002_partial_07_0074 : Poly :=
[
  term ((1027435416174102218404321596014449957863072 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (4, 1), (9, 1), (15, 1)],
  term ((-513717708087051109202160798007224978931536 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (4, 1), (9, 1), (15, 1)],
  term ((-513717708087051109202160798007224978931536 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (4, 1), (9, 1), (15, 1)],
  term ((-1027435416174102218404321596014449957863072 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (12, 1), (15, 1)],
  term ((513717708087051109202160798007224978931536 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (12, 2), (15, 1)],
  term ((513717708087051109202160798007224978931536 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 7. -/
theorem ep_Q2_002_partial_07_0074_valid :
    mulPoly ep_Q2_002_coefficient_07_0074
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0075 : Poly :=
[
  term ((7916040642 : Rat) / 7401317245) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 75 for generator 7. -/
def ep_Q2_002_partial_07_0075 : Poly :=
[
  term ((-15832081284 : Rat) / 7401317245) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((7916040642 : Rat) / 7401317245) [(0, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((7916040642 : Rat) / 7401317245) [(1, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((15832081284 : Rat) / 7401317245) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7916040642 : Rat) / 7401317245) [(4, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-7916040642 : Rat) / 7401317245) [(4, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 7. -/
theorem ep_Q2_002_partial_07_0075_valid :
    mulPoly ep_Q2_002_coefficient_07_0075
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0076 : Poly :=
[
  term ((-12821768913210962450566722448176 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 76 for generator 7. -/
def ep_Q2_002_partial_07_0076 : Poly :=
[
  term ((25643537826421924901133444896352 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (11, 1), (13, 1)],
  term ((-12821768913210962450566722448176 : Rat) / 1273790490336191187829975377157) [(0, 2), (4, 1), (11, 1), (13, 1)],
  term ((-12821768913210962450566722448176 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (11, 1), (13, 1)],
  term ((-25643537826421924901133444896352 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (12, 1), (13, 1)],
  term ((12821768913210962450566722448176 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (12, 2), (13, 1)],
  term ((12821768913210962450566722448176 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 7. -/
theorem ep_Q2_002_partial_07_0076_valid :
    mulPoly ep_Q2_002_coefficient_07_0076
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0077 : Poly :=
[
  term ((132247820406544088246652410290744464464352 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 77 for generator 7. -/
def ep_Q2_002_partial_07_0077 : Poly :=
[
  term ((-264495640813088176493304820581488928928704 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (4, 1), (11, 1), (15, 1)],
  term ((132247820406544088246652410290744464464352 : Rat) / 269363643504064505317229453910785233499) [(0, 2), (4, 1), (11, 1), (15, 1)],
  term ((132247820406544088246652410290744464464352 : Rat) / 269363643504064505317229453910785233499) [(1, 2), (4, 1), (11, 1), (15, 1)],
  term ((264495640813088176493304820581488928928704 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-132247820406544088246652410290744464464352 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (11, 1), (12, 2), (15, 1)],
  term ((-132247820406544088246652410290744464464352 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 7. -/
theorem ep_Q2_002_partial_07_0077_valid :
    mulPoly ep_Q2_002_coefficient_07_0077
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0078 : Poly :=
[
  term ((3649061966 : Rat) / 1480263449) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 78 for generator 7. -/
def ep_Q2_002_partial_07_0078 : Poly :=
[
  term ((-7298123932 : Rat) / 1480263449) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((3649061966 : Rat) / 1480263449) [(0, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((3649061966 : Rat) / 1480263449) [(1, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((7298123932 : Rat) / 1480263449) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3649061966 : Rat) / 1480263449) [(4, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3649061966 : Rat) / 1480263449) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 7. -/
theorem ep_Q2_002_partial_07_0078_valid :
    mulPoly ep_Q2_002_coefficient_07_0078
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0079 : Poly :=
[
  term ((-7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2)]
]

/-- Partial product 79 for generator 7. -/
def ep_Q2_002_partial_07_0079 : Poly :=
[
  term ((14008864293390933964005499264032 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (11, 2)],
  term ((-7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(0, 2), (4, 1), (11, 2)],
  term ((-7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (11, 2)],
  term ((-14008864293390933964005499264032 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2), (12, 1)],
  term ((7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2), (12, 2)],
  term ((7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 7. -/
theorem ep_Q2_002_partial_07_0079_valid :
    mulPoly ep_Q2_002_coefficient_07_0079
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0080 : Poly :=
[
  term ((-359945959089606894337366244743523050118976 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 80 for generator 7. -/
def ep_Q2_002_partial_07_0080 : Poly :=
[
  term ((719891918179213788674732489487046100237952 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (4, 1), (13, 1), (15, 1)],
  term ((-359945959089606894337366244743523050118976 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (4, 1), (13, 1), (15, 1)],
  term ((-359945959089606894337366244743523050118976 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (4, 1), (13, 1), (15, 1)],
  term ((-719891918179213788674732489487046100237952 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((359945959089606894337366244743523050118976 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (12, 2), (13, 1), (15, 1)],
  term ((359945959089606894337366244743523050118976 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 7. -/
theorem ep_Q2_002_partial_07_0080_valid :
    mulPoly ep_Q2_002_coefficient_07_0080
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0081 : Poly :=
[
  term ((14304889212 : Rat) / 7401317245) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 81 for generator 7. -/
def ep_Q2_002_partial_07_0081 : Poly :=
[
  term ((-28609778424 : Rat) / 7401317245) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((14304889212 : Rat) / 7401317245) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((14304889212 : Rat) / 7401317245) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((28609778424 : Rat) / 7401317245) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14304889212 : Rat) / 7401317245) [(4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14304889212 : Rat) / 7401317245) [(4, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 7. -/
theorem ep_Q2_002_partial_07_0081_valid :
    mulPoly ep_Q2_002_coefficient_07_0081
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0082 : Poly :=
[
  term ((48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2)]
]

/-- Partial product 82 for generator 7. -/
def ep_Q2_002_partial_07_0082 : Poly :=
[
  term ((-97972540527695988759115675151232 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (13, 2)],
  term ((48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(0, 2), (4, 1), (13, 2)],
  term ((48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (13, 2)],
  term ((97972540527695988759115675151232 : Rat) / 1273790490336191187829975377157) [(4, 1), (12, 1), (13, 2)],
  term ((-48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(4, 1), (12, 2), (13, 2)],
  term ((-48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 7. -/
theorem ep_Q2_002_partial_07_0082_valid :
    mulPoly ep_Q2_002_coefficient_07_0082
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0083 : Poly :=
[
  term ((1397783652909974648009941616571108605306256 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (15, 2)]
]

/-- Partial product 83 for generator 7. -/
def ep_Q2_002_partial_07_0083 : Poly :=
[
  term ((-2795567305819949296019883233142217210612512 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (4, 1), (15, 2)],
  term ((1397783652909974648009941616571108605306256 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (4, 1), (15, 2)],
  term ((1397783652909974648009941616571108605306256 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (4, 1), (15, 2)],
  term ((2795567305819949296019883233142217210612512 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (12, 1), (15, 2)],
  term ((-1397783652909974648009941616571108605306256 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (12, 2), (15, 2)],
  term ((-1397783652909974648009941616571108605306256 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 7. -/
theorem ep_Q2_002_partial_07_0083_valid :
    mulPoly ep_Q2_002_coefficient_07_0083
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0084 : Poly :=
[
  term ((-53748272602 : Rat) / 7401317245) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 84 for generator 7. -/
def ep_Q2_002_partial_07_0084 : Poly :=
[
  term ((107496545204 : Rat) / 7401317245) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((-53748272602 : Rat) / 7401317245) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((-53748272602 : Rat) / 7401317245) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((-107496545204 : Rat) / 7401317245) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((53748272602 : Rat) / 7401317245) [(4, 1), (12, 2), (15, 2), (16, 1)],
  term ((53748272602 : Rat) / 7401317245) [(4, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 7. -/
theorem ep_Q2_002_partial_07_0084_valid :
    mulPoly ep_Q2_002_coefficient_07_0084
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0085 : Poly :=
[
  term ((34232367646131608217947215264200 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 1)]
]

/-- Partial product 85 for generator 7. -/
def ep_Q2_002_partial_07_0085 : Poly :=
[
  term ((-68464735292263216435894430528400 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (8, 1), (11, 1)],
  term ((34232367646131608217947215264200 : Rat) / 1273790490336191187829975377157) [(0, 2), (5, 1), (8, 1), (11, 1)],
  term ((34232367646131608217947215264200 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (8, 1), (11, 1)],
  term ((68464735292263216435894430528400 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 1), (12, 1)],
  term ((-34232367646131608217947215264200 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 1), (12, 2)],
  term ((-34232367646131608217947215264200 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 7. -/
theorem ep_Q2_002_partial_07_0085_valid :
    mulPoly ep_Q2_002_coefficient_07_0085
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0086 : Poly :=
[
  term ((-64465959034826407080272042906400 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (13, 1)]
]

/-- Partial product 86 for generator 7. -/
def ep_Q2_002_partial_07_0086 : Poly :=
[
  term ((128931918069652814160544085812800 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (8, 1), (13, 1)],
  term ((-64465959034826407080272042906400 : Rat) / 1273790490336191187829975377157) [(0, 2), (5, 1), (8, 1), (13, 1)],
  term ((-64465959034826407080272042906400 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (8, 1), (13, 1)],
  term ((-128931918069652814160544085812800 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (12, 1), (13, 1)],
  term ((64465959034826407080272042906400 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (12, 2), (13, 1)],
  term ((64465959034826407080272042906400 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 7. -/
theorem ep_Q2_002_partial_07_0086_valid :
    mulPoly ep_Q2_002_coefficient_07_0086
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0087 : Poly :=
[
  term ((513717708087051109202160798007224978931536 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 87 for generator 7. -/
def ep_Q2_002_partial_07_0087 : Poly :=
[
  term ((-1027435416174102218404321596014449957863072 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (8, 1), (15, 1)],
  term ((513717708087051109202160798007224978931536 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (5, 1), (8, 1), (15, 1)],
  term ((513717708087051109202160798007224978931536 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (5, 1), (8, 1), (15, 1)],
  term ((1027435416174102218404321596014449957863072 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-513717708087051109202160798007224978931536 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (12, 2), (15, 1)],
  term ((-513717708087051109202160798007224978931536 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 7. -/
theorem ep_Q2_002_partial_07_0087_valid :
    mulPoly ep_Q2_002_coefficient_07_0087
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0088 : Poly :=
[
  term ((-7916040642 : Rat) / 7401317245) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 88 for generator 7. -/
def ep_Q2_002_partial_07_0088 : Poly :=
[
  term ((15832081284 : Rat) / 7401317245) [(0, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-7916040642 : Rat) / 7401317245) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-7916040642 : Rat) / 7401317245) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-15832081284 : Rat) / 7401317245) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((7916040642 : Rat) / 7401317245) [(5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((7916040642 : Rat) / 7401317245) [(5, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 7. -/
theorem ep_Q2_002_partial_07_0088_valid :
    mulPoly ep_Q2_002_coefficient_07_0088
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0089 : Poly :=
[
  term ((-89023618346230131892148018385684 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1)]
]

/-- Partial product 89 for generator 7. -/
def ep_Q2_002_partial_07_0089 : Poly :=
[
  term ((178047236692460263784296036771368 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 1)],
  term ((-89023618346230131892148018385684 : Rat) / 1273790490336191187829975377157) [(0, 2), (5, 1), (11, 1)],
  term ((-89023618346230131892148018385684 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (11, 1)],
  term ((-178047236692460263784296036771368 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 1)],
  term ((89023618346230131892148018385684 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 2)],
  term ((89023618346230131892148018385684 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 7. -/
theorem ep_Q2_002_partial_07_0089_valid :
    mulPoly ep_Q2_002_coefficient_07_0089
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0090 : Poly :=
[
  term ((26012426378065509144228434721648 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 90 for generator 7. -/
def ep_Q2_002_partial_07_0090 : Poly :=
[
  term ((-52024852756131018288456869443296 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 1), (12, 1)],
  term ((26012426378065509144228434721648 : Rat) / 1273790490336191187829975377157) [(0, 2), (5, 1), (11, 1), (12, 1)],
  term ((26012426378065509144228434721648 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (11, 1), (12, 1)],
  term ((-26012426378065509144228434721648 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 1), (13, 2)],
  term ((52024852756131018288456869443296 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 2)],
  term ((-26012426378065509144228434721648 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 7. -/
theorem ep_Q2_002_partial_07_0090_valid :
    mulPoly ep_Q2_002_coefficient_07_0090
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0091 : Poly :=
[
  term ((-48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 91 for generator 7. -/
def ep_Q2_002_partial_07_0091 : Poly :=
[
  term ((97972540527695988759115675151232 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (12, 1), (13, 1)],
  term ((-48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(0, 2), (5, 1), (12, 1), (13, 1)],
  term ((-48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (12, 1), (13, 1)],
  term ((48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 1), (13, 3)],
  term ((-97972540527695988759115675151232 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 2), (13, 1)],
  term ((48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 7. -/
theorem ep_Q2_002_partial_07_0091_valid :
    mulPoly ep_Q2_002_coefficient_07_0091
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0092 : Poly :=
[
  term ((74470755625268217210323397620905239206496 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 92 for generator 7. -/
def ep_Q2_002_partial_07_0092 : Poly :=
[
  term ((-148941511250536434420646795241810478412992 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((74470755625268217210323397620905239206496 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (5, 1), (12, 1), (15, 1)],
  term ((74470755625268217210323397620905239206496 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (5, 1), (12, 1), (15, 1)],
  term ((-74470755625268217210323397620905239206496 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (12, 1), (13, 2), (15, 1)],
  term ((148941511250536434420646795241810478412992 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (12, 2), (15, 1)],
  term ((-74470755625268217210323397620905239206496 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 7. -/
theorem ep_Q2_002_partial_07_0092_valid :
    mulPoly ep_Q2_002_coefficient_07_0092
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0093 : Poly :=
[
  term ((-14304889212 : Rat) / 7401317245) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 93 for generator 7. -/
def ep_Q2_002_partial_07_0093 : Poly :=
[
  term ((28609778424 : Rat) / 7401317245) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-14304889212 : Rat) / 7401317245) [(0, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-14304889212 : Rat) / 7401317245) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((14304889212 : Rat) / 7401317245) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-28609778424 : Rat) / 7401317245) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((14304889212 : Rat) / 7401317245) [(5, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 7. -/
theorem ep_Q2_002_partial_07_0093_valid :
    mulPoly ep_Q2_002_coefficient_07_0093
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0094 : Poly :=
[
  term ((167648144959339993698785149454928 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1)]
]

/-- Partial product 94 for generator 7. -/
def ep_Q2_002_partial_07_0094 : Poly :=
[
  term ((-335296289918679987397570298909856 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (13, 1)],
  term ((167648144959339993698785149454928 : Rat) / 1273790490336191187829975377157) [(0, 2), (5, 1), (13, 1)],
  term ((167648144959339993698785149454928 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (13, 1)],
  term ((335296289918679987397570298909856 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 1), (13, 1)],
  term ((-167648144959339993698785149454928 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 2), (13, 1)],
  term ((-167648144959339993698785149454928 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 7. -/
theorem ep_Q2_002_partial_07_0094_valid :
    mulPoly ep_Q2_002_coefficient_07_0094
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0095 : Poly :=
[
  term ((-826244674922083507696550043601457968290348 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (15, 1)]
]

/-- Partial product 95 for generator 7. -/
def ep_Q2_002_partial_07_0095 : Poly :=
[
  term ((1652489349844167015393100087202915936580696 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (15, 1)],
  term ((-826244674922083507696550043601457968290348 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (5, 1), (15, 1)],
  term ((-826244674922083507696550043601457968290348 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (5, 1), (15, 1)],
  term ((-1652489349844167015393100087202915936580696 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (12, 1), (15, 1)],
  term ((826244674922083507696550043601457968290348 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (12, 2), (15, 1)],
  term ((826244674922083507696550043601457968290348 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 7. -/
theorem ep_Q2_002_partial_07_0095_valid :
    mulPoly ep_Q2_002_coefficient_07_0095
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0096 : Poly :=
[
  term ((34944584196 : Rat) / 7401317245) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 96 for generator 7. -/
def ep_Q2_002_partial_07_0096 : Poly :=
[
  term ((-69889168392 : Rat) / 7401317245) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((34944584196 : Rat) / 7401317245) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((34944584196 : Rat) / 7401317245) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((69889168392 : Rat) / 7401317245) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-34944584196 : Rat) / 7401317245) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-34944584196 : Rat) / 7401317245) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 7. -/
theorem ep_Q2_002_partial_07_0096_valid :
    mulPoly ep_Q2_002_coefficient_07_0096
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0097 : Poly :=
[
  term ((-534945682692686961360 : Rat) / 253528477699481291099) [(6, 1)]
]

/-- Partial product 97 for generator 7. -/
def ep_Q2_002_partial_07_0097 : Poly :=
[
  term ((1069891365385373922720 : Rat) / 253528477699481291099) [(0, 1), (6, 1)],
  term ((-534945682692686961360 : Rat) / 253528477699481291099) [(0, 2), (6, 1)],
  term ((-534945682692686961360 : Rat) / 253528477699481291099) [(1, 2), (6, 1)],
  term ((-1069891365385373922720 : Rat) / 253528477699481291099) [(6, 1), (12, 1)],
  term ((534945682692686961360 : Rat) / 253528477699481291099) [(6, 1), (12, 2)],
  term ((534945682692686961360 : Rat) / 253528477699481291099) [(6, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 7. -/
theorem ep_Q2_002_partial_07_0097_valid :
    mulPoly ep_Q2_002_coefficient_07_0097
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0098 : Poly :=
[
  term ((17030902643248288897961462256912 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 98 for generator 7. -/
def ep_Q2_002_partial_07_0098 : Poly :=
[
  term ((-34061805286496577795922924513824 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (9, 1), (11, 1)],
  term ((17030902643248288897961462256912 : Rat) / 1273790490336191187829975377157) [(0, 2), (6, 1), (9, 1), (11, 1)],
  term ((17030902643248288897961462256912 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (9, 1), (11, 1)],
  term ((34061805286496577795922924513824 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-17030902643248288897961462256912 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1), (12, 2)],
  term ((-17030902643248288897961462256912 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 7. -/
theorem ep_Q2_002_partial_07_0098_valid :
    mulPoly ep_Q2_002_coefficient_07_0098
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 7. -/
def ep_Q2_002_coefficient_07_0099 : Poly :=
[
  term ((-32072379085056639224248912931904 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 99 for generator 7. -/
def ep_Q2_002_partial_07_0099 : Poly :=
[
  term ((64144758170113278448497825863808 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (9, 1), (13, 1)],
  term ((-32072379085056639224248912931904 : Rat) / 1273790490336191187829975377157) [(0, 2), (6, 1), (9, 1), (13, 1)],
  term ((-32072379085056639224248912931904 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((-64144758170113278448497825863808 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (12, 1), (13, 1)],
  term ((32072379085056639224248912931904 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (12, 2), (13, 1)],
  term ((32072379085056639224248912931904 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 7. -/
theorem ep_Q2_002_partial_07_0099_valid :
    mulPoly ep_Q2_002_coefficient_07_0099
        ep_Q2_002_generator_07_0000_0099 =
      ep_Q2_002_partial_07_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_07_0000_0099 : List Poly :=
[
  ep_Q2_002_partial_07_0000,
  ep_Q2_002_partial_07_0001,
  ep_Q2_002_partial_07_0002,
  ep_Q2_002_partial_07_0003,
  ep_Q2_002_partial_07_0004,
  ep_Q2_002_partial_07_0005,
  ep_Q2_002_partial_07_0006,
  ep_Q2_002_partial_07_0007,
  ep_Q2_002_partial_07_0008,
  ep_Q2_002_partial_07_0009,
  ep_Q2_002_partial_07_0010,
  ep_Q2_002_partial_07_0011,
  ep_Q2_002_partial_07_0012,
  ep_Q2_002_partial_07_0013,
  ep_Q2_002_partial_07_0014,
  ep_Q2_002_partial_07_0015,
  ep_Q2_002_partial_07_0016,
  ep_Q2_002_partial_07_0017,
  ep_Q2_002_partial_07_0018,
  ep_Q2_002_partial_07_0019,
  ep_Q2_002_partial_07_0020,
  ep_Q2_002_partial_07_0021,
  ep_Q2_002_partial_07_0022,
  ep_Q2_002_partial_07_0023,
  ep_Q2_002_partial_07_0024,
  ep_Q2_002_partial_07_0025,
  ep_Q2_002_partial_07_0026,
  ep_Q2_002_partial_07_0027,
  ep_Q2_002_partial_07_0028,
  ep_Q2_002_partial_07_0029,
  ep_Q2_002_partial_07_0030,
  ep_Q2_002_partial_07_0031,
  ep_Q2_002_partial_07_0032,
  ep_Q2_002_partial_07_0033,
  ep_Q2_002_partial_07_0034,
  ep_Q2_002_partial_07_0035,
  ep_Q2_002_partial_07_0036,
  ep_Q2_002_partial_07_0037,
  ep_Q2_002_partial_07_0038,
  ep_Q2_002_partial_07_0039,
  ep_Q2_002_partial_07_0040,
  ep_Q2_002_partial_07_0041,
  ep_Q2_002_partial_07_0042,
  ep_Q2_002_partial_07_0043,
  ep_Q2_002_partial_07_0044,
  ep_Q2_002_partial_07_0045,
  ep_Q2_002_partial_07_0046,
  ep_Q2_002_partial_07_0047,
  ep_Q2_002_partial_07_0048,
  ep_Q2_002_partial_07_0049,
  ep_Q2_002_partial_07_0050,
  ep_Q2_002_partial_07_0051,
  ep_Q2_002_partial_07_0052,
  ep_Q2_002_partial_07_0053,
  ep_Q2_002_partial_07_0054,
  ep_Q2_002_partial_07_0055,
  ep_Q2_002_partial_07_0056,
  ep_Q2_002_partial_07_0057,
  ep_Q2_002_partial_07_0058,
  ep_Q2_002_partial_07_0059,
  ep_Q2_002_partial_07_0060,
  ep_Q2_002_partial_07_0061,
  ep_Q2_002_partial_07_0062,
  ep_Q2_002_partial_07_0063,
  ep_Q2_002_partial_07_0064,
  ep_Q2_002_partial_07_0065,
  ep_Q2_002_partial_07_0066,
  ep_Q2_002_partial_07_0067,
  ep_Q2_002_partial_07_0068,
  ep_Q2_002_partial_07_0069,
  ep_Q2_002_partial_07_0070,
  ep_Q2_002_partial_07_0071,
  ep_Q2_002_partial_07_0072,
  ep_Q2_002_partial_07_0073,
  ep_Q2_002_partial_07_0074,
  ep_Q2_002_partial_07_0075,
  ep_Q2_002_partial_07_0076,
  ep_Q2_002_partial_07_0077,
  ep_Q2_002_partial_07_0078,
  ep_Q2_002_partial_07_0079,
  ep_Q2_002_partial_07_0080,
  ep_Q2_002_partial_07_0081,
  ep_Q2_002_partial_07_0082,
  ep_Q2_002_partial_07_0083,
  ep_Q2_002_partial_07_0084,
  ep_Q2_002_partial_07_0085,
  ep_Q2_002_partial_07_0086,
  ep_Q2_002_partial_07_0087,
  ep_Q2_002_partial_07_0088,
  ep_Q2_002_partial_07_0089,
  ep_Q2_002_partial_07_0090,
  ep_Q2_002_partial_07_0091,
  ep_Q2_002_partial_07_0092,
  ep_Q2_002_partial_07_0093,
  ep_Q2_002_partial_07_0094,
  ep_Q2_002_partial_07_0095,
  ep_Q2_002_partial_07_0096,
  ep_Q2_002_partial_07_0097,
  ep_Q2_002_partial_07_0098,
  ep_Q2_002_partial_07_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_07_0000_0099 : Poly :=
[
  term ((-802418524039030442040 : Rat) / 253528477699481291099) [(0, 1)],
  term ((110381046111582097150119508416 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 1), (3, 1)],
  term ((-9870251280062719201013309565696 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (4, 1), (7, 1)],
  term ((-4842540339826116929709132139200 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (4, 1), (9, 1)],
  term ((-109668662759460911261573091832032 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (4, 1), (11, 1)],
  term ((200980927671187435042848224557824 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (4, 1), (13, 1)],
  term ((7688690107529581544064573070926439337472 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (1, 1), (4, 1), (15, 1)],
  term ((70812392888 : Rat) / 7401317245) [(0, 1), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((-12593358060864944097896790473184 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1)],
  term ((4842540339826116929709132139200 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (8, 1)],
  term ((-4399745127567885367635756896640 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (12, 1)],
  term ((4039742732489230527245195334144 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (12, 2)],
  term ((4039742732489230527245195334144 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (13, 2)],
  term ((2409206220443850471656029206912 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (6, 1), (9, 1)],
  term ((-4738480755736780185549148936704 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (6, 1), (11, 1)],
  term ((93497987899972894978986958325376 : Rat) / 268063527727966972480841957465) [(0, 1), (1, 1), (6, 1), (15, 1)],
  term ((12548443744 : Rat) / 7401317245) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-7076241811783304361952385047488 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1)],
  term ((187155526347636087040440117504 : Rat) / 8907625806546791523286541099) [(0, 1), (1, 1), (7, 1), (8, 1)],
  term ((5069779899375562235757976872192 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (12, 1)],
  term ((-2534889949687781117878988436096 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (12, 2)],
  term ((-2534889949687781117878988436096 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (13, 2)],
  term ((339045321587223888214298139837552 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 1), (11, 1)],
  term ((-629624221117857028389373017952320 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 1), (13, 1)],
  term ((-560915936543371939717768643613068699237376 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (8, 1), (15, 1)],
  term ((-229149562548 : Rat) / 7401317245) [(0, 1), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2538792038063908705824972261120 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1)],
  term ((-913858825949780263597159929024 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 1), (9, 1), (12, 1)],
  term ((5492601301641450569041159359264 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1), (12, 2)],
  term ((5492601301641450569041159359264 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1), (13, 2)],
  term ((-12717185626825236172798917528744 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 1), (11, 1)],
  term ((-36167198658100864159893174449472 : Rat) / 115799135485108289802725034287) [(0, 1), (1, 1), (11, 1), (12, 1)],
  term ((89672609289557259039953945717232 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1), (12, 2)],
  term ((89672609289557259039953945717232 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1), (13, 2)],
  term ((769634253746703473145722618418432 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (12, 1), (13, 1)],
  term ((-904135836002541655252879179615262587794304 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (12, 1), (15, 1)],
  term ((32890365984 : Rat) / 1057331035) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-183546321707023842294576772754112 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (12, 2), (13, 1)],
  term ((-33601647908133130266888822718232221921104 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (1, 1), (12, 2), (15, 1)],
  term ((-71427522016 : Rat) / 7401317245) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((325924190809018618414715652919200 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (13, 1)],
  term ((-33601647908133130266888822718232221921104 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (1, 1), (13, 2), (15, 1)],
  term ((-71427522016 : Rat) / 7401317245) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-183546321707023842294576772754112 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (13, 3)],
  term ((197041236572643012199947014422838391062736 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (1, 1), (15, 1)],
  term ((27477680586 : Rat) / 1480263449) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term ((12010583216717537435731558354272 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2)],
  term ((591294499063264758390936959616 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 2), (4, 1)],
  term ((57114633522836183706024143868288 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (5, 1), (11, 1)],
  term ((-107557550883815516796500102186496 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (5, 1), (13, 1)],
  term ((735124433572387104387134023322073147961728 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 2), (5, 1), (15, 1)],
  term ((-17222453536 : Rat) / 7401317245) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-35838745208392855232790833172192 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (7, 1), (11, 1)],
  term ((67491068813784397620094809377664 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (7, 1), (13, 1)],
  term ((660713555419972994318477863829433249304368 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term ((41983667284 : Rat) / 7401317245) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-23681603637372044578781960552256 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (8, 1)],
  term ((77655417981778808216619892293528 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (9, 1), (11, 1)],
  term ((-146239694729715460668287334228576 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (9, 1), (13, 1)],
  term ((-772971510407633498736441043559074658111472 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((-69832201566 : Rat) / 7401317245) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-134766769211008818673805283151296 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((1163595390451560844393720997712545675160624 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((39443926462 : Rat) / 7401317245) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-135028704725573384111185361520 : Rat) / 8907625806546791523286541099) [(0, 1), (1, 2), (11, 2)],
  term ((27997381803702512131404877127424 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (12, 1)],
  term ((-6439181915715762621857499195456 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (12, 2)],
  term ((-1761970040619034839634056235276550192619816 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((70790263182 : Rat) / 7401317245) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((315829581652162201392985241466816 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (13, 2)],
  term ((1058352100917003998010495843637268340384264 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 2), (15, 2)],
  term ((-42093590768 : Rat) / 7401317245) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((-4039742732489230527245195334144 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 3), (5, 1)],
  term ((2534889949687781117878988436096 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 3), (7, 1)],
  term ((-5492601301641450569041159359264 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 3), (9, 1)],
  term ((-89672609289557259039953945717232 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 3), (11, 1)],
  term ((183546321707023842294576772754112 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 3), (13, 1)],
  term ((33601647908133130266888822718232221921104 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (1, 3), (15, 1)],
  term ((71427522016 : Rat) / 7401317245) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term ((6439181915715762621857499195456 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 4)],
  term ((-1560587743825367507544935066832 : Rat) / 97983883872014706756151952089) [(0, 1), (3, 1), (11, 1)],
  term ((2938878975701438057858690804544 : Rat) / 97983883872014706756151952089) [(0, 1), (3, 1), (13, 1)],
  term ((214939533084328049877536652781642391606064 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 1), (15, 1)],
  term ((18930737152 : Rat) / 7401317245) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((139547446946385412691205792931392 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (7, 1), (11, 1)],
  term ((-262793975901835801412014680824064 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (7, 1), (13, 1)],
  term ((29255753088929547696583272731332684324608 : Rat) / 20720280269543423485940727223906556423) [(0, 1), (4, 1), (7, 1), (15, 1)],
  term ((-1042425392 : Rat) / 211466207) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((68464735292263216435894430528400 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (9, 1), (11, 1)],
  term ((-128931918069652814160544085812800 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (9, 1), (13, 1)],
  term ((1027435416174102218404321596014449957863072 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (4, 1), (9, 1), (15, 1)],
  term ((-15832081284 : Rat) / 7401317245) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((25643537826421924901133444896352 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (11, 1), (13, 1)],
  term ((-264495640813088176493304820581488928928704 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (4, 1), (11, 1), (15, 1)],
  term ((-7298123932 : Rat) / 1480263449) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((14008864293390933964005499264032 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (11, 2)],
  term ((719891918179213788674732489487046100237952 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (4, 1), (13, 1), (15, 1)],
  term ((-28609778424 : Rat) / 7401317245) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-97972540527695988759115675151232 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (13, 2)],
  term ((-2795567305819949296019883233142217210612512 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (4, 1), (15, 2)],
  term ((107496545204 : Rat) / 7401317245) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((-68464735292263216435894430528400 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (8, 1), (11, 1)],
  term ((128931918069652814160544085812800 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (8, 1), (13, 1)],
  term ((-1027435416174102218404321596014449957863072 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (8, 1), (15, 1)],
  term ((15832081284 : Rat) / 7401317245) [(0, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((178047236692460263784296036771368 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 1)],
  term ((62204414289541349123591418293280 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 1), (12, 1)],
  term ((-57114633522836183706024143868288 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 1), (12, 2)],
  term ((-57114633522836183706024143868288 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 1), (13, 2)],
  term ((-117142561239935044833884529221760 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (12, 1), (13, 1)],
  term ((1321307355894237774353621251402335817510464 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((-5835128648 : Rat) / 7401317245) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((107557550883815516796500102186496 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (12, 2), (13, 1)],
  term ((-735124433572387104387134023322073147961728 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (12, 2), (15, 1)],
  term ((17222453536 : Rat) / 7401317245) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-335296289918679987397570298909856 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (13, 1)],
  term ((-735124433572387104387134023322073147961728 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (13, 2), (15, 1)],
  term ((17222453536 : Rat) / 7401317245) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((107557550883815516796500102186496 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (13, 3)],
  term ((1652489349844167015393100087202915936580696 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (15, 1)],
  term ((-69889168392 : Rat) / 7401317245) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((1069891365385373922720 : Rat) / 253528477699481291099) [(0, 1), (6, 1)],
  term ((-34061805286496577795922924513824 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (9, 1), (11, 1)],
  term ((64144758170113278448497825863808 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (9, 1), (13, 1)],
  term ((-71677490416785710465581666344384 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((35838745208392855232790833172192 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1), (12, 2)],
  term ((35838745208392855232790833172192 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1), (13, 2)],
  term ((134982137627568795240189618755328 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term ((1321427110839945988636955727658866498608736 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((83967334568 : Rat) / 7401317245) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-67491068813784397620094809377664 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (12, 2), (13, 1)],
  term ((-660713555419972994318477863829433249304368 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((-41983667284 : Rat) / 7401317245) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-660713555419972994318477863829433249304368 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (13, 2), (15, 1)],
  term ((-41983667284 : Rat) / 7401317245) [(0, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-67491068813784397620094809377664 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (13, 3)],
  term ((155310835963557616433239784587056 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((-77655417981778808216619892293528 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (12, 2)],
  term ((-77655417981778808216619892293528 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (13, 2)],
  term ((-292479389459430921336574668457152 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((-1545943020815266997472882087118149316222944 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((-139664403132 : Rat) / 7401317245) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((146239694729715460668287334228576 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (12, 2), (13, 1)],
  term ((772971510407633498736441043559074658111472 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((69832201566 : Rat) / 7401317245) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((772971510407633498736441043559074658111472 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (13, 2), (15, 1)],
  term ((69832201566 : Rat) / 7401317245) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((146239694729715460668287334228576 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (13, 3)],
  term ((-269533538422017637347610566302592 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((2327190780903121688787441995425091350321248 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((78887852924 : Rat) / 7401317245) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((134766769211008818673805283151296 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((-1163595390451560844393720997712545675160624 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((-39443926462 : Rat) / 7401317245) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1163595390451560844393720997712545675160624 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (13, 2), (15, 1)],
  term ((-39443926462 : Rat) / 7401317245) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((134766769211008818673805283151296 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 3)],
  term ((-270057409451146768222370723040 : Rat) / 8907625806546791523286541099) [(0, 1), (11, 2), (12, 1)],
  term ((135028704725573384111185361520 : Rat) / 8907625806546791523286541099) [(0, 1), (11, 2), (12, 2)],
  term ((135028704725573384111185361520 : Rat) / 8907625806546791523286541099) [(0, 1), (11, 2), (13, 2)],
  term ((-3523940081238069679268112470553100385239632 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((141580526364 : Rat) / 7401317245) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((644537527135755928029685481324544 : Rat) / 1273790490336191187829975377157) [(0, 1), (12, 1), (13, 2)],
  term ((2116704201834007996020991687274536680768528 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (12, 1), (15, 2)],
  term ((-84187181536 : Rat) / 7401317245) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((1761970040619034839634056235276550192619816 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((-70790263182 : Rat) / 7401317245) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-322268763567877964014842740662272 : Rat) / 1273790490336191187829975377157) [(0, 1), (12, 2), (13, 2)],
  term ((-1058352100917003998010495843637268340384264 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (12, 2), (15, 2)],
  term ((42093590768 : Rat) / 7401317245) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1058352100917003998010495843637268340384264 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (13, 2), (15, 2)],
  term ((42093590768 : Rat) / 7401317245) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((1761970040619034839634056235276550192619816 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (13, 3), (15, 1)],
  term ((-70790263182 : Rat) / 7401317245) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term ((-322268763567877964014842740662272 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 4)],
  term ((401209262019515221020 : Rat) / 253528477699481291099) [(0, 2)],
  term ((-55190523055791048575059754208 : Rat) / 97983883872014706756151952089) [(0, 2), (1, 1), (3, 1)],
  term ((4935125640031359600506654782848 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (4, 1), (7, 1)],
  term ((2421270169913058464854566069600 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (4, 1), (9, 1)],
  term ((54834331379730455630786545916016 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (4, 1), (11, 1)],
  term ((-100490463835593717521424112278912 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (4, 1), (13, 1)],
  term ((-3844345053764790772032286535463219668736 : Rat) / 103601401347717117429703636119532782115) [(0, 2), (1, 1), (4, 1), (15, 1)],
  term ((-35406196444 : Rat) / 7401317245) [(0, 2), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((14376164495410933103438785904880 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (5, 1)],
  term ((-2421270169913058464854566069600 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (5, 1), (8, 1)],
  term ((-1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (5, 1), (12, 1)],
  term ((-1204603110221925235828014603456 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (6, 1), (9, 1)],
  term ((2369240377868390092774574468352 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (6, 1), (11, 1)],
  term ((-46748993949986447489493479162688 : Rat) / 268063527727966972480841957465) [(0, 2), (1, 1), (6, 1), (15, 1)],
  term ((-6274221872 : Rat) / 7401317245) [(0, 2), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1531658993483910054781784348448 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (7, 1)],
  term ((-93577763173818043520220058752 : Rat) / 8907625806546791523286541099) [(0, 2), (1, 1), (7, 1), (8, 1)],
  term ((-169522660793611944107149069918776 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (8, 1), (11, 1)],
  term ((314812110558928514194686508976160 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (8, 1), (13, 1)],
  term ((280457968271685969858884321806534349618688 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (1, 1), (8, 1), (15, 1)],
  term ((114574781274 : Rat) / 7401317245) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((12254598622314855490994804849088 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (9, 1)],
  term ((40680097002920104030943652672 : Rat) / 115799135485108289802725034287) [(0, 2), (1, 1), (9, 1), (12, 1)],
  term ((262006925153478553203100855371300 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (11, 1)],
  term ((109246983329997493839458513754864 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (11, 1), (12, 1)],
  term ((-15482369628179068790637272035008 : Rat) / 97983883872014706756151952089) [(0, 2), (1, 1), (12, 1), (13, 1)],
  term ((888889340807001521095994285144650178871504 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (1, 1), (12, 1), (15, 1)],
  term ((-43688758928 : Rat) / 7401317245) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-530054738818556993796511371967824 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (13, 1)],
  term ((-1366245937043068917438976926731133747605544 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (1, 1), (15, 1)],
  term ((-211549245497 : Rat) / 7401317245) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-18883655439790293961580777568048 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 2)],
  term ((-295647249531632379195468479808 : Rat) / 97983883872014706756151952089) [(0, 2), (1, 2), (4, 1)],
  term ((11840801818686022289390980276128 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 2), (8, 1)],
  term ((-581500691241191803372687643712 : Rat) / 97983883872014706756151952089) [(0, 2), (1, 2), (12, 1)],
  term ((780293871912683753772467533416 : Rat) / 97983883872014706756151952089) [(0, 2), (3, 1), (11, 1)],
  term ((-1469439487850719028929345402272 : Rat) / 97983883872014706756151952089) [(0, 2), (3, 1), (13, 1)],
  term ((-107469766542164024938768326390821195803032 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (3, 1), (15, 1)],
  term ((-9465368576 : Rat) / 7401317245) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-69773723473192706345602896465696 : Rat) / 1273790490336191187829975377157) [(0, 2), (4, 1), (7, 1), (11, 1)],
  term ((131396987950917900706007340412032 : Rat) / 1273790490336191187829975377157) [(0, 2), (4, 1), (7, 1), (13, 1)],
  term ((-14627876544464773848291636365666342162304 : Rat) / 20720280269543423485940727223906556423) [(0, 2), (4, 1), (7, 1), (15, 1)],
  term ((521212696 : Rat) / 211466207) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-34232367646131608217947215264200 : Rat) / 1273790490336191187829975377157) [(0, 2), (4, 1), (9, 1), (11, 1)],
  term ((64465959034826407080272042906400 : Rat) / 1273790490336191187829975377157) [(0, 2), (4, 1), (9, 1), (13, 1)],
  term ((-513717708087051109202160798007224978931536 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (4, 1), (9, 1), (15, 1)],
  term ((7916040642 : Rat) / 7401317245) [(0, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-12821768913210962450566722448176 : Rat) / 1273790490336191187829975377157) [(0, 2), (4, 1), (11, 1), (13, 1)],
  term ((132247820406544088246652410290744464464352 : Rat) / 269363643504064505317229453910785233499) [(0, 2), (4, 1), (11, 1), (15, 1)],
  term ((3649061966 : Rat) / 1480263449) [(0, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(0, 2), (4, 1), (11, 2)],
  term ((-359945959089606894337366244743523050118976 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (4, 1), (13, 1), (15, 1)],
  term ((14304889212 : Rat) / 7401317245) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(0, 2), (4, 1), (13, 2)],
  term ((1397783652909974648009941616571108605306256 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (4, 1), (15, 2)],
  term ((-53748272602 : Rat) / 7401317245) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((34232367646131608217947215264200 : Rat) / 1273790490336191187829975377157) [(0, 2), (5, 1), (8, 1), (11, 1)],
  term ((-64465959034826407080272042906400 : Rat) / 1273790490336191187829975377157) [(0, 2), (5, 1), (8, 1), (13, 1)],
  term ((513717708087051109202160798007224978931536 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (5, 1), (8, 1), (15, 1)],
  term ((-7916040642 : Rat) / 7401317245) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-203252885391902499304196306122260 : Rat) / 1273790490336191187829975377157) [(0, 2), (5, 1), (11, 1)],
  term ((26012426378065509144228434721648 : Rat) / 1273790490336191187829975377157) [(0, 2), (5, 1), (11, 1), (12, 1)],
  term ((-48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(0, 2), (5, 1), (12, 1), (13, 1)],
  term ((74470755625268217210323397620905239206496 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (5, 1), (12, 1), (15, 1)],
  term ((-14304889212 : Rat) / 7401317245) [(0, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((382763246726971027291785353827920 : Rat) / 1273790490336191187829975377157) [(0, 2), (5, 1), (13, 1)],
  term ((-2296493542066857716470818090245604264213804 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (5, 1), (15, 1)],
  term ((69389491268 : Rat) / 7401317245) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-534945682692686961360 : Rat) / 253528477699481291099) [(0, 2), (6, 1)],
  term ((17030902643248288897961462256912 : Rat) / 1273790490336191187829975377157) [(0, 2), (6, 1), (9, 1), (11, 1)],
  term ((-32072379085056639224248912931904 : Rat) / 1273790490336191187829975377157) [(0, 2), (6, 1), (9, 1), (13, 1)],
  term ((71677490416785710465581666344384 : Rat) / 1273790490336191187829975377157) [(0, 2), (7, 1), (11, 1)],
  term ((-134982137627568795240189618755328 : Rat) / 1273790490336191187829975377157) [(0, 2), (7, 1), (13, 1)],
  term ((-1321427110839945988636955727658866498608736 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (7, 1), (15, 1)],
  term ((-83967334568 : Rat) / 7401317245) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-155310835963557616433239784587056 : Rat) / 1273790490336191187829975377157) [(0, 2), (9, 1), (11, 1)],
  term ((292479389459430921336574668457152 : Rat) / 1273790490336191187829975377157) [(0, 2), (9, 1), (13, 1)],
  term ((1545943020815266997472882087118149316222944 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (9, 1), (15, 1)],
  term ((139664403132 : Rat) / 7401317245) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((269533538422017637347610566302592 : Rat) / 1273790490336191187829975377157) [(0, 2), (11, 1), (13, 1)],
  term ((-2327190780903121688787441995425091350321248 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (11, 1), (15, 1)],
  term ((-78887852924 : Rat) / 7401317245) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((270057409451146768222370723040 : Rat) / 8907625806546791523286541099) [(0, 2), (11, 2)],
  term ((3523940081238069679268112470553100385239632 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (13, 1), (15, 1)],
  term ((-141580526364 : Rat) / 7401317245) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-644537527135755928029685481324544 : Rat) / 1273790490336191187829975377157) [(0, 2), (13, 2)],
  term ((-2116704201834007996020991687274536680768528 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (15, 2)],
  term ((84187181536 : Rat) / 7401317245) [(0, 2), (15, 2), (16, 1)],
  term ((-4039742732489230527245195334144 : Rat) / 1273790490336191187829975377157) [(0, 3), (1, 1), (5, 1)],
  term ((2534889949687781117878988436096 : Rat) / 1273790490336191187829975377157) [(0, 3), (1, 1), (7, 1)],
  term ((-5492601301641450569041159359264 : Rat) / 1273790490336191187829975377157) [(0, 3), (1, 1), (9, 1)],
  term ((-89672609289557259039953945717232 : Rat) / 1273790490336191187829975377157) [(0, 3), (1, 1), (11, 1)],
  term ((183546321707023842294576772754112 : Rat) / 1273790490336191187829975377157) [(0, 3), (1, 1), (13, 1)],
  term ((33601647908133130266888822718232221921104 : Rat) / 103601401347717117429703636119532782115) [(0, 3), (1, 1), (15, 1)],
  term ((71427522016 : Rat) / 7401317245) [(0, 3), (1, 1), (15, 1), (16, 1)],
  term ((6439181915715762621857499195456 : Rat) / 1273790490336191187829975377157) [(0, 3), (1, 2)],
  term ((57114633522836183706024143868288 : Rat) / 1273790490336191187829975377157) [(0, 3), (5, 1), (11, 1)],
  term ((-107557550883815516796500102186496 : Rat) / 1273790490336191187829975377157) [(0, 3), (5, 1), (13, 1)],
  term ((735124433572387104387134023322073147961728 : Rat) / 1346818217520322526586147269553926167495) [(0, 3), (5, 1), (15, 1)],
  term ((-17222453536 : Rat) / 7401317245) [(0, 3), (5, 1), (15, 1), (16, 1)],
  term ((-35838745208392855232790833172192 : Rat) / 1273790490336191187829975377157) [(0, 3), (7, 1), (11, 1)],
  term ((67491068813784397620094809377664 : Rat) / 1273790490336191187829975377157) [(0, 3), (7, 1), (13, 1)],
  term ((660713555419972994318477863829433249304368 : Rat) / 1346818217520322526586147269553926167495) [(0, 3), (7, 1), (15, 1)],
  term ((41983667284 : Rat) / 7401317245) [(0, 3), (7, 1), (15, 1), (16, 1)],
  term ((77655417981778808216619892293528 : Rat) / 1273790490336191187829975377157) [(0, 3), (9, 1), (11, 1)],
  term ((-146239694729715460668287334228576 : Rat) / 1273790490336191187829975377157) [(0, 3), (9, 1), (13, 1)],
  term ((-772971510407633498736441043559074658111472 : Rat) / 1346818217520322526586147269553926167495) [(0, 3), (9, 1), (15, 1)],
  term ((-69832201566 : Rat) / 7401317245) [(0, 3), (9, 1), (15, 1), (16, 1)],
  term ((-134766769211008818673805283151296 : Rat) / 1273790490336191187829975377157) [(0, 3), (11, 1), (13, 1)],
  term ((1163595390451560844393720997712545675160624 : Rat) / 1346818217520322526586147269553926167495) [(0, 3), (11, 1), (15, 1)],
  term ((39443926462 : Rat) / 7401317245) [(0, 3), (11, 1), (15, 1), (16, 1)],
  term ((-135028704725573384111185361520 : Rat) / 8907625806546791523286541099) [(0, 3), (11, 2)],
  term ((-1761970040619034839634056235276550192619816 : Rat) / 1346818217520322526586147269553926167495) [(0, 3), (13, 1), (15, 1)],
  term ((70790263182 : Rat) / 7401317245) [(0, 3), (13, 1), (15, 1), (16, 1)],
  term ((322268763567877964014842740662272 : Rat) / 1273790490336191187829975377157) [(0, 3), (13, 2)],
  term ((1058352100917003998010495843637268340384264 : Rat) / 1346818217520322526586147269553926167495) [(0, 3), (15, 2)],
  term ((-42093590768 : Rat) / 7401317245) [(0, 3), (15, 2), (16, 1)],
  term ((-110381046111582097150119508416 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (12, 1)],
  term ((55190523055791048575059754208 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (12, 2)],
  term ((55190523055791048575059754208 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (13, 2)],
  term ((9870251280062719201013309565696 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (12, 1)],
  term ((-4935125640031359600506654782848 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (12, 2)],
  term ((-4935125640031359600506654782848 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (13, 2)],
  term ((4842540339826116929709132139200 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (12, 1)],
  term ((-2421270169913058464854566069600 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (12, 2)],
  term ((-2421270169913058464854566069600 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (13, 2)],
  term ((109668662759460911261573091832032 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (12, 1)],
  term ((-54834331379730455630786545916016 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (12, 2)],
  term ((-54834331379730455630786545916016 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (13, 2)],
  term ((-200980927671187435042848224557824 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (12, 1), (13, 1)],
  term ((-7688690107529581544064573070926439337472 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (4, 1), (12, 1), (15, 1)],
  term ((-70812392888 : Rat) / 7401317245) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((100490463835593717521424112278912 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (12, 2), (13, 1)],
  term ((3844345053764790772032286535463219668736 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (4, 1), (12, 2), (15, 1)],
  term ((35406196444 : Rat) / 7401317245) [(1, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((3844345053764790772032286535463219668736 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (4, 1), (13, 2), (15, 1)],
  term ((35406196444 : Rat) / 7401317245) [(1, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((100490463835593717521424112278912 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (13, 3)],
  term ((-4842540339826116929709132139200 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (12, 1)],
  term ((2421270169913058464854566069600 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (12, 2)],
  term ((2421270169913058464854566069600 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (13, 2)],
  term ((12593358060864944097896790473184 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 1)],
  term ((1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 1), (13, 2)],
  term ((-9976419367843047735803029008240 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 2)],
  term ((1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 3)],
  term ((-6296679030432472048948395236592 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (13, 2)],
  term ((-2409206220443850471656029206912 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (12, 1)],
  term ((1204603110221925235828014603456 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (12, 2)],
  term ((1204603110221925235828014603456 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (13, 2)],
  term ((4738480755736780185549148936704 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1), (12, 1)],
  term ((-2369240377868390092774574468352 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1), (12, 2)],
  term ((-2369240377868390092774574468352 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1), (13, 2)],
  term ((-93497987899972894978986958325376 : Rat) / 268063527727966972480841957465) [(1, 1), (6, 1), (12, 1), (15, 1)],
  term ((-12548443744 : Rat) / 7401317245) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((46748993949986447489493479162688 : Rat) / 268063527727966972480841957465) [(1, 1), (6, 1), (12, 2), (15, 1)],
  term ((6274221872 : Rat) / 7401317245) [(1, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((46748993949986447489493479162688 : Rat) / 268063527727966972480841957465) [(1, 1), (6, 1), (13, 2), (15, 1)],
  term ((6274221872 : Rat) / 7401317245) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-187155526347636087040440117504 : Rat) / 8907625806546791523286541099) [(1, 1), (7, 1), (8, 1), (12, 1)],
  term ((93577763173818043520220058752 : Rat) / 8907625806546791523286541099) [(1, 1), (7, 1), (8, 1), (12, 2)],
  term ((93577763173818043520220058752 : Rat) / 8907625806546791523286541099) [(1, 1), (7, 1), (8, 1), (13, 2)],
  term ((7076241811783304361952385047488 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 1)],
  term ((-3538120905891652180976192523744 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 2)],
  term ((-3538120905891652180976192523744 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (13, 2)],
  term ((-339045321587223888214298139837552 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (12, 1)],
  term ((169522660793611944107149069918776 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (12, 2)],
  term ((169522660793611944107149069918776 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (13, 2)],
  term ((629624221117857028389373017952320 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (12, 1), (13, 1)],
  term ((560915936543371939717768643613068699237376 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (12, 1), (15, 1)],
  term ((229149562548 : Rat) / 7401317245) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-314812110558928514194686508976160 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (12, 2), (13, 1)],
  term ((-280457968271685969858884321806534349618688 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (12, 2), (15, 1)],
  term ((-114574781274 : Rat) / 7401317245) [(1, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-280457968271685969858884321806534349618688 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (13, 2), (15, 1)],
  term ((-114574781274 : Rat) / 7401317245) [(1, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-314812110558928514194686508976160 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (13, 3)],
  term ((2538792038063908705824972261120 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 1)],
  term ((-40680097002920104030943652672 : Rat) / 115799135485108289802725034287) [(1, 1), (9, 1), (12, 1), (13, 2)],
  term ((-374433884967712064231725771776 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 2)],
  term ((-40680097002920104030943652672 : Rat) / 115799135485108289802725034287) [(1, 1), (9, 1), (12, 3)],
  term ((-1269396019031954352912486130560 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (13, 2)],
  term ((12717185626825236172798917528744 : Rat) / 97983883872014706756151952089) [(1, 1), (11, 1), (12, 1)],
  term ((-109246983329997493839458513754864 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((135832260085630952555724063572892 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 2)],
  term ((-109246983329997493839458513754864 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 3)],
  term ((-6358592813412618086399458764372 : Rat) / 97983883872014706756151952089) [(1, 1), (11, 1), (13, 2)],
  term ((-325924190809018618414715652919200 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 1)],
  term ((-888889340807001521095994285144650178871504 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((43688758928 : Rat) / 7401317245) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((15482369628179068790637272035008 : Rat) / 97983883872014706756151952089) [(1, 1), (12, 1), (13, 3)],
  term ((-197041236572643012199947014422838391062736 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (12, 1), (15, 1)],
  term ((-27477680586 : Rat) / 1480263449) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-239579514928146479349211246450608 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 2), (13, 1)],
  term ((2270381773045610572691856106346396335399848 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 2), (15, 1)],
  term ((-18683316391 : Rat) / 7401317245) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((15482369628179068790637272035008 : Rat) / 97983883872014706756151952089) [(1, 1), (12, 3), (13, 1)],
  term ((-888889340807001521095994285144650178871504 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 3), (15, 1)],
  term ((43688758928 : Rat) / 7401317245) [(1, 1), (12, 3), (15, 1), (16, 1)],
  term ((98520618286321506099973507211419195531368 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (13, 2), (15, 1)],
  term ((13738840293 : Rat) / 1480263449) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((162962095404509309207357826459600 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 3)],
  term ((401209262019515221020 : Rat) / 253528477699481291099) [(1, 2)],
  term ((780293871912683753772467533416 : Rat) / 97983883872014706756151952089) [(1, 2), (3, 1), (11, 1)],
  term ((-1469439487850719028929345402272 : Rat) / 97983883872014706756151952089) [(1, 2), (3, 1), (13, 1)],
  term ((-107469766542164024938768326390821195803032 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (3, 1), (15, 1)],
  term ((-9465368576 : Rat) / 7401317245) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-69773723473192706345602896465696 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (7, 1), (11, 1)],
  term ((131396987950917900706007340412032 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (7, 1), (13, 1)],
  term ((-14627876544464773848291636365666342162304 : Rat) / 20720280269543423485940727223906556423) [(1, 2), (4, 1), (7, 1), (15, 1)],
  term ((521212696 : Rat) / 211466207) [(1, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-34232367646131608217947215264200 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (9, 1), (11, 1)],
  term ((64465959034826407080272042906400 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (9, 1), (13, 1)],
  term ((-513717708087051109202160798007224978931536 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (4, 1), (9, 1), (15, 1)],
  term ((7916040642 : Rat) / 7401317245) [(1, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-12821768913210962450566722448176 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (11, 1), (13, 1)],
  term ((132247820406544088246652410290744464464352 : Rat) / 269363643504064505317229453910785233499) [(1, 2), (4, 1), (11, 1), (15, 1)],
  term ((3649061966 : Rat) / 1480263449) [(1, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (11, 2)],
  term ((-591294499063264758390936959616 : Rat) / 97983883872014706756151952089) [(1, 2), (4, 1), (12, 1)],
  term ((295647249531632379195468479808 : Rat) / 97983883872014706756151952089) [(1, 2), (4, 1), (12, 2)],
  term ((-359945959089606894337366244743523050118976 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (4, 1), (13, 1), (15, 1)],
  term ((14304889212 : Rat) / 7401317245) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((52829684507759215309098927813120 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (13, 2)],
  term ((1397783652909974648009941616571108605306256 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (4, 1), (15, 2)],
  term ((-53748272602 : Rat) / 7401317245) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((34232367646131608217947215264200 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (8, 1), (11, 1)],
  term ((-64465959034826407080272042906400 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (8, 1), (13, 1)],
  term ((513717708087051109202160798007224978931536 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (5, 1), (8, 1), (15, 1)],
  term ((-7916040642 : Rat) / 7401317245) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-89023618346230131892148018385684 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (11, 1)],
  term ((26012426378065509144228434721648 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (11, 1), (12, 1)],
  term ((-48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (12, 1), (13, 1)],
  term ((74470755625268217210323397620905239206496 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (5, 1), (12, 1), (15, 1)],
  term ((-14304889212 : Rat) / 7401317245) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((167648144959339993698785149454928 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (13, 1)],
  term ((-826244674922083507696550043601457968290348 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (5, 1), (15, 1)],
  term ((34944584196 : Rat) / 7401317245) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-534945682692686961360 : Rat) / 253528477699481291099) [(1, 2), (6, 1)],
  term ((17030902643248288897961462256912 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (9, 1), (11, 1)],
  term ((-32072379085056639224248912931904 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((23681603637372044578781960552256 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (12, 1)],
  term ((-11840801818686022289390980276128 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (12, 2)],
  term ((-11840801818686022289390980276128 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (13, 2)],
  term ((-12010583216717537435731558354272 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1)],
  term ((581500691241191803372687643712 : Rat) / 97983883872014706756151952089) [(1, 2), (12, 1), (13, 2)],
  term ((-9113726363912218169824099559376 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 2)],
  term ((581500691241191803372687643712 : Rat) / 97983883872014706756151952089) [(1, 2), (12, 3)],
  term ((6005291608358768717865779177136 : Rat) / 1273790490336191187829975377157) [(1, 2), (13, 2)],
  term ((-55190523055791048575059754208 : Rat) / 97983883872014706756151952089) [(1, 3), (3, 1)],
  term ((4935125640031359600506654782848 : Rat) / 1273790490336191187829975377157) [(1, 3), (4, 1), (7, 1)],
  term ((2421270169913058464854566069600 : Rat) / 1273790490336191187829975377157) [(1, 3), (4, 1), (9, 1)],
  term ((54834331379730455630786545916016 : Rat) / 1273790490336191187829975377157) [(1, 3), (4, 1), (11, 1)],
  term ((-100490463835593717521424112278912 : Rat) / 1273790490336191187829975377157) [(1, 3), (4, 1), (13, 1)],
  term ((-3844345053764790772032286535463219668736 : Rat) / 103601401347717117429703636119532782115) [(1, 3), (4, 1), (15, 1)],
  term ((-35406196444 : Rat) / 7401317245) [(1, 3), (4, 1), (15, 1), (16, 1)],
  term ((6296679030432472048948395236592 : Rat) / 1273790490336191187829975377157) [(1, 3), (5, 1)],
  term ((-2421270169913058464854566069600 : Rat) / 1273790490336191187829975377157) [(1, 3), (5, 1), (8, 1)],
  term ((-1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 3), (5, 1), (12, 1)],
  term ((-1204603110221925235828014603456 : Rat) / 1273790490336191187829975377157) [(1, 3), (6, 1), (9, 1)],
  term ((2369240377868390092774574468352 : Rat) / 1273790490336191187829975377157) [(1, 3), (6, 1), (11, 1)],
  term ((-46748993949986447489493479162688 : Rat) / 268063527727966972480841957465) [(1, 3), (6, 1), (15, 1)],
  term ((-6274221872 : Rat) / 7401317245) [(1, 3), (6, 1), (15, 1), (16, 1)],
  term ((3538120905891652180976192523744 : Rat) / 1273790490336191187829975377157) [(1, 3), (7, 1)],
  term ((-93577763173818043520220058752 : Rat) / 8907625806546791523286541099) [(1, 3), (7, 1), (8, 1)],
  term ((-169522660793611944107149069918776 : Rat) / 1273790490336191187829975377157) [(1, 3), (8, 1), (11, 1)],
  term ((314812110558928514194686508976160 : Rat) / 1273790490336191187829975377157) [(1, 3), (8, 1), (13, 1)],
  term ((280457968271685969858884321806534349618688 : Rat) / 1346818217520322526586147269553926167495) [(1, 3), (8, 1), (15, 1)],
  term ((114574781274 : Rat) / 7401317245) [(1, 3), (8, 1), (15, 1), (16, 1)],
  term ((1269396019031954352912486130560 : Rat) / 1273790490336191187829975377157) [(1, 3), (9, 1)],
  term ((40680097002920104030943652672 : Rat) / 115799135485108289802725034287) [(1, 3), (9, 1), (12, 1)],
  term ((6358592813412618086399458764372 : Rat) / 97983883872014706756151952089) [(1, 3), (11, 1)],
  term ((109246983329997493839458513754864 : Rat) / 1273790490336191187829975377157) [(1, 3), (11, 1), (12, 1)],
  term ((-15482369628179068790637272035008 : Rat) / 97983883872014706756151952089) [(1, 3), (12, 1), (13, 1)],
  term ((888889340807001521095994285144650178871504 : Rat) / 1346818217520322526586147269553926167495) [(1, 3), (12, 1), (15, 1)],
  term ((-43688758928 : Rat) / 7401317245) [(1, 3), (12, 1), (15, 1), (16, 1)],
  term ((-162962095404509309207357826459600 : Rat) / 1273790490336191187829975377157) [(1, 3), (13, 1)],
  term ((-98520618286321506099973507211419195531368 : Rat) / 269363643504064505317229453910785233499) [(1, 3), (15, 1)],
  term ((-13738840293 : Rat) / 1480263449) [(1, 3), (15, 1), (16, 1)],
  term ((-6005291608358768717865779177136 : Rat) / 1273790490336191187829975377157) [(1, 4)],
  term ((-295647249531632379195468479808 : Rat) / 97983883872014706756151952089) [(1, 4), (4, 1)],
  term ((11840801818686022289390980276128 : Rat) / 1273790490336191187829975377157) [(1, 4), (8, 1)],
  term ((-581500691241191803372687643712 : Rat) / 97983883872014706756151952089) [(1, 4), (12, 1)],
  term ((1560587743825367507544935066832 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (12, 1)],
  term ((-780293871912683753772467533416 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (12, 2)],
  term ((-780293871912683753772467533416 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (13, 2)],
  term ((-2938878975701438057858690804544 : Rat) / 97983883872014706756151952089) [(3, 1), (12, 1), (13, 1)],
  term ((-214939533084328049877536652781642391606064 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (15, 1)],
  term ((-18930737152 : Rat) / 7401317245) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((1469439487850719028929345402272 : Rat) / 97983883872014706756151952089) [(3, 1), (12, 2), (13, 1)],
  term ((107469766542164024938768326390821195803032 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 2), (15, 1)],
  term ((9465368576 : Rat) / 7401317245) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((107469766542164024938768326390821195803032 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (13, 2), (15, 1)],
  term ((9465368576 : Rat) / 7401317245) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((1469439487850719028929345402272 : Rat) / 97983883872014706756151952089) [(3, 1), (13, 3)],
  term ((-139547446946385412691205792931392 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (12, 1)],
  term ((69773723473192706345602896465696 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (12, 2)],
  term ((69773723473192706345602896465696 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (13, 2)],
  term ((262793975901835801412014680824064 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (12, 1), (13, 1)],
  term ((-29255753088929547696583272731332684324608 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (7, 1), (12, 1), (15, 1)],
  term ((1042425392 : Rat) / 211466207) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-131396987950917900706007340412032 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (12, 2), (13, 1)],
  term ((14627876544464773848291636365666342162304 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (7, 1), (12, 2), (15, 1)],
  term ((-521212696 : Rat) / 211466207) [(4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((14627876544464773848291636365666342162304 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (7, 1), (13, 2), (15, 1)],
  term ((-521212696 : Rat) / 211466207) [(4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-131396987950917900706007340412032 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 3)],
  term ((-68464735292263216435894430528400 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (12, 1)],
  term ((34232367646131608217947215264200 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (12, 2)],
  term ((34232367646131608217947215264200 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (13, 2)],
  term ((128931918069652814160544085812800 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (12, 1), (13, 1)],
  term ((-1027435416174102218404321596014449957863072 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (12, 1), (15, 1)],
  term ((15832081284 : Rat) / 7401317245) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-64465959034826407080272042906400 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (12, 2), (13, 1)],
  term ((513717708087051109202160798007224978931536 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (12, 2), (15, 1)],
  term ((-7916040642 : Rat) / 7401317245) [(4, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((513717708087051109202160798007224978931536 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (13, 2), (15, 1)],
  term ((-7916040642 : Rat) / 7401317245) [(4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-64465959034826407080272042906400 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (13, 3)],
  term ((-25643537826421924901133444896352 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (12, 1), (13, 1)],
  term ((264495640813088176493304820581488928928704 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((7298123932 : Rat) / 1480263449) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((12821768913210962450566722448176 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (12, 2), (13, 1)],
  term ((-132247820406544088246652410290744464464352 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (11, 1), (12, 2), (15, 1)],
  term ((-3649061966 : Rat) / 1480263449) [(4, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-132247820406544088246652410290744464464352 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (11, 1), (13, 2), (15, 1)],
  term ((-3649061966 : Rat) / 1480263449) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((12821768913210962450566722448176 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 3)],
  term ((-14008864293390933964005499264032 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2), (12, 1)],
  term ((7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2), (12, 2)],
  term ((7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2), (13, 2)],
  term ((-719891918179213788674732489487046100237952 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((28609778424 : Rat) / 7401317245) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((97972540527695988759115675151232 : Rat) / 1273790490336191187829975377157) [(4, 1), (12, 1), (13, 2)],
  term ((2795567305819949296019883233142217210612512 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (12, 1), (15, 2)],
  term ((-107496545204 : Rat) / 7401317245) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((359945959089606894337366244743523050118976 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (12, 2), (13, 1), (15, 1)],
  term ((-14304889212 : Rat) / 7401317245) [(4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(4, 1), (12, 2), (13, 2)],
  term ((-1397783652909974648009941616571108605306256 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (12, 2), (15, 2)],
  term ((53748272602 : Rat) / 7401317245) [(4, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1397783652909974648009941616571108605306256 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 2), (15, 2)],
  term ((53748272602 : Rat) / 7401317245) [(4, 1), (13, 2), (15, 2), (16, 1)],
  term ((359945959089606894337366244743523050118976 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 3), (15, 1)],
  term ((-14304889212 : Rat) / 7401317245) [(4, 1), (13, 3), (15, 1), (16, 1)],
  term ((-48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 4)],
  term ((68464735292263216435894430528400 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 1), (12, 1)],
  term ((-34232367646131608217947215264200 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 1), (12, 2)],
  term ((-34232367646131608217947215264200 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 1), (13, 2)],
  term ((-128931918069652814160544085812800 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (12, 1), (13, 1)],
  term ((1027435416174102218404321596014449957863072 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-15832081284 : Rat) / 7401317245) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((64465959034826407080272042906400 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (12, 2), (13, 1)],
  term ((-513717708087051109202160798007224978931536 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (12, 2), (15, 1)],
  term ((7916040642 : Rat) / 7401317245) [(5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-513717708087051109202160798007224978931536 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (13, 2), (15, 1)],
  term ((7916040642 : Rat) / 7401317245) [(5, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((64465959034826407080272042906400 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (13, 3)],
  term ((-178047236692460263784296036771368 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 1)],
  term ((-26012426378065509144228434721648 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 1), (13, 2)],
  term ((141048471102361150180604887828980 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 2)],
  term ((-26012426378065509144228434721648 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 3)],
  term ((89023618346230131892148018385684 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (13, 2)],
  term ((335296289918679987397570298909856 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 1), (13, 1)],
  term ((-74470755625268217210323397620905239206496 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (12, 1), (13, 2), (15, 1)],
  term ((14304889212 : Rat) / 7401317245) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 1), (13, 3)],
  term ((-1652489349844167015393100087202915936580696 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (12, 1), (15, 1)],
  term ((69889168392 : Rat) / 7401317245) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-265620685487035982457900824606160 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 2), (13, 1)],
  term ((195037237234523988423439367768653689340668 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (12, 2), (15, 1)],
  term ((-1815838932 : Rat) / 211466207) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 3), (13, 1)],
  term ((-74470755625268217210323397620905239206496 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (12, 3), (15, 1)],
  term ((14304889212 : Rat) / 7401317245) [(5, 1), (12, 3), (15, 1), (16, 1)],
  term ((826244674922083507696550043601457968290348 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (13, 2), (15, 1)],
  term ((-34944584196 : Rat) / 7401317245) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-167648144959339993698785149454928 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 3)],
  term ((34061805286496577795922924513824 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-17030902643248288897961462256912 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1), (12, 2)],
  term ((-17030902643248288897961462256912 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1), (13, 2)],
  term ((-64144758170113278448497825863808 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (12, 1), (13, 1)],
  term ((32072379085056639224248912931904 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (12, 2), (13, 1)],
  term ((32072379085056639224248912931904 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (13, 3)],
  term ((-1069891365385373922720 : Rat) / 253528477699481291099) [(6, 1), (12, 1)],
  term ((534945682692686961360 : Rat) / 253528477699481291099) [(6, 1), (12, 2)],
  term ((534945682692686961360 : Rat) / 253528477699481291099) [(6, 1), (13, 2)],
  term ((802418524039030442040 : Rat) / 253528477699481291099) [(12, 1)],
  term ((-401209262019515221020 : Rat) / 253528477699481291099) [(12, 2)],
  term ((-401209262019515221020 : Rat) / 253528477699481291099) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 7, terms 0 through 99. -/
theorem ep_Q2_002_block_07_0000_0099_valid :
    checkProductSumEq ep_Q2_002_partials_07_0000_0099
      ep_Q2_002_block_07_0000_0099 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
