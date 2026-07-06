/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 9:1000-1098

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_09_1000_1098 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 1000 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1000 : Poly :=
[
  term ((798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(6, 2), (15, 2)]
]

/-- Partial product 1000 for generator 9. -/
def ep_Q2_002_partial_09_1000 : Poly :=
[
  term ((1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 2), (15, 2)],
  term ((-798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(6, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1000 for generator 9. -/
theorem ep_Q2_002_partial_09_1000_valid :
    mulPoly ep_Q2_002_coefficient_09_1000
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1000 := by
  native_decide

/-- Coefficient term 1001 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1001 : Poly :=
[
  term ((-88171245013 : Rat) / 14802634490) [(6, 2), (15, 2), (16, 1)]
]

/-- Partial product 1001 for generator 9. -/
def ep_Q2_002_partial_09_1001 : Poly :=
[
  term ((-88171245013 : Rat) / 7401317245) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((88171245013 : Rat) / 14802634490) [(6, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1001 for generator 9. -/
theorem ep_Q2_002_partial_09_1001_valid :
    mulPoly ep_Q2_002_coefficient_09_1001
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1001 := by
  native_decide

/-- Coefficient term 1002 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1002 : Poly :=
[
  term ((-2360428594692159888058201923744 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (11, 1)]
]

/-- Partial product 1002 for generator 9. -/
def ep_Q2_002_partial_09_1002 : Poly :=
[
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (8, 1), (11, 1)],
  term ((2360428594692159888058201923744 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1002 for generator 9. -/
theorem ep_Q2_002_partial_09_1002_valid :
    mulPoly ep_Q2_002_coefficient_09_1002
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1002 := by
  native_decide

/-- Coefficient term 1003 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1003 : Poly :=
[
  term ((-1799554768562794406842091463120 : Rat) / 11272482215364523786105976789) [(7, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 1003 for generator 9. -/
def ep_Q2_002_partial_09_1003 : Poly :=
[
  term ((-3599109537125588813684182926240 : Rat) / 11272482215364523786105976789) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 1)],
  term ((1799554768562794406842091463120 : Rat) / 11272482215364523786105976789) [(7, 1), (8, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1003 for generator 9. -/
theorem ep_Q2_002_partial_09_1003_valid :
    mulPoly ep_Q2_002_coefficient_09_1003
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1003 := by
  native_decide

/-- Coefficient term 1004 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1004 : Poly :=
[
  term ((4445129085520707327185426936448 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 1004 for generator 9. -/
def ep_Q2_002_partial_09_1004 : Poly :=
[
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (8, 1), (13, 1)],
  term ((-4445129085520707327185426936448 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1004 for generator 9. -/
theorem ep_Q2_002_partial_09_1004_valid :
    mulPoly ep_Q2_002_coefficient_09_1004
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1004 := by
  native_decide

/-- Coefficient term 1005 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1005 : Poly :=
[
  term ((3388898635067247757846169567040 : Rat) / 11272482215364523786105976789) [(7, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 1005 for generator 9. -/
def ep_Q2_002_partial_09_1005 : Poly :=
[
  term ((6777797270134495515692339134080 : Rat) / 11272482215364523786105976789) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term ((-3388898635067247757846169567040 : Rat) / 11272482215364523786105976789) [(7, 1), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1005 for generator 9. -/
theorem ep_Q2_002_partial_09_1005_valid :
    mulPoly ep_Q2_002_coefficient_09_1005
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1005 := by
  native_decide

/-- Coefficient term 1006 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1006 : Poly :=
[
  term ((-488417286136011034646576898458287097656896 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 1006 for generator 9. -/
def ep_Q2_002_partial_09_1006 : Poly :=
[
  term ((-976834572272022069293153796916574195313792 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((488417286136011034646576898458287097656896 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1006 for generator 9. -/
theorem ep_Q2_002_partial_09_1006_valid :
    mulPoly ep_Q2_002_coefficient_09_1006
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1006 := by
  native_decide

/-- Coefficient term 1007 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1007 : Poly :=
[
  term ((116593558892 : Rat) / 7401317245) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1007 for generator 9. -/
def ep_Q2_002_partial_09_1007 : Poly :=
[
  term ((233187117784 : Rat) / 7401317245) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-116593558892 : Rat) / 7401317245) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1007 for generator 9. -/
theorem ep_Q2_002_partial_09_1007_valid :
    mulPoly ep_Q2_002_coefficient_09_1007
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1007 := by
  native_decide

/-- Coefficient term 1008 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1008 : Poly :=
[
  term ((40487635042082358186788298224576229261384 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 1008 for generator 9. -/
def ep_Q2_002_partial_09_1008 : Poly :=
[
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (8, 1), (15, 1)],
  term ((-40487635042082358186788298224576229261384 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1008 for generator 9. -/
theorem ep_Q2_002_partial_09_1008_valid :
    mulPoly ep_Q2_002_coefficient_09_1008
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1008 := by
  native_decide

/-- Coefficient term 1009 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1009 : Poly :=
[
  term ((2635507382 : Rat) / 7401317245) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 1009 for generator 9. -/
def ep_Q2_002_partial_09_1009 : Poly :=
[
  term ((5271014764 : Rat) / 7401317245) [(2, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2635507382 : Rat) / 7401317245) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1009 for generator 9. -/
theorem ep_Q2_002_partial_09_1009_valid :
    mulPoly ep_Q2_002_coefficient_09_1009
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1009 := by
  native_decide

/-- Coefficient term 1010 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1010 : Poly :=
[
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 1010 for generator 9. -/
def ep_Q2_002_partial_09_1010 : Poly :=
[
  term ((75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1010 for generator 9. -/
theorem ep_Q2_002_partial_09_1010_valid :
    mulPoly ep_Q2_002_coefficient_09_1010
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1010 := by
  native_decide

/-- Coefficient term 1011 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1011 : Poly :=
[
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 1011 for generator 9. -/
def ep_Q2_002_partial_09_1011 : Poly :=
[
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1011 for generator 9. -/
theorem ep_Q2_002_partial_09_1011_valid :
    mulPoly ep_Q2_002_coefficient_09_1011
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1011 := by
  native_decide

/-- Coefficient term 1012 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1012 : Poly :=
[
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (9, 1), (15, 2)]
]

/-- Partial product 1012 for generator 9. -/
def ep_Q2_002_partial_09_1012 : Poly :=
[
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (9, 1), (15, 2)],
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1012 for generator 9. -/
theorem ep_Q2_002_partial_09_1012_valid :
    mulPoly ep_Q2_002_coefficient_09_1012
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1012 := by
  native_decide

/-- Coefficient term 1013 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1013 : Poly :=
[
  term ((-32504690856 : Rat) / 7401317245) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 1013 for generator 9. -/
def ep_Q2_002_partial_09_1013 : Poly :=
[
  term ((-65009381712 : Rat) / 7401317245) [(2, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((32504690856 : Rat) / 7401317245) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1013 for generator 9. -/
theorem ep_Q2_002_partial_09_1013_valid :
    mulPoly ep_Q2_002_coefficient_09_1013
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1013 := by
  native_decide

/-- Coefficient term 1014 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1014 : Poly :=
[
  term ((-2557184775630644202034080783645 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1)]
]

/-- Partial product 1014 for generator 9. -/
def ep_Q2_002_partial_09_1014 : Poly :=
[
  term ((-5114369551261288404068161567290 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (11, 1)],
  term ((2557184775630644202034080783645 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1014 for generator 9. -/
theorem ep_Q2_002_partial_09_1014_valid :
    mulPoly ep_Q2_002_coefficient_09_1014
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1014 := by
  native_decide

/-- Coefficient term 1015 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1015 : Poly :=
[
  term ((-2868028696565571505793048669412 : Rat) / 97983883872014706756151952089) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 1015 for generator 9. -/
def ep_Q2_002_partial_09_1015 : Poly :=
[
  term ((-5736057393131143011586097338824 : Rat) / 97983883872014706756151952089) [(2, 1), (7, 1), (11, 1), (12, 1)],
  term ((2868028696565571505793048669412 : Rat) / 97983883872014706756151952089) [(7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1015 for generator 9. -/
theorem ep_Q2_002_partial_09_1015_valid :
    mulPoly ep_Q2_002_coefficient_09_1015
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1015 := by
  native_decide

/-- Coefficient term 1016 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1016 : Poly :=
[
  term ((-49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 1016 for generator 9. -/
def ep_Q2_002_partial_09_1016 : Poly :=
[
  term ((-99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1016 for generator 9. -/
theorem ep_Q2_002_partial_09_1016_valid :
    mulPoly ep_Q2_002_coefficient_09_1016
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1016 := by
  native_decide

/-- Coefficient term 1017 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1017 : Poly :=
[
  term ((99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1017 for generator 9. -/
def ep_Q2_002_partial_09_1017 : Poly :=
[
  term ((199850475640319463763955027265984 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1017 for generator 9. -/
theorem ep_Q2_002_partial_09_1017_valid :
    mulPoly ep_Q2_002_coefficient_09_1017
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1017 := by
  native_decide

/-- Coefficient term 1018 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1018 : Poly :=
[
  term ((96948580454412880336195925979162 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 1018 for generator 9. -/
def ep_Q2_002_partial_09_1018 : Poly :=
[
  term ((193897160908825760672391851958324 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (11, 1), (14, 1)],
  term ((-96948580454412880336195925979162 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1018 for generator 9. -/
theorem ep_Q2_002_partial_09_1018_valid :
    mulPoly ep_Q2_002_coefficient_09_1018
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1018 := by
  native_decide

/-- Coefficient term 1019 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1019 : Poly :=
[
  term ((-26410324226195064991735661042484 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (15, 2)]
]

/-- Partial product 1019 for generator 9. -/
def ep_Q2_002_partial_09_1019 : Poly :=
[
  term ((-52820648452390129983471322084968 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (11, 1), (15, 2)],
  term ((26410324226195064991735661042484 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1019 for generator 9. -/
theorem ep_Q2_002_partial_09_1019_valid :
    mulPoly ep_Q2_002_coefficient_09_1019
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1019 := by
  native_decide

/-- Coefficient term 1020 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1020 : Poly :=
[
  term ((5401035136533888807578975381904 : Rat) / 97983883872014706756151952089) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 1020 for generator 9. -/
def ep_Q2_002_partial_09_1020 : Poly :=
[
  term ((10802070273067777615157950763808 : Rat) / 97983883872014706756151952089) [(2, 1), (7, 1), (12, 1), (13, 1)],
  term ((-5401035136533888807578975381904 : Rat) / 97983883872014706756151952089) [(7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1020 for generator 9. -/
theorem ep_Q2_002_partial_09_1020_valid :
    mulPoly ep_Q2_002_coefficient_09_1020
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1020 := by
  native_decide

/-- Coefficient term 1021 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1021 : Poly :=
[
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1021 for generator 9. -/
def ep_Q2_002_partial_09_1021 : Poly :=
[
  term ((188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1021 for generator 9. -/
theorem ep_Q2_002_partial_09_1021_valid :
    mulPoly ep_Q2_002_coefficient_09_1021
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1021 := by
  native_decide

/-- Coefficient term 1022 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1022 : Poly :=
[
  term ((878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1022 for generator 9. -/
def ep_Q2_002_partial_09_1022 : Poly :=
[
  term ((1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1022 for generator 9. -/
theorem ep_Q2_002_partial_09_1022_valid :
    mulPoly ep_Q2_002_coefficient_09_1022
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1022 := by
  native_decide

/-- Coefficient term 1023 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1023 : Poly :=
[
  term ((56063165212 : Rat) / 7401317245) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1023 for generator 9. -/
def ep_Q2_002_partial_09_1023 : Poly :=
[
  term ((112126330424 : Rat) / 7401317245) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-56063165212 : Rat) / 7401317245) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1023 for generator 9. -/
theorem ep_Q2_002_partial_09_1023_valid :
    mulPoly ep_Q2_002_coefficient_09_1023
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1023 := by
  native_decide

/-- Coefficient term 1024 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1024 : Poly :=
[
  term ((-162268135487407697768116762801645907339418 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 1024 for generator 9. -/
def ep_Q2_002_partial_09_1024 : Poly :=
[
  term ((-324536270974815395536233525603291814678836 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (12, 1), (15, 1)],
  term ((162268135487407697768116762801645907339418 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1024 for generator 9. -/
theorem ep_Q2_002_partial_09_1024_valid :
    mulPoly ep_Q2_002_coefficient_09_1024
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1024 := by
  native_decide

/-- Coefficient term 1025 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1025 : Poly :=
[
  term ((39643219857 : Rat) / 14802634490) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1025 for generator 9. -/
def ep_Q2_002_partial_09_1025 : Poly :=
[
  term ((39643219857 : Rat) / 7401317245) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-39643219857 : Rat) / 14802634490) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1025 for generator 9. -/
theorem ep_Q2_002_partial_09_1025_valid :
    mulPoly ep_Q2_002_coefficient_09_1025
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1025 := by
  native_decide

/-- Coefficient term 1026 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1026 : Poly :=
[
  term ((4815657821112344748607329380340 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1)]
]

/-- Partial product 1026 for generator 9. -/
def ep_Q2_002_partial_09_1026 : Poly :=
[
  term ((9631315642224689497214658760680 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (13, 1)],
  term ((-4815657821112344748607329380340 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1026 for generator 9. -/
theorem ep_Q2_002_partial_09_1026_valid :
    mulPoly ep_Q2_002_coefficient_09_1026
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1026 := by
  native_decide

/-- Coefficient term 1027 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1027 : Poly :=
[
  term ((-9254090918712766251637197037800 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 1027 for generator 9. -/
def ep_Q2_002_partial_09_1027 : Poly :=
[
  term ((-18508181837425532503274394075600 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (13, 1), (14, 1)],
  term ((9254090918712766251637197037800 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1027 for generator 9. -/
theorem ep_Q2_002_partial_09_1027_valid :
    mulPoly ep_Q2_002_coefficient_09_1027
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1027 := by
  native_decide

/-- Coefficient term 1028 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1028 : Poly :=
[
  term ((-1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1028 for generator 9. -/
def ep_Q2_002_partial_09_1028 : Poly :=
[
  term ((-3515749384676109821755012385992629835019136 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1028 for generator 9. -/
theorem ep_Q2_002_partial_09_1028_valid :
    mulPoly ep_Q2_002_coefficient_09_1028
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1028 := by
  native_decide

/-- Coefficient term 1029 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1029 : Poly :=
[
  term ((-112126330424 : Rat) / 7401317245) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1029 for generator 9. -/
def ep_Q2_002_partial_09_1029 : Poly :=
[
  term ((-224252660848 : Rat) / 7401317245) [(2, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((112126330424 : Rat) / 7401317245) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1029 for generator 9. -/
theorem ep_Q2_002_partial_09_1029_valid :
    mulPoly ep_Q2_002_coefficient_09_1029
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1029 := by
  native_decide

/-- Coefficient term 1030 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1030 : Poly :=
[
  term ((49735586426922802174114028280528 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 1030 for generator 9. -/
def ep_Q2_002_partial_09_1030 : Poly :=
[
  term ((99471172853845604348228056561056 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((-49735586426922802174114028280528 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1030 for generator 9. -/
theorem ep_Q2_002_partial_09_1030_valid :
    mulPoly ep_Q2_002_coefficient_09_1030
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1030 := by
  native_decide

/-- Coefficient term 1031 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1031 : Poly :=
[
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 1031 for generator 9. -/
def ep_Q2_002_partial_09_1031 : Poly :=
[
  term ((-376355871989336363652770196342528 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1031 for generator 9. -/
theorem ep_Q2_002_partial_09_1031_valid :
    mulPoly ep_Q2_002_coefficient_09_1031
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1031 := by
  native_decide

/-- Coefficient term 1032 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1032 : Poly :=
[
  term ((176520678459374987885091275338076657045025 : Rat) / 269363643504064505317229453910785233499) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 1032 for generator 9. -/
def ep_Q2_002_partial_09_1032 : Poly :=
[
  term ((353041356918749975770182550676153314090050 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((-176520678459374987885091275338076657045025 : Rat) / 269363643504064505317229453910785233499) [(7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1032 for generator 9. -/
theorem ep_Q2_002_partial_09_1032_valid :
    mulPoly ep_Q2_002_coefficient_09_1032
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1032 := by
  native_decide

/-- Coefficient term 1033 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1033 : Poly :=
[
  term ((8070396223 : Rat) / 2537594484) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1033 for generator 9. -/
def ep_Q2_002_partial_09_1033 : Poly :=
[
  term ((8070396223 : Rat) / 1268797242) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8070396223 : Rat) / 2537594484) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1033 for generator 9. -/
theorem ep_Q2_002_partial_09_1033_valid :
    mulPoly ep_Q2_002_coefficient_09_1033
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1033 := by
  native_decide

/-- Coefficient term 1034 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1034 : Poly :=
[
  term ((-93206467625888256892506957698163613983699 : Rat) / 538727287008129010634458907821570466998) [(7, 1), (15, 1)]
]

/-- Partial product 1034 for generator 9. -/
def ep_Q2_002_partial_09_1034 : Poly :=
[
  term ((-93206467625888256892506957698163613983699 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (7, 1), (15, 1)],
  term ((93206467625888256892506957698163613983699 : Rat) / 538727287008129010634458907821570466998) [(7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1034 for generator 9. -/
theorem ep_Q2_002_partial_09_1034_valid :
    mulPoly ep_Q2_002_coefficient_09_1034
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1034 := by
  native_decide

/-- Coefficient term 1035 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1035 : Poly :=
[
  term ((-21311157487 : Rat) / 35526322776) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1035 for generator 9. -/
def ep_Q2_002_partial_09_1035 : Poly :=
[
  term ((-21311157487 : Rat) / 17763161388) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((21311157487 : Rat) / 35526322776) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1035 for generator 9. -/
theorem ep_Q2_002_partial_09_1035_valid :
    mulPoly ep_Q2_002_coefficient_09_1035
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1035 := by
  native_decide

/-- Coefficient term 1036 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1036 : Poly :=
[
  term ((-18167873795752132795656050533631679820578 : Rat) / 22827427415598686891290631687354680805) [(7, 1), (15, 3)]
]

/-- Partial product 1036 for generator 9. -/
def ep_Q2_002_partial_09_1036 : Poly :=
[
  term ((-36335747591504265591312101067263359641156 : Rat) / 22827427415598686891290631687354680805) [(2, 1), (7, 1), (15, 3)],
  term ((18167873795752132795656050533631679820578 : Rat) / 22827427415598686891290631687354680805) [(7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1036 for generator 9. -/
theorem ep_Q2_002_partial_09_1036_valid :
    mulPoly ep_Q2_002_coefficient_09_1036
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1036 := by
  native_decide

/-- Coefficient term 1037 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1037 : Poly :=
[
  term ((-1191600989 : Rat) / 752676330) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 1037 for generator 9. -/
def ep_Q2_002_partial_09_1037 : Poly :=
[
  term ((-1191600989 : Rat) / 376338165) [(2, 1), (7, 1), (15, 3), (16, 1)],
  term ((1191600989 : Rat) / 752676330) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1037 for generator 9. -/
theorem ep_Q2_002_partial_09_1037_valid :
    mulPoly ep_Q2_002_coefficient_09_1037
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1037 := by
  native_decide

/-- Coefficient term 1038 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1038 : Poly :=
[
  term ((56636140983145466834438517230928 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (11, 1)]
]

/-- Partial product 1038 for generator 9. -/
def ep_Q2_002_partial_09_1038 : Poly :=
[
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 2), (9, 1), (11, 1)],
  term ((-56636140983145466834438517230928 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1038 for generator 9. -/
theorem ep_Q2_002_partial_09_1038_valid :
    mulPoly ep_Q2_002_coefficient_09_1038
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1038 := by
  native_decide

/-- Coefficient term 1039 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1039 : Poly :=
[
  term ((-106656459823417958354488202669376 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (13, 1)]
]

/-- Partial product 1039 for generator 9. -/
def ep_Q2_002_partial_09_1039 : Poly :=
[
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 2), (9, 1), (13, 1)],
  term ((106656459823417958354488202669376 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1039 for generator 9. -/
theorem ep_Q2_002_partial_09_1039_valid :
    mulPoly ep_Q2_002_coefficient_09_1039
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1039 := by
  native_decide

/-- Coefficient term 1040 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1040 : Poly :=
[
  term ((-458165658364913570055618568893328988640288 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (9, 1), (15, 1)]
]

/-- Partial product 1040 for generator 9. -/
def ep_Q2_002_partial_09_1040 : Poly :=
[
  term ((-916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 2), (9, 1), (15, 1)],
  term ((458165658364913570055618568893328988640288 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1040 for generator 9. -/
theorem ep_Q2_002_partial_09_1040_valid :
    mulPoly ep_Q2_002_coefficient_09_1040
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1040 := by
  native_decide

/-- Coefficient term 1041 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1041 : Poly :=
[
  term ((-48757036284 : Rat) / 7401317245) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1041 for generator 9. -/
def ep_Q2_002_partial_09_1041 : Poly :=
[
  term ((-97514072568 : Rat) / 7401317245) [(2, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((48757036284 : Rat) / 7401317245) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1041 for generator 9. -/
theorem ep_Q2_002_partial_09_1041_valid :
    mulPoly ep_Q2_002_coefficient_09_1041
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1041 := by
  native_decide

/-- Coefficient term 1042 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1042 : Poly :=
[
  term ((67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(7, 2), (11, 1), (15, 1)]
]

/-- Partial product 1042 for generator 9. -/
def ep_Q2_002_partial_09_1042 : Poly :=
[
  term ((135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 2), (11, 1), (15, 1)],
  term ((-67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1042 for generator 9. -/
theorem ep_Q2_002_partial_09_1042_valid :
    mulPoly ep_Q2_002_coefficient_09_1042
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1042 := by
  native_decide

/-- Coefficient term 1043 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1043 : Poly :=
[
  term ((-127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(7, 2), (13, 1), (15, 1)]
]

/-- Partial product 1043 for generator 9. -/
def ep_Q2_002_partial_09_1043 : Poly :=
[
  term ((-255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 2), (13, 1), (15, 1)],
  term ((127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1043 for generator 9. -/
theorem ep_Q2_002_partial_09_1043_valid :
    mulPoly ep_Q2_002_coefficient_09_1043
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1043 := by
  native_decide

/-- Coefficient term 1044 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1044 : Poly :=
[
  term ((-1069891365385373922720 : Rat) / 253528477699481291099) [(7, 2), (14, 1)]
]

/-- Partial product 1044 for generator 9. -/
def ep_Q2_002_partial_09_1044 : Poly :=
[
  term ((-2139782730770747845440 : Rat) / 253528477699481291099) [(2, 1), (7, 2), (14, 1)],
  term ((1069891365385373922720 : Rat) / 253528477699481291099) [(7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1044 for generator 9. -/
theorem ep_Q2_002_partial_09_1044_valid :
    mulPoly ep_Q2_002_coefficient_09_1044
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1044 := by
  native_decide

/-- Coefficient term 1045 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1045 : Poly :=
[
  term ((532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (15, 2)]
]

/-- Partial product 1045 for generator 9. -/
def ep_Q2_002_partial_09_1045 : Poly :=
[
  term ((1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 2), (15, 2)],
  term ((-532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1045 for generator 9. -/
theorem ep_Q2_002_partial_09_1045_valid :
    mulPoly ep_Q2_002_coefficient_09_1045
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1045 := by
  native_decide

/-- Coefficient term 1046 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1046 : Poly :=
[
  term ((-88171245013 : Rat) / 22203951735) [(7, 2), (15, 2), (16, 1)]
]

/-- Partial product 1046 for generator 9. -/
def ep_Q2_002_partial_09_1046 : Poly :=
[
  term ((-176342490026 : Rat) / 22203951735) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((88171245013 : Rat) / 22203951735) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1046 for generator 9. -/
theorem ep_Q2_002_partial_09_1046_valid :
    mulPoly ep_Q2_002_coefficient_09_1046
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1046 := by
  native_decide

/-- Coefficient term 1047 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1047 : Poly :=
[
  term ((101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(7, 3), (11, 1)]
]

/-- Partial product 1047 for generator 9. -/
def ep_Q2_002_partial_09_1047 : Poly :=
[
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 3), (11, 1)],
  term ((-101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(7, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1047 for generator 9. -/
theorem ep_Q2_002_partial_09_1047_valid :
    mulPoly ep_Q2_002_coefficient_09_1047
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1047 := by
  native_decide

/-- Coefficient term 1048 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1048 : Poly :=
[
  term ((-191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(7, 3), (13, 1)]
]

/-- Partial product 1048 for generator 9. -/
def ep_Q2_002_partial_09_1048 : Poly :=
[
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 3), (13, 1)],
  term ((191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(7, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1048 for generator 9. -/
theorem ep_Q2_002_partial_09_1048_valid :
    mulPoly ep_Q2_002_coefficient_09_1048
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1048 := by
  native_decide

/-- Coefficient term 1049 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1049 : Poly :=
[
  term ((798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(7, 3), (15, 1)]
]

/-- Partial product 1049 for generator 9. -/
def ep_Q2_002_partial_09_1049 : Poly :=
[
  term ((1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 3), (15, 1)],
  term ((-798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1049 for generator 9. -/
theorem ep_Q2_002_partial_09_1049_valid :
    mulPoly ep_Q2_002_coefficient_09_1049
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1049 := by
  native_decide

/-- Coefficient term 1050 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1050 : Poly :=
[
  term ((-88171245013 : Rat) / 14802634490) [(7, 3), (15, 1), (16, 1)]
]

/-- Partial product 1050 for generator 9. -/
def ep_Q2_002_partial_09_1050 : Poly :=
[
  term ((-88171245013 : Rat) / 7401317245) [(2, 1), (7, 3), (15, 1), (16, 1)],
  term ((88171245013 : Rat) / 14802634490) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1050 for generator 9. -/
theorem ep_Q2_002_partial_09_1050_valid :
    mulPoly ep_Q2_002_coefficient_09_1050
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1050 := by
  native_decide

/-- Coefficient term 1051 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1051 : Poly :=
[
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1051 for generator 9. -/
def ep_Q2_002_partial_09_1051 : Poly :=
[
  term ((-9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1051 for generator 9. -/
theorem ep_Q2_002_partial_09_1051_valid :
    mulPoly ep_Q2_002_coefficient_09_1051
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1051 := by
  native_decide

/-- Coefficient term 1052 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1052 : Poly :=
[
  term ((2360428594692159888058201923744 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 1052 for generator 9. -/
def ep_Q2_002_partial_09_1052 : Poly :=
[
  term ((4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(2, 1), (8, 1), (11, 1), (15, 1)],
  term ((-2360428594692159888058201923744 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1052 for generator 9. -/
theorem ep_Q2_002_partial_09_1052_valid :
    mulPoly ep_Q2_002_coefficient_09_1052
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1052 := by
  native_decide

/-- Coefficient term 1053 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1053 : Poly :=
[
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1053 for generator 9. -/
def ep_Q2_002_partial_09_1053 : Poly :=
[
  term ((17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1053 for generator 9. -/
theorem ep_Q2_002_partial_09_1053_valid :
    mulPoly ep_Q2_002_coefficient_09_1053
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1053 := by
  native_decide

/-- Coefficient term 1054 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1054 : Poly :=
[
  term ((-4445129085520707327185426936448 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 1054 for generator 9. -/
def ep_Q2_002_partial_09_1054 : Poly :=
[
  term ((-8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(2, 1), (8, 1), (13, 1), (15, 1)],
  term ((4445129085520707327185426936448 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1054 for generator 9. -/
theorem ep_Q2_002_partial_09_1054_valid :
    mulPoly ep_Q2_002_coefficient_09_1054
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1054 := by
  native_decide

/-- Coefficient term 1055 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1055 : Poly :=
[
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (14, 1), (15, 2)]
]

/-- Partial product 1055 for generator 9. -/
def ep_Q2_002_partial_09_1055 : Poly :=
[
  term ((161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (8, 1), (14, 1), (15, 2)],
  term ((-80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1055 for generator 9. -/
theorem ep_Q2_002_partial_09_1055_valid :
    mulPoly ep_Q2_002_coefficient_09_1055
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1055 := by
  native_decide

/-- Coefficient term 1056 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1056 : Poly :=
[
  term ((5271014764 : Rat) / 7401317245) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1056 for generator 9. -/
def ep_Q2_002_partial_09_1056 : Poly :=
[
  term ((10542029528 : Rat) / 7401317245) [(2, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5271014764 : Rat) / 7401317245) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1056 for generator 9. -/
theorem ep_Q2_002_partial_09_1056_valid :
    mulPoly ep_Q2_002_coefficient_09_1056
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1056 := by
  native_decide

/-- Coefficient term 1057 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1057 : Poly :=
[
  term ((-40487635042082358186788298224576229261384 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (15, 2)]
]

/-- Partial product 1057 for generator 9. -/
def ep_Q2_002_partial_09_1057 : Poly :=
[
  term ((-80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (8, 1), (15, 2)],
  term ((40487635042082358186788298224576229261384 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1057 for generator 9. -/
theorem ep_Q2_002_partial_09_1057_valid :
    mulPoly ep_Q2_002_coefficient_09_1057
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1057 := by
  native_decide

/-- Coefficient term 1058 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1058 : Poly :=
[
  term ((-2635507382 : Rat) / 7401317245) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 1058 for generator 9. -/
def ep_Q2_002_partial_09_1058 : Poly :=
[
  term ((-5271014764 : Rat) / 7401317245) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((2635507382 : Rat) / 7401317245) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1058 for generator 9. -/
theorem ep_Q2_002_partial_09_1058_valid :
    mulPoly ep_Q2_002_coefficient_09_1058
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1058 := by
  native_decide

/-- Coefficient term 1059 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1059 : Poly :=
[
  term ((60102007785319123601720449948584 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 1059 for generator 9. -/
def ep_Q2_002_partial_09_1059 : Poly :=
[
  term ((120204015570638247203440899897168 : Rat) / 1273790490336191187829975377157) [(2, 1), (9, 1), (11, 1), (14, 1)],
  term ((-60102007785319123601720449948584 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1059 for generator 9. -/
theorem ep_Q2_002_partial_09_1059_valid :
    mulPoly ep_Q2_002_coefficient_09_1059
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1059 := by
  native_decide

/-- Coefficient term 1060 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1060 : Poly :=
[
  term ((-12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (14, 2)]
]

/-- Partial product 1060 for generator 9. -/
def ep_Q2_002_partial_09_1060 : Poly :=
[
  term ((-25287768951215770208773407086208 : Rat) / 115799135485108289802725034287) [(2, 1), (9, 1), (11, 1), (14, 2)],
  term ((12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1060 for generator 9. -/
theorem ep_Q2_002_partial_09_1060_valid :
    mulPoly ep_Q2_002_coefficient_09_1060
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1060 := by
  native_decide

/-- Coefficient term 1061 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1061 : Poly :=
[
  term ((-18878713661048488944812839076976 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 1061 for generator 9. -/
def ep_Q2_002_partial_09_1061 : Poly :=
[
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((18878713661048488944812839076976 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1061 for generator 9. -/
theorem ep_Q2_002_partial_09_1061_valid :
    mulPoly ep_Q2_002_coefficient_09_1061
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1061 := by
  native_decide

/-- Coefficient term 1062 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1062 : Poly :=
[
  term ((-113183336071030947245045168941728 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 1062 for generator 9. -/
def ep_Q2_002_partial_09_1062 : Poly :=
[
  term ((-226366672142061894490090337883456 : Rat) / 1273790490336191187829975377157) [(2, 1), (9, 1), (13, 1), (14, 1)],
  term ((113183336071030947245045168941728 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1062 for generator 9. -/
theorem ep_Q2_002_partial_09_1062_valid :
    mulPoly ep_Q2_002_coefficient_09_1062
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1062 := by
  native_decide

/-- Coefficient term 1063 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1063 : Poly :=
[
  term ((23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(9, 1), (13, 1), (14, 2)]
]

/-- Partial product 1063 for generator 9. -/
def ep_Q2_002_partial_09_1063 : Poly :=
[
  term ((47621604621188099504530861595136 : Rat) / 115799135485108289802725034287) [(2, 1), (9, 1), (13, 1), (14, 2)],
  term ((-23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1063 for generator 9. -/
theorem ep_Q2_002_partial_09_1063_valid :
    mulPoly ep_Q2_002_coefficient_09_1063
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1063 := by
  native_decide

/-- Coefficient term 1064 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1064 : Poly :=
[
  term ((35552153274472652784829400889792 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 1064 for generator 9. -/
def ep_Q2_002_partial_09_1064 : Poly :=
[
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(2, 1), (9, 1), (13, 1), (15, 2)],
  term ((-35552153274472652784829400889792 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1064 for generator 9. -/
theorem ep_Q2_002_partial_09_1064_valid :
    mulPoly ep_Q2_002_coefficient_09_1064
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1064 := by
  native_decide

/-- Coefficient term 1065 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1065 : Poly :=
[
  term ((-433781750143017511621143444025824195418176 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 1065 for generator 9. -/
def ep_Q2_002_partial_09_1065 : Poly :=
[
  term ((-867563500286035023242286888051648390836352 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((433781750143017511621143444025824195418176 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1065 for generator 9. -/
theorem ep_Q2_002_partial_09_1065_valid :
    mulPoly ep_Q2_002_coefficient_09_1065
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1065 := by
  native_decide

/-- Coefficient term 1066 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1066 : Poly :=
[
  term ((-49733921578 : Rat) / 7401317245) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1066 for generator 9. -/
def ep_Q2_002_partial_09_1066 : Poly :=
[
  term ((-99467843156 : Rat) / 7401317245) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((49733921578 : Rat) / 7401317245) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1066 for generator 9. -/
theorem ep_Q2_002_partial_09_1066_valid :
    mulPoly ep_Q2_002_coefficient_09_1066
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1066 := by
  native_decide

/-- Coefficient term 1067 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1067 : Poly :=
[
  term ((1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(9, 1), (14, 2), (15, 1)]
]

/-- Partial product 1067 for generator 9. -/
def ep_Q2_002_partial_09_1067 : Poly :=
[
  term ((3946945401963918297591849430107381252288 : Rat) / 2605064250522867556259472474959238235) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((-1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1067 for generator 9. -/
theorem ep_Q2_002_partial_09_1067_valid :
    mulPoly ep_Q2_002_coefficient_09_1067
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1067 := by
  native_decide

/-- Coefficient term 1068 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1068 : Poly :=
[
  term ((351733096 : Rat) / 22496405) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1068 for generator 9. -/
def ep_Q2_002_partial_09_1068 : Poly :=
[
  term ((703466192 : Rat) / 22496405) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-351733096 : Rat) / 22496405) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1068 for generator 9. -/
theorem ep_Q2_002_partial_09_1068_valid :
    mulPoly ep_Q2_002_coefficient_09_1068
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1068 := by
  native_decide

/-- Coefficient term 1069 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1069 : Poly :=
[
  term ((152721886121637856685206189631109662880096 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (15, 3)]
]

/-- Partial product 1069 for generator 9. -/
def ep_Q2_002_partial_09_1069 : Poly :=
[
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (9, 1), (15, 3)],
  term ((-152721886121637856685206189631109662880096 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1069 for generator 9. -/
theorem ep_Q2_002_partial_09_1069_valid :
    mulPoly ep_Q2_002_coefficient_09_1069
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1069 := by
  native_decide

/-- Coefficient term 1070 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1070 : Poly :=
[
  term ((16252345428 : Rat) / 7401317245) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 1070 for generator 9. -/
def ep_Q2_002_partial_09_1070 : Poly :=
[
  term ((32504690856 : Rat) / 7401317245) [(2, 1), (9, 1), (15, 3), (16, 1)],
  term ((-16252345428 : Rat) / 7401317245) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1070 for generator 9. -/
theorem ep_Q2_002_partial_09_1070_valid :
    mulPoly ep_Q2_002_coefficient_09_1070
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1070 := by
  native_decide

/-- Coefficient term 1071 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1071 : Poly :=
[
  term ((1560587743825367507544935066832 : Rat) / 97983883872014706756151952089) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1071 for generator 9. -/
def ep_Q2_002_partial_09_1071 : Poly :=
[
  term ((3121175487650735015089870133664 : Rat) / 97983883872014706756151952089) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1560587743825367507544935066832 : Rat) / 97983883872014706756151952089) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1071 for generator 9. -/
theorem ep_Q2_002_partial_09_1071_valid :
    mulPoly ep_Q2_002_coefficient_09_1071
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1071 := by
  native_decide

/-- Coefficient term 1072 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1072 : Poly :=
[
  term ((-4428616440390939013337983736244 : Rat) / 97983883872014706756151952089) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1072 for generator 9. -/
def ep_Q2_002_partial_09_1072 : Poly :=
[
  term ((-8857232880781878026675967472488 : Rat) / 97983883872014706756151952089) [(2, 1), (11, 1), (12, 1), (15, 1)],
  term ((4428616440390939013337983736244 : Rat) / 97983883872014706756151952089) [(11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1072 for generator 9. -/
theorem ep_Q2_002_partial_09_1072_valid :
    mulPoly ep_Q2_002_coefficient_09_1072
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1072 := by
  native_decide

/-- Coefficient term 1073 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1073 : Poly :=
[
  term ((-9463462091912526835583822976180 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1073 for generator 9. -/
def ep_Q2_002_partial_09_1073 : Poly :=
[
  term ((-18926924183825053671167645952360 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 1), (13, 1), (14, 1)],
  term ((9463462091912526835583822976180 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1073 for generator 9. -/
theorem ep_Q2_002_partial_09_1073_valid :
    mulPoly ep_Q2_002_coefficient_09_1073
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1073 := by
  native_decide

/-- Coefficient term 1074 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1074 : Poly :=
[
  term ((73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1), (14, 2)]
]

/-- Partial product 1074 for generator 9. -/
def ep_Q2_002_partial_09_1074 : Poly :=
[
  term ((146416059249600270447405510976512 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 1), (13, 1), (14, 2)],
  term ((-73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1074 for generator 9. -/
theorem ep_Q2_002_partial_09_1074_valid :
    mulPoly ep_Q2_002_coefficient_09_1074
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1074 := by
  native_decide

/-- Coefficient term 1075 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1075 : Poly :=
[
  term ((-13905625631353716040679493297486 : Rat) / 1273790490336191187829975377157) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1075 for generator 9. -/
def ep_Q2_002_partial_09_1075 : Poly :=
[
  term ((-27811251262707432081358986594972 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((13905625631353716040679493297486 : Rat) / 1273790490336191187829975377157) [(11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1075 for generator 9. -/
theorem ep_Q2_002_partial_09_1075_valid :
    mulPoly ep_Q2_002_coefficient_09_1075
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1075 := by
  native_decide

/-- Coefficient term 1076 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1076 : Poly :=
[
  term ((38239573890101819638510016839629 : Rat) / 1273790490336191187829975377157) [(11, 1), (15, 1)]
]

/-- Partial product 1076 for generator 9. -/
def ep_Q2_002_partial_09_1076 : Poly :=
[
  term ((76479147780203639277020033679258 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 1), (15, 1)],
  term ((-38239573890101819638510016839629 : Rat) / 1273790490336191187829975377157) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1076 for generator 9. -/
theorem ep_Q2_002_partial_09_1076_valid :
    mulPoly ep_Q2_002_coefficient_09_1076
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1076 := by
  native_decide

/-- Coefficient term 1077 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1077 : Poly :=
[
  term ((7541135557908311693894114865240 : Rat) / 1273790490336191187829975377157) [(11, 1), (15, 3)]
]

/-- Partial product 1077 for generator 9. -/
def ep_Q2_002_partial_09_1077 : Poly :=
[
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 1), (15, 3)],
  term ((-7541135557908311693894114865240 : Rat) / 1273790490336191187829975377157) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1077 for generator 9. -/
theorem ep_Q2_002_partial_09_1077_valid :
    mulPoly ep_Q2_002_coefficient_09_1077
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1077 := by
  native_decide

/-- Coefficient term 1078 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1078 : Poly :=
[
  term ((-2938878975701438057858690804544 : Rat) / 97983883872014706756151952089) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1078 for generator 9. -/
def ep_Q2_002_partial_09_1078 : Poly :=
[
  term ((-5877757951402876115717381609088 : Rat) / 97983883872014706756151952089) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2938878975701438057858690804544 : Rat) / 97983883872014706756151952089) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1078 for generator 9. -/
theorem ep_Q2_002_partial_09_1078_valid :
    mulPoly ep_Q2_002_coefficient_09_1078
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1078 := by
  native_decide

/-- Coefficient term 1079 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1079 : Poly :=
[
  term ((8339914112235326865437666186448 : Rat) / 97983883872014706756151952089) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1079 for generator 9. -/
def ep_Q2_002_partial_09_1079 : Poly :=
[
  term ((16679828224470653730875332372896 : Rat) / 97983883872014706756151952089) [(2, 1), (12, 1), (13, 1), (15, 1)],
  term ((-8339914112235326865437666186448 : Rat) / 97983883872014706756151952089) [(12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1079 for generator 9. -/
theorem ep_Q2_002_partial_09_1079_valid :
    mulPoly ep_Q2_002_coefficient_09_1079
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1079 := by
  native_decide

/-- Coefficient term 1080 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1080 : Poly :=
[
  term ((-214939533084328049877536652781642391606064 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 1080 for generator 9. -/
def ep_Q2_002_partial_09_1080 : Poly :=
[
  term ((-429879066168656099755073305563284783212128 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (12, 1), (14, 1), (15, 2)],
  term ((214939533084328049877536652781642391606064 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1080 for generator 9. -/
theorem ep_Q2_002_partial_09_1080_valid :
    mulPoly ep_Q2_002_coefficient_09_1080
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1080 := by
  native_decide

/-- Coefficient term 1081 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1081 : Poly :=
[
  term ((-18930737152 : Rat) / 7401317245) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1081 for generator 9. -/
def ep_Q2_002_partial_09_1081 : Poly :=
[
  term ((-37861474304 : Rat) / 7401317245) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((18930737152 : Rat) / 7401317245) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1081 for generator 9. -/
theorem ep_Q2_002_partial_09_1081_valid :
    mulPoly ep_Q2_002_coefficient_09_1081
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1081 := by
  native_decide

/-- Coefficient term 1082 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1082 : Poly :=
[
  term ((52671397596920352109419889979996484266646 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (15, 2)]
]

/-- Partial product 1082 for generator 9. -/
def ep_Q2_002_partial_09_1082 : Poly :=
[
  term ((105342795193840704218839779959992968533292 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (12, 1), (15, 2)],
  term ((-52671397596920352109419889979996484266646 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1082 for generator 9. -/
theorem ep_Q2_002_partial_09_1082_valid :
    mulPoly ep_Q2_002_coefficient_09_1082
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1082 := by
  native_decide

/-- Coefficient term 1083 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1083 : Poly :=
[
  term ((77504694161 : Rat) / 14802634490) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1083 for generator 9. -/
def ep_Q2_002_partial_09_1083 : Poly :=
[
  term ((77504694161 : Rat) / 7401317245) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-77504694161 : Rat) / 14802634490) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1083 for generator 9. -/
theorem ep_Q2_002_partial_09_1083_valid :
    mulPoly ep_Q2_002_coefficient_09_1083
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1083 := by
  native_decide

/-- Coefficient term 1084 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1084 : Poly :=
[
  term ((-412756057422625581334186008366582003689946 : Rat) / 1346818217520322526586147269553926167495) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1084 for generator 9. -/
def ep_Q2_002_partial_09_1084 : Poly :=
[
  term ((-825512114845251162668372016733164007379892 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((412756057422625581334186008366582003689946 : Rat) / 1346818217520322526586147269553926167495) [(13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1084 for generator 9. -/
theorem ep_Q2_002_partial_09_1084_valid :
    mulPoly ep_Q2_002_coefficient_09_1084
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1084 := by
  native_decide

/-- Coefficient term 1085 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1085 : Poly :=
[
  term ((-9807653291 : Rat) / 14802634490) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1085 for generator 9. -/
def ep_Q2_002_partial_09_1085 : Poly :=
[
  term ((-9807653291 : Rat) / 7401317245) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9807653291 : Rat) / 14802634490) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1085 for generator 9. -/
theorem ep_Q2_002_partial_09_1085_valid :
    mulPoly ep_Q2_002_coefficient_09_1085
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1085 := by
  native_decide

/-- Coefficient term 1086 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1086 : Poly :=
[
  term ((1420364357134502249943571117790138865478632 : Rat) / 1346818217520322526586147269553926167495) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 1086 for generator 9. -/
def ep_Q2_002_partial_09_1086 : Poly :=
[
  term ((2840728714269004499887142235580277730957264 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1420364357134502249943571117790138865478632 : Rat) / 1346818217520322526586147269553926167495) [(13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1086 for generator 9. -/
theorem ep_Q2_002_partial_09_1086_valid :
    mulPoly ep_Q2_002_coefficient_09_1086
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1086 := by
  native_decide

/-- Coefficient term 1087 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1087 : Poly :=
[
  term ((-10904829414 : Rat) / 7401317245) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1087 for generator 9. -/
def ep_Q2_002_partial_09_1087 : Poly :=
[
  term ((-21809658828 : Rat) / 7401317245) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((10904829414 : Rat) / 7401317245) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1087 for generator 9. -/
theorem ep_Q2_002_partial_09_1087_valid :
    mulPoly ep_Q2_002_coefficient_09_1087
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1087 := by
  native_decide

/-- Coefficient term 1088 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1088 : Poly :=
[
  term ((-72012278828954826475265204402868 : Rat) / 1273790490336191187829975377157) [(13, 1), (15, 1)]
]

/-- Partial product 1088 for generator 9. -/
def ep_Q2_002_partial_09_1088 : Poly :=
[
  term ((-144024557657909652950530408805736 : Rat) / 1273790490336191187829975377157) [(2, 1), (13, 1), (15, 1)],
  term ((72012278828954826475265204402868 : Rat) / 1273790490336191187829975377157) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1088 for generator 9. -/
theorem ep_Q2_002_partial_09_1088_valid :
    mulPoly ep_Q2_002_coefficient_09_1088
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1088 := by
  native_decide

/-- Coefficient term 1089 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1089 : Poly :=
[
  term ((-14201370497583051902393464522080 : Rat) / 1273790490336191187829975377157) [(13, 1), (15, 3)]
]

/-- Partial product 1089 for generator 9. -/
def ep_Q2_002_partial_09_1089 : Poly :=
[
  term ((-28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(2, 1), (13, 1), (15, 3)],
  term ((14201370497583051902393464522080 : Rat) / 1273790490336191187829975377157) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1089 for generator 9. -/
theorem ep_Q2_002_partial_09_1089_valid :
    mulPoly ep_Q2_002_coefficient_09_1089
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1089 := by
  native_decide

/-- Coefficient term 1090 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1090 : Poly :=
[
  term ((17821471358666189223367035748560 : Rat) / 1273790490336191187829975377157) [(13, 2), (14, 1)]
]

/-- Partial product 1090 for generator 9. -/
def ep_Q2_002_partial_09_1090 : Poly :=
[
  term ((35642942717332378446734071497120 : Rat) / 1273790490336191187829975377157) [(2, 1), (13, 2), (14, 1)],
  term ((-17821471358666189223367035748560 : Rat) / 1273790490336191187829975377157) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1090 for generator 9. -/
theorem ep_Q2_002_partial_09_1090_valid :
    mulPoly ep_Q2_002_coefficient_09_1090
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1090 := by
  native_decide

/-- Coefficient term 1091 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1091 : Poly :=
[
  term ((-137864429583094792691624450967552 : Rat) / 1273790490336191187829975377157) [(13, 2), (14, 2)]
]

/-- Partial product 1091 for generator 9. -/
def ep_Q2_002_partial_09_1091 : Poly :=
[
  term ((-275728859166189585383248901935104 : Rat) / 1273790490336191187829975377157) [(2, 1), (13, 2), (14, 2)],
  term ((137864429583094792691624450967552 : Rat) / 1273790490336191187829975377157) [(13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1091 for generator 9. -/
theorem ep_Q2_002_partial_09_1091_valid :
    mulPoly ep_Q2_002_coefficient_09_1091
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1091 := by
  native_decide

/-- Coefficient term 1092 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1092 : Poly :=
[
  term ((-5044574020079521697990 : Rat) / 253528477699481291099) [(14, 1)]
]

/-- Partial product 1092 for generator 9. -/
def ep_Q2_002_partial_09_1092 : Poly :=
[
  term ((-10089148040159043395980 : Rat) / 253528477699481291099) [(2, 1), (14, 1)],
  term ((5044574020079521697990 : Rat) / 253528477699481291099) [(14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1092 for generator 9. -/
theorem ep_Q2_002_partial_09_1092_valid :
    mulPoly ep_Q2_002_coefficient_09_1092
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1092 := by
  native_decide

/-- Coefficient term 1093 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1093 : Poly :=
[
  term ((-891976025632465881012149369272410689697959 : Rat) / 1346818217520322526586147269553926167495) [(14, 1), (15, 2)]
]

/-- Partial product 1093 for generator 9. -/
def ep_Q2_002_partial_09_1093 : Poly :=
[
  term ((-1783952051264931762024298738544821379395918 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (14, 1), (15, 2)],
  term ((891976025632465881012149369272410689697959 : Rat) / 1346818217520322526586147269553926167495) [(14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1093 for generator 9. -/
theorem ep_Q2_002_partial_09_1093_valid :
    mulPoly ep_Q2_002_coefficient_09_1093
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1093 := by
  native_decide

/-- Coefficient term 1094 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1094 : Poly :=
[
  term ((-192645192919 : Rat) / 88815806940) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1094 for generator 9. -/
def ep_Q2_002_partial_09_1094 : Poly :=
[
  term ((-192645192919 : Rat) / 44407903470) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((192645192919 : Rat) / 88815806940) [(14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1094 for generator 9. -/
theorem ep_Q2_002_partial_09_1094_valid :
    mulPoly ep_Q2_002_coefficient_09_1094
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1094 := by
  native_decide

/-- Coefficient term 1095 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1095 : Poly :=
[
  term ((610218244260754336536767830153130762839639 : Rat) / 2693636435040645053172294539107852334990) [(15, 2)]
]

/-- Partial product 1095 for generator 9. -/
def ep_Q2_002_partial_09_1095 : Poly :=
[
  term ((610218244260754336536767830153130762839639 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (15, 2)],
  term ((-610218244260754336536767830153130762839639 : Rat) / 2693636435040645053172294539107852334990) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1095 for generator 9. -/
theorem ep_Q2_002_partial_09_1095_valid :
    mulPoly ep_Q2_002_coefficient_09_1095
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1095 := by
  native_decide

/-- Coefficient term 1096 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1096 : Poly :=
[
  term ((-382953023581 : Rat) / 177631613880) [(15, 2), (16, 1)]
]

/-- Partial product 1096 for generator 9. -/
def ep_Q2_002_partial_09_1096 : Poly :=
[
  term ((-382953023581 : Rat) / 88815806940) [(2, 1), (15, 2), (16, 1)],
  term ((382953023581 : Rat) / 177631613880) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1096 for generator 9. -/
theorem ep_Q2_002_partial_09_1096_valid :
    mulPoly ep_Q2_002_coefficient_09_1096
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1096 := by
  native_decide

/-- Coefficient term 1097 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1097 : Poly :=
[
  term ((-805609802875682775348978966241272190695888 : Rat) / 1346818217520322526586147269553926167495) [(15, 4)]
]

/-- Partial product 1097 for generator 9. -/
def ep_Q2_002_partial_09_1097 : Poly :=
[
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (15, 4)],
  term ((805609802875682775348978966241272190695888 : Rat) / 1346818217520322526586147269553926167495) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1097 for generator 9. -/
theorem ep_Q2_002_partial_09_1097_valid :
    mulPoly ep_Q2_002_coefficient_09_1097
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1097 := by
  native_decide

/-- Coefficient term 1098 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_1098 : Poly :=
[
  term ((-79237851682 : Rat) / 22203951735) [(15, 4), (16, 1)]
]

/-- Partial product 1098 for generator 9. -/
def ep_Q2_002_partial_09_1098 : Poly :=
[
  term ((-158475703364 : Rat) / 22203951735) [(2, 1), (15, 4), (16, 1)],
  term ((79237851682 : Rat) / 22203951735) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1098 for generator 9. -/
theorem ep_Q2_002_partial_09_1098_valid :
    mulPoly ep_Q2_002_coefficient_09_1098
        ep_Q2_002_generator_09_1000_1098 =
      ep_Q2_002_partial_09_1098 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_09_1000_1098 : List Poly :=
[
  ep_Q2_002_partial_09_1000,
  ep_Q2_002_partial_09_1001,
  ep_Q2_002_partial_09_1002,
  ep_Q2_002_partial_09_1003,
  ep_Q2_002_partial_09_1004,
  ep_Q2_002_partial_09_1005,
  ep_Q2_002_partial_09_1006,
  ep_Q2_002_partial_09_1007,
  ep_Q2_002_partial_09_1008,
  ep_Q2_002_partial_09_1009,
  ep_Q2_002_partial_09_1010,
  ep_Q2_002_partial_09_1011,
  ep_Q2_002_partial_09_1012,
  ep_Q2_002_partial_09_1013,
  ep_Q2_002_partial_09_1014,
  ep_Q2_002_partial_09_1015,
  ep_Q2_002_partial_09_1016,
  ep_Q2_002_partial_09_1017,
  ep_Q2_002_partial_09_1018,
  ep_Q2_002_partial_09_1019,
  ep_Q2_002_partial_09_1020,
  ep_Q2_002_partial_09_1021,
  ep_Q2_002_partial_09_1022,
  ep_Q2_002_partial_09_1023,
  ep_Q2_002_partial_09_1024,
  ep_Q2_002_partial_09_1025,
  ep_Q2_002_partial_09_1026,
  ep_Q2_002_partial_09_1027,
  ep_Q2_002_partial_09_1028,
  ep_Q2_002_partial_09_1029,
  ep_Q2_002_partial_09_1030,
  ep_Q2_002_partial_09_1031,
  ep_Q2_002_partial_09_1032,
  ep_Q2_002_partial_09_1033,
  ep_Q2_002_partial_09_1034,
  ep_Q2_002_partial_09_1035,
  ep_Q2_002_partial_09_1036,
  ep_Q2_002_partial_09_1037,
  ep_Q2_002_partial_09_1038,
  ep_Q2_002_partial_09_1039,
  ep_Q2_002_partial_09_1040,
  ep_Q2_002_partial_09_1041,
  ep_Q2_002_partial_09_1042,
  ep_Q2_002_partial_09_1043,
  ep_Q2_002_partial_09_1044,
  ep_Q2_002_partial_09_1045,
  ep_Q2_002_partial_09_1046,
  ep_Q2_002_partial_09_1047,
  ep_Q2_002_partial_09_1048,
  ep_Q2_002_partial_09_1049,
  ep_Q2_002_partial_09_1050,
  ep_Q2_002_partial_09_1051,
  ep_Q2_002_partial_09_1052,
  ep_Q2_002_partial_09_1053,
  ep_Q2_002_partial_09_1054,
  ep_Q2_002_partial_09_1055,
  ep_Q2_002_partial_09_1056,
  ep_Q2_002_partial_09_1057,
  ep_Q2_002_partial_09_1058,
  ep_Q2_002_partial_09_1059,
  ep_Q2_002_partial_09_1060,
  ep_Q2_002_partial_09_1061,
  ep_Q2_002_partial_09_1062,
  ep_Q2_002_partial_09_1063,
  ep_Q2_002_partial_09_1064,
  ep_Q2_002_partial_09_1065,
  ep_Q2_002_partial_09_1066,
  ep_Q2_002_partial_09_1067,
  ep_Q2_002_partial_09_1068,
  ep_Q2_002_partial_09_1069,
  ep_Q2_002_partial_09_1070,
  ep_Q2_002_partial_09_1071,
  ep_Q2_002_partial_09_1072,
  ep_Q2_002_partial_09_1073,
  ep_Q2_002_partial_09_1074,
  ep_Q2_002_partial_09_1075,
  ep_Q2_002_partial_09_1076,
  ep_Q2_002_partial_09_1077,
  ep_Q2_002_partial_09_1078,
  ep_Q2_002_partial_09_1079,
  ep_Q2_002_partial_09_1080,
  ep_Q2_002_partial_09_1081,
  ep_Q2_002_partial_09_1082,
  ep_Q2_002_partial_09_1083,
  ep_Q2_002_partial_09_1084,
  ep_Q2_002_partial_09_1085,
  ep_Q2_002_partial_09_1086,
  ep_Q2_002_partial_09_1087,
  ep_Q2_002_partial_09_1088,
  ep_Q2_002_partial_09_1089,
  ep_Q2_002_partial_09_1090,
  ep_Q2_002_partial_09_1091,
  ep_Q2_002_partial_09_1092,
  ep_Q2_002_partial_09_1093,
  ep_Q2_002_partial_09_1094,
  ep_Q2_002_partial_09_1095,
  ep_Q2_002_partial_09_1096,
  ep_Q2_002_partial_09_1097,
  ep_Q2_002_partial_09_1098
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_09_1000_1098 : Poly :=
[
  term ((1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 2), (15, 2)],
  term ((-88171245013 : Rat) / 7401317245) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (8, 1), (11, 1)],
  term ((-3599109537125588813684182926240 : Rat) / 11272482215364523786105976789) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 1)],
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (8, 1), (13, 1)],
  term ((6777797270134495515692339134080 : Rat) / 11272482215364523786105976789) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term ((-976834572272022069293153796916574195313792 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((233187117784 : Rat) / 7401317245) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (8, 1), (15, 1)],
  term ((5271014764 : Rat) / 7401317245) [(2, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (9, 1), (15, 2)],
  term ((-65009381712 : Rat) / 7401317245) [(2, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-5114369551261288404068161567290 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (11, 1)],
  term ((-5736057393131143011586097338824 : Rat) / 97983883872014706756151952089) [(2, 1), (7, 1), (11, 1), (12, 1)],
  term ((-99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((199850475640319463763955027265984 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((193897160908825760672391851958324 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (11, 1), (14, 1)],
  term ((-52820648452390129983471322084968 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (11, 1), (15, 2)],
  term ((10802070273067777615157950763808 : Rat) / 97983883872014706756151952089) [(2, 1), (7, 1), (12, 1), (13, 1)],
  term ((188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((112126330424 : Rat) / 7401317245) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-324536270974815395536233525603291814678836 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (12, 1), (15, 1)],
  term ((39643219857 : Rat) / 7401317245) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((9631315642224689497214658760680 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (13, 1)],
  term ((-18508181837425532503274394075600 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (13, 1), (14, 1)],
  term ((-3515749384676109821755012385992629835019136 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-224252660848 : Rat) / 7401317245) [(2, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((99471172853845604348228056561056 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((-376355871989336363652770196342528 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((353041356918749975770182550676153314090050 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((8070396223 : Rat) / 1268797242) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-93206467625888256892506957698163613983699 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (7, 1), (15, 1)],
  term ((-21311157487 : Rat) / 17763161388) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-36335747591504265591312101067263359641156 : Rat) / 22827427415598686891290631687354680805) [(2, 1), (7, 1), (15, 3)],
  term ((-1191600989 : Rat) / 376338165) [(2, 1), (7, 1), (15, 3), (16, 1)],
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 2), (9, 1), (11, 1)],
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 2), (9, 1), (13, 1)],
  term ((-916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 2), (9, 1), (15, 1)],
  term ((-97514072568 : Rat) / 7401317245) [(2, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 2), (11, 1), (15, 1)],
  term ((-255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 2), (13, 1), (15, 1)],
  term ((-2139782730770747845440 : Rat) / 253528477699481291099) [(2, 1), (7, 2), (14, 1)],
  term ((1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 2), (15, 2)],
  term ((-176342490026 : Rat) / 22203951735) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 3), (11, 1)],
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 3), (13, 1)],
  term ((1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 3), (15, 1)],
  term ((-88171245013 : Rat) / 7401317245) [(2, 1), (7, 3), (15, 1), (16, 1)],
  term ((-9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(2, 1), (8, 1), (11, 1), (15, 1)],
  term ((17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(2, 1), (8, 1), (13, 1), (15, 1)],
  term ((161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (8, 1), (14, 1), (15, 2)],
  term ((10542029528 : Rat) / 7401317245) [(2, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (8, 1), (15, 2)],
  term ((-5271014764 : Rat) / 7401317245) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((120204015570638247203440899897168 : Rat) / 1273790490336191187829975377157) [(2, 1), (9, 1), (11, 1), (14, 1)],
  term ((-25287768951215770208773407086208 : Rat) / 115799135485108289802725034287) [(2, 1), (9, 1), (11, 1), (14, 2)],
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((-226366672142061894490090337883456 : Rat) / 1273790490336191187829975377157) [(2, 1), (9, 1), (13, 1), (14, 1)],
  term ((47621604621188099504530861595136 : Rat) / 115799135485108289802725034287) [(2, 1), (9, 1), (13, 1), (14, 2)],
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(2, 1), (9, 1), (13, 1), (15, 2)],
  term ((-867563500286035023242286888051648390836352 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-99467843156 : Rat) / 7401317245) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((3946945401963918297591849430107381252288 : Rat) / 2605064250522867556259472474959238235) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((703466192 : Rat) / 22496405) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (9, 1), (15, 3)],
  term ((32504690856 : Rat) / 7401317245) [(2, 1), (9, 1), (15, 3), (16, 1)],
  term ((3121175487650735015089870133664 : Rat) / 97983883872014706756151952089) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8857232880781878026675967472488 : Rat) / 97983883872014706756151952089) [(2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-18926924183825053671167645952360 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 1), (13, 1), (14, 1)],
  term ((146416059249600270447405510976512 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 1), (13, 1), (14, 2)],
  term ((-27811251262707432081358986594972 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((76479147780203639277020033679258 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 1), (15, 1)],
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 1), (15, 3)],
  term ((-5877757951402876115717381609088 : Rat) / 97983883872014706756151952089) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((16679828224470653730875332372896 : Rat) / 97983883872014706756151952089) [(2, 1), (12, 1), (13, 1), (15, 1)],
  term ((-429879066168656099755073305563284783212128 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (12, 1), (14, 1), (15, 2)],
  term ((-37861474304 : Rat) / 7401317245) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((105342795193840704218839779959992968533292 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (12, 1), (15, 2)],
  term ((77504694161 : Rat) / 7401317245) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-825512114845251162668372016733164007379892 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-9807653291 : Rat) / 7401317245) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2840728714269004499887142235580277730957264 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((-21809658828 : Rat) / 7401317245) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-144024557657909652950530408805736 : Rat) / 1273790490336191187829975377157) [(2, 1), (13, 1), (15, 1)],
  term ((-28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(2, 1), (13, 1), (15, 3)],
  term ((35642942717332378446734071497120 : Rat) / 1273790490336191187829975377157) [(2, 1), (13, 2), (14, 1)],
  term ((-275728859166189585383248901935104 : Rat) / 1273790490336191187829975377157) [(2, 1), (13, 2), (14, 2)],
  term ((-10089148040159043395980 : Rat) / 253528477699481291099) [(2, 1), (14, 1)],
  term ((-1783952051264931762024298738544821379395918 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (14, 1), (15, 2)],
  term ((-192645192919 : Rat) / 44407903470) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((610218244260754336536767830153130762839639 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (15, 2)],
  term ((-382953023581 : Rat) / 88815806940) [(2, 1), (15, 2), (16, 1)],
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (15, 4)],
  term ((-158475703364 : Rat) / 22203951735) [(2, 1), (15, 4), (16, 1)],
  term ((-798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(6, 2), (15, 2)],
  term ((88171245013 : Rat) / 14802634490) [(6, 2), (15, 2), (16, 1)],
  term ((2360428594692159888058201923744 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (11, 1)],
  term ((1799554768562794406842091463120 : Rat) / 11272482215364523786105976789) [(7, 1), (8, 1), (11, 1), (14, 1)],
  term ((-4445129085520707327185426936448 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (13, 1)],
  term ((-3388898635067247757846169567040 : Rat) / 11272482215364523786105976789) [(7, 1), (8, 1), (13, 1), (14, 1)],
  term ((488417286136011034646576898458287097656896 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-116593558892 : Rat) / 7401317245) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-40487635042082358186788298224576229261384 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (15, 1)],
  term ((-2635507382 : Rat) / 7401317245) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (9, 1), (15, 2)],
  term ((32504690856 : Rat) / 7401317245) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((2557184775630644202034080783645 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1)],
  term ((2868028696565571505793048669412 : Rat) / 97983883872014706756151952089) [(7, 1), (11, 1), (12, 1)],
  term ((49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-96948580454412880336195925979162 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (14, 1)],
  term ((26410324226195064991735661042484 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (15, 2)],
  term ((-5401035136533888807578975381904 : Rat) / 97983883872014706756151952089) [(7, 1), (12, 1), (13, 1)],
  term ((-94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-56063165212 : Rat) / 7401317245) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((162268135487407697768116762801645907339418 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (15, 1)],
  term ((-39643219857 : Rat) / 14802634490) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4815657821112344748607329380340 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1)],
  term ((9254090918712766251637197037800 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (14, 1)],
  term ((1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((112126330424 : Rat) / 7401317245) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-49735586426922802174114028280528 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (15, 2)],
  term ((188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-176520678459374987885091275338076657045025 : Rat) / 269363643504064505317229453910785233499) [(7, 1), (14, 1), (15, 1)],
  term ((-8070396223 : Rat) / 2537594484) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((93206467625888256892506957698163613983699 : Rat) / 538727287008129010634458907821570466998) [(7, 1), (15, 1)],
  term ((21311157487 : Rat) / 35526322776) [(7, 1), (15, 1), (16, 1)],
  term ((18167873795752132795656050533631679820578 : Rat) / 22827427415598686891290631687354680805) [(7, 1), (15, 3)],
  term ((1191600989 : Rat) / 752676330) [(7, 1), (15, 3), (16, 1)],
  term ((-56636140983145466834438517230928 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (11, 1)],
  term ((106656459823417958354488202669376 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (13, 1)],
  term ((458165658364913570055618568893328988640288 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (9, 1), (15, 1)],
  term ((48757036284 : Rat) / 7401317245) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(7, 2), (11, 1), (15, 1)],
  term ((127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(7, 2), (13, 1), (15, 1)],
  term ((1069891365385373922720 : Rat) / 253528477699481291099) [(7, 2), (14, 1)],
  term ((-532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (15, 2)],
  term ((88171245013 : Rat) / 22203951735) [(7, 2), (15, 2), (16, 1)],
  term ((-101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(7, 3), (11, 1)],
  term ((191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(7, 3), (13, 1)],
  term ((-798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(7, 3), (15, 1)],
  term ((88171245013 : Rat) / 14802634490) [(7, 3), (15, 1), (16, 1)],
  term ((4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-2360428594692159888058201923744 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (15, 1)],
  term ((-8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((4445129085520707327185426936448 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 1), (15, 1)],
  term ((-80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (14, 1), (15, 2)],
  term ((-5271014764 : Rat) / 7401317245) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((40487635042082358186788298224576229261384 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (15, 2)],
  term ((2635507382 : Rat) / 7401317245) [(8, 1), (15, 2), (16, 1)],
  term ((-60102007785319123601720449948584 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (14, 1)],
  term ((12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (14, 2)],
  term ((18878713661048488944812839076976 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (15, 2)],
  term ((113183336071030947245045168941728 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1), (14, 1)],
  term ((-23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(9, 1), (13, 1), (14, 2)],
  term ((-35552153274472652784829400889792 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1), (15, 2)],
  term ((433781750143017511621143444025824195418176 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (14, 1), (15, 1)],
  term ((49733921578 : Rat) / 7401317245) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(9, 1), (14, 2), (15, 1)],
  term ((-351733096 : Rat) / 22496405) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-152721886121637856685206189631109662880096 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (15, 3)],
  term ((-16252345428 : Rat) / 7401317245) [(9, 1), (15, 3), (16, 1)],
  term ((-1560587743825367507544935066832 : Rat) / 97983883872014706756151952089) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((4428616440390939013337983736244 : Rat) / 97983883872014706756151952089) [(11, 1), (12, 1), (15, 1)],
  term ((9463462091912526835583822976180 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1), (14, 1)],
  term ((-73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1), (14, 2)],
  term ((13905625631353716040679493297486 : Rat) / 1273790490336191187829975377157) [(11, 1), (14, 1), (15, 1)],
  term ((-38239573890101819638510016839629 : Rat) / 1273790490336191187829975377157) [(11, 1), (15, 1)],
  term ((-7541135557908311693894114865240 : Rat) / 1273790490336191187829975377157) [(11, 1), (15, 3)],
  term ((2938878975701438057858690804544 : Rat) / 97983883872014706756151952089) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-8339914112235326865437666186448 : Rat) / 97983883872014706756151952089) [(12, 1), (13, 1), (15, 1)],
  term ((214939533084328049877536652781642391606064 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (14, 1), (15, 2)],
  term ((18930737152 : Rat) / 7401317245) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-52671397596920352109419889979996484266646 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (15, 2)],
  term ((-77504694161 : Rat) / 14802634490) [(12, 1), (15, 2), (16, 1)],
  term ((412756057422625581334186008366582003689946 : Rat) / 1346818217520322526586147269553926167495) [(13, 1), (14, 1), (15, 1)],
  term ((9807653291 : Rat) / 14802634490) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1420364357134502249943571117790138865478632 : Rat) / 1346818217520322526586147269553926167495) [(13, 1), (14, 2), (15, 1)],
  term ((10904829414 : Rat) / 7401317245) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((72012278828954826475265204402868 : Rat) / 1273790490336191187829975377157) [(13, 1), (15, 1)],
  term ((14201370497583051902393464522080 : Rat) / 1273790490336191187829975377157) [(13, 1), (15, 3)],
  term ((-17821471358666189223367035748560 : Rat) / 1273790490336191187829975377157) [(13, 2), (14, 1)],
  term ((137864429583094792691624450967552 : Rat) / 1273790490336191187829975377157) [(13, 2), (14, 2)],
  term ((5044574020079521697990 : Rat) / 253528477699481291099) [(14, 1)],
  term ((891976025632465881012149369272410689697959 : Rat) / 1346818217520322526586147269553926167495) [(14, 1), (15, 2)],
  term ((192645192919 : Rat) / 88815806940) [(14, 1), (15, 2), (16, 1)],
  term ((-610218244260754336536767830153130762839639 : Rat) / 2693636435040645053172294539107852334990) [(15, 2)],
  term ((382953023581 : Rat) / 177631613880) [(15, 2), (16, 1)],
  term ((805609802875682775348978966241272190695888 : Rat) / 1346818217520322526586147269553926167495) [(15, 4)],
  term ((79237851682 : Rat) / 22203951735) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 1000 through 1098. -/
theorem ep_Q2_002_block_09_1000_1098_valid :
    checkProductSumEq ep_Q2_002_partials_09_1000_1098
      ep_Q2_002_block_09_1000_1098 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
