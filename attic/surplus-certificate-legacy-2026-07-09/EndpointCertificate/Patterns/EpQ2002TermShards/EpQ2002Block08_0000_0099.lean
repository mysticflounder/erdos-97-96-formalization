/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 8:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 8 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_08_0000_0099 : Poly :=
[
  term (-2 : Rat) [(0, 1)],
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0000 : Poly :=
[
  term ((-6030972427540066085910 : Rat) / 253528477699481291099) []
]

/-- Partial product 0 for generator 8. -/
def ep_Q2_002_partial_08_0000 : Poly :=
[
  term ((12061944855080132171820 : Rat) / 253528477699481291099) [(0, 1)],
  term ((-6030972427540066085910 : Rat) / 253528477699481291099) [(0, 2)],
  term ((-6030972427540066085910 : Rat) / 253528477699481291099) [(1, 2)],
  term ((-12061944855080132171820 : Rat) / 253528477699481291099) [(14, 1)],
  term ((6030972427540066085910 : Rat) / 253528477699481291099) [(14, 2)],
  term ((6030972427540066085910 : Rat) / 253528477699481291099) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 8. -/
theorem ep_Q2_002_partial_08_0000_valid :
    mulPoly ep_Q2_002_coefficient_08_0000
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0001 : Poly :=
[
  term ((4039742732489230527245195334144 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1)]
]

/-- Partial product 1 for generator 8. -/
def ep_Q2_002_partial_08_0001 : Poly :=
[
  term ((8079485464978461054490390668288 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (14, 1)],
  term ((-4039742732489230527245195334144 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (14, 2)],
  term ((-4039742732489230527245195334144 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (15, 2)],
  term ((4039742732489230527245195334144 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 3), (5, 1)],
  term ((-8079485464978461054490390668288 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (5, 1)],
  term ((4039742732489230527245195334144 : Rat) / 1273790490336191187829975377157) [(0, 3), (1, 1), (5, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 8. -/
theorem ep_Q2_002_partial_08_0001_valid :
    mulPoly ep_Q2_002_coefficient_08_0001
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0002 : Poly :=
[
  term ((-2534889949687781117878988436096 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1)]
]

/-- Partial product 2 for generator 8. -/
def ep_Q2_002_partial_08_0002 : Poly :=
[
  term ((-5069779899375562235757976872192 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (14, 1)],
  term ((2534889949687781117878988436096 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (14, 2)],
  term ((2534889949687781117878988436096 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (15, 2)],
  term ((-2534889949687781117878988436096 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 3), (7, 1)],
  term ((5069779899375562235757976872192 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (7, 1)],
  term ((-2534889949687781117878988436096 : Rat) / 1273790490336191187829975377157) [(0, 3), (1, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 8. -/
theorem ep_Q2_002_partial_08_0002_valid :
    mulPoly ep_Q2_002_coefficient_08_0002
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0003 : Poly :=
[
  term ((348375289288835045927331980352 : Rat) / 115799135485108289802725034287) [(0, 1), (1, 1), (9, 1)]
]

/-- Partial product 3 for generator 8. -/
def ep_Q2_002_partial_08_0003 : Poly :=
[
  term ((696750578577670091854663960704 : Rat) / 115799135485108289802725034287) [(0, 1), (1, 1), (9, 1), (14, 1)],
  term ((-348375289288835045927331980352 : Rat) / 115799135485108289802725034287) [(0, 1), (1, 1), (9, 1), (14, 2)],
  term ((-348375289288835045927331980352 : Rat) / 115799135485108289802725034287) [(0, 1), (1, 1), (9, 1), (15, 2)],
  term ((348375289288835045927331980352 : Rat) / 115799135485108289802725034287) [(0, 1), (1, 3), (9, 1)],
  term ((-696750578577670091854663960704 : Rat) / 115799135485108289802725034287) [(0, 2), (1, 1), (9, 1)],
  term ((348375289288835045927331980352 : Rat) / 115799135485108289802725034287) [(0, 3), (1, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 8. -/
theorem ep_Q2_002_partial_08_0003_valid :
    mulPoly ep_Q2_002_coefficient_08_0003
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0004 : Poly :=
[
  term ((89672609289557259039953945717232 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1)]
]

/-- Partial product 4 for generator 8. -/
def ep_Q2_002_partial_08_0004 : Poly :=
[
  term ((179345218579114518079907891434464 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1), (14, 1)],
  term ((-89672609289557259039953945717232 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1), (14, 2)],
  term ((-89672609289557259039953945717232 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1), (15, 2)],
  term ((89672609289557259039953945717232 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 3), (11, 1)],
  term ((-179345218579114518079907891434464 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (11, 1)],
  term ((89672609289557259039953945717232 : Rat) / 1273790490336191187829975377157) [(0, 3), (1, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 8. -/
theorem ep_Q2_002_partial_08_0004_valid :
    mulPoly ep_Q2_002_coefficient_08_0004
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0005 : Poly :=
[
  term ((-177225658430121250218322201895232 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (13, 1)]
]

/-- Partial product 5 for generator 8. -/
def ep_Q2_002_partial_08_0005 : Poly :=
[
  term ((-354451316860242500436644403790464 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (13, 1), (14, 1)],
  term ((177225658430121250218322201895232 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (13, 1), (14, 2)],
  term ((177225658430121250218322201895232 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (13, 1), (15, 2)],
  term ((-177225658430121250218322201895232 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 3), (13, 1)],
  term ((354451316860242500436644403790464 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (13, 1)],
  term ((-177225658430121250218322201895232 : Rat) / 1273790490336191187829975377157) [(0, 3), (1, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 8. -/
theorem ep_Q2_002_partial_08_0005_valid :
    mulPoly ep_Q2_002_coefficient_08_0005
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0006 : Poly :=
[
  term ((-437625254029569747285894144582261248267952 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 6 for generator 8. -/
def ep_Q2_002_partial_08_0006 : Poly :=
[
  term ((-875250508059139494571788289164522496535904 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (14, 1), (15, 1)],
  term ((437625254029569747285894144582261248267952 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (14, 2), (15, 1)],
  term ((437625254029569747285894144582261248267952 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (15, 3)],
  term ((-437625254029569747285894144582261248267952 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 3), (15, 1)],
  term ((875250508059139494571788289164522496535904 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (1, 1), (15, 1)],
  term ((-437625254029569747285894144582261248267952 : Rat) / 1346818217520322526586147269553926167495) [(0, 3), (1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 8. -/
theorem ep_Q2_002_partial_08_0006_valid :
    mulPoly ep_Q2_002_coefficient_08_0006
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0007 : Poly :=
[
  term ((-71427522016 : Rat) / 7401317245) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 8. -/
def ep_Q2_002_partial_08_0007 : Poly :=
[
  term ((-142855044032 : Rat) / 7401317245) [(0, 1), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((71427522016 : Rat) / 7401317245) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((71427522016 : Rat) / 7401317245) [(0, 1), (1, 1), (15, 3), (16, 1)],
  term ((-71427522016 : Rat) / 7401317245) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term ((142855044032 : Rat) / 7401317245) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-71427522016 : Rat) / 7401317245) [(0, 3), (1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 8. -/
theorem ep_Q2_002_partial_08_0007_valid :
    mulPoly ep_Q2_002_coefficient_08_0007
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0008 : Poly :=
[
  term ((-6439181915715762621857499195456 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2)]
]

/-- Partial product 8 for generator 8. -/
def ep_Q2_002_partial_08_0008 : Poly :=
[
  term ((-12878363831431525243714998390912 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (14, 1)],
  term ((6439181915715762621857499195456 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (14, 2)],
  term ((6439181915715762621857499195456 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (15, 2)],
  term ((-6439181915715762621857499195456 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 4)],
  term ((12878363831431525243714998390912 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 2)],
  term ((-6439181915715762621857499195456 : Rat) / 1273790490336191187829975377157) [(0, 3), (1, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 8. -/
theorem ep_Q2_002_partial_08_0008_valid :
    mulPoly ep_Q2_002_coefficient_08_0008
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0009 : Poly :=
[
  term ((-57114633522836183706024143868288 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 1)]
]

/-- Partial product 9 for generator 8. -/
def ep_Q2_002_partial_08_0009 : Poly :=
[
  term ((-57114633522836183706024143868288 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (5, 1), (11, 1)],
  term ((-114229267045672367412048287736576 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 1), (14, 1)],
  term ((57114633522836183706024143868288 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 1), (14, 2)],
  term ((57114633522836183706024143868288 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 1), (15, 2)],
  term ((114229267045672367412048287736576 : Rat) / 1273790490336191187829975377157) [(0, 2), (5, 1), (11, 1)],
  term ((-57114633522836183706024143868288 : Rat) / 1273790490336191187829975377157) [(0, 3), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 8. -/
theorem ep_Q2_002_partial_08_0009_valid :
    mulPoly ep_Q2_002_coefficient_08_0009
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0010 : Poly :=
[
  term ((107557550883815516796500102186496 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (13, 1)]
]

/-- Partial product 10 for generator 8. -/
def ep_Q2_002_partial_08_0010 : Poly :=
[
  term ((107557550883815516796500102186496 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (5, 1), (13, 1)],
  term ((215115101767631033593000204372992 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (13, 1), (14, 1)],
  term ((-107557550883815516796500102186496 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (13, 1), (14, 2)],
  term ((-107557550883815516796500102186496 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (13, 1), (15, 2)],
  term ((-215115101767631033593000204372992 : Rat) / 1273790490336191187829975377157) [(0, 2), (5, 1), (13, 1)],
  term ((107557550883815516796500102186496 : Rat) / 1273790490336191187829975377157) [(0, 3), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 8. -/
theorem ep_Q2_002_partial_08_0010_valid :
    mulPoly ep_Q2_002_coefficient_08_0010
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0011 : Poly :=
[
  term ((-735124433572387104387134023322073147961728 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 11 for generator 8. -/
def ep_Q2_002_partial_08_0011 : Poly :=
[
  term ((-735124433572387104387134023322073147961728 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 2), (5, 1), (15, 1)],
  term ((-1470248867144774208774268046644146295923456 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (14, 1), (15, 1)],
  term ((735124433572387104387134023322073147961728 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (14, 2), (15, 1)],
  term ((735124433572387104387134023322073147961728 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (15, 3)],
  term ((1470248867144774208774268046644146295923456 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (5, 1), (15, 1)],
  term ((-735124433572387104387134023322073147961728 : Rat) / 1346818217520322526586147269553926167495) [(0, 3), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 8. -/
theorem ep_Q2_002_partial_08_0011_valid :
    mulPoly ep_Q2_002_coefficient_08_0011
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0012 : Poly :=
[
  term ((17222453536 : Rat) / 7401317245) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 8. -/
def ep_Q2_002_partial_08_0012 : Poly :=
[
  term ((17222453536 : Rat) / 7401317245) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((34444907072 : Rat) / 7401317245) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17222453536 : Rat) / 7401317245) [(0, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-17222453536 : Rat) / 7401317245) [(0, 1), (5, 1), (15, 3), (16, 1)],
  term ((-34444907072 : Rat) / 7401317245) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((17222453536 : Rat) / 7401317245) [(0, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 8. -/
theorem ep_Q2_002_partial_08_0012_valid :
    mulPoly ep_Q2_002_coefficient_08_0012
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0013 : Poly :=
[
  term ((35838745208392855232790833172192 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 13 for generator 8. -/
def ep_Q2_002_partial_08_0013 : Poly :=
[
  term ((35838745208392855232790833172192 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (7, 1), (11, 1)],
  term ((71677490416785710465581666344384 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1), (14, 1)],
  term ((-35838745208392855232790833172192 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1), (14, 2)],
  term ((-35838745208392855232790833172192 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1), (15, 2)],
  term ((-71677490416785710465581666344384 : Rat) / 1273790490336191187829975377157) [(0, 2), (7, 1), (11, 1)],
  term ((35838745208392855232790833172192 : Rat) / 1273790490336191187829975377157) [(0, 3), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 8. -/
theorem ep_Q2_002_partial_08_0013_valid :
    mulPoly ep_Q2_002_coefficient_08_0013
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0014 : Poly :=
[
  term ((-67491068813784397620094809377664 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 14 for generator 8. -/
def ep_Q2_002_partial_08_0014 : Poly :=
[
  term ((-67491068813784397620094809377664 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (7, 1), (13, 1)],
  term ((-134982137627568795240189618755328 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (13, 1), (14, 1)],
  term ((67491068813784397620094809377664 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (13, 1), (14, 2)],
  term ((67491068813784397620094809377664 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (13, 1), (15, 2)],
  term ((134982137627568795240189618755328 : Rat) / 1273790490336191187829975377157) [(0, 2), (7, 1), (13, 1)],
  term ((-67491068813784397620094809377664 : Rat) / 1273790490336191187829975377157) [(0, 3), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 8. -/
theorem ep_Q2_002_partial_08_0014_valid :
    mulPoly ep_Q2_002_coefficient_08_0014
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0015 : Poly :=
[
  term ((-660713555419972994318477863829433249304368 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 15 for generator 8. -/
def ep_Q2_002_partial_08_0015 : Poly :=
[
  term ((-660713555419972994318477863829433249304368 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term ((-1321427110839945988636955727658866498608736 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term ((660713555419972994318477863829433249304368 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term ((660713555419972994318477863829433249304368 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (15, 3)],
  term ((1321427110839945988636955727658866498608736 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (7, 1), (15, 1)],
  term ((-660713555419972994318477863829433249304368 : Rat) / 1346818217520322526586147269553926167495) [(0, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 8. -/
theorem ep_Q2_002_partial_08_0015_valid :
    mulPoly ep_Q2_002_coefficient_08_0015
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0016 : Poly :=
[
  term ((-41983667284 : Rat) / 7401317245) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 8. -/
def ep_Q2_002_partial_08_0016 : Poly :=
[
  term ((-41983667284 : Rat) / 7401317245) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-83967334568 : Rat) / 7401317245) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((41983667284 : Rat) / 7401317245) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((41983667284 : Rat) / 7401317245) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((83967334568 : Rat) / 7401317245) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-41983667284 : Rat) / 7401317245) [(0, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 8. -/
theorem ep_Q2_002_partial_08_0016_valid :
    mulPoly ep_Q2_002_coefficient_08_0016
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0017 : Poly :=
[
  term ((-4925394584195070471041568310704 : Rat) / 115799135485108289802725034287) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 17 for generator 8. -/
def ep_Q2_002_partial_08_0017 : Poly :=
[
  term ((-4925394584195070471041568310704 : Rat) / 115799135485108289802725034287) [(0, 1), (1, 2), (9, 1), (11, 1)],
  term ((-9850789168390140942083136621408 : Rat) / 115799135485108289802725034287) [(0, 1), (9, 1), (11, 1), (14, 1)],
  term ((4925394584195070471041568310704 : Rat) / 115799135485108289802725034287) [(0, 1), (9, 1), (11, 1), (14, 2)],
  term ((4925394584195070471041568310704 : Rat) / 115799135485108289802725034287) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((9850789168390140942083136621408 : Rat) / 115799135485108289802725034287) [(0, 2), (9, 1), (11, 1)],
  term ((-4925394584195070471041568310704 : Rat) / 115799135485108289802725034287) [(0, 3), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 8. -/
theorem ep_Q2_002_partial_08_0017_valid :
    mulPoly ep_Q2_002_coefficient_08_0017
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0018 : Poly :=
[
  term ((9275440389556469816258880216768 : Rat) / 115799135485108289802725034287) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 18 for generator 8. -/
def ep_Q2_002_partial_08_0018 : Poly :=
[
  term ((9275440389556469816258880216768 : Rat) / 115799135485108289802725034287) [(0, 1), (1, 2), (9, 1), (13, 1)],
  term ((18550880779112939632517760433536 : Rat) / 115799135485108289802725034287) [(0, 1), (9, 1), (13, 1), (14, 1)],
  term ((-9275440389556469816258880216768 : Rat) / 115799135485108289802725034287) [(0, 1), (9, 1), (13, 1), (14, 2)],
  term ((-9275440389556469816258880216768 : Rat) / 115799135485108289802725034287) [(0, 1), (9, 1), (13, 1), (15, 2)],
  term ((-18550880779112939632517760433536 : Rat) / 115799135485108289802725034287) [(0, 2), (9, 1), (13, 1)],
  term ((9275440389556469816258880216768 : Rat) / 115799135485108289802725034287) [(0, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 8. -/
theorem ep_Q2_002_partial_08_0018_valid :
    mulPoly ep_Q2_002_coefficient_08_0018
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0019 : Poly :=
[
  term ((5023719978252624155832503530521657444264 : Rat) / 24487603954914955028839041264616839409) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 19 for generator 8. -/
def ep_Q2_002_partial_08_0019 : Poly :=
[
  term ((5023719978252624155832503530521657444264 : Rat) / 24487603954914955028839041264616839409) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((10047439956505248311665007061043314888528 : Rat) / 24487603954914955028839041264616839409) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term ((-5023719978252624155832503530521657444264 : Rat) / 24487603954914955028839041264616839409) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((-5023719978252624155832503530521657444264 : Rat) / 24487603954914955028839041264616839409) [(0, 1), (9, 1), (15, 3)],
  term ((-10047439956505248311665007061043314888528 : Rat) / 24487603954914955028839041264616839409) [(0, 2), (9, 1), (15, 1)],
  term ((5023719978252624155832503530521657444264 : Rat) / 24487603954914955028839041264616839409) [(0, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 8. -/
theorem ep_Q2_002_partial_08_0019_valid :
    mulPoly ep_Q2_002_coefficient_08_0019
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0020 : Poly :=
[
  term ((1183365302 : Rat) / 211466207) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 8. -/
def ep_Q2_002_partial_08_0020 : Poly :=
[
  term ((1183365302 : Rat) / 211466207) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((2366730604 : Rat) / 211466207) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1183365302 : Rat) / 211466207) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1183365302 : Rat) / 211466207) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((-2366730604 : Rat) / 211466207) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((1183365302 : Rat) / 211466207) [(0, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 8. -/
theorem ep_Q2_002_partial_08_0020_valid :
    mulPoly ep_Q2_002_coefficient_08_0020
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0021 : Poly :=
[
  term ((45404057130802661965632964933536 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 21 for generator 8. -/
def ep_Q2_002_partial_08_0021 : Poly :=
[
  term ((45404057130802661965632964933536 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((90808114261605323931265929867072 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 1), (14, 1)],
  term ((-45404057130802661965632964933536 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((-45404057130802661965632964933536 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((-90808114261605323931265929867072 : Rat) / 1273790490336191187829975377157) [(0, 2), (11, 1), (13, 1)],
  term ((45404057130802661965632964933536 : Rat) / 1273790490336191187829975377157) [(0, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 8. -/
theorem ep_Q2_002_partial_08_0021_valid :
    mulPoly ep_Q2_002_coefficient_08_0021
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0022 : Poly :=
[
  term ((-1152230675219932452276975247017027696698424 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 22 for generator 8. -/
def ep_Q2_002_partial_08_0022 : Poly :=
[
  term ((-1152230675219932452276975247017027696698424 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((-2304461350439864904553950494034055393396848 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term ((1152230675219932452276975247017027696698424 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((1152230675219932452276975247017027696698424 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (15, 3)],
  term ((2304461350439864904553950494034055393396848 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (11, 1), (15, 1)],
  term ((-1152230675219932452276975247017027696698424 : Rat) / 1346818217520322526586147269553926167495) [(0, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 8. -/
theorem ep_Q2_002_partial_08_0022_valid :
    mulPoly ep_Q2_002_coefficient_08_0022
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0023 : Poly :=
[
  term ((-39443926462 : Rat) / 7401317245) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 8. -/
def ep_Q2_002_partial_08_0023 : Poly :=
[
  term ((-39443926462 : Rat) / 7401317245) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-78887852924 : Rat) / 7401317245) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39443926462 : Rat) / 7401317245) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((39443926462 : Rat) / 7401317245) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((78887852924 : Rat) / 7401317245) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-39443926462 : Rat) / 7401317245) [(0, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 8. -/
theorem ep_Q2_002_partial_08_0023_valid :
    mulPoly ep_Q2_002_coefficient_08_0023
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0024 : Poly :=
[
  term ((135028704725573384111185361520 : Rat) / 8907625806546791523286541099) [(0, 1), (11, 2)]
]

/-- Partial product 24 for generator 8. -/
def ep_Q2_002_partial_08_0024 : Poly :=
[
  term ((135028704725573384111185361520 : Rat) / 8907625806546791523286541099) [(0, 1), (1, 2), (11, 2)],
  term ((270057409451146768222370723040 : Rat) / 8907625806546791523286541099) [(0, 1), (11, 2), (14, 1)],
  term ((-135028704725573384111185361520 : Rat) / 8907625806546791523286541099) [(0, 1), (11, 2), (14, 2)],
  term ((-135028704725573384111185361520 : Rat) / 8907625806546791523286541099) [(0, 1), (11, 2), (15, 2)],
  term ((-270057409451146768222370723040 : Rat) / 8907625806546791523286541099) [(0, 2), (11, 2)],
  term ((135028704725573384111185361520 : Rat) / 8907625806546791523286541099) [(0, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 8. -/
theorem ep_Q2_002_partial_08_0024_valid :
    mulPoly ep_Q2_002_coefficient_08_0024
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0025 : Poly :=
[
  term ((79487390270197526185166791572366050232036 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 25 for generator 8. -/
def ep_Q2_002_partial_08_0025 : Poly :=
[
  term ((79487390270197526185166791572366050232036 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((158974780540395052370333583144732100464072 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((-79487390270197526185166791572366050232036 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((-79487390270197526185166791572366050232036 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (13, 1), (15, 3)],
  term ((-158974780540395052370333583144732100464072 : Rat) / 103601401347717117429703636119532782115) [(0, 2), (13, 1), (15, 1)],
  term ((79487390270197526185166791572366050232036 : Rat) / 103601401347717117429703636119532782115) [(0, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 8. -/
theorem ep_Q2_002_partial_08_0025_valid :
    mulPoly ep_Q2_002_coefficient_08_0025
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0026 : Poly :=
[
  term ((-4286620453 : Rat) / 1057331035) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 8. -/
def ep_Q2_002_partial_08_0026 : Poly :=
[
  term ((-4286620453 : Rat) / 1057331035) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8573240906 : Rat) / 1057331035) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4286620453 : Rat) / 1057331035) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((4286620453 : Rat) / 1057331035) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((8573240906 : Rat) / 1057331035) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4286620453 : Rat) / 1057331035) [(0, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 8. -/
theorem ep_Q2_002_partial_08_0026_valid :
    mulPoly ep_Q2_002_coefficient_08_0026
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0027 : Poly :=
[
  term ((-153982041604766657839392822548352 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2)]
]

/-- Partial product 27 for generator 8. -/
def ep_Q2_002_partial_08_0027 : Poly :=
[
  term ((-153982041604766657839392822548352 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (13, 2)],
  term ((-307964083209533315678785645096704 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2), (14, 1)],
  term ((153982041604766657839392822548352 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2), (14, 2)],
  term ((153982041604766657839392822548352 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2), (15, 2)],
  term ((307964083209533315678785645096704 : Rat) / 1273790490336191187829975377157) [(0, 2), (13, 2)],
  term ((-153982041604766657839392822548352 : Rat) / 1273790490336191187829975377157) [(0, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 8. -/
theorem ep_Q2_002_partial_08_0027_valid :
    mulPoly ep_Q2_002_coefficient_08_0027
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0028 : Poly :=
[
  term ((-1025704141627803448472009149084370045565768 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (15, 2)]
]

/-- Partial product 28 for generator 8. -/
def ep_Q2_002_partial_08_0028 : Poly :=
[
  term ((-1025704141627803448472009149084370045565768 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 2), (15, 2)],
  term ((-2051408283255606896944018298168740091131536 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (14, 1), (15, 2)],
  term ((1025704141627803448472009149084370045565768 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (14, 2), (15, 2)],
  term ((1025704141627803448472009149084370045565768 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (15, 4)],
  term ((2051408283255606896944018298168740091131536 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (15, 2)],
  term ((-1025704141627803448472009149084370045565768 : Rat) / 1346818217520322526586147269553926167495) [(0, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 8. -/
theorem ep_Q2_002_partial_08_0028_valid :
    mulPoly ep_Q2_002_coefficient_08_0028
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0029 : Poly :=
[
  term ((35309876906 : Rat) / 7401317245) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 29 for generator 8. -/
def ep_Q2_002_partial_08_0029 : Poly :=
[
  term ((35309876906 : Rat) / 7401317245) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((70619753812 : Rat) / 7401317245) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((-35309876906 : Rat) / 7401317245) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((-35309876906 : Rat) / 7401317245) [(0, 1), (15, 4), (16, 1)],
  term ((-70619753812 : Rat) / 7401317245) [(0, 2), (15, 2), (16, 1)],
  term ((35309876906 : Rat) / 7401317245) [(0, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 8. -/
theorem ep_Q2_002_partial_08_0029_valid :
    mulPoly ep_Q2_002_coefficient_08_0029
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0030 : Poly :=
[
  term ((2079579198120066384386689412288 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1)]
]

/-- Partial product 30 for generator 8. -/
def ep_Q2_002_partial_08_0030 : Poly :=
[
  term ((-4159158396240132768773378824576 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1)],
  term ((2079579198120066384386689412288 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (3, 1)],
  term ((4159158396240132768773378824576 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (14, 1)],
  term ((-2079579198120066384386689412288 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (14, 2)],
  term ((-2079579198120066384386689412288 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (15, 2)],
  term ((2079579198120066384386689412288 : Rat) / 1273790490336191187829975377157) [(1, 3), (3, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 8. -/
theorem ep_Q2_002_partial_08_0030_valid :
    mulPoly ep_Q2_002_coefficient_08_0030
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0031 : Poly :=
[
  term ((1420705013955037485625388731712 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1)]
]

/-- Partial product 31 for generator 8. -/
def ep_Q2_002_partial_08_0031 : Poly :=
[
  term ((-2841410027910074971250777463424 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (4, 1)],
  term ((1420705013955037485625388731712 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (3, 1), (4, 1)],
  term ((2841410027910074971250777463424 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (14, 1)],
  term ((-1420705013955037485625388731712 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (14, 2)],
  term ((-1420705013955037485625388731712 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (15, 2)],
  term ((1420705013955037485625388731712 : Rat) / 1273790490336191187829975377157) [(1, 3), (3, 1), (4, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 8. -/
theorem ep_Q2_002_partial_08_0031_valid :
    mulPoly ep_Q2_002_coefficient_08_0031
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0032 : Poly :=
[
  term ((-613290056235095947809105628608 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1)]
]

/-- Partial product 32 for generator 8. -/
def ep_Q2_002_partial_08_0032 : Poly :=
[
  term ((1226580112470191895618211257216 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (6, 1)],
  term ((-613290056235095947809105628608 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (3, 1), (6, 1)],
  term ((-1226580112470191895618211257216 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (14, 1)],
  term ((613290056235095947809105628608 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (14, 2)],
  term ((613290056235095947809105628608 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (15, 2)],
  term ((-613290056235095947809105628608 : Rat) / 1273790490336191187829975377157) [(1, 3), (3, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 8. -/
theorem ep_Q2_002_partial_08_0032_valid :
    mulPoly ep_Q2_002_coefficient_08_0032
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0033 : Poly :=
[
  term ((-4935125640031359600506654782848 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1)]
]

/-- Partial product 33 for generator 8. -/
def ep_Q2_002_partial_08_0033 : Poly :=
[
  term ((9870251280062719201013309565696 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (4, 1), (7, 1)],
  term ((-4935125640031359600506654782848 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (4, 1), (7, 1)],
  term ((-9870251280062719201013309565696 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (14, 1)],
  term ((4935125640031359600506654782848 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (14, 2)],
  term ((4935125640031359600506654782848 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (15, 2)],
  term ((-4935125640031359600506654782848 : Rat) / 1273790490336191187829975377157) [(1, 3), (4, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 8. -/
theorem ep_Q2_002_partial_08_0033_valid :
    mulPoly ep_Q2_002_coefficient_08_0033
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0034 : Poly :=
[
  term ((-15162489548754842436942999648 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (9, 1)]
]

/-- Partial product 34 for generator 8. -/
def ep_Q2_002_partial_08_0034 : Poly :=
[
  term ((30324979097509684873885999296 : Rat) / 115799135485108289802725034287) [(0, 1), (1, 1), (4, 1), (9, 1)],
  term ((-15162489548754842436942999648 : Rat) / 115799135485108289802725034287) [(0, 2), (1, 1), (4, 1), (9, 1)],
  term ((-30324979097509684873885999296 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (9, 1), (14, 1)],
  term ((15162489548754842436942999648 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (9, 1), (14, 2)],
  term ((15162489548754842436942999648 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (9, 1), (15, 2)],
  term ((-15162489548754842436942999648 : Rat) / 115799135485108289802725034287) [(1, 3), (4, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 8. -/
theorem ep_Q2_002_partial_08_0034_valid :
    mulPoly ep_Q2_002_coefficient_08_0034
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0035 : Poly :=
[
  term ((-57343412300765195893823187175728 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1)]
]

/-- Partial product 35 for generator 8. -/
def ep_Q2_002_partial_08_0035 : Poly :=
[
  term ((114686824601530391787646374351456 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (4, 1), (11, 1)],
  term ((-57343412300765195893823187175728 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (4, 1), (11, 1)],
  term ((-114686824601530391787646374351456 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (14, 1)],
  term ((57343412300765195893823187175728 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (14, 2)],
  term ((57343412300765195893823187175728 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (15, 2)],
  term ((-57343412300765195893823187175728 : Rat) / 1273790490336191187829975377157) [(1, 3), (4, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 8. -/
theorem ep_Q2_002_partial_08_0035_valid :
    mulPoly ep_Q2_002_coefficient_08_0035
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0036 : Poly :=
[
  term ((8752376920653082207442683725312 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (13, 1)]
]

/-- Partial product 36 for generator 8. -/
def ep_Q2_002_partial_08_0036 : Poly :=
[
  term ((-17504753841306164414885367450624 : Rat) / 115799135485108289802725034287) [(0, 1), (1, 1), (4, 1), (13, 1)],
  term ((8752376920653082207442683725312 : Rat) / 115799135485108289802725034287) [(0, 2), (1, 1), (4, 1), (13, 1)],
  term ((17504753841306164414885367450624 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (13, 1), (14, 1)],
  term ((-8752376920653082207442683725312 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (13, 1), (14, 2)],
  term ((-8752376920653082207442683725312 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (13, 1), (15, 2)],
  term ((8752376920653082207442683725312 : Rat) / 115799135485108289802725034287) [(1, 3), (4, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 8. -/
theorem ep_Q2_002_partial_08_0036_valid :
    mulPoly ep_Q2_002_coefficient_08_0036
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0037 : Poly :=
[
  term ((54788610022254561397955989521752316302528 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (15, 1)]
]

/-- Partial product 37 for generator 8. -/
def ep_Q2_002_partial_08_0037 : Poly :=
[
  term ((-109577220044509122795911979043504632605056 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (4, 1), (15, 1)],
  term ((54788610022254561397955989521752316302528 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (1, 1), (4, 1), (15, 1)],
  term ((109577220044509122795911979043504632605056 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (14, 1), (15, 1)],
  term ((-54788610022254561397955989521752316302528 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (14, 2), (15, 1)],
  term ((-54788610022254561397955989521752316302528 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (15, 3)],
  term ((54788610022254561397955989521752316302528 : Rat) / 1346818217520322526586147269553926167495) [(1, 3), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 8. -/
theorem ep_Q2_002_partial_08_0037_valid :
    mulPoly ep_Q2_002_coefficient_08_0037
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0038 : Poly :=
[
  term ((35406196444 : Rat) / 7401317245) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 8. -/
def ep_Q2_002_partial_08_0038 : Poly :=
[
  term ((-70812392888 : Rat) / 7401317245) [(0, 1), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((35406196444 : Rat) / 7401317245) [(0, 2), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((70812392888 : Rat) / 7401317245) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35406196444 : Rat) / 7401317245) [(1, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((-35406196444 : Rat) / 7401317245) [(1, 1), (4, 1), (15, 3), (16, 1)],
  term ((35406196444 : Rat) / 7401317245) [(1, 3), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 8. -/
theorem ep_Q2_002_partial_08_0038_valid :
    mulPoly ep_Q2_002_coefficient_08_0038
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0039 : Poly :=
[
  term ((-5006447349977004329038174365008 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1)]
]

/-- Partial product 39 for generator 8. -/
def ep_Q2_002_partial_08_0039 : Poly :=
[
  term ((10012894699954008658076348730016 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1)],
  term ((-5006447349977004329038174365008 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (5, 1)],
  term ((-10012894699954008658076348730016 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (14, 1)],
  term ((5006447349977004329038174365008 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (14, 2)],
  term ((5006447349977004329038174365008 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (15, 2)],
  term ((-5006447349977004329038174365008 : Rat) / 1273790490336191187829975377157) [(1, 3), (5, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 8. -/
theorem ep_Q2_002_partial_08_0039_valid :
    mulPoly ep_Q2_002_coefficient_08_0039
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0040 : Poly :=
[
  term ((1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1)]
]

/-- Partial product 40 for generator 8. -/
def ep_Q2_002_partial_08_0040 : Poly :=
[
  term ((-3679740337410575686854633771648 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (6, 1)],
  term ((1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (5, 1), (6, 1)],
  term ((3679740337410575686854633771648 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (14, 1)],
  term ((-1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (14, 2)],
  term ((-1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (15, 2)],
  term ((1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 3), (5, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 8. -/
theorem ep_Q2_002_partial_08_0040_valid :
    mulPoly ep_Q2_002_coefficient_08_0040
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0041 : Poly :=
[
  term ((15162489548754842436942999648 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (8, 1)]
]

/-- Partial product 41 for generator 8. -/
def ep_Q2_002_partial_08_0041 : Poly :=
[
  term ((-30324979097509684873885999296 : Rat) / 115799135485108289802725034287) [(0, 1), (1, 1), (5, 1), (8, 1)],
  term ((15162489548754842436942999648 : Rat) / 115799135485108289802725034287) [(0, 2), (1, 1), (5, 1), (8, 1)],
  term ((30324979097509684873885999296 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (8, 1), (14, 1)],
  term ((-15162489548754842436942999648 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (8, 1), (14, 2)],
  term ((-15162489548754842436942999648 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (8, 1), (15, 2)],
  term ((15162489548754842436942999648 : Rat) / 115799135485108289802725034287) [(1, 3), (5, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 8. -/
theorem ep_Q2_002_partial_08_0041_valid :
    mulPoly ep_Q2_002_coefficient_08_0041
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0042 : Poly :=
[
  term ((-140689930714257721061875183488 : Rat) / 97983883872014706756151952089) [(1, 1), (5, 1), (12, 1)]
]

/-- Partial product 42 for generator 8. -/
def ep_Q2_002_partial_08_0042 : Poly :=
[
  term ((281379861428515442123750366976 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 1), (5, 1), (12, 1)],
  term ((-140689930714257721061875183488 : Rat) / 97983883872014706756151952089) [(0, 2), (1, 1), (5, 1), (12, 1)],
  term ((-281379861428515442123750366976 : Rat) / 97983883872014706756151952089) [(1, 1), (5, 1), (12, 1), (14, 1)],
  term ((140689930714257721061875183488 : Rat) / 97983883872014706756151952089) [(1, 1), (5, 1), (12, 1), (14, 2)],
  term ((140689930714257721061875183488 : Rat) / 97983883872014706756151952089) [(1, 1), (5, 1), (12, 1), (15, 2)],
  term ((-140689930714257721061875183488 : Rat) / 97983883872014706756151952089) [(1, 3), (5, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 8. -/
theorem ep_Q2_002_partial_08_0042_valid :
    mulPoly ep_Q2_002_coefficient_08_0042
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0043 : Poly :=
[
  term ((-4169144703998217557320436615616 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1)]
]

/-- Partial product 43 for generator 8. -/
def ep_Q2_002_partial_08_0043 : Poly :=
[
  term ((8338289407996435114640873231232 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (6, 1), (9, 1)],
  term ((-4169144703998217557320436615616 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (6, 1), (9, 1)],
  term ((-8338289407996435114640873231232 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (14, 1)],
  term ((4169144703998217557320436615616 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (14, 2)],
  term ((4169144703998217557320436615616 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (15, 2)],
  term ((-4169144703998217557320436615616 : Rat) / 1273790490336191187829975377157) [(1, 3), (6, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 8. -/
theorem ep_Q2_002_partial_08_0043_valid :
    mulPoly ep_Q2_002_coefficient_08_0043
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0044 : Poly :=
[
  term ((3004507436351752700373876750720 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1)]
]

/-- Partial product 44 for generator 8. -/
def ep_Q2_002_partial_08_0044 : Poly :=
[
  term ((-6009014872703505400747753501440 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (6, 1), (11, 1)],
  term ((3004507436351752700373876750720 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (6, 1), (11, 1)],
  term ((6009014872703505400747753501440 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1), (14, 1)],
  term ((-3004507436351752700373876750720 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1), (14, 2)],
  term ((-3004507436351752700373876750720 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1), (15, 2)],
  term ((3004507436351752700373876750720 : Rat) / 1273790490336191187829975377157) [(1, 3), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 8. -/
theorem ep_Q2_002_partial_08_0044_valid :
    mulPoly ep_Q2_002_coefficient_08_0044
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0045 : Poly :=
[
  term ((2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (13, 1)]
]

/-- Partial product 45 for generator 8. -/
def ep_Q2_002_partial_08_0045 : Poly :=
[
  term ((-4658549070585859427786239459584 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (6, 1), (13, 1)],
  term ((2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (6, 1), (13, 1)],
  term ((4658549070585859427786239459584 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (13, 1), (14, 1)],
  term ((-2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (13, 1), (14, 2)],
  term ((-2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (13, 1), (15, 2)],
  term ((2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 3), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 8. -/
theorem ep_Q2_002_partial_08_0045_valid :
    mulPoly ep_Q2_002_coefficient_08_0045
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0046 : Poly :=
[
  term ((232998781800811072744041862962342334167744 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (15, 1)]
]

/-- Partial product 46 for generator 8. -/
def ep_Q2_002_partial_08_0046 : Poly :=
[
  term ((-465997563601622145488083725924684668335488 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (6, 1), (15, 1)],
  term ((232998781800811072744041862962342334167744 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (1, 1), (6, 1), (15, 1)],
  term ((465997563601622145488083725924684668335488 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (14, 1), (15, 1)],
  term ((-232998781800811072744041862962342334167744 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (14, 2), (15, 1)],
  term ((-232998781800811072744041862962342334167744 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (15, 3)],
  term ((232998781800811072744041862962342334167744 : Rat) / 1346818217520322526586147269553926167495) [(1, 3), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 8. -/
theorem ep_Q2_002_partial_08_0046_valid :
    mulPoly ep_Q2_002_coefficient_08_0046
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0047 : Poly :=
[
  term ((6274221872 : Rat) / 7401317245) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 8. -/
def ep_Q2_002_partial_08_0047 : Poly :=
[
  term ((-12548443744 : Rat) / 7401317245) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((6274221872 : Rat) / 7401317245) [(0, 2), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((12548443744 : Rat) / 7401317245) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6274221872 : Rat) / 7401317245) [(1, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6274221872 : Rat) / 7401317245) [(1, 1), (6, 1), (15, 3), (16, 1)],
  term ((6274221872 : Rat) / 7401317245) [(1, 3), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 8. -/
theorem ep_Q2_002_partial_08_0047_valid :
    mulPoly ep_Q2_002_coefficient_08_0047
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0048 : Poly :=
[
  term ((-1480492894520967183557801545248 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1)]
]

/-- Partial product 48 for generator 8. -/
def ep_Q2_002_partial_08_0048 : Poly :=
[
  term ((2960985789041934367115603090496 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1)],
  term ((-1480492894520967183557801545248 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (7, 1)],
  term ((-2960985789041934367115603090496 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (14, 1)],
  term ((1480492894520967183557801545248 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (14, 2)],
  term ((1480492894520967183557801545248 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (15, 2)],
  term ((-1480492894520967183557801545248 : Rat) / 1273790490336191187829975377157) [(1, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 8. -/
theorem ep_Q2_002_partial_08_0048_valid :
    mulPoly ep_Q2_002_coefficient_08_0048
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0049 : Poly :=
[
  term ((93577763173818043520220058752 : Rat) / 8907625806546791523286541099) [(1, 1), (7, 1), (8, 1)]
]

/-- Partial product 49 for generator 8. -/
def ep_Q2_002_partial_08_0049 : Poly :=
[
  term ((-187155526347636087040440117504 : Rat) / 8907625806546791523286541099) [(0, 1), (1, 1), (7, 1), (8, 1)],
  term ((93577763173818043520220058752 : Rat) / 8907625806546791523286541099) [(0, 2), (1, 1), (7, 1), (8, 1)],
  term ((187155526347636087040440117504 : Rat) / 8907625806546791523286541099) [(1, 1), (7, 1), (8, 1), (14, 1)],
  term ((-93577763173818043520220058752 : Rat) / 8907625806546791523286541099) [(1, 1), (7, 1), (8, 1), (14, 2)],
  term ((-93577763173818043520220058752 : Rat) / 8907625806546791523286541099) [(1, 1), (7, 1), (8, 1), (15, 2)],
  term ((93577763173818043520220058752 : Rat) / 8907625806546791523286541099) [(1, 3), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 8. -/
theorem ep_Q2_002_partial_08_0049_valid :
    mulPoly ep_Q2_002_coefficient_08_0049
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0050 : Poly :=
[
  term ((-2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 1)]
]

/-- Partial product 50 for generator 8. -/
def ep_Q2_002_partial_08_0050 : Poly :=
[
  term ((4658549070585859427786239459584 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (12, 1)],
  term ((-2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (7, 1), (12, 1)],
  term ((-4658549070585859427786239459584 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 1), (14, 1)],
  term ((2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 1), (14, 2)],
  term ((2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 1), (15, 2)],
  term ((-2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 3), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 8. -/
theorem ep_Q2_002_partial_08_0050_valid :
    mulPoly ep_Q2_002_coefficient_08_0050
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0051 : Poly :=
[
  term ((145424138590131589129361895863568 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1)]
]

/-- Partial product 51 for generator 8. -/
def ep_Q2_002_partial_08_0051 : Poly :=
[
  term ((-290848277180263178258723791727136 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 1), (11, 1)],
  term ((145424138590131589129361895863568 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (8, 1), (11, 1)],
  term ((290848277180263178258723791727136 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (14, 1)],
  term ((-145424138590131589129361895863568 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (14, 2)],
  term ((-145424138590131589129361895863568 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((145424138590131589129361895863568 : Rat) / 1273790490336191187829975377157) [(1, 3), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 8. -/
theorem ep_Q2_002_partial_08_0051_valid :
    mulPoly ep_Q2_002_coefficient_08_0051
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0052 : Poly :=
[
  term ((-260350379499009354771085230099360 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (13, 1)]
]

/-- Partial product 52 for generator 8. -/
def ep_Q2_002_partial_08_0052 : Poly :=
[
  term ((520700758998018709542170460198720 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 1), (13, 1)],
  term ((-260350379499009354771085230099360 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (8, 1), (13, 1)],
  term ((-520700758998018709542170460198720 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (13, 1), (14, 1)],
  term ((260350379499009354771085230099360 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (13, 1), (14, 2)],
  term ((260350379499009354771085230099360 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (13, 1), (15, 2)],
  term ((-260350379499009354771085230099360 : Rat) / 1273790490336191187829975377157) [(1, 3), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 8. -/
theorem ep_Q2_002_partial_08_0052_valid :
    mulPoly ep_Q2_002_coefficient_08_0052
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0053 : Poly :=
[
  term ((209263783390655483820232292571520714849944 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 53 for generator 8. -/
def ep_Q2_002_partial_08_0053 : Poly :=
[
  term ((-418527566781310967640464585143041429699888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (8, 1), (15, 1)],
  term ((209263783390655483820232292571520714849944 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (1, 1), (8, 1), (15, 1)],
  term ((418527566781310967640464585143041429699888 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (14, 1), (15, 1)],
  term ((-209263783390655483820232292571520714849944 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (14, 2), (15, 1)],
  term ((-209263783390655483820232292571520714849944 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (15, 3)],
  term ((209263783390655483820232292571520714849944 : Rat) / 1346818217520322526586147269553926167495) [(1, 3), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 8. -/
theorem ep_Q2_002_partial_08_0053_valid :
    mulPoly ep_Q2_002_coefficient_08_0053
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0054 : Poly :=
[
  term ((-86160365278 : Rat) / 7401317245) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 8. -/
def ep_Q2_002_partial_08_0054 : Poly :=
[
  term ((172320730556 : Rat) / 7401317245) [(0, 1), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-86160365278 : Rat) / 7401317245) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-172320730556 : Rat) / 7401317245) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((86160365278 : Rat) / 7401317245) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((86160365278 : Rat) / 7401317245) [(1, 1), (8, 1), (15, 3), (16, 1)],
  term ((-86160365278 : Rat) / 7401317245) [(1, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 8. -/
theorem ep_Q2_002_partial_08_0054_valid :
    mulPoly ep_Q2_002_coefficient_08_0054
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0055 : Poly :=
[
  term ((1838888275441835994700066171632 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1)]
]

/-- Partial product 55 for generator 8. -/
def ep_Q2_002_partial_08_0055 : Poly :=
[
  term ((-3677776550883671989400132343264 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1)],
  term ((1838888275441835994700066171632 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (9, 1)],
  term ((3677776550883671989400132343264 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (14, 1)],
  term ((-1838888275441835994700066171632 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (14, 2)],
  term ((-1838888275441835994700066171632 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (15, 2)],
  term ((1838888275441835994700066171632 : Rat) / 1273790490336191187829975377157) [(1, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 8. -/
theorem ep_Q2_002_partial_08_0055_valid :
    mulPoly ep_Q2_002_coefficient_08_0055
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0056 : Poly :=
[
  term ((-4351161165312416158152186295200 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 56 for generator 8. -/
def ep_Q2_002_partial_08_0056 : Poly :=
[
  term ((8702322330624832316304372590400 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1), (12, 1)],
  term ((-4351161165312416158152186295200 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (9, 1), (12, 1)],
  term ((-8702322330624832316304372590400 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 1), (14, 1)],
  term ((4351161165312416158152186295200 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 1), (14, 2)],
  term ((4351161165312416158152186295200 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 1), (15, 2)],
  term ((-4351161165312416158152186295200 : Rat) / 1273790490336191187829975377157) [(1, 3), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 8. -/
theorem ep_Q2_002_partial_08_0056_valid :
    mulPoly ep_Q2_002_coefficient_08_0056
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0057 : Poly :=
[
  term ((-44695490943979269270944351015568 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1)]
]

/-- Partial product 57 for generator 8. -/
def ep_Q2_002_partial_08_0057 : Poly :=
[
  term ((89390981887958538541888702031136 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1)],
  term ((-44695490943979269270944351015568 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (11, 1)],
  term ((-89390981887958538541888702031136 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (14, 1)],
  term ((44695490943979269270944351015568 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (14, 2)],
  term ((44695490943979269270944351015568 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (15, 2)],
  term ((-44695490943979269270944351015568 : Rat) / 1273790490336191187829975377157) [(1, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 8. -/
theorem ep_Q2_002_partial_08_0057_valid :
    mulPoly ep_Q2_002_coefficient_08_0057
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0058 : Poly :=
[
  term ((-111409462926400416474423864632640 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 58 for generator 8. -/
def ep_Q2_002_partial_08_0058 : Poly :=
[
  term ((222818925852800832948847729265280 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1), (12, 1)],
  term ((-111409462926400416474423864632640 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (11, 1), (12, 1)],
  term ((-222818925852800832948847729265280 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1), (14, 1)],
  term ((111409462926400416474423864632640 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1), (14, 2)],
  term ((111409462926400416474423864632640 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((-111409462926400416474423864632640 : Rat) / 1273790490336191187829975377157) [(1, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 8. -/
theorem ep_Q2_002_partial_08_0058_valid :
    mulPoly ep_Q2_002_coefficient_08_0058
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0059 : Poly :=
[
  term ((208970895924104936953566451727040 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 59 for generator 8. -/
def ep_Q2_002_partial_08_0059 : Poly :=
[
  term ((-417941791848209873907132903454080 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (12, 1), (13, 1)],
  term ((208970895924104936953566451727040 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (12, 1), (13, 1)],
  term ((417941791848209873907132903454080 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((-208970895924104936953566451727040 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 1), (14, 2)],
  term ((-208970895924104936953566451727040 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((208970895924104936953566451727040 : Rat) / 1273790490336191187829975377157) [(1, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 8. -/
theorem ep_Q2_002_partial_08_0059_valid :
    mulPoly ep_Q2_002_coefficient_08_0059
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0060 : Poly :=
[
  term ((263815500370808520271946796902221948741236 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 60 for generator 8. -/
def ep_Q2_002_partial_08_0060 : Poly :=
[
  term ((-527631000741617040543893593804443897482472 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (12, 1), (15, 1)],
  term ((263815500370808520271946796902221948741236 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (1, 1), (12, 1), (15, 1)],
  term ((527631000741617040543893593804443897482472 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 1), (14, 1), (15, 1)],
  term ((-263815500370808520271946796902221948741236 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 1), (14, 2), (15, 1)],
  term ((-263815500370808520271946796902221948741236 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 1), (15, 3)],
  term ((263815500370808520271946796902221948741236 : Rat) / 1346818217520322526586147269553926167495) [(1, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 8. -/
theorem ep_Q2_002_partial_08_0060_valid :
    mulPoly ep_Q2_002_coefficient_08_0060
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0061 : Poly :=
[
  term ((74332360933 : Rat) / 7401317245) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 61 for generator 8. -/
def ep_Q2_002_partial_08_0061 : Poly :=
[
  term ((-148664721866 : Rat) / 7401317245) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((74332360933 : Rat) / 7401317245) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((148664721866 : Rat) / 7401317245) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-74332360933 : Rat) / 7401317245) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-74332360933 : Rat) / 7401317245) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((74332360933 : Rat) / 7401317245) [(1, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 8. -/
theorem ep_Q2_002_partial_08_0061_valid :
    mulPoly ep_Q2_002_coefficient_08_0061
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0062 : Poly :=
[
  term ((80406316199896160551386295640592 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1)]
]

/-- Partial product 62 for generator 8. -/
def ep_Q2_002_partial_08_0062 : Poly :=
[
  term ((-160812632399792321102772591281184 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (13, 1)],
  term ((80406316199896160551386295640592 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (13, 1)],
  term ((160812632399792321102772591281184 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1), (14, 1)],
  term ((-80406316199896160551386295640592 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1), (14, 2)],
  term ((-80406316199896160551386295640592 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1), (15, 2)],
  term ((80406316199896160551386295640592 : Rat) / 1273790490336191187829975377157) [(1, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 8. -/
theorem ep_Q2_002_partial_08_0062_valid :
    mulPoly ep_Q2_002_coefficient_08_0062
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0063 : Poly :=
[
  term ((255862751852412828269293059024849975762496 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (15, 1)]
]

/-- Partial product 63 for generator 8. -/
def ep_Q2_002_partial_08_0063 : Poly :=
[
  term ((-511725503704825656538586118049699951524992 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (15, 1)],
  term ((255862751852412828269293059024849975762496 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (1, 1), (15, 1)],
  term ((511725503704825656538586118049699951524992 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (14, 1), (15, 1)],
  term ((-255862751852412828269293059024849975762496 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (14, 2), (15, 1)],
  term ((-255862751852412828269293059024849975762496 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (15, 3)],
  term ((255862751852412828269293059024849975762496 : Rat) / 1346818217520322526586147269553926167495) [(1, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 8. -/
theorem ep_Q2_002_partial_08_0063_valid :
    mulPoly ep_Q2_002_coefficient_08_0063
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0064 : Poly :=
[
  term ((5196042484 : Rat) / 1057331035) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 64 for generator 8. -/
def ep_Q2_002_partial_08_0064 : Poly :=
[
  term ((-10392084968 : Rat) / 1057331035) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term ((5196042484 : Rat) / 1057331035) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((10392084968 : Rat) / 1057331035) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5196042484 : Rat) / 1057331035) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5196042484 : Rat) / 1057331035) [(1, 1), (15, 3), (16, 1)],
  term ((5196042484 : Rat) / 1057331035) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 8. -/
theorem ep_Q2_002_partial_08_0064_valid :
    mulPoly ep_Q2_002_coefficient_08_0064
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0065 : Poly :=
[
  term ((3165823430042232193217444229888 : Rat) / 1273790490336191187829975377157) [(1, 2)]
]

/-- Partial product 65 for generator 8. -/
def ep_Q2_002_partial_08_0065 : Poly :=
[
  term ((-6331646860084464386434888459776 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2)],
  term ((3165823430042232193217444229888 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 2)],
  term ((6331646860084464386434888459776 : Rat) / 1273790490336191187829975377157) [(1, 2), (14, 1)],
  term ((-3165823430042232193217444229888 : Rat) / 1273790490336191187829975377157) [(1, 2), (14, 2)],
  term ((-3165823430042232193217444229888 : Rat) / 1273790490336191187829975377157) [(1, 2), (15, 2)],
  term ((3165823430042232193217444229888 : Rat) / 1273790490336191187829975377157) [(1, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 8. -/
theorem ep_Q2_002_partial_08_0065_valid :
    mulPoly ep_Q2_002_coefficient_08_0065
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0066 : Poly :=
[
  term ((295647249531632379195468479808 : Rat) / 97983883872014706756151952089) [(1, 2), (4, 1)]
]

/-- Partial product 66 for generator 8. -/
def ep_Q2_002_partial_08_0066 : Poly :=
[
  term ((-591294499063264758390936959616 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 2), (4, 1)],
  term ((295647249531632379195468479808 : Rat) / 97983883872014706756151952089) [(0, 2), (1, 2), (4, 1)],
  term ((591294499063264758390936959616 : Rat) / 97983883872014706756151952089) [(1, 2), (4, 1), (14, 1)],
  term ((-295647249531632379195468479808 : Rat) / 97983883872014706756151952089) [(1, 2), (4, 1), (14, 2)],
  term ((-295647249531632379195468479808 : Rat) / 97983883872014706756151952089) [(1, 2), (4, 1), (15, 2)],
  term ((295647249531632379195468479808 : Rat) / 97983883872014706756151952089) [(1, 4), (4, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 8. -/
theorem ep_Q2_002_partial_08_0066_valid :
    mulPoly ep_Q2_002_coefficient_08_0066
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0067 : Poly :=
[
  term ((-10180328699221757225550472700736 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1)]
]

/-- Partial product 67 for generator 8. -/
def ep_Q2_002_partial_08_0067 : Poly :=
[
  term ((20360657398443514451100945401472 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (8, 1)],
  term ((-10180328699221757225550472700736 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 2), (8, 1)],
  term ((-20360657398443514451100945401472 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (14, 1)],
  term ((10180328699221757225550472700736 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (14, 2)],
  term ((10180328699221757225550472700736 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (15, 2)],
  term ((-10180328699221757225550472700736 : Rat) / 1273790490336191187829975377157) [(1, 4), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 8. -/
theorem ep_Q2_002_partial_08_0067_valid :
    mulPoly ep_Q2_002_coefficient_08_0067
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0068 : Poly :=
[
  term ((7678027624948663989447867704832 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1)]
]

/-- Partial product 68 for generator 8. -/
def ep_Q2_002_partial_08_0068 : Poly :=
[
  term ((-15356055249897327978895735409664 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (12, 1)],
  term ((7678027624948663989447867704832 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 2), (12, 1)],
  term ((15356055249897327978895735409664 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1), (14, 1)],
  term ((-7678027624948663989447867704832 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1), (14, 2)],
  term ((-7678027624948663989447867704832 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1), (15, 2)],
  term ((7678027624948663989447867704832 : Rat) / 1273790490336191187829975377157) [(1, 4), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 8. -/
theorem ep_Q2_002_partial_08_0068_valid :
    mulPoly ep_Q2_002_coefficient_08_0068
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0069 : Poly :=
[
  term ((-20086191519948269342749364813424 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1)]
]

/-- Partial product 69 for generator 8. -/
def ep_Q2_002_partial_08_0069 : Poly :=
[
  term ((40172383039896538685498729626848 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (4, 1), (11, 1)],
  term ((-20086191519948269342749364813424 : Rat) / 1273790490336191187829975377157) [(0, 2), (3, 1), (4, 1), (11, 1)],
  term ((-20086191519948269342749364813424 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (4, 1), (11, 1)],
  term ((-40172383039896538685498729626848 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (14, 1)],
  term ((20086191519948269342749364813424 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (14, 2)],
  term ((20086191519948269342749364813424 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 8. -/
theorem ep_Q2_002_partial_08_0069_valid :
    mulPoly ep_Q2_002_coefficient_08_0069
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0070 : Poly :=
[
  term ((37826060209334913373947980227008 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 1)]
]

/-- Partial product 70 for generator 8. -/
def ep_Q2_002_partial_08_0070 : Poly :=
[
  term ((-75652120418669826747895960454016 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (4, 1), (13, 1)],
  term ((37826060209334913373947980227008 : Rat) / 1273790490336191187829975377157) [(0, 2), (3, 1), (4, 1), (13, 1)],
  term ((37826060209334913373947980227008 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (4, 1), (13, 1)],
  term ((75652120418669826747895960454016 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 1), (14, 1)],
  term ((-37826060209334913373947980227008 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 1), (14, 2)],
  term ((-37826060209334913373947980227008 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 8. -/
theorem ep_Q2_002_partial_08_0070_valid :
    mulPoly ep_Q2_002_coefficient_08_0070
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0071 : Poly :=
[
  term ((-204963042053392577794574035387878733705008 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (15, 1)]
]

/-- Partial product 71 for generator 8. -/
def ep_Q2_002_partial_08_0071 : Poly :=
[
  term ((409926084106785155589148070775757467410016 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 1), (4, 1), (15, 1)],
  term ((-204963042053392577794574035387878733705008 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (3, 1), (4, 1), (15, 1)],
  term ((-204963042053392577794574035387878733705008 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (3, 1), (4, 1), (15, 1)],
  term ((-409926084106785155589148070775757467410016 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (14, 1), (15, 1)],
  term ((204963042053392577794574035387878733705008 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (14, 2), (15, 1)],
  term ((204963042053392577794574035387878733705008 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 8. -/
theorem ep_Q2_002_partial_08_0071_valid :
    mulPoly ep_Q2_002_coefficient_08_0071
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0072 : Poly :=
[
  term ((7790969936 : Rat) / 7401317245) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 72 for generator 8. -/
def ep_Q2_002_partial_08_0072 : Poly :=
[
  term ((-15581939872 : Rat) / 7401317245) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((7790969936 : Rat) / 7401317245) [(0, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((7790969936 : Rat) / 7401317245) [(1, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((15581939872 : Rat) / 7401317245) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7790969936 : Rat) / 7401317245) [(3, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7790969936 : Rat) / 7401317245) [(3, 1), (4, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 8. -/
theorem ep_Q2_002_partial_08_0072_valid :
    mulPoly ep_Q2_002_coefficient_08_0072
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0073 : Poly :=
[
  term ((8670808792688503048076144907216 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1)]
]

/-- Partial product 73 for generator 8. -/
def ep_Q2_002_partial_08_0073 : Poly :=
[
  term ((-17341617585377006096152289814432 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (6, 1), (11, 1)],
  term ((8670808792688503048076144907216 : Rat) / 1273790490336191187829975377157) [(0, 2), (3, 1), (6, 1), (11, 1)],
  term ((8670808792688503048076144907216 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (6, 1), (11, 1)],
  term ((17341617585377006096152289814432 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1), (14, 1)],
  term ((-8670808792688503048076144907216 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1), (14, 2)],
  term ((-8670808792688503048076144907216 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 8. -/
theorem ep_Q2_002_partial_08_0073_valid :
    mulPoly ep_Q2_002_coefficient_08_0073
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0074 : Poly :=
[
  term ((-16328756754615998126519279191872 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 1)]
]

/-- Partial product 74 for generator 8. -/
def ep_Q2_002_partial_08_0074 : Poly :=
[
  term ((32657513509231996253038558383744 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (6, 1), (13, 1)],
  term ((-16328756754615998126519279191872 : Rat) / 1273790490336191187829975377157) [(0, 2), (3, 1), (6, 1), (13, 1)],
  term ((-16328756754615998126519279191872 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (6, 1), (13, 1)],
  term ((-32657513509231996253038558383744 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 1), (14, 1)],
  term ((16328756754615998126519279191872 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 1), (14, 2)],
  term ((16328756754615998126519279191872 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 8. -/
theorem ep_Q2_002_partial_08_0074_valid :
    mulPoly ep_Q2_002_coefficient_08_0074
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0075 : Poly :=
[
  term ((259702224746748282717257402887671117333216 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 75 for generator 8. -/
def ep_Q2_002_partial_08_0075 : Poly :=
[
  term ((-519404449493496565434514805775342234666432 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 1), (6, 1), (15, 1)],
  term ((259702224746748282717257402887671117333216 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (3, 1), (6, 1), (15, 1)],
  term ((259702224746748282717257402887671117333216 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((519404449493496565434514805775342234666432 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-259702224746748282717257402887671117333216 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (14, 2), (15, 1)],
  term ((-259702224746748282717257402887671117333216 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 8. -/
theorem ep_Q2_002_partial_08_0075_valid :
    mulPoly ep_Q2_002_coefficient_08_0075
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0076 : Poly :=
[
  term ((1505925468 : Rat) / 7401317245) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 76 for generator 8. -/
def ep_Q2_002_partial_08_0076 : Poly :=
[
  term ((-3011850936 : Rat) / 7401317245) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((1505925468 : Rat) / 7401317245) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((1505925468 : Rat) / 7401317245) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((3011850936 : Rat) / 7401317245) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1505925468 : Rat) / 7401317245) [(3, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1505925468 : Rat) / 7401317245) [(3, 1), (6, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 8. -/
theorem ep_Q2_002_partial_08_0076_valid :
    mulPoly ep_Q2_002_coefficient_08_0076
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0077 : Poly :=
[
  term ((-29401477184947883694696741474576 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1)]
]

/-- Partial product 77 for generator 8. -/
def ep_Q2_002_partial_08_0077 : Poly :=
[
  term ((58802954369895767389393482949152 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (11, 1)],
  term ((-29401477184947883694696741474576 : Rat) / 1273790490336191187829975377157) [(0, 2), (3, 1), (11, 1)],
  term ((-29401477184947883694696741474576 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (11, 1)],
  term ((-58802954369895767389393482949152 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (14, 1)],
  term ((29401477184947883694696741474576 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (14, 2)],
  term ((29401477184947883694696741474576 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 8. -/
theorem ep_Q2_002_partial_08_0077_valid :
    mulPoly ep_Q2_002_coefficient_08_0077
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0078 : Poly :=
[
  term ((55368487606857672406614102268992 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 1)]
]

/-- Partial product 78 for generator 8. -/
def ep_Q2_002_partial_08_0078 : Poly :=
[
  term ((-110736975213715344813228204537984 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (13, 1)],
  term ((55368487606857672406614102268992 : Rat) / 1273790490336191187829975377157) [(0, 2), (3, 1), (13, 1)],
  term ((55368487606857672406614102268992 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (13, 1)],
  term ((110736975213715344813228204537984 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 1), (14, 1)],
  term ((-55368487606857672406614102268992 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 1), (14, 2)],
  term ((-55368487606857672406614102268992 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 8. -/
theorem ep_Q2_002_partial_08_0078_valid :
    mulPoly ep_Q2_002_coefficient_08_0078
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0079 : Poly :=
[
  term ((-41154019766628133478609717151037939944 : Rat) / 485689945012738018963630461433078315) [(3, 1), (15, 1)]
]

/-- Partial product 79 for generator 8. -/
def ep_Q2_002_partial_08_0079 : Poly :=
[
  term ((82308039533256266957219434302075879888 : Rat) / 485689945012738018963630461433078315) [(0, 1), (3, 1), (15, 1)],
  term ((-41154019766628133478609717151037939944 : Rat) / 485689945012738018963630461433078315) [(0, 2), (3, 1), (15, 1)],
  term ((-41154019766628133478609717151037939944 : Rat) / 485689945012738018963630461433078315) [(1, 2), (3, 1), (15, 1)],
  term ((-82308039533256266957219434302075879888 : Rat) / 485689945012738018963630461433078315) [(3, 1), (14, 1), (15, 1)],
  term ((41154019766628133478609717151037939944 : Rat) / 485689945012738018963630461433078315) [(3, 1), (14, 2), (15, 1)],
  term ((41154019766628133478609717151037939944 : Rat) / 485689945012738018963630461433078315) [(3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 8. -/
theorem ep_Q2_002_partial_08_0079_valid :
    mulPoly ep_Q2_002_coefficient_08_0079
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0080 : Poly :=
[
  term ((895374 : Rat) / 381295) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 80 for generator 8. -/
def ep_Q2_002_partial_08_0080 : Poly :=
[
  term ((-1790748 : Rat) / 381295) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((895374 : Rat) / 381295) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((895374 : Rat) / 381295) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((1790748 : Rat) / 381295) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-895374 : Rat) / 381295) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-895374 : Rat) / 381295) [(3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 8. -/
theorem ep_Q2_002_partial_08_0080_valid :
    mulPoly ep_Q2_002_coefficient_08_0080
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0081 : Poly :=
[
  term ((69773723473192706345602896465696 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1)]
]

/-- Partial product 81 for generator 8. -/
def ep_Q2_002_partial_08_0081 : Poly :=
[
  term ((-139547446946385412691205792931392 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (7, 1), (11, 1)],
  term ((69773723473192706345602896465696 : Rat) / 1273790490336191187829975377157) [(0, 2), (4, 1), (7, 1), (11, 1)],
  term ((69773723473192706345602896465696 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (7, 1), (11, 1)],
  term ((139547446946385412691205792931392 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (14, 1)],
  term ((-69773723473192706345602896465696 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (14, 2)],
  term ((-69773723473192706345602896465696 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 8. -/
theorem ep_Q2_002_partial_08_0081_valid :
    mulPoly ep_Q2_002_coefficient_08_0081
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0082 : Poly :=
[
  term ((-131396987950917900706007340412032 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 1)]
]

/-- Partial product 82 for generator 8. -/
def ep_Q2_002_partial_08_0082 : Poly :=
[
  term ((262793975901835801412014680824064 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (7, 1), (13, 1)],
  term ((-131396987950917900706007340412032 : Rat) / 1273790490336191187829975377157) [(0, 2), (4, 1), (7, 1), (13, 1)],
  term ((-131396987950917900706007340412032 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (7, 1), (13, 1)],
  term ((-262793975901835801412014680824064 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 1), (14, 1)],
  term ((131396987950917900706007340412032 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 1), (14, 2)],
  term ((131396987950917900706007340412032 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 8. -/
theorem ep_Q2_002_partial_08_0082_valid :
    mulPoly ep_Q2_002_coefficient_08_0082
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0083 : Poly :=
[
  term ((14627876544464773848291636365666342162304 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 83 for generator 8. -/
def ep_Q2_002_partial_08_0083 : Poly :=
[
  term ((-29255753088929547696583272731332684324608 : Rat) / 20720280269543423485940727223906556423) [(0, 1), (4, 1), (7, 1), (15, 1)],
  term ((14627876544464773848291636365666342162304 : Rat) / 20720280269543423485940727223906556423) [(0, 2), (4, 1), (7, 1), (15, 1)],
  term ((14627876544464773848291636365666342162304 : Rat) / 20720280269543423485940727223906556423) [(1, 2), (4, 1), (7, 1), (15, 1)],
  term ((29255753088929547696583272731332684324608 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((-14627876544464773848291636365666342162304 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (7, 1), (14, 2), (15, 1)],
  term ((-14627876544464773848291636365666342162304 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 8. -/
theorem ep_Q2_002_partial_08_0083_valid :
    mulPoly ep_Q2_002_coefficient_08_0083
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0084 : Poly :=
[
  term ((-521212696 : Rat) / 211466207) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 84 for generator 8. -/
def ep_Q2_002_partial_08_0084 : Poly :=
[
  term ((1042425392 : Rat) / 211466207) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-521212696 : Rat) / 211466207) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-521212696 : Rat) / 211466207) [(1, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1042425392 : Rat) / 211466207) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((521212696 : Rat) / 211466207) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((521212696 : Rat) / 211466207) [(4, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 8. -/
theorem ep_Q2_002_partial_08_0084_valid :
    mulPoly ep_Q2_002_coefficient_08_0084
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0085 : Poly :=
[
  term ((214370095131614982566528524296 : Rat) / 115799135485108289802725034287) [(4, 1), (9, 1), (11, 1)]
]

/-- Partial product 85 for generator 8. -/
def ep_Q2_002_partial_08_0085 : Poly :=
[
  term ((-428740190263229965133057048592 : Rat) / 115799135485108289802725034287) [(0, 1), (4, 1), (9, 1), (11, 1)],
  term ((214370095131614982566528524296 : Rat) / 115799135485108289802725034287) [(0, 2), (4, 1), (9, 1), (11, 1)],
  term ((214370095131614982566528524296 : Rat) / 115799135485108289802725034287) [(1, 2), (4, 1), (9, 1), (11, 1)],
  term ((428740190263229965133057048592 : Rat) / 115799135485108289802725034287) [(4, 1), (9, 1), (11, 1), (14, 1)],
  term ((-214370095131614982566528524296 : Rat) / 115799135485108289802725034287) [(4, 1), (9, 1), (11, 1), (14, 2)],
  term ((-214370095131614982566528524296 : Rat) / 115799135485108289802725034287) [(4, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 8. -/
theorem ep_Q2_002_partial_08_0085_valid :
    mulPoly ep_Q2_002_coefficient_08_0085
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0086 : Poly :=
[
  term ((-403699034606745855532583603232 : Rat) / 115799135485108289802725034287) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 86 for generator 8. -/
def ep_Q2_002_partial_08_0086 : Poly :=
[
  term ((807398069213491711065167206464 : Rat) / 115799135485108289802725034287) [(0, 1), (4, 1), (9, 1), (13, 1)],
  term ((-403699034606745855532583603232 : Rat) / 115799135485108289802725034287) [(0, 2), (4, 1), (9, 1), (13, 1)],
  term ((-403699034606745855532583603232 : Rat) / 115799135485108289802725034287) [(1, 2), (4, 1), (9, 1), (13, 1)],
  term ((-807398069213491711065167206464 : Rat) / 115799135485108289802725034287) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((403699034606745855532583603232 : Rat) / 115799135485108289802725034287) [(4, 1), (9, 1), (13, 1), (14, 2)],
  term ((403699034606745855532583603232 : Rat) / 115799135485108289802725034287) [(4, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 8. -/
theorem ep_Q2_002_partial_08_0086_valid :
    mulPoly ep_Q2_002_coefficient_08_0086
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0087 : Poly :=
[
  term ((4100178369584376928887436350743077849464 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 87 for generator 8. -/
def ep_Q2_002_partial_08_0087 : Poly :=
[
  term ((-8200356739168753857774872701486155698928 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (4, 1), (9, 1), (15, 1)],
  term ((4100178369584376928887436350743077849464 : Rat) / 122438019774574775144195206323084197045) [(0, 2), (4, 1), (9, 1), (15, 1)],
  term ((4100178369584376928887436350743077849464 : Rat) / 122438019774574775144195206323084197045) [(1, 2), (4, 1), (9, 1), (15, 1)],
  term ((8200356739168753857774872701486155698928 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-4100178369584376928887436350743077849464 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((-4100178369584376928887436350743077849464 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 8. -/
theorem ep_Q2_002_partial_08_0087_valid :
    mulPoly ep_Q2_002_coefficient_08_0087
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0088 : Poly :=
[
  term ((-219650568 : Rat) / 7401317245) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 88 for generator 8. -/
def ep_Q2_002_partial_08_0088 : Poly :=
[
  term ((439301136 : Rat) / 7401317245) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-219650568 : Rat) / 7401317245) [(0, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-219650568 : Rat) / 7401317245) [(1, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-439301136 : Rat) / 7401317245) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((219650568 : Rat) / 7401317245) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((219650568 : Rat) / 7401317245) [(4, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 8. -/
theorem ep_Q2_002_partial_08_0088_valid :
    mulPoly ep_Q2_002_coefficient_08_0088
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0089 : Poly :=
[
  term ((5600668634578983609711368170128 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 89 for generator 8. -/
def ep_Q2_002_partial_08_0089 : Poly :=
[
  term ((-11201337269157967219422736340256 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (11, 1), (13, 1)],
  term ((5600668634578983609711368170128 : Rat) / 1273790490336191187829975377157) [(0, 2), (4, 1), (11, 1), (13, 1)],
  term ((5600668634578983609711368170128 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (11, 1), (13, 1)],
  term ((11201337269157967219422736340256 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((-5600668634578983609711368170128 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term ((-5600668634578983609711368170128 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 8. -/
theorem ep_Q2_002_partial_08_0089_valid :
    mulPoly ep_Q2_002_coefficient_08_0089
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0090 : Poly :=
[
  term ((-9323773246554199676149983683920055344728 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 90 for generator 8. -/
def ep_Q2_002_partial_08_0090 : Poly :=
[
  term ((18647546493108399352299967367840110689456 : Rat) / 20720280269543423485940727223906556423) [(0, 1), (4, 1), (11, 1), (15, 1)],
  term ((-9323773246554199676149983683920055344728 : Rat) / 20720280269543423485940727223906556423) [(0, 2), (4, 1), (11, 1), (15, 1)],
  term ((-9323773246554199676149983683920055344728 : Rat) / 20720280269543423485940727223906556423) [(1, 2), (4, 1), (11, 1), (15, 1)],
  term ((-18647546493108399352299967367840110689456 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((9323773246554199676149983683920055344728 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((9323773246554199676149983683920055344728 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 8. -/
theorem ep_Q2_002_partial_08_0090_valid :
    mulPoly ep_Q2_002_coefficient_08_0090
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0091 : Poly :=
[
  term ((-7555141124 : Rat) / 1480263449) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 91 for generator 8. -/
def ep_Q2_002_partial_08_0091 : Poly :=
[
  term ((15110282248 : Rat) / 1480263449) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7555141124 : Rat) / 1480263449) [(0, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7555141124 : Rat) / 1480263449) [(1, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15110282248 : Rat) / 1480263449) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((7555141124 : Rat) / 1480263449) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((7555141124 : Rat) / 1480263449) [(4, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 8. -/
theorem ep_Q2_002_partial_08_0091_valid :
    mulPoly ep_Q2_002_coefficient_08_0091
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0092 : Poly :=
[
  term ((42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2)]
]

/-- Partial product 92 for generator 8. -/
def ep_Q2_002_partial_08_0092 : Poly :=
[
  term ((-84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (11, 2)],
  term ((42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(0, 2), (4, 1), (11, 2)],
  term ((42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (11, 2)],
  term ((84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2), (14, 1)],
  term ((-42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2), (14, 2)],
  term ((-42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 8. -/
theorem ep_Q2_002_partial_08_0092_valid :
    mulPoly ep_Q2_002_coefficient_08_0092
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0093 : Poly :=
[
  term ((291212867981093588602461934101198855770256 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 93 for generator 8. -/
def ep_Q2_002_partial_08_0093 : Poly :=
[
  term ((-582425735962187177204923868202397711540512 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (4, 1), (13, 1), (15, 1)],
  term ((291212867981093588602461934101198855770256 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (4, 1), (13, 1), (15, 1)],
  term ((291212867981093588602461934101198855770256 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (4, 1), (13, 1), (15, 1)],
  term ((582425735962187177204923868202397711540512 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-291212867981093588602461934101198855770256 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((-291212867981093588602461934101198855770256 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 8. -/
theorem ep_Q2_002_partial_08_0093_valid :
    mulPoly ep_Q2_002_coefficient_08_0093
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0094 : Poly :=
[
  term ((-8228707296 : Rat) / 1057331035) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 94 for generator 8. -/
def ep_Q2_002_partial_08_0094 : Poly :=
[
  term ((16457414592 : Rat) / 1057331035) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8228707296 : Rat) / 1057331035) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8228707296 : Rat) / 1057331035) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16457414592 : Rat) / 1057331035) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8228707296 : Rat) / 1057331035) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((8228707296 : Rat) / 1057331035) [(4, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 8. -/
theorem ep_Q2_002_partial_08_0094_valid :
    mulPoly ep_Q2_002_coefficient_08_0094
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0095 : Poly :=
[
  term ((-161191853980202062078517742543936 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2)]
]

/-- Partial product 95 for generator 8. -/
def ep_Q2_002_partial_08_0095 : Poly :=
[
  term ((322383707960404124157035485087872 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (13, 2)],
  term ((-161191853980202062078517742543936 : Rat) / 1273790490336191187829975377157) [(0, 2), (4, 1), (13, 2)],
  term ((-161191853980202062078517742543936 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (13, 2)],
  term ((-322383707960404124157035485087872 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2), (14, 1)],
  term ((161191853980202062078517742543936 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2), (14, 2)],
  term ((161191853980202062078517742543936 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 8. -/
theorem ep_Q2_002_partial_08_0095_valid :
    mulPoly ep_Q2_002_coefficient_08_0095
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0096 : Poly :=
[
  term ((-962988723936244228686468534884522718697104 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (15, 2)]
]

/-- Partial product 96 for generator 8. -/
def ep_Q2_002_partial_08_0096 : Poly :=
[
  term ((1925977447872488457372937069769045437394208 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (4, 1), (15, 2)],
  term ((-962988723936244228686468534884522718697104 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (4, 1), (15, 2)],
  term ((-962988723936244228686468534884522718697104 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (4, 1), (15, 2)],
  term ((-1925977447872488457372937069769045437394208 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (14, 1), (15, 2)],
  term ((962988723936244228686468534884522718697104 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (14, 2), (15, 2)],
  term ((962988723936244228686468534884522718697104 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 8. -/
theorem ep_Q2_002_partial_08_0096_valid :
    mulPoly ep_Q2_002_coefficient_08_0096
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0097 : Poly :=
[
  term ((106218296958 : Rat) / 7401317245) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 97 for generator 8. -/
def ep_Q2_002_partial_08_0097 : Poly :=
[
  term ((-212436593916 : Rat) / 7401317245) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((106218296958 : Rat) / 7401317245) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((106218296958 : Rat) / 7401317245) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((212436593916 : Rat) / 7401317245) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-106218296958 : Rat) / 7401317245) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((-106218296958 : Rat) / 7401317245) [(4, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 8. -/
theorem ep_Q2_002_partial_08_0097_valid :
    mulPoly ep_Q2_002_coefficient_08_0097
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0098 : Poly :=
[
  term ((-26012426378065509144228434721648 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1)]
]

/-- Partial product 98 for generator 8. -/
def ep_Q2_002_partial_08_0098 : Poly :=
[
  term ((52024852756131018288456869443296 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (6, 1), (11, 1)],
  term ((-26012426378065509144228434721648 : Rat) / 1273790490336191187829975377157) [(0, 2), (5, 1), (6, 1), (11, 1)],
  term ((-26012426378065509144228434721648 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (6, 1), (11, 1)],
  term ((-52024852756131018288456869443296 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1), (14, 1)],
  term ((26012426378065509144228434721648 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1), (14, 2)],
  term ((26012426378065509144228434721648 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 8. -/
theorem ep_Q2_002_partial_08_0098_valid :
    mulPoly ep_Q2_002_coefficient_08_0098
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0099 : Poly :=
[
  term ((48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (13, 1)]
]

/-- Partial product 99 for generator 8. -/
def ep_Q2_002_partial_08_0099 : Poly :=
[
  term ((-97972540527695988759115675151232 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (6, 1), (13, 1)],
  term ((48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(0, 2), (5, 1), (6, 1), (13, 1)],
  term ((48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (6, 1), (13, 1)],
  term ((97972540527695988759115675151232 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (13, 1), (14, 2)],
  term ((-48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 8. -/
theorem ep_Q2_002_partial_08_0099_valid :
    mulPoly ep_Q2_002_coefficient_08_0099
        ep_Q2_002_generator_08_0000_0099 =
      ep_Q2_002_partial_08_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_08_0000_0099 : List Poly :=
[
  ep_Q2_002_partial_08_0000,
  ep_Q2_002_partial_08_0001,
  ep_Q2_002_partial_08_0002,
  ep_Q2_002_partial_08_0003,
  ep_Q2_002_partial_08_0004,
  ep_Q2_002_partial_08_0005,
  ep_Q2_002_partial_08_0006,
  ep_Q2_002_partial_08_0007,
  ep_Q2_002_partial_08_0008,
  ep_Q2_002_partial_08_0009,
  ep_Q2_002_partial_08_0010,
  ep_Q2_002_partial_08_0011,
  ep_Q2_002_partial_08_0012,
  ep_Q2_002_partial_08_0013,
  ep_Q2_002_partial_08_0014,
  ep_Q2_002_partial_08_0015,
  ep_Q2_002_partial_08_0016,
  ep_Q2_002_partial_08_0017,
  ep_Q2_002_partial_08_0018,
  ep_Q2_002_partial_08_0019,
  ep_Q2_002_partial_08_0020,
  ep_Q2_002_partial_08_0021,
  ep_Q2_002_partial_08_0022,
  ep_Q2_002_partial_08_0023,
  ep_Q2_002_partial_08_0024,
  ep_Q2_002_partial_08_0025,
  ep_Q2_002_partial_08_0026,
  ep_Q2_002_partial_08_0027,
  ep_Q2_002_partial_08_0028,
  ep_Q2_002_partial_08_0029,
  ep_Q2_002_partial_08_0030,
  ep_Q2_002_partial_08_0031,
  ep_Q2_002_partial_08_0032,
  ep_Q2_002_partial_08_0033,
  ep_Q2_002_partial_08_0034,
  ep_Q2_002_partial_08_0035,
  ep_Q2_002_partial_08_0036,
  ep_Q2_002_partial_08_0037,
  ep_Q2_002_partial_08_0038,
  ep_Q2_002_partial_08_0039,
  ep_Q2_002_partial_08_0040,
  ep_Q2_002_partial_08_0041,
  ep_Q2_002_partial_08_0042,
  ep_Q2_002_partial_08_0043,
  ep_Q2_002_partial_08_0044,
  ep_Q2_002_partial_08_0045,
  ep_Q2_002_partial_08_0046,
  ep_Q2_002_partial_08_0047,
  ep_Q2_002_partial_08_0048,
  ep_Q2_002_partial_08_0049,
  ep_Q2_002_partial_08_0050,
  ep_Q2_002_partial_08_0051,
  ep_Q2_002_partial_08_0052,
  ep_Q2_002_partial_08_0053,
  ep_Q2_002_partial_08_0054,
  ep_Q2_002_partial_08_0055,
  ep_Q2_002_partial_08_0056,
  ep_Q2_002_partial_08_0057,
  ep_Q2_002_partial_08_0058,
  ep_Q2_002_partial_08_0059,
  ep_Q2_002_partial_08_0060,
  ep_Q2_002_partial_08_0061,
  ep_Q2_002_partial_08_0062,
  ep_Q2_002_partial_08_0063,
  ep_Q2_002_partial_08_0064,
  ep_Q2_002_partial_08_0065,
  ep_Q2_002_partial_08_0066,
  ep_Q2_002_partial_08_0067,
  ep_Q2_002_partial_08_0068,
  ep_Q2_002_partial_08_0069,
  ep_Q2_002_partial_08_0070,
  ep_Q2_002_partial_08_0071,
  ep_Q2_002_partial_08_0072,
  ep_Q2_002_partial_08_0073,
  ep_Q2_002_partial_08_0074,
  ep_Q2_002_partial_08_0075,
  ep_Q2_002_partial_08_0076,
  ep_Q2_002_partial_08_0077,
  ep_Q2_002_partial_08_0078,
  ep_Q2_002_partial_08_0079,
  ep_Q2_002_partial_08_0080,
  ep_Q2_002_partial_08_0081,
  ep_Q2_002_partial_08_0082,
  ep_Q2_002_partial_08_0083,
  ep_Q2_002_partial_08_0084,
  ep_Q2_002_partial_08_0085,
  ep_Q2_002_partial_08_0086,
  ep_Q2_002_partial_08_0087,
  ep_Q2_002_partial_08_0088,
  ep_Q2_002_partial_08_0089,
  ep_Q2_002_partial_08_0090,
  ep_Q2_002_partial_08_0091,
  ep_Q2_002_partial_08_0092,
  ep_Q2_002_partial_08_0093,
  ep_Q2_002_partial_08_0094,
  ep_Q2_002_partial_08_0095,
  ep_Q2_002_partial_08_0096,
  ep_Q2_002_partial_08_0097,
  ep_Q2_002_partial_08_0098,
  ep_Q2_002_partial_08_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_08_0000_0099 : Poly :=
[
  term ((12061944855080132171820 : Rat) / 253528477699481291099) [(0, 1)],
  term ((-4159158396240132768773378824576 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1)],
  term ((-2841410027910074971250777463424 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (4, 1)],
  term ((1226580112470191895618211257216 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (6, 1)],
  term ((9870251280062719201013309565696 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (4, 1), (7, 1)],
  term ((30324979097509684873885999296 : Rat) / 115799135485108289802725034287) [(0, 1), (1, 1), (4, 1), (9, 1)],
  term ((114686824601530391787646374351456 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (4, 1), (11, 1)],
  term ((-17504753841306164414885367450624 : Rat) / 115799135485108289802725034287) [(0, 1), (1, 1), (4, 1), (13, 1)],
  term ((-109577220044509122795911979043504632605056 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (4, 1), (15, 1)],
  term ((-70812392888 : Rat) / 7401317245) [(0, 1), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((10012894699954008658076348730016 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1)],
  term ((-3679740337410575686854633771648 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (6, 1)],
  term ((-30324979097509684873885999296 : Rat) / 115799135485108289802725034287) [(0, 1), (1, 1), (5, 1), (8, 1)],
  term ((281379861428515442123750366976 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 1), (5, 1), (12, 1)],
  term ((8079485464978461054490390668288 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (14, 1)],
  term ((-4039742732489230527245195334144 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (14, 2)],
  term ((-4039742732489230527245195334144 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (15, 2)],
  term ((8338289407996435114640873231232 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (6, 1), (9, 1)],
  term ((-6009014872703505400747753501440 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (6, 1), (11, 1)],
  term ((-4658549070585859427786239459584 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (6, 1), (13, 1)],
  term ((-465997563601622145488083725924684668335488 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (6, 1), (15, 1)],
  term ((-12548443744 : Rat) / 7401317245) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((2960985789041934367115603090496 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1)],
  term ((-187155526347636087040440117504 : Rat) / 8907625806546791523286541099) [(0, 1), (1, 1), (7, 1), (8, 1)],
  term ((4658549070585859427786239459584 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (12, 1)],
  term ((-5069779899375562235757976872192 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (14, 1)],
  term ((2534889949687781117878988436096 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (14, 2)],
  term ((2534889949687781117878988436096 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (15, 2)],
  term ((-290848277180263178258723791727136 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 1), (11, 1)],
  term ((520700758998018709542170460198720 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (8, 1), (13, 1)],
  term ((-418527566781310967640464585143041429699888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (8, 1), (15, 1)],
  term ((172320730556 : Rat) / 7401317245) [(0, 1), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3677776550883671989400132343264 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1)],
  term ((8702322330624832316304372590400 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1), (12, 1)],
  term ((696750578577670091854663960704 : Rat) / 115799135485108289802725034287) [(0, 1), (1, 1), (9, 1), (14, 1)],
  term ((-348375289288835045927331980352 : Rat) / 115799135485108289802725034287) [(0, 1), (1, 1), (9, 1), (14, 2)],
  term ((-348375289288835045927331980352 : Rat) / 115799135485108289802725034287) [(0, 1), (1, 1), (9, 1), (15, 2)],
  term ((89390981887958538541888702031136 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1)],
  term ((222818925852800832948847729265280 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1), (12, 1)],
  term ((179345218579114518079907891434464 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1), (14, 1)],
  term ((-89672609289557259039953945717232 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1), (14, 2)],
  term ((-89672609289557259039953945717232 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1), (15, 2)],
  term ((-417941791848209873907132903454080 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (12, 1), (13, 1)],
  term ((-527631000741617040543893593804443897482472 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (12, 1), (15, 1)],
  term ((-148664721866 : Rat) / 7401317245) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-160812632399792321102772591281184 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (13, 1)],
  term ((-354451316860242500436644403790464 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (13, 1), (14, 1)],
  term ((177225658430121250218322201895232 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (13, 1), (14, 2)],
  term ((177225658430121250218322201895232 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (13, 1), (15, 2)],
  term ((-875250508059139494571788289164522496535904 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (14, 1), (15, 1)],
  term ((-142855044032 : Rat) / 7401317245) [(0, 1), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((437625254029569747285894144582261248267952 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (14, 2), (15, 1)],
  term ((71427522016 : Rat) / 7401317245) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-511725503704825656538586118049699951524992 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (15, 1)],
  term ((-10392084968 : Rat) / 1057331035) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term ((437625254029569747285894144582261248267952 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (15, 3)],
  term ((71427522016 : Rat) / 7401317245) [(0, 1), (1, 1), (15, 3), (16, 1)],
  term ((-6331646860084464386434888459776 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2)],
  term ((-591294499063264758390936959616 : Rat) / 97983883872014706756151952089) [(0, 1), (1, 2), (4, 1)],
  term ((-57114633522836183706024143868288 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (5, 1), (11, 1)],
  term ((107557550883815516796500102186496 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (5, 1), (13, 1)],
  term ((-735124433572387104387134023322073147961728 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 2), (5, 1), (15, 1)],
  term ((17222453536 : Rat) / 7401317245) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((35838745208392855232790833172192 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (7, 1), (11, 1)],
  term ((-67491068813784397620094809377664 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (7, 1), (13, 1)],
  term ((-660713555419972994318477863829433249304368 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term ((-41983667284 : Rat) / 7401317245) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((20360657398443514451100945401472 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (8, 1)],
  term ((-4925394584195070471041568310704 : Rat) / 115799135485108289802725034287) [(0, 1), (1, 2), (9, 1), (11, 1)],
  term ((9275440389556469816258880216768 : Rat) / 115799135485108289802725034287) [(0, 1), (1, 2), (9, 1), (13, 1)],
  term ((5023719978252624155832503530521657444264 : Rat) / 24487603954914955028839041264616839409) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((1183365302 : Rat) / 211466207) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((45404057130802661965632964933536 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((-1152230675219932452276975247017027696698424 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((-39443926462 : Rat) / 7401317245) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((135028704725573384111185361520 : Rat) / 8907625806546791523286541099) [(0, 1), (1, 2), (11, 2)],
  term ((-15356055249897327978895735409664 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (12, 1)],
  term ((79487390270197526185166791572366050232036 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((-4286620453 : Rat) / 1057331035) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-153982041604766657839392822548352 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (13, 2)],
  term ((-12878363831431525243714998390912 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (14, 1)],
  term ((6439181915715762621857499195456 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (14, 2)],
  term ((-1018895794748306418413226245837526885788808 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 2), (15, 2)],
  term ((35309876906 : Rat) / 7401317245) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((4039742732489230527245195334144 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 3), (5, 1)],
  term ((-2534889949687781117878988436096 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 3), (7, 1)],
  term ((348375289288835045927331980352 : Rat) / 115799135485108289802725034287) [(0, 1), (1, 3), (9, 1)],
  term ((89672609289557259039953945717232 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 3), (11, 1)],
  term ((-177225658430121250218322201895232 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 3), (13, 1)],
  term ((-437625254029569747285894144582261248267952 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 3), (15, 1)],
  term ((-71427522016 : Rat) / 7401317245) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term ((-6439181915715762621857499195456 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 4)],
  term ((40172383039896538685498729626848 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (4, 1), (11, 1)],
  term ((-75652120418669826747895960454016 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (4, 1), (13, 1)],
  term ((409926084106785155589148070775757467410016 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 1), (4, 1), (15, 1)],
  term ((-15581939872 : Rat) / 7401317245) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-17341617585377006096152289814432 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (6, 1), (11, 1)],
  term ((32657513509231996253038558383744 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (6, 1), (13, 1)],
  term ((-519404449493496565434514805775342234666432 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 1), (6, 1), (15, 1)],
  term ((-3011850936 : Rat) / 7401317245) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((58802954369895767389393482949152 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (11, 1)],
  term ((-110736975213715344813228204537984 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (13, 1)],
  term ((82308039533256266957219434302075879888 : Rat) / 485689945012738018963630461433078315) [(0, 1), (3, 1), (15, 1)],
  term ((-1790748 : Rat) / 381295) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((-139547446946385412691205792931392 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (7, 1), (11, 1)],
  term ((262793975901835801412014680824064 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (7, 1), (13, 1)],
  term ((-29255753088929547696583272731332684324608 : Rat) / 20720280269543423485940727223906556423) [(0, 1), (4, 1), (7, 1), (15, 1)],
  term ((1042425392 : Rat) / 211466207) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-428740190263229965133057048592 : Rat) / 115799135485108289802725034287) [(0, 1), (4, 1), (9, 1), (11, 1)],
  term ((807398069213491711065167206464 : Rat) / 115799135485108289802725034287) [(0, 1), (4, 1), (9, 1), (13, 1)],
  term ((-8200356739168753857774872701486155698928 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (4, 1), (9, 1), (15, 1)],
  term ((439301136 : Rat) / 7401317245) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-11201337269157967219422736340256 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (11, 1), (13, 1)],
  term ((18647546493108399352299967367840110689456 : Rat) / 20720280269543423485940727223906556423) [(0, 1), (4, 1), (11, 1), (15, 1)],
  term ((15110282248 : Rat) / 1480263449) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (11, 2)],
  term ((-582425735962187177204923868202397711540512 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (4, 1), (13, 1), (15, 1)],
  term ((16457414592 : Rat) / 1057331035) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((322383707960404124157035485087872 : Rat) / 1273790490336191187829975377157) [(0, 1), (4, 1), (13, 2)],
  term ((1925977447872488457372937069769045437394208 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (4, 1), (15, 2)],
  term ((-212436593916 : Rat) / 7401317245) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((52024852756131018288456869443296 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (6, 1), (11, 1)],
  term ((-97972540527695988759115675151232 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (6, 1), (13, 1)],
  term ((-114229267045672367412048287736576 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 1), (14, 1)],
  term ((57114633522836183706024143868288 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 1), (14, 2)],
  term ((57114633522836183706024143868288 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 1), (15, 2)],
  term ((215115101767631033593000204372992 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (13, 1), (14, 1)],
  term ((-107557550883815516796500102186496 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (13, 1), (14, 2)],
  term ((-107557550883815516796500102186496 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (13, 1), (15, 2)],
  term ((-1470248867144774208774268046644146295923456 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (14, 1), (15, 1)],
  term ((34444907072 : Rat) / 7401317245) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((735124433572387104387134023322073147961728 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (14, 2), (15, 1)],
  term ((-17222453536 : Rat) / 7401317245) [(0, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((735124433572387104387134023322073147961728 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (15, 3)],
  term ((-17222453536 : Rat) / 7401317245) [(0, 1), (5, 1), (15, 3), (16, 1)],
  term ((71677490416785710465581666344384 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1), (14, 1)],
  term ((-35838745208392855232790833172192 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1), (14, 2)],
  term ((-35838745208392855232790833172192 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1), (15, 2)],
  term ((-134982137627568795240189618755328 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (13, 1), (14, 1)],
  term ((67491068813784397620094809377664 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (13, 1), (14, 2)],
  term ((67491068813784397620094809377664 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (13, 1), (15, 2)],
  term ((-1321427110839945988636955727658866498608736 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term ((-83967334568 : Rat) / 7401317245) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((660713555419972994318477863829433249304368 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term ((41983667284 : Rat) / 7401317245) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((660713555419972994318477863829433249304368 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (15, 3)],
  term ((41983667284 : Rat) / 7401317245) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((-9850789168390140942083136621408 : Rat) / 115799135485108289802725034287) [(0, 1), (9, 1), (11, 1), (14, 1)],
  term ((4925394584195070471041568310704 : Rat) / 115799135485108289802725034287) [(0, 1), (9, 1), (11, 1), (14, 2)],
  term ((4925394584195070471041568310704 : Rat) / 115799135485108289802725034287) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((18550880779112939632517760433536 : Rat) / 115799135485108289802725034287) [(0, 1), (9, 1), (13, 1), (14, 1)],
  term ((-9275440389556469816258880216768 : Rat) / 115799135485108289802725034287) [(0, 1), (9, 1), (13, 1), (14, 2)],
  term ((-9275440389556469816258880216768 : Rat) / 115799135485108289802725034287) [(0, 1), (9, 1), (13, 1), (15, 2)],
  term ((10047439956505248311665007061043314888528 : Rat) / 24487603954914955028839041264616839409) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term ((2366730604 : Rat) / 211466207) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5023719978252624155832503530521657444264 : Rat) / 24487603954914955028839041264616839409) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((-1183365302 : Rat) / 211466207) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5023719978252624155832503530521657444264 : Rat) / 24487603954914955028839041264616839409) [(0, 1), (9, 1), (15, 3)],
  term ((-1183365302 : Rat) / 211466207) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((90808114261605323931265929867072 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 1), (14, 1)],
  term ((-45404057130802661965632964933536 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((-45404057130802661965632964933536 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((-2304461350439864904553950494034055393396848 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term ((-78887852924 : Rat) / 7401317245) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1152230675219932452276975247017027696698424 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((39443926462 : Rat) / 7401317245) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1152230675219932452276975247017027696698424 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (15, 3)],
  term ((39443926462 : Rat) / 7401317245) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((270057409451146768222370723040 : Rat) / 8907625806546791523286541099) [(0, 1), (11, 2), (14, 1)],
  term ((-135028704725573384111185361520 : Rat) / 8907625806546791523286541099) [(0, 1), (11, 2), (14, 2)],
  term ((-135028704725573384111185361520 : Rat) / 8907625806546791523286541099) [(0, 1), (11, 2), (15, 2)],
  term ((158974780540395052370333583144732100464072 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((-8573240906 : Rat) / 1057331035) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-79487390270197526185166791572366050232036 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((4286620453 : Rat) / 1057331035) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-79487390270197526185166791572366050232036 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (13, 1), (15, 3)],
  term ((4286620453 : Rat) / 1057331035) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((-307964083209533315678785645096704 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2), (14, 1)],
  term ((153982041604766657839392822548352 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2), (14, 2)],
  term ((153982041604766657839392822548352 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2), (15, 2)],
  term ((-2051408283255606896944018298168740091131536 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (14, 1), (15, 2)],
  term ((70619753812 : Rat) / 7401317245) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((1025704141627803448472009149084370045565768 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (14, 2), (15, 2)],
  term ((-35309876906 : Rat) / 7401317245) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((1025704141627803448472009149084370045565768 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (15, 4)],
  term ((-35309876906 : Rat) / 7401317245) [(0, 1), (15, 4), (16, 1)],
  term ((-6030972427540066085910 : Rat) / 253528477699481291099) [(0, 2)],
  term ((2079579198120066384386689412288 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (3, 1)],
  term ((1420705013955037485625388731712 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (3, 1), (4, 1)],
  term ((-613290056235095947809105628608 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (3, 1), (6, 1)],
  term ((-4935125640031359600506654782848 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (4, 1), (7, 1)],
  term ((-15162489548754842436942999648 : Rat) / 115799135485108289802725034287) [(0, 2), (1, 1), (4, 1), (9, 1)],
  term ((-57343412300765195893823187175728 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (4, 1), (11, 1)],
  term ((8752376920653082207442683725312 : Rat) / 115799135485108289802725034287) [(0, 2), (1, 1), (4, 1), (13, 1)],
  term ((54788610022254561397955989521752316302528 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (1, 1), (4, 1), (15, 1)],
  term ((35406196444 : Rat) / 7401317245) [(0, 2), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((-13085932814955465383528565033296 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (5, 1)],
  term ((1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (5, 1), (6, 1)],
  term ((15162489548754842436942999648 : Rat) / 115799135485108289802725034287) [(0, 2), (1, 1), (5, 1), (8, 1)],
  term ((-140689930714257721061875183488 : Rat) / 97983883872014706756151952089) [(0, 2), (1, 1), (5, 1), (12, 1)],
  term ((-4169144703998217557320436615616 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (6, 1), (9, 1)],
  term ((3004507436351752700373876750720 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (6, 1), (11, 1)],
  term ((2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (6, 1), (13, 1)],
  term ((232998781800811072744041862962342334167744 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (1, 1), (6, 1), (15, 1)],
  term ((6274221872 : Rat) / 7401317245) [(0, 2), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((3589287004854595052200175326944 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (7, 1)],
  term ((93577763173818043520220058752 : Rat) / 8907625806546791523286541099) [(0, 2), (1, 1), (7, 1), (8, 1)],
  term ((-2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (7, 1), (12, 1)],
  term ((145424138590131589129361895863568 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (8, 1), (11, 1)],
  term ((-260350379499009354771085230099360 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (8, 1), (13, 1)],
  term ((209263783390655483820232292571520714849944 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (1, 1), (8, 1), (15, 1)],
  term ((-86160365278 : Rat) / 7401317245) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-5825368088912535015701237396112 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (9, 1)],
  term ((-4351161165312416158152186295200 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (9, 1), (12, 1)],
  term ((-224040709523093787350852242450032 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (11, 1)],
  term ((-111409462926400416474423864632640 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (11, 1), (12, 1)],
  term ((208970895924104936953566451727040 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (12, 1), (13, 1)],
  term ((263815500370808520271946796902221948741236 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (1, 1), (12, 1), (15, 1)],
  term ((74332360933 : Rat) / 7401317245) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((33450587158472204691386976879312 : Rat) / 97983883872014706756151952089) [(0, 2), (1, 1), (13, 1)],
  term ((17401742460177728043708943818298038035360 : Rat) / 20720280269543423485940727223906556423) [(0, 2), (1, 1), (15, 1)],
  term ((35845468284 : Rat) / 1480263449) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((1234168250882596725917880201600 : Rat) / 97983883872014706756151952089) [(0, 2), (1, 2)],
  term ((295647249531632379195468479808 : Rat) / 97983883872014706756151952089) [(0, 2), (1, 2), (4, 1)],
  term ((-10180328699221757225550472700736 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 2), (8, 1)],
  term ((7678027624948663989447867704832 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 2), (12, 1)],
  term ((-20086191519948269342749364813424 : Rat) / 1273790490336191187829975377157) [(0, 2), (3, 1), (4, 1), (11, 1)],
  term ((37826060209334913373947980227008 : Rat) / 1273790490336191187829975377157) [(0, 2), (3, 1), (4, 1), (13, 1)],
  term ((-204963042053392577794574035387878733705008 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (3, 1), (4, 1), (15, 1)],
  term ((7790969936 : Rat) / 7401317245) [(0, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((8670808792688503048076144907216 : Rat) / 1273790490336191187829975377157) [(0, 2), (3, 1), (6, 1), (11, 1)],
  term ((-16328756754615998126519279191872 : Rat) / 1273790490336191187829975377157) [(0, 2), (3, 1), (6, 1), (13, 1)],
  term ((259702224746748282717257402887671117333216 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (3, 1), (6, 1), (15, 1)],
  term ((1505925468 : Rat) / 7401317245) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-29401477184947883694696741474576 : Rat) / 1273790490336191187829975377157) [(0, 2), (3, 1), (11, 1)],
  term ((55368487606857672406614102268992 : Rat) / 1273790490336191187829975377157) [(0, 2), (3, 1), (13, 1)],
  term ((-41154019766628133478609717151037939944 : Rat) / 485689945012738018963630461433078315) [(0, 2), (3, 1), (15, 1)],
  term ((895374 : Rat) / 381295) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((69773723473192706345602896465696 : Rat) / 1273790490336191187829975377157) [(0, 2), (4, 1), (7, 1), (11, 1)],
  term ((-131396987950917900706007340412032 : Rat) / 1273790490336191187829975377157) [(0, 2), (4, 1), (7, 1), (13, 1)],
  term ((14627876544464773848291636365666342162304 : Rat) / 20720280269543423485940727223906556423) [(0, 2), (4, 1), (7, 1), (15, 1)],
  term ((-521212696 : Rat) / 211466207) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((214370095131614982566528524296 : Rat) / 115799135485108289802725034287) [(0, 2), (4, 1), (9, 1), (11, 1)],
  term ((-403699034606745855532583603232 : Rat) / 115799135485108289802725034287) [(0, 2), (4, 1), (9, 1), (13, 1)],
  term ((4100178369584376928887436350743077849464 : Rat) / 122438019774574775144195206323084197045) [(0, 2), (4, 1), (9, 1), (15, 1)],
  term ((-219650568 : Rat) / 7401317245) [(0, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((5600668634578983609711368170128 : Rat) / 1273790490336191187829975377157) [(0, 2), (4, 1), (11, 1), (13, 1)],
  term ((-9323773246554199676149983683920055344728 : Rat) / 20720280269543423485940727223906556423) [(0, 2), (4, 1), (11, 1), (15, 1)],
  term ((-7555141124 : Rat) / 1480263449) [(0, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(0, 2), (4, 1), (11, 2)],
  term ((291212867981093588602461934101198855770256 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (4, 1), (13, 1), (15, 1)],
  term ((-8228707296 : Rat) / 1057331035) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-161191853980202062078517742543936 : Rat) / 1273790490336191187829975377157) [(0, 2), (4, 1), (13, 2)],
  term ((-962988723936244228686468534884522718697104 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (4, 1), (15, 2)],
  term ((106218296958 : Rat) / 7401317245) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((-26012426378065509144228434721648 : Rat) / 1273790490336191187829975377157) [(0, 2), (5, 1), (6, 1), (11, 1)],
  term ((48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(0, 2), (5, 1), (6, 1), (13, 1)],
  term ((114229267045672367412048287736576 : Rat) / 1273790490336191187829975377157) [(0, 2), (5, 1), (11, 1)],
  term ((-215115101767631033593000204372992 : Rat) / 1273790490336191187829975377157) [(0, 2), (5, 1), (13, 1)],
  term ((1470248867144774208774268046644146295923456 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (5, 1), (15, 1)],
  term ((-34444907072 : Rat) / 7401317245) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-71677490416785710465581666344384 : Rat) / 1273790490336191187829975377157) [(0, 2), (7, 1), (11, 1)],
  term ((134982137627568795240189618755328 : Rat) / 1273790490336191187829975377157) [(0, 2), (7, 1), (13, 1)],
  term ((1321427110839945988636955727658866498608736 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (7, 1), (15, 1)],
  term ((83967334568 : Rat) / 7401317245) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((9850789168390140942083136621408 : Rat) / 115799135485108289802725034287) [(0, 2), (9, 1), (11, 1)],
  term ((-18550880779112939632517760433536 : Rat) / 115799135485108289802725034287) [(0, 2), (9, 1), (13, 1)],
  term ((-10047439956505248311665007061043314888528 : Rat) / 24487603954914955028839041264616839409) [(0, 2), (9, 1), (15, 1)],
  term ((-2366730604 : Rat) / 211466207) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-90808114261605323931265929867072 : Rat) / 1273790490336191187829975377157) [(0, 2), (11, 1), (13, 1)],
  term ((2304461350439864904553950494034055393396848 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (11, 1), (15, 1)],
  term ((78887852924 : Rat) / 7401317245) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-270057409451146768222370723040 : Rat) / 8907625806546791523286541099) [(0, 2), (11, 2)],
  term ((-158974780540395052370333583144732100464072 : Rat) / 103601401347717117429703636119532782115) [(0, 2), (13, 1), (15, 1)],
  term ((8573240906 : Rat) / 1057331035) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((307964083209533315678785645096704 : Rat) / 1273790490336191187829975377157) [(0, 2), (13, 2)],
  term ((2051408283255606896944018298168740091131536 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (15, 2)],
  term ((-70619753812 : Rat) / 7401317245) [(0, 2), (15, 2), (16, 1)],
  term ((4039742732489230527245195334144 : Rat) / 1273790490336191187829975377157) [(0, 3), (1, 1), (5, 1)],
  term ((-2534889949687781117878988436096 : Rat) / 1273790490336191187829975377157) [(0, 3), (1, 1), (7, 1)],
  term ((348375289288835045927331980352 : Rat) / 115799135485108289802725034287) [(0, 3), (1, 1), (9, 1)],
  term ((89672609289557259039953945717232 : Rat) / 1273790490336191187829975377157) [(0, 3), (1, 1), (11, 1)],
  term ((-177225658430121250218322201895232 : Rat) / 1273790490336191187829975377157) [(0, 3), (1, 1), (13, 1)],
  term ((-437625254029569747285894144582261248267952 : Rat) / 1346818217520322526586147269553926167495) [(0, 3), (1, 1), (15, 1)],
  term ((-71427522016 : Rat) / 7401317245) [(0, 3), (1, 1), (15, 1), (16, 1)],
  term ((-6439181915715762621857499195456 : Rat) / 1273790490336191187829975377157) [(0, 3), (1, 2)],
  term ((-57114633522836183706024143868288 : Rat) / 1273790490336191187829975377157) [(0, 3), (5, 1), (11, 1)],
  term ((107557550883815516796500102186496 : Rat) / 1273790490336191187829975377157) [(0, 3), (5, 1), (13, 1)],
  term ((-735124433572387104387134023322073147961728 : Rat) / 1346818217520322526586147269553926167495) [(0, 3), (5, 1), (15, 1)],
  term ((17222453536 : Rat) / 7401317245) [(0, 3), (5, 1), (15, 1), (16, 1)],
  term ((35838745208392855232790833172192 : Rat) / 1273790490336191187829975377157) [(0, 3), (7, 1), (11, 1)],
  term ((-67491068813784397620094809377664 : Rat) / 1273790490336191187829975377157) [(0, 3), (7, 1), (13, 1)],
  term ((-660713555419972994318477863829433249304368 : Rat) / 1346818217520322526586147269553926167495) [(0, 3), (7, 1), (15, 1)],
  term ((-41983667284 : Rat) / 7401317245) [(0, 3), (7, 1), (15, 1), (16, 1)],
  term ((-4925394584195070471041568310704 : Rat) / 115799135485108289802725034287) [(0, 3), (9, 1), (11, 1)],
  term ((9275440389556469816258880216768 : Rat) / 115799135485108289802725034287) [(0, 3), (9, 1), (13, 1)],
  term ((5023719978252624155832503530521657444264 : Rat) / 24487603954914955028839041264616839409) [(0, 3), (9, 1), (15, 1)],
  term ((1183365302 : Rat) / 211466207) [(0, 3), (9, 1), (15, 1), (16, 1)],
  term ((45404057130802661965632964933536 : Rat) / 1273790490336191187829975377157) [(0, 3), (11, 1), (13, 1)],
  term ((-1152230675219932452276975247017027696698424 : Rat) / 1346818217520322526586147269553926167495) [(0, 3), (11, 1), (15, 1)],
  term ((-39443926462 : Rat) / 7401317245) [(0, 3), (11, 1), (15, 1), (16, 1)],
  term ((135028704725573384111185361520 : Rat) / 8907625806546791523286541099) [(0, 3), (11, 2)],
  term ((79487390270197526185166791572366050232036 : Rat) / 103601401347717117429703636119532782115) [(0, 3), (13, 1), (15, 1)],
  term ((-4286620453 : Rat) / 1057331035) [(0, 3), (13, 1), (15, 1), (16, 1)],
  term ((-153982041604766657839392822548352 : Rat) / 1273790490336191187829975377157) [(0, 3), (13, 2)],
  term ((-1025704141627803448472009149084370045565768 : Rat) / 1346818217520322526586147269553926167495) [(0, 3), (15, 2)],
  term ((35309876906 : Rat) / 7401317245) [(0, 3), (15, 2), (16, 1)],
  term ((2841410027910074971250777463424 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (14, 1)],
  term ((-1420705013955037485625388731712 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (14, 2)],
  term ((-1420705013955037485625388731712 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (15, 2)],
  term ((-1226580112470191895618211257216 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (14, 1)],
  term ((613290056235095947809105628608 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (14, 2)],
  term ((613290056235095947809105628608 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (15, 2)],
  term ((4159158396240132768773378824576 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (14, 1)],
  term ((-2079579198120066384386689412288 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (14, 2)],
  term ((-2079579198120066384386689412288 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (15, 2)],
  term ((-9870251280062719201013309565696 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (14, 1)],
  term ((4935125640031359600506654782848 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (14, 2)],
  term ((4935125640031359600506654782848 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (15, 2)],
  term ((-30324979097509684873885999296 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (9, 1), (14, 1)],
  term ((15162489548754842436942999648 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (9, 1), (14, 2)],
  term ((15162489548754842436942999648 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (9, 1), (15, 2)],
  term ((-114686824601530391787646374351456 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (14, 1)],
  term ((57343412300765195893823187175728 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (14, 2)],
  term ((57343412300765195893823187175728 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (15, 2)],
  term ((17504753841306164414885367450624 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (13, 1), (14, 1)],
  term ((-8752376920653082207442683725312 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (13, 1), (14, 2)],
  term ((-8752376920653082207442683725312 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (13, 1), (15, 2)],
  term ((109577220044509122795911979043504632605056 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (14, 1), (15, 1)],
  term ((70812392888 : Rat) / 7401317245) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-54788610022254561397955989521752316302528 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (14, 2), (15, 1)],
  term ((-35406196444 : Rat) / 7401317245) [(1, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((-54788610022254561397955989521752316302528 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (15, 3)],
  term ((-35406196444 : Rat) / 7401317245) [(1, 1), (4, 1), (15, 3), (16, 1)],
  term ((3679740337410575686854633771648 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (14, 1)],
  term ((-1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (14, 2)],
  term ((-1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (15, 2)],
  term ((30324979097509684873885999296 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (8, 1), (14, 1)],
  term ((-15162489548754842436942999648 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (8, 1), (14, 2)],
  term ((-15162489548754842436942999648 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (8, 1), (15, 2)],
  term ((-281379861428515442123750366976 : Rat) / 97983883872014706756151952089) [(1, 1), (5, 1), (12, 1), (14, 1)],
  term ((140689930714257721061875183488 : Rat) / 97983883872014706756151952089) [(1, 1), (5, 1), (12, 1), (14, 2)],
  term ((140689930714257721061875183488 : Rat) / 97983883872014706756151952089) [(1, 1), (5, 1), (12, 1), (15, 2)],
  term ((-10012894699954008658076348730016 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (14, 1)],
  term ((5006447349977004329038174365008 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (14, 2)],
  term ((5006447349977004329038174365008 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (15, 2)],
  term ((-8338289407996435114640873231232 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (14, 1)],
  term ((4169144703998217557320436615616 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (14, 2)],
  term ((4169144703998217557320436615616 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (15, 2)],
  term ((6009014872703505400747753501440 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1), (14, 1)],
  term ((-3004507436351752700373876750720 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1), (14, 2)],
  term ((-3004507436351752700373876750720 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1), (15, 2)],
  term ((4658549070585859427786239459584 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (13, 1), (14, 1)],
  term ((-2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (13, 1), (14, 2)],
  term ((-2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (13, 1), (15, 2)],
  term ((465997563601622145488083725924684668335488 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (14, 1), (15, 1)],
  term ((12548443744 : Rat) / 7401317245) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-232998781800811072744041862962342334167744 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (14, 2), (15, 1)],
  term ((-6274221872 : Rat) / 7401317245) [(1, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-232998781800811072744041862962342334167744 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (15, 3)],
  term ((-6274221872 : Rat) / 7401317245) [(1, 1), (6, 1), (15, 3), (16, 1)],
  term ((187155526347636087040440117504 : Rat) / 8907625806546791523286541099) [(1, 1), (7, 1), (8, 1), (14, 1)],
  term ((-93577763173818043520220058752 : Rat) / 8907625806546791523286541099) [(1, 1), (7, 1), (8, 1), (14, 2)],
  term ((-93577763173818043520220058752 : Rat) / 8907625806546791523286541099) [(1, 1), (7, 1), (8, 1), (15, 2)],
  term ((-4658549070585859427786239459584 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 1), (14, 1)],
  term ((2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 1), (14, 2)],
  term ((2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 1), (15, 2)],
  term ((-2960985789041934367115603090496 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (14, 1)],
  term ((1480492894520967183557801545248 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (14, 2)],
  term ((1480492894520967183557801545248 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (15, 2)],
  term ((290848277180263178258723791727136 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (14, 1)],
  term ((-145424138590131589129361895863568 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (14, 2)],
  term ((-145424138590131589129361895863568 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((-520700758998018709542170460198720 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (13, 1), (14, 1)],
  term ((260350379499009354771085230099360 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (13, 1), (14, 2)],
  term ((260350379499009354771085230099360 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (13, 1), (15, 2)],
  term ((418527566781310967640464585143041429699888 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (14, 1), (15, 1)],
  term ((-172320730556 : Rat) / 7401317245) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-209263783390655483820232292571520714849944 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (14, 2), (15, 1)],
  term ((86160365278 : Rat) / 7401317245) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-209263783390655483820232292571520714849944 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (15, 3)],
  term ((86160365278 : Rat) / 7401317245) [(1, 1), (8, 1), (15, 3), (16, 1)],
  term ((-8702322330624832316304372590400 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 1), (14, 1)],
  term ((4351161165312416158152186295200 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 1), (14, 2)],
  term ((4351161165312416158152186295200 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 1), (15, 2)],
  term ((3677776550883671989400132343264 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (14, 1)],
  term ((-1838888275441835994700066171632 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (14, 2)],
  term ((-1838888275441835994700066171632 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (15, 2)],
  term ((-222818925852800832948847729265280 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1), (14, 1)],
  term ((111409462926400416474423864632640 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1), (14, 2)],
  term ((111409462926400416474423864632640 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((-89390981887958538541888702031136 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (14, 1)],
  term ((44695490943979269270944351015568 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (14, 2)],
  term ((44695490943979269270944351015568 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (15, 2)],
  term ((417941791848209873907132903454080 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((-208970895924104936953566451727040 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 1), (14, 2)],
  term ((-208970895924104936953566451727040 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((527631000741617040543893593804443897482472 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 1), (14, 1), (15, 1)],
  term ((148664721866 : Rat) / 7401317245) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-263815500370808520271946796902221948741236 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 1), (14, 2), (15, 1)],
  term ((-74332360933 : Rat) / 7401317245) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-263815500370808520271946796902221948741236 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 1), (15, 3)],
  term ((-74332360933 : Rat) / 7401317245) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((160812632399792321102772591281184 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1), (14, 1)],
  term ((-80406316199896160551386295640592 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1), (14, 2)],
  term ((-80406316199896160551386295640592 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1), (15, 2)],
  term ((511725503704825656538586118049699951524992 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (14, 1), (15, 1)],
  term ((10392084968 : Rat) / 1057331035) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-255862751852412828269293059024849975762496 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (14, 2), (15, 1)],
  term ((-5196042484 : Rat) / 1057331035) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-255862751852412828269293059024849975762496 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (15, 3)],
  term ((-5196042484 : Rat) / 1057331035) [(1, 1), (15, 3), (16, 1)],
  term ((-6030972427540066085910 : Rat) / 253528477699481291099) [(1, 2)],
  term ((-20086191519948269342749364813424 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (4, 1), (11, 1)],
  term ((37826060209334913373947980227008 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (4, 1), (13, 1)],
  term ((-204963042053392577794574035387878733705008 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (3, 1), (4, 1), (15, 1)],
  term ((7790969936 : Rat) / 7401317245) [(1, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((8670808792688503048076144907216 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (6, 1), (11, 1)],
  term ((-16328756754615998126519279191872 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (6, 1), (13, 1)],
  term ((259702224746748282717257402887671117333216 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((1505925468 : Rat) / 7401317245) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-29401477184947883694696741474576 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (11, 1)],
  term ((55368487606857672406614102268992 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (13, 1)],
  term ((-41154019766628133478609717151037939944 : Rat) / 485689945012738018963630461433078315) [(1, 2), (3, 1), (15, 1)],
  term ((895374 : Rat) / 381295) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((69773723473192706345602896465696 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (7, 1), (11, 1)],
  term ((-131396987950917900706007340412032 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (7, 1), (13, 1)],
  term ((14627876544464773848291636365666342162304 : Rat) / 20720280269543423485940727223906556423) [(1, 2), (4, 1), (7, 1), (15, 1)],
  term ((-521212696 : Rat) / 211466207) [(1, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((214370095131614982566528524296 : Rat) / 115799135485108289802725034287) [(1, 2), (4, 1), (9, 1), (11, 1)],
  term ((-403699034606745855532583603232 : Rat) / 115799135485108289802725034287) [(1, 2), (4, 1), (9, 1), (13, 1)],
  term ((4100178369584376928887436350743077849464 : Rat) / 122438019774574775144195206323084197045) [(1, 2), (4, 1), (9, 1), (15, 1)],
  term ((-219650568 : Rat) / 7401317245) [(1, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((5600668634578983609711368170128 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (11, 1), (13, 1)],
  term ((-9323773246554199676149983683920055344728 : Rat) / 20720280269543423485940727223906556423) [(1, 2), (4, 1), (11, 1), (15, 1)],
  term ((-7555141124 : Rat) / 1480263449) [(1, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (11, 2)],
  term ((291212867981093588602461934101198855770256 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (4, 1), (13, 1), (15, 1)],
  term ((-8228707296 : Rat) / 1057331035) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-161191853980202062078517742543936 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (13, 2)],
  term ((591294499063264758390936959616 : Rat) / 97983883872014706756151952089) [(1, 2), (4, 1), (14, 1)],
  term ((-295647249531632379195468479808 : Rat) / 97983883872014706756151952089) [(1, 2), (4, 1), (14, 2)],
  term ((-967052485096692622360013877900371218833744 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (4, 1), (15, 2)],
  term ((106218296958 : Rat) / 7401317245) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((-26012426378065509144228434721648 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (6, 1), (11, 1)],
  term ((48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (6, 1), (13, 1)],
  term ((-20360657398443514451100945401472 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (14, 1)],
  term ((10180328699221757225550472700736 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (14, 2)],
  term ((10180328699221757225550472700736 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (15, 2)],
  term ((15356055249897327978895735409664 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1), (14, 1)],
  term ((-7678027624948663989447867704832 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1), (14, 2)],
  term ((-7678027624948663989447867704832 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1), (15, 2)],
  term ((6331646860084464386434888459776 : Rat) / 1273790490336191187829975377157) [(1, 2), (14, 1)],
  term ((-3165823430042232193217444229888 : Rat) / 1273790490336191187829975377157) [(1, 2), (14, 2)],
  term ((-3165823430042232193217444229888 : Rat) / 1273790490336191187829975377157) [(1, 2), (15, 2)],
  term ((2079579198120066384386689412288 : Rat) / 1273790490336191187829975377157) [(1, 3), (3, 1)],
  term ((1420705013955037485625388731712 : Rat) / 1273790490336191187829975377157) [(1, 3), (3, 1), (4, 1)],
  term ((-613290056235095947809105628608 : Rat) / 1273790490336191187829975377157) [(1, 3), (3, 1), (6, 1)],
  term ((-4935125640031359600506654782848 : Rat) / 1273790490336191187829975377157) [(1, 3), (4, 1), (7, 1)],
  term ((-15162489548754842436942999648 : Rat) / 115799135485108289802725034287) [(1, 3), (4, 1), (9, 1)],
  term ((-57343412300765195893823187175728 : Rat) / 1273790490336191187829975377157) [(1, 3), (4, 1), (11, 1)],
  term ((8752376920653082207442683725312 : Rat) / 115799135485108289802725034287) [(1, 3), (4, 1), (13, 1)],
  term ((54788610022254561397955989521752316302528 : Rat) / 1346818217520322526586147269553926167495) [(1, 3), (4, 1), (15, 1)],
  term ((35406196444 : Rat) / 7401317245) [(1, 3), (4, 1), (15, 1), (16, 1)],
  term ((-5006447349977004329038174365008 : Rat) / 1273790490336191187829975377157) [(1, 3), (5, 1)],
  term ((1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 3), (5, 1), (6, 1)],
  term ((15162489548754842436942999648 : Rat) / 115799135485108289802725034287) [(1, 3), (5, 1), (8, 1)],
  term ((-140689930714257721061875183488 : Rat) / 97983883872014706756151952089) [(1, 3), (5, 1), (12, 1)],
  term ((-4169144703998217557320436615616 : Rat) / 1273790490336191187829975377157) [(1, 3), (6, 1), (9, 1)],
  term ((3004507436351752700373876750720 : Rat) / 1273790490336191187829975377157) [(1, 3), (6, 1), (11, 1)],
  term ((2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 3), (6, 1), (13, 1)],
  term ((232998781800811072744041862962342334167744 : Rat) / 1346818217520322526586147269553926167495) [(1, 3), (6, 1), (15, 1)],
  term ((6274221872 : Rat) / 7401317245) [(1, 3), (6, 1), (15, 1), (16, 1)],
  term ((-1480492894520967183557801545248 : Rat) / 1273790490336191187829975377157) [(1, 3), (7, 1)],
  term ((93577763173818043520220058752 : Rat) / 8907625806546791523286541099) [(1, 3), (7, 1), (8, 1)],
  term ((-2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 3), (7, 1), (12, 1)],
  term ((145424138590131589129361895863568 : Rat) / 1273790490336191187829975377157) [(1, 3), (8, 1), (11, 1)],
  term ((-260350379499009354771085230099360 : Rat) / 1273790490336191187829975377157) [(1, 3), (8, 1), (13, 1)],
  term ((209263783390655483820232292571520714849944 : Rat) / 1346818217520322526586147269553926167495) [(1, 3), (8, 1), (15, 1)],
  term ((-86160365278 : Rat) / 7401317245) [(1, 3), (8, 1), (15, 1), (16, 1)],
  term ((1838888275441835994700066171632 : Rat) / 1273790490336191187829975377157) [(1, 3), (9, 1)],
  term ((-4351161165312416158152186295200 : Rat) / 1273790490336191187829975377157) [(1, 3), (9, 1), (12, 1)],
  term ((-44695490943979269270944351015568 : Rat) / 1273790490336191187829975377157) [(1, 3), (11, 1)],
  term ((-111409462926400416474423864632640 : Rat) / 1273790490336191187829975377157) [(1, 3), (11, 1), (12, 1)],
  term ((208970895924104936953566451727040 : Rat) / 1273790490336191187829975377157) [(1, 3), (12, 1), (13, 1)],
  term ((263815500370808520271946796902221948741236 : Rat) / 1346818217520322526586147269553926167495) [(1, 3), (12, 1), (15, 1)],
  term ((74332360933 : Rat) / 7401317245) [(1, 3), (12, 1), (15, 1), (16, 1)],
  term ((80406316199896160551386295640592 : Rat) / 1273790490336191187829975377157) [(1, 3), (13, 1)],
  term ((255862751852412828269293059024849975762496 : Rat) / 1346818217520322526586147269553926167495) [(1, 3), (15, 1)],
  term ((5196042484 : Rat) / 1057331035) [(1, 3), (15, 1), (16, 1)],
  term ((3165823430042232193217444229888 : Rat) / 1273790490336191187829975377157) [(1, 4)],
  term ((295647249531632379195468479808 : Rat) / 97983883872014706756151952089) [(1, 4), (4, 1)],
  term ((-10180328699221757225550472700736 : Rat) / 1273790490336191187829975377157) [(1, 4), (8, 1)],
  term ((7678027624948663989447867704832 : Rat) / 1273790490336191187829975377157) [(1, 4), (12, 1)],
  term ((-40172383039896538685498729626848 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (14, 1)],
  term ((20086191519948269342749364813424 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (14, 2)],
  term ((20086191519948269342749364813424 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (15, 2)],
  term ((75652120418669826747895960454016 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 1), (14, 1)],
  term ((-37826060209334913373947980227008 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 1), (14, 2)],
  term ((-37826060209334913373947980227008 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 1), (15, 2)],
  term ((-409926084106785155589148070775757467410016 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (14, 1), (15, 1)],
  term ((15581939872 : Rat) / 7401317245) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((204963042053392577794574035387878733705008 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (14, 2), (15, 1)],
  term ((-7790969936 : Rat) / 7401317245) [(3, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((204963042053392577794574035387878733705008 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (15, 3)],
  term ((-7790969936 : Rat) / 7401317245) [(3, 1), (4, 1), (15, 3), (16, 1)],
  term ((17341617585377006096152289814432 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1), (14, 1)],
  term ((-8670808792688503048076144907216 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1), (14, 2)],
  term ((-8670808792688503048076144907216 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1), (15, 2)],
  term ((-32657513509231996253038558383744 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 1), (14, 1)],
  term ((16328756754615998126519279191872 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 1), (14, 2)],
  term ((16328756754615998126519279191872 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((519404449493496565434514805775342234666432 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (14, 1), (15, 1)],
  term ((3011850936 : Rat) / 7401317245) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-259702224746748282717257402887671117333216 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (14, 2), (15, 1)],
  term ((-1505925468 : Rat) / 7401317245) [(3, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-259702224746748282717257402887671117333216 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (15, 3)],
  term ((-1505925468 : Rat) / 7401317245) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-58802954369895767389393482949152 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (14, 1)],
  term ((29401477184947883694696741474576 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (14, 2)],
  term ((29401477184947883694696741474576 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (15, 2)],
  term ((110736975213715344813228204537984 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 1), (14, 1)],
  term ((-55368487606857672406614102268992 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 1), (14, 2)],
  term ((-55368487606857672406614102268992 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 1), (15, 2)],
  term ((-82308039533256266957219434302075879888 : Rat) / 485689945012738018963630461433078315) [(3, 1), (14, 1), (15, 1)],
  term ((1790748 : Rat) / 381295) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((41154019766628133478609717151037939944 : Rat) / 485689945012738018963630461433078315) [(3, 1), (14, 2), (15, 1)],
  term ((-895374 : Rat) / 381295) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((41154019766628133478609717151037939944 : Rat) / 485689945012738018963630461433078315) [(3, 1), (15, 3)],
  term ((-895374 : Rat) / 381295) [(3, 1), (15, 3), (16, 1)],
  term ((139547446946385412691205792931392 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (14, 1)],
  term ((-69773723473192706345602896465696 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (14, 2)],
  term ((-69773723473192706345602896465696 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (15, 2)],
  term ((-262793975901835801412014680824064 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 1), (14, 1)],
  term ((131396987950917900706007340412032 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 1), (14, 2)],
  term ((131396987950917900706007340412032 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 1), (15, 2)],
  term ((29255753088929547696583272731332684324608 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((-1042425392 : Rat) / 211466207) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14627876544464773848291636365666342162304 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (7, 1), (14, 2), (15, 1)],
  term ((521212696 : Rat) / 211466207) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-14627876544464773848291636365666342162304 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (7, 1), (15, 3)],
  term ((521212696 : Rat) / 211466207) [(4, 1), (7, 1), (15, 3), (16, 1)],
  term ((428740190263229965133057048592 : Rat) / 115799135485108289802725034287) [(4, 1), (9, 1), (11, 1), (14, 1)],
  term ((-214370095131614982566528524296 : Rat) / 115799135485108289802725034287) [(4, 1), (9, 1), (11, 1), (14, 2)],
  term ((-214370095131614982566528524296 : Rat) / 115799135485108289802725034287) [(4, 1), (9, 1), (11, 1), (15, 2)],
  term ((-807398069213491711065167206464 : Rat) / 115799135485108289802725034287) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((403699034606745855532583603232 : Rat) / 115799135485108289802725034287) [(4, 1), (9, 1), (13, 1), (14, 2)],
  term ((403699034606745855532583603232 : Rat) / 115799135485108289802725034287) [(4, 1), (9, 1), (13, 1), (15, 2)],
  term ((8200356739168753857774872701486155698928 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-439301136 : Rat) / 7401317245) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4100178369584376928887436350743077849464 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((219650568 : Rat) / 7401317245) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4100178369584376928887436350743077849464 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (9, 1), (15, 3)],
  term ((219650568 : Rat) / 7401317245) [(4, 1), (9, 1), (15, 3), (16, 1)],
  term ((11201337269157967219422736340256 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((-5600668634578983609711368170128 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term ((-5600668634578983609711368170128 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((-18647546493108399352299967367840110689456 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-15110282248 : Rat) / 1480263449) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((9323773246554199676149983683920055344728 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((7555141124 : Rat) / 1480263449) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((9323773246554199676149983683920055344728 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (11, 1), (15, 3)],
  term ((7555141124 : Rat) / 1480263449) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2), (14, 1)],
  term ((-42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2), (14, 2)],
  term ((-42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2), (15, 2)],
  term ((582425735962187177204923868202397711540512 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-16457414592 : Rat) / 1057331035) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-291212867981093588602461934101198855770256 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((8228707296 : Rat) / 1057331035) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-291212867981093588602461934101198855770256 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 1), (15, 3)],
  term ((8228707296 : Rat) / 1057331035) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-322383707960404124157035485087872 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2), (14, 1)],
  term ((161191853980202062078517742543936 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2), (14, 2)],
  term ((161191853980202062078517742543936 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2), (15, 2)],
  term ((-1925977447872488457372937069769045437394208 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (14, 1), (15, 2)],
  term ((212436593916 : Rat) / 7401317245) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((962988723936244228686468534884522718697104 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (14, 2), (15, 2)],
  term ((-106218296958 : Rat) / 7401317245) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((962988723936244228686468534884522718697104 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (15, 4)],
  term ((-106218296958 : Rat) / 7401317245) [(4, 1), (15, 4), (16, 1)],
  term ((-52024852756131018288456869443296 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1), (14, 1)],
  term ((26012426378065509144228434721648 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1), (14, 2)],
  term ((26012426378065509144228434721648 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1), (15, 2)],
  term ((97972540527695988759115675151232 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (13, 1), (14, 2)],
  term ((-48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (13, 1), (15, 2)],
  term ((-12061944855080132171820 : Rat) / 253528477699481291099) [(14, 1)],
  term ((6030972427540066085910 : Rat) / 253528477699481291099) [(14, 2)],
  term ((6030972427540066085910 : Rat) / 253528477699481291099) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 8, terms 0 through 99. -/
theorem ep_Q2_002_block_08_0000_0099_valid :
    checkProductSumEq ep_Q2_002_partials_08_0000_0099
      ep_Q2_002_block_08_0000_0099 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
