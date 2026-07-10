/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_041, term block 18:900-999

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_041`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2041TermShards

/-- Generator polynomial 18 for endpoint certificate `ep_Q2_041`. -/
def ep_Q2_041_generator_18_0900_0999 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 900 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0900 : Poly :=
[
  term ((-6479026554445420286591971977710880509556762940458573027320 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (7, 1), (13, 1), (14, 3), (15, 1)]
]

/-- Partial product 900 for generator 18. -/
def ep_Q2_041_partial_18_0900 : Poly :=
[
  term ((-12958053108890840573183943955421761019113525880917146054640 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (7, 1), (8, 1), (13, 1), (14, 3), (15, 1)],
  term ((6479026554445420286591971977710880509556762940458573027320 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (7, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 900 for generator 18. -/
theorem ep_Q2_041_partial_18_0900_valid :
    mulPoly ep_Q2_041_coefficient_18_0900
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0900 := by
  native_decide

/-- Coefficient term 901 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0901 : Poly :=
[
  term ((-95485795659772921587391787878264447135780238359606187937050 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 901 for generator 18. -/
def ep_Q2_041_partial_18_0901 : Poly :=
[
  term ((-190971591319545843174783575756528894271560476719212375874100 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((95485795659772921587391787878264447135780238359606187937050 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 901 for generator 18. -/
theorem ep_Q2_041_partial_18_0901_valid :
    mulPoly ep_Q2_041_coefficient_18_0901
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0901 := by
  native_decide

/-- Coefficient term 902 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0902 : Poly :=
[
  term ((3811549227095986982834772424775074677652924297949273510963400 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (7, 1), (13, 1), (15, 3)]
]

/-- Partial product 902 for generator 18. -/
def ep_Q2_041_partial_18_0902 : Poly :=
[
  term ((7623098454191973965669544849550149355305848595898547021926800 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 3)],
  term ((-3811549227095986982834772424775074677652924297949273510963400 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (7, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 902 for generator 18. -/
theorem ep_Q2_041_partial_18_0902_valid :
    mulPoly ep_Q2_041_coefficient_18_0902
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0902 := by
  native_decide

/-- Coefficient term 903 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0903 : Poly :=
[
  term ((129929504224917189952 : Rat) / 777005835365402853) [(1, 1), (7, 1), (14, 1)]
]

/-- Partial product 903 for generator 18. -/
def ep_Q2_041_partial_18_0903 : Poly :=
[
  term ((259859008449834379904 : Rat) / 777005835365402853) [(1, 1), (7, 1), (8, 1), (14, 1)],
  term ((-129929504224917189952 : Rat) / 777005835365402853) [(1, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 903 for generator 18. -/
theorem ep_Q2_041_partial_18_0903_valid :
    mulPoly ep_Q2_041_coefficient_18_0903
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0903 := by
  native_decide

/-- Coefficient term 904 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0904 : Poly :=
[
  term ((-54859488212652701712573700898700442879129897435450880173609288228859280 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (14, 1), (15, 2)]
]

/-- Partial product 904 for generator 18. -/
def ep_Q2_041_partial_18_0904 : Poly :=
[
  term ((-109718976425305403425147401797400885758259794870901760347218576457718560 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (8, 1), (14, 1), (15, 2)],
  term ((54859488212652701712573700898700442879129897435450880173609288228859280 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 904 for generator 18. -/
theorem ep_Q2_041_partial_18_0904_valid :
    mulPoly ep_Q2_041_coefficient_18_0904
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0904 := by
  native_decide

/-- Coefficient term 905 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0905 : Poly :=
[
  term ((10771342364160 : Rat) / 275754830051) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 905 for generator 18. -/
def ep_Q2_041_partial_18_0905 : Poly :=
[
  term ((21542684728320 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10771342364160 : Rat) / 275754830051) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 905 for generator 18. -/
theorem ep_Q2_041_partial_18_0905_valid :
    mulPoly ep_Q2_041_coefficient_18_0905
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0905 := by
  native_decide

/-- Coefficient term 906 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0906 : Poly :=
[
  term ((2990534780 : Rat) / 151763803) [(1, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 906 for generator 18. -/
def ep_Q2_041_partial_18_0906 : Poly :=
[
  term ((5981069560 : Rat) / 151763803) [(1, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((-2990534780 : Rat) / 151763803) [(1, 1), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 906 for generator 18. -/
theorem ep_Q2_041_partial_18_0906_valid :
    mulPoly ep_Q2_041_coefficient_18_0906
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0906 := by
  native_decide

/-- Coefficient term 907 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0907 : Poly :=
[
  term ((-7704000469600148341 : Rat) / 37000277874542993) [(1, 1), (7, 1), (14, 2)]
]

/-- Partial product 907 for generator 18. -/
def ep_Q2_041_partial_18_0907 : Poly :=
[
  term ((-15408000939200296682 : Rat) / 37000277874542993) [(1, 1), (7, 1), (8, 1), (14, 2)],
  term ((7704000469600148341 : Rat) / 37000277874542993) [(1, 1), (7, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 907 for generator 18. -/
theorem ep_Q2_041_partial_18_0907_valid :
    mulPoly ep_Q2_041_coefficient_18_0907
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0907 := by
  native_decide

/-- Coefficient term 908 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0908 : Poly :=
[
  term ((19207222930351417060560341308777701258249249064450817185506342324313155 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (14, 2), (15, 2)]
]

/-- Partial product 908 for generator 18. -/
def ep_Q2_041_partial_18_0908 : Poly :=
[
  term ((38414445860702834121120682617555402516498498128901634371012684648626310 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (8, 1), (14, 2), (15, 2)],
  term ((-19207222930351417060560341308777701258249249064450817185506342324313155 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 908 for generator 18. -/
theorem ep_Q2_041_partial_18_0908_valid :
    mulPoly ep_Q2_041_coefficient_18_0908
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0908 := by
  native_decide

/-- Coefficient term 909 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0909 : Poly :=
[
  term ((-1346417795520 : Rat) / 275754830051) [(1, 1), (7, 1), (14, 2), (15, 2), (16, 1)]
]

/-- Partial product 909 for generator 18. -/
def ep_Q2_041_partial_18_0909 : Poly :=
[
  term ((-2692835591040 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((1346417795520 : Rat) / 275754830051) [(1, 1), (7, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 909 for generator 18. -/
theorem ep_Q2_041_partial_18_0909_valid :
    mulPoly ep_Q2_041_coefficient_18_0909
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0909 := by
  native_decide

/-- Coefficient term 910 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0910 : Poly :=
[
  term ((-4513221930 : Rat) / 151763803) [(1, 1), (7, 1), (14, 2), (16, 1)]
]

/-- Partial product 910 for generator 18. -/
def ep_Q2_041_partial_18_0910 : Poly :=
[
  term ((-9026443860 : Rat) / 151763803) [(1, 1), (7, 1), (8, 1), (14, 2), (16, 1)],
  term ((4513221930 : Rat) / 151763803) [(1, 1), (7, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 910 for generator 18. -/
theorem ep_Q2_041_partial_18_0910_valid :
    mulPoly ep_Q2_041_coefficient_18_0910
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0910 := by
  native_decide

/-- Coefficient term 911 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0911 : Poly :=
[
  term ((24999850265064131710 : Rat) / 777005835365402853) [(1, 1), (7, 1), (14, 3)]
]

/-- Partial product 911 for generator 18. -/
def ep_Q2_041_partial_18_0911 : Poly :=
[
  term ((49999700530128263420 : Rat) / 777005835365402853) [(1, 1), (7, 1), (8, 1), (14, 3)],
  term ((-24999850265064131710 : Rat) / 777005835365402853) [(1, 1), (7, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 911 for generator 18. -/
theorem ep_Q2_041_partial_18_0911_valid :
    mulPoly ep_Q2_041_coefficient_18_0911
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0911 := by
  native_decide

/-- Coefficient term 912 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0912 : Poly :=
[
  term ((636121756 : Rat) / 151763803) [(1, 1), (7, 1), (14, 3), (16, 1)]
]

/-- Partial product 912 for generator 18. -/
def ep_Q2_041_partial_18_0912 : Poly :=
[
  term ((1272243512 : Rat) / 151763803) [(1, 1), (7, 1), (8, 1), (14, 3), (16, 1)],
  term ((-636121756 : Rat) / 151763803) [(1, 1), (7, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 912 for generator 18. -/
theorem ep_Q2_041_partial_18_0912_valid :
    mulPoly ep_Q2_041_coefficient_18_0912
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0912 := by
  native_decide

/-- Coefficient term 913 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0913 : Poly :=
[
  term ((-16252243794807783781470894235171777965279876604942415666981374919572175 : Rat) / 7072084985476130797419550380337666792653424749481795423376657213092216) [(1, 1), (7, 1), (15, 2)]
]

/-- Partial product 913 for generator 18. -/
def ep_Q2_041_partial_18_0913 : Poly :=
[
  term ((-16252243794807783781470894235171777965279876604942415666981374919572175 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 1), (7, 1), (8, 1), (15, 2)],
  term ((16252243794807783781470894235171777965279876604942415666981374919572175 : Rat) / 7072084985476130797419550380337666792653424749481795423376657213092216) [(1, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 913 for generator 18. -/
theorem ep_Q2_041_partial_18_0913_valid :
    mulPoly ep_Q2_041_coefficient_18_0913
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0913 := by
  native_decide

/-- Coefficient term 914 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0914 : Poly :=
[
  term ((-4712462284320 : Rat) / 275754830051) [(1, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 914 for generator 18. -/
def ep_Q2_041_partial_18_0914 : Poly :=
[
  term ((-9424924568640 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((4712462284320 : Rat) / 275754830051) [(1, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 914 for generator 18. -/
theorem ep_Q2_041_partial_18_0914_valid :
    mulPoly ep_Q2_041_coefficient_18_0914
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0914 := by
  native_decide

/-- Coefficient term 915 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0915 : Poly :=
[
  term ((761343575 : Rat) / 151763803) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 915 for generator 18. -/
def ep_Q2_041_partial_18_0915 : Poly :=
[
  term ((1522687150 : Rat) / 151763803) [(1, 1), (7, 1), (8, 1), (16, 1)],
  term ((-761343575 : Rat) / 151763803) [(1, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 915 for generator 18. -/
theorem ep_Q2_041_partial_18_0915_valid :
    mulPoly ep_Q2_041_coefficient_18_0915
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0915 := by
  native_decide

/-- Coefficient term 916 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0916 : Poly :=
[
  term ((144984245648089289672629988540526790880971935746311375275924000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 2), (8, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 916 for generator 18. -/
def ep_Q2_041_partial_18_0916 : Poly :=
[
  term ((-144984245648089289672629988540526790880971935746311375275924000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 2), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((289968491296178579345259977081053581761943871492622750551848000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 2), (8, 2), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 916 for generator 18. -/
theorem ep_Q2_041_partial_18_0916_valid :
    mulPoly ep_Q2_041_coefficient_18_0916
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0916 := by
  native_decide

/-- Coefficient term 917 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0917 : Poly :=
[
  term ((-26277225226938278443880935570445926517118588244726991469128760 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 2), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 917 for generator 18. -/
def ep_Q2_041_partial_18_0917 : Poly :=
[
  term ((26277225226938278443880935570445926517118588244726991469128760 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 2), (8, 1), (11, 1), (15, 2)],
  term ((-52554450453876556887761871140891853034237176489453982938257520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 2), (8, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 917 for generator 18. -/
theorem ep_Q2_041_partial_18_0917_valid :
    mulPoly ep_Q2_041_coefficient_18_0917
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0917 := by
  native_decide

/-- Coefficient term 918 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0918 : Poly :=
[
  term ((45738590725151843794017269097300896131835091575391282131560800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 2), (8, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 918 for generator 18. -/
def ep_Q2_041_partial_18_0918 : Poly :=
[
  term ((-45738590725151843794017269097300896131835091575391282131560800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 2), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((91477181450303687588034538194601792263670183150782564263121600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 2), (8, 2), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 918 for generator 18. -/
theorem ep_Q2_041_partial_18_0918_valid :
    mulPoly ep_Q2_041_coefficient_18_0918
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0918 := by
  native_decide

/-- Coefficient term 919 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0919 : Poly :=
[
  term ((-394999741182975349658642848355236395908478806899968875393415480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 2), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 919 for generator 18. -/
def ep_Q2_041_partial_18_0919 : Poly :=
[
  term ((394999741182975349658642848355236395908478806899968875393415480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 2), (8, 1), (13, 1), (15, 2)],
  term ((-789999482365950699317285696710472791816957613799937750786830960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 2), (8, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 919 for generator 18. -/
theorem ep_Q2_041_partial_18_0919_valid :
    mulPoly ep_Q2_041_coefficient_18_0919
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0919 := by
  native_decide

/-- Coefficient term 920 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0920 : Poly :=
[
  term ((-21487662129244123658222708484217016626743842486471289067699486214935350 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 2), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 920 for generator 18. -/
def ep_Q2_041_partial_18_0920 : Poly :=
[
  term ((21487662129244123658222708484217016626743842486471289067699486214935350 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 2), (8, 1), (14, 1), (15, 1)],
  term ((-42975324258488247316445416968434033253487684972942578135398972429870700 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 2), (8, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 920 for generator 18. -/
theorem ep_Q2_041_partial_18_0920_valid :
    mulPoly ep_Q2_041_coefficient_18_0920
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0920 := by
  native_decide

/-- Coefficient term 921 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0921 : Poly :=
[
  term ((-8078506773120 : Rat) / 275754830051) [(1, 1), (7, 2), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 921 for generator 18. -/
def ep_Q2_041_partial_18_0921 : Poly :=
[
  term ((8078506773120 : Rat) / 275754830051) [(1, 1), (7, 2), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16157013546240 : Rat) / 275754830051) [(1, 1), (7, 2), (8, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 921 for generator 18. -/
theorem ep_Q2_041_partial_18_0921_valid :
    mulPoly ep_Q2_041_coefficient_18_0921
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0921 := by
  native_decide

/-- Coefficient term 922 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0922 : Poly :=
[
  term ((1046921715110601286624658383719844882063034602142090914021005944809370229 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 2), (8, 1), (15, 1)]
]

/-- Partial product 922 for generator 18. -/
def ep_Q2_041_partial_18_0922 : Poly :=
[
  term ((-1046921715110601286624658383719844882063034602142090914021005944809370229 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 2), (8, 1), (15, 1)],
  term ((2093843430221202573249316767439689764126069204284181828042011889618740458 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 2), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 922 for generator 18. -/
theorem ep_Q2_041_partial_18_0922_valid :
    mulPoly ep_Q2_041_coefficient_18_0922
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0922 := by
  native_decide

/-- Coefficient term 923 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0923 : Poly :=
[
  term ((12414691965060 : Rat) / 275754830051) [(1, 1), (7, 2), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 923 for generator 18. -/
def ep_Q2_041_partial_18_0923 : Poly :=
[
  term ((-12414691965060 : Rat) / 275754830051) [(1, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((24829383930120 : Rat) / 275754830051) [(1, 1), (7, 2), (8, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 923 for generator 18. -/
theorem ep_Q2_041_partial_18_0923_valid :
    mulPoly ep_Q2_041_coefficient_18_0923
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0923 := by
  native_decide

/-- Coefficient term 924 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0924 : Poly :=
[
  term ((-237414040842302022457498105940161728727706695003168767613590480 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 2), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 924 for generator 18. -/
def ep_Q2_041_partial_18_0924 : Poly :=
[
  term ((-474828081684604044914996211880323457455413390006337535227180960 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 2), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((237414040842302022457498105940161728727706695003168767613590480 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 2), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 924 for generator 18. -/
theorem ep_Q2_041_partial_18_0924_valid :
    mulPoly ep_Q2_041_coefficient_18_0924
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0924 := by
  native_decide

/-- Coefficient term 925 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0925 : Poly :=
[
  term ((698522300915647011729251158515870999553287430649155186523709360 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 2), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 925 for generator 18. -/
def ep_Q2_041_partial_18_0925 : Poly :=
[
  term ((1397044601831294023458502317031741999106574861298310373047418720 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 2), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-698522300915647011729251158515870999553287430649155186523709360 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 2), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 925 for generator 18. -/
theorem ep_Q2_041_partial_18_0925_valid :
    mulPoly ep_Q2_041_coefficient_18_0925
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0925 := by
  native_decide

/-- Coefficient term 926 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0926 : Poly :=
[
  term ((-2050868105962714325932871350471255730872581519311239249906612917188869758 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 2), (10, 1), (15, 1)]
]

/-- Partial product 926 for generator 18. -/
def ep_Q2_041_partial_18_0926 : Poly :=
[
  term ((-4101736211925428651865742700942511461745163038622478499813225834377739516 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 2), (8, 1), (10, 1), (15, 1)],
  term ((2050868105962714325932871350471255730872581519311239249906612917188869758 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 2), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 926 for generator 18. -/
theorem ep_Q2_041_partial_18_0926_valid :
    mulPoly ep_Q2_041_coefficient_18_0926
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0926 := by
  native_decide

/-- Coefficient term 927 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0927 : Poly :=
[
  term ((-8672370383880 : Rat) / 275754830051) [(1, 1), (7, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 927 for generator 18. -/
def ep_Q2_041_partial_18_0927 : Poly :=
[
  term ((-17344740767760 : Rat) / 275754830051) [(1, 1), (7, 2), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((8672370383880 : Rat) / 275754830051) [(1, 1), (7, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 927 for generator 18. -/
theorem ep_Q2_041_partial_18_0927_valid :
    mulPoly ep_Q2_041_coefficient_18_0927
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0927 := by
  native_decide

/-- Coefficient term 928 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0928 : Poly :=
[
  term ((289968491296178579345259977081053581761943871492622750551848000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 2), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 928 for generator 18. -/
def ep_Q2_041_partial_18_0928 : Poly :=
[
  term ((579936982592357158690519954162107163523887742985245501103696000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 2), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-289968491296178579345259977081053581761943871492622750551848000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 2), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 928 for generator 18. -/
theorem ep_Q2_041_partial_18_0928_valid :
    mulPoly ep_Q2_041_coefficient_18_0928
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0928 := by
  native_decide

/-- Coefficient term 929 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0929 : Poly :=
[
  term ((-289968491296178579345259977081053581761943871492622750551848000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 2), (11, 1), (14, 2), (15, 2)]
]

/-- Partial product 929 for generator 18. -/
def ep_Q2_041_partial_18_0929 : Poly :=
[
  term ((-579936982592357158690519954162107163523887742985245501103696000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 2), (8, 1), (11, 1), (14, 2), (15, 2)],
  term ((289968491296178579345259977081053581761943871492622750551848000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 2), (11, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 929 for generator 18. -/
theorem ep_Q2_041_partial_18_0929_valid :
    mulPoly ep_Q2_041_coefficient_18_0929
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0929 := by
  native_decide

/-- Coefficient term 930 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0930 : Poly :=
[
  term ((-13138612613469139221940467785222963258559294122363495734564380 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 2), (11, 1), (15, 2)]
]

/-- Partial product 930 for generator 18. -/
def ep_Q2_041_partial_18_0930 : Poly :=
[
  term ((-26277225226938278443880935570445926517118588244726991469128760 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 2), (8, 1), (11, 1), (15, 2)],
  term ((13138612613469139221940467785222963258559294122363495734564380 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 930 for generator 18. -/
theorem ep_Q2_041_partial_18_0930_valid :
    mulPoly ep_Q2_041_coefficient_18_0930
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0930 := by
  native_decide

/-- Coefficient term 931 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0931 : Poly :=
[
  term ((91477181450303687588034538194601792263670183150782564263121600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 2), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 931 for generator 18. -/
def ep_Q2_041_partial_18_0931 : Poly :=
[
  term ((182954362900607375176069076389203584527340366301565128526243200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 2), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-91477181450303687588034538194601792263670183150782564263121600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 2), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 931 for generator 18. -/
theorem ep_Q2_041_partial_18_0931_valid :
    mulPoly ep_Q2_041_coefficient_18_0931
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0931 := by
  native_decide

/-- Coefficient term 932 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0932 : Poly :=
[
  term ((-91477181450303687588034538194601792263670183150782564263121600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 2), (13, 1), (14, 2), (15, 2)]
]

/-- Partial product 932 for generator 18. -/
def ep_Q2_041_partial_18_0932 : Poly :=
[
  term ((-182954362900607375176069076389203584527340366301565128526243200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 2), (8, 1), (13, 1), (14, 2), (15, 2)],
  term ((91477181450303687588034538194601792263670183150782564263121600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 2), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 932 for generator 18. -/
theorem ep_Q2_041_partial_18_0932_valid :
    mulPoly ep_Q2_041_coefficient_18_0932
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0932 := by
  native_decide

/-- Coefficient term 933 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0933 : Poly :=
[
  term ((-197499870591487674829321424177618197954239403449984437696707740 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 2), (13, 1), (15, 2)]
]

/-- Partial product 933 for generator 18. -/
def ep_Q2_041_partial_18_0933 : Poly :=
[
  term ((-394999741182975349658642848355236395908478806899968875393415480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 2), (8, 1), (13, 1), (15, 2)],
  term ((197499870591487674829321424177618197954239403449984437696707740 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 933 for generator 18. -/
theorem ep_Q2_041_partial_18_0933_valid :
    mulPoly ep_Q2_041_coefficient_18_0933
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0933 := by
  native_decide

/-- Coefficient term 934 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0934 : Poly :=
[
  term ((-42975324258488247316445416968434033253487684972942578135398972429870700 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 2), (14, 1), (15, 1)]
]

/-- Partial product 934 for generator 18. -/
def ep_Q2_041_partial_18_0934 : Poly :=
[
  term ((-85950648516976494632890833936868066506975369945885156270797944859741400 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 2), (8, 1), (14, 1), (15, 1)],
  term ((42975324258488247316445416968434033253487684972942578135398972429870700 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 934 for generator 18. -/
theorem ep_Q2_041_partial_18_0934_valid :
    mulPoly ep_Q2_041_coefficient_18_0934
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0934 := by
  native_decide

/-- Coefficient term 935 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0935 : Poly :=
[
  term ((-16157013546240 : Rat) / 275754830051) [(1, 1), (7, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 935 for generator 18. -/
def ep_Q2_041_partial_18_0935 : Poly :=
[
  term ((-32314027092480 : Rat) / 275754830051) [(1, 1), (7, 2), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((16157013546240 : Rat) / 275754830051) [(1, 1), (7, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 935 for generator 18. -/
theorem ep_Q2_041_partial_18_0935_valid :
    mulPoly ep_Q2_041_coefficient_18_0935
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0935 := by
  native_decide

/-- Coefficient term 936 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0936 : Poly :=
[
  term ((42975324258488247316445416968434033253487684972942578135398972429870700 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 2), (14, 2), (15, 1)]
]

/-- Partial product 936 for generator 18. -/
def ep_Q2_041_partial_18_0936 : Poly :=
[
  term ((85950648516976494632890833936868066506975369945885156270797944859741400 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 2), (8, 1), (14, 2), (15, 1)],
  term ((-42975324258488247316445416968434033253487684972942578135398972429870700 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 936 for generator 18. -/
theorem ep_Q2_041_partial_18_0936_valid :
    mulPoly ep_Q2_041_coefficient_18_0936
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0936 := by
  native_decide

/-- Coefficient term 937 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0937 : Poly :=
[
  term ((16157013546240 : Rat) / 275754830051) [(1, 1), (7, 2), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 937 for generator 18. -/
def ep_Q2_041_partial_18_0937 : Poly :=
[
  term ((32314027092480 : Rat) / 275754830051) [(1, 1), (7, 2), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16157013546240 : Rat) / 275754830051) [(1, 1), (7, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 937 for generator 18. -/
theorem ep_Q2_041_partial_18_0937_valid :
    mulPoly ep_Q2_041_coefficient_18_0937
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0937 := by
  native_decide

/-- Coefficient term 938 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0938 : Poly :=
[
  term ((1046921715110601286624658383719844882063034602142090914021005944809370229 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (7, 2), (15, 1)]
]

/-- Partial product 938 for generator 18. -/
def ep_Q2_041_partial_18_0938 : Poly :=
[
  term ((1046921715110601286624658383719844882063034602142090914021005944809370229 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 2), (8, 1), (15, 1)],
  term ((-1046921715110601286624658383719844882063034602142090914021005944809370229 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 938 for generator 18. -/
theorem ep_Q2_041_partial_18_0938_valid :
    mulPoly ep_Q2_041_coefficient_18_0938
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0938 := by
  native_decide

/-- Coefficient term 939 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0939 : Poly :=
[
  term ((6207345982530 : Rat) / 275754830051) [(1, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 939 for generator 18. -/
def ep_Q2_041_partial_18_0939 : Poly :=
[
  term ((12414691965060 : Rat) / 275754830051) [(1, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((-6207345982530 : Rat) / 275754830051) [(1, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 939 for generator 18. -/
theorem ep_Q2_041_partial_18_0939_valid :
    mulPoly ep_Q2_041_coefficient_18_0939
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0939 := by
  native_decide

/-- Coefficient term 940 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0940 : Poly :=
[
  term ((6985696753566031486 : Rat) / 37000277874542993) [(1, 1), (8, 1), (10, 1), (11, 1)]
]

/-- Partial product 940 for generator 18. -/
def ep_Q2_041_partial_18_0940 : Poly :=
[
  term ((-6985696753566031486 : Rat) / 37000277874542993) [(1, 1), (8, 1), (10, 1), (11, 1)],
  term ((13971393507132062972 : Rat) / 37000277874542993) [(1, 1), (8, 2), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 940 for generator 18. -/
theorem ep_Q2_041_partial_18_0940_valid :
    mulPoly ep_Q2_041_coefficient_18_0940
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0940 := by
  native_decide

/-- Coefficient term 941 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0941 : Poly :=
[
  term ((20836401579622699433 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 941 for generator 18. -/
def ep_Q2_041_partial_18_0941 : Poly :=
[
  term ((-20836401579622699433 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((41672803159245398866 : Rat) / 259001945121800951) [(1, 1), (8, 2), (10, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 941 for generator 18. -/
theorem ep_Q2_041_partial_18_0941_valid :
    mulPoly ep_Q2_041_coefficient_18_0941
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0941 := by
  native_decide

/-- Coefficient term 942 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0942 : Poly :=
[
  term ((-45599887597959813589266870936863464887364592830676130011280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 942 for generator 18. -/
def ep_Q2_041_partial_18_0942 : Poly :=
[
  term ((45599887597959813589266870936863464887364592830676130011280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-91199775195919627178533741873726929774729185661352260022560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 942 for generator 18. -/
theorem ep_Q2_041_partial_18_0942_valid :
    mulPoly ep_Q2_041_coefficient_18_0942
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0942 := by
  native_decide

/-- Coefficient term 943 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0943 : Poly :=
[
  term ((-28141485490105910864488796107832096938629520911132357368840 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 943 for generator 18. -/
def ep_Q2_041_partial_18_0943 : Poly :=
[
  term ((28141485490105910864488796107832096938629520911132357368840 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-56282970980211821728977592215664193877259041822264714737680 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 2), (10, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 943 for generator 18. -/
theorem ep_Q2_041_partial_18_0943_valid :
    mulPoly ep_Q2_041_coefficient_18_0943
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0943 := by
  native_decide

/-- Coefficient term 944 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0944 : Poly :=
[
  term ((1305153278 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 944 for generator 18. -/
def ep_Q2_041_partial_18_0944 : Poly :=
[
  term ((-1305153278 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((2610306556 : Rat) / 151763803) [(1, 1), (8, 2), (10, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 944 for generator 18. -/
theorem ep_Q2_041_partial_18_0944_valid :
    mulPoly ep_Q2_041_coefficient_18_0944
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0944 := by
  native_decide

/-- Coefficient term 945 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0945 : Poly :=
[
  term ((-316607767978434134466652045309040698932695847279890170408600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 945 for generator 18. -/
def ep_Q2_041_partial_18_0945 : Poly :=
[
  term ((316607767978434134466652045309040698932695847279890170408600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-633215535956868268933304090618081397865391694559780340817200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 945 for generator 18. -/
theorem ep_Q2_041_partial_18_0945_valid :
    mulPoly ep_Q2_041_coefficient_18_0945
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0945 := by
  native_decide

/-- Coefficient term 946 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0946 : Poly :=
[
  term ((-212104952274147156199754915973233120016235714498508767159114241630802 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 946 for generator 18. -/
def ep_Q2_041_partial_18_0946 : Poly :=
[
  term ((212104952274147156199754915973233120016235714498508767159114241630802 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-424209904548294312399509831946466240032471428997017534318228483261604 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (8, 2), (10, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 946 for generator 18. -/
theorem ep_Q2_041_partial_18_0946_valid :
    mulPoly ep_Q2_041_coefficient_18_0946
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0946 := by
  native_decide

/-- Coefficient term 947 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0947 : Poly :=
[
  term ((-1445074560 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 947 for generator 18. -/
def ep_Q2_041_partial_18_0947 : Poly :=
[
  term ((1445074560 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2890149120 : Rat) / 151763803) [(1, 1), (8, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 947 for generator 18. -/
theorem ep_Q2_041_partial_18_0947_valid :
    mulPoly ep_Q2_041_coefficient_18_0947
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0947 := by
  native_decide

/-- Coefficient term 948 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0948 : Poly :=
[
  term ((1274425241192731137893378820301769365314591228246790196571851820 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 3)]
]

/-- Partial product 948 for generator 18. -/
def ep_Q2_041_partial_18_0948 : Poly :=
[
  term ((-1274425241192731137893378820301769365314591228246790196571851820 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 3)],
  term ((2548850482385462275786757640603538730629182456493580393143703640 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 2), (10, 1), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 948 for generator 18. -/
theorem ep_Q2_041_partial_18_0948_valid :
    mulPoly ep_Q2_041_coefficient_18_0948
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0948 := by
  native_decide

/-- Coefficient term 949 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0949 : Poly :=
[
  term ((66357816800524245524285883507035829667185542710602004537440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 2), (15, 2)]
]

/-- Partial product 949 for generator 18. -/
def ep_Q2_041_partial_18_0949 : Poly :=
[
  term ((-66357816800524245524285883507035829667185542710602004537440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 2), (15, 2)],
  term ((132715633601048491048571767014071659334371085421204009074880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (10, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 949 for generator 18. -/
theorem ep_Q2_041_partial_18_0949_valid :
    mulPoly ep_Q2_041_coefficient_18_0949
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0949 := by
  native_decide

/-- Coefficient term 950 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0950 : Poly :=
[
  term ((-43263706185058267732 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 950 for generator 18. -/
def ep_Q2_041_partial_18_0950 : Poly :=
[
  term ((43263706185058267732 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((-86527412370116535464 : Rat) / 259001945121800951) [(1, 1), (8, 2), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 950 for generator 18. -/
theorem ep_Q2_041_partial_18_0950_valid :
    mulPoly ep_Q2_041_coefficient_18_0950
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0950 := by
  native_decide

/-- Coefficient term 951 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0951 : Poly :=
[
  term ((28141485490105910864488796107832096938629520911132357368840 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 951 for generator 18. -/
def ep_Q2_041_partial_18_0951 : Poly :=
[
  term ((-28141485490105910864488796107832096938629520911132357368840 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((56282970980211821728977592215664193877259041822264714737680 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 2), (10, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 951 for generator 18. -/
theorem ep_Q2_041_partial_18_0951_valid :
    mulPoly ep_Q2_041_coefficient_18_0951
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0951 := by
  native_decide

/-- Coefficient term 952 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0952 : Poly :=
[
  term ((-3755642168 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 952 for generator 18. -/
def ep_Q2_041_partial_18_0952 : Poly :=
[
  term ((3755642168 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-7511284336 : Rat) / 151763803) [(1, 1), (8, 2), (10, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 952 for generator 18. -/
theorem ep_Q2_041_partial_18_0952_valid :
    mulPoly ep_Q2_041_coefficient_18_0952
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0952 := by
  native_decide

/-- Coefficient term 953 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0953 : Poly :=
[
  term ((-2436024629436762076450363066684604094249494279427255704740285863285613395 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 953 for generator 18. -/
def ep_Q2_041_partial_18_0953 : Poly :=
[
  term ((2436024629436762076450363066684604094249494279427255704740285863285613395 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((-2436024629436762076450363066684604094249494279427255704740285863285613395 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 2), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 953 for generator 18. -/
theorem ep_Q2_041_partial_18_0953_valid :
    mulPoly ep_Q2_041_coefficient_18_0953
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0953 := by
  native_decide

/-- Coefficient term 954 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0954 : Poly :=
[
  term ((-35837153657424 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 954 for generator 18. -/
def ep_Q2_041_partial_18_0954 : Poly :=
[
  term ((35837153657424 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-71674307314848 : Rat) / 275754830051) [(1, 1), (8, 2), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 954 for generator 18. -/
theorem ep_Q2_041_partial_18_0954_valid :
    mulPoly ep_Q2_041_coefficient_18_0954
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0954 := by
  native_decide

/-- Coefficient term 955 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0955 : Poly :=
[
  term ((-643166223055551654464416921386725791769200503852386850876807300 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 4)]
]

/-- Partial product 955 for generator 18. -/
def ep_Q2_041_partial_18_0955 : Poly :=
[
  term ((643166223055551654464416921386725791769200503852386850876807300 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 4)],
  term ((-1286332446111103308928833842773451583538401007704773701753614600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 2), (10, 1), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 955 for generator 18. -/
theorem ep_Q2_041_partial_18_0955_valid :
    mulPoly ep_Q2_041_coefficient_18_0955
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0955 := by
  native_decide

/-- Coefficient term 956 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0956 : Poly :=
[
  term ((2458410876 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 956 for generator 18. -/
def ep_Q2_041_partial_18_0956 : Poly :=
[
  term ((-2458410876 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((4916821752 : Rat) / 151763803) [(1, 1), (8, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 956 for generator 18. -/
theorem ep_Q2_041_partial_18_0956_valid :
    mulPoly ep_Q2_041_coefficient_18_0956
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0956 := by
  native_decide

/-- Coefficient term 957 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0957 : Poly :=
[
  term ((28141485490105910864488796107832096938629520911132357368840 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (10, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 957 for generator 18. -/
def ep_Q2_041_partial_18_0957 : Poly :=
[
  term ((-28141485490105910864488796107832096938629520911132357368840 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((56282970980211821728977592215664193877259041822264714737680 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 2), (10, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 957 for generator 18. -/
theorem ep_Q2_041_partial_18_0957_valid :
    mulPoly ep_Q2_041_coefficient_18_0957
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0957 := by
  native_decide

/-- Coefficient term 958 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0958 : Poly :=
[
  term ((-589721392773979873880283123219359506498367579225439664284480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 2), (13, 1), (15, 2)]
]

/-- Partial product 958 for generator 18. -/
def ep_Q2_041_partial_18_0958 : Poly :=
[
  term ((589721392773979873880283123219359506498367579225439664284480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((-1179442785547959747760566246438719012996735158450879328568960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (10, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 958 for generator 18. -/
theorem ep_Q2_041_partial_18_0958_valid :
    mulPoly ep_Q2_041_coefficient_18_0958
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0958 := by
  native_decide

/-- Coefficient term 959 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0959 : Poly :=
[
  term ((110733224240005311322248134089613324090887490483430126861080 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 959 for generator 18. -/
def ep_Q2_041_partial_18_0959 : Poly :=
[
  term ((-110733224240005311322248134089613324090887490483430126861080 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((221466448480010622644496268179226648181774980966860253722160 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (10, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 959 for generator 18. -/
theorem ep_Q2_041_partial_18_0959_valid :
    mulPoly ep_Q2_041_coefficient_18_0959
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0959 := by
  native_decide

/-- Coefficient term 960 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0960 : Poly :=
[
  term ((1078217268802902955200357157544261834138890336542354812905370 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 960 for generator 18. -/
def ep_Q2_041_partial_18_0960 : Poly :=
[
  term ((-1078217268802902955200357157544261834138890336542354812905370 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((2156434537605805910400714315088523668277780673084709625810740 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 960 for generator 18. -/
theorem ep_Q2_041_partial_18_0960_valid :
    mulPoly ep_Q2_041_coefficient_18_0960
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0960 := by
  native_decide

/-- Coefficient term 961 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0961 : Poly :=
[
  term ((643166223055551654464416921386725791769200503852386850876807300 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (10, 1), (11, 2), (15, 3)]
]

/-- Partial product 961 for generator 18. -/
def ep_Q2_041_partial_18_0961 : Poly :=
[
  term ((-643166223055551654464416921386725791769200503852386850876807300 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (10, 1), (11, 2), (15, 3)],
  term ((1286332446111103308928833842773451583538401007704773701753614600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 2), (10, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 961 for generator 18. -/
theorem ep_Q2_041_partial_18_0961_valid :
    mulPoly ep_Q2_041_coefficient_18_0961
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0961 := by
  native_decide

/-- Coefficient term 962 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0962 : Poly :=
[
  term ((45599887597959813589266870936863464887364592830676130011280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 962 for generator 18. -/
def ep_Q2_041_partial_18_0962 : Poly :=
[
  term ((-45599887597959813589266870936863464887364592830676130011280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((91199775195919627178533741873726929774729185661352260022560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (10, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 962 for generator 18. -/
theorem ep_Q2_041_partial_18_0962_valid :
    mulPoly ep_Q2_041_coefficient_18_0962
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0962 := by
  native_decide

/-- Coefficient term 963 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0963 : Poly :=
[
  term ((-20836401579622699433 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 963 for generator 18. -/
def ep_Q2_041_partial_18_0963 : Poly :=
[
  term ((20836401579622699433 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-41672803159245398866 : Rat) / 259001945121800951) [(1, 1), (8, 2), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 963 for generator 18. -/
theorem ep_Q2_041_partial_18_0963_valid :
    mulPoly ep_Q2_041_coefficient_18_0963
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0963 := by
  native_decide

/-- Coefficient term 964 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0964 : Poly :=
[
  term ((-1305153278 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 964 for generator 18. -/
def ep_Q2_041_partial_18_0964 : Poly :=
[
  term ((1305153278 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2610306556 : Rat) / 151763803) [(1, 1), (8, 2), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 964 for generator 18. -/
theorem ep_Q2_041_partial_18_0964_valid :
    mulPoly ep_Q2_041_coefficient_18_0964
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0964 := by
  native_decide

/-- Coefficient term 965 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0965 : Poly :=
[
  term ((2761578227626427503 : Rat) / 37000277874542993) [(1, 1), (8, 1), (10, 1), (13, 1)]
]

/-- Partial product 965 for generator 18. -/
def ep_Q2_041_partial_18_0965 : Poly :=
[
  term ((-2761578227626427503 : Rat) / 37000277874542993) [(1, 1), (8, 1), (10, 1), (13, 1)],
  term ((5523156455252855006 : Rat) / 37000277874542993) [(1, 1), (8, 2), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 965 for generator 18. -/
theorem ep_Q2_041_partial_18_0965_valid :
    mulPoly ep_Q2_041_coefficient_18_0965
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0965 := by
  native_decide

/-- Coefficient term 966 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0966 : Poly :=
[
  term ((1505353986237706912 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 966 for generator 18. -/
def ep_Q2_041_partial_18_0966 : Poly :=
[
  term ((-1505353986237706912 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((3010707972475413824 : Rat) / 259001945121800951) [(1, 1), (8, 2), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 966 for generator 18. -/
theorem ep_Q2_041_partial_18_0966_valid :
    mulPoly ep_Q2_041_coefficient_18_0966
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0966 := by
  native_decide

/-- Coefficient term 967 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0967 : Poly :=
[
  term ((-45599887597959813589266870936863464887364592830676130011280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 967 for generator 18. -/
def ep_Q2_041_partial_18_0967 : Poly :=
[
  term ((45599887597959813589266870936863464887364592830676130011280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-91199775195919627178533741873726929774729185661352260022560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (10, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 967 for generator 18. -/
theorem ep_Q2_041_partial_18_0967_valid :
    mulPoly ep_Q2_041_coefficient_18_0967
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0967 := by
  native_decide

/-- Coefficient term 968 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0968 : Poly :=
[
  term ((-26832532 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 968 for generator 18. -/
def ep_Q2_041_partial_18_0968 : Poly :=
[
  term ((26832532 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-53665064 : Rat) / 151763803) [(1, 1), (8, 2), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 968 for generator 18. -/
theorem ep_Q2_041_partial_18_0968_valid :
    mulPoly ep_Q2_041_coefficient_18_0968
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0968 := by
  native_decide

/-- Coefficient term 969 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0969 : Poly :=
[
  term ((315620298154365945106810333885306115787060997342978583920378687897602 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 969 for generator 18. -/
def ep_Q2_041_partial_18_0969 : Poly :=
[
  term ((-315620298154365945106810333885306115787060997342978583920378687897602 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((631240596308731890213620667770612231574121994685957167840757375795204 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (8, 2), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 969 for generator 18. -/
theorem ep_Q2_041_partial_18_0969_valid :
    mulPoly ep_Q2_041_coefficient_18_0969
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0969 := by
  native_decide

/-- Coefficient term 970 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0970 : Poly :=
[
  term ((1445074560 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 970 for generator 18. -/
def ep_Q2_041_partial_18_0970 : Poly :=
[
  term ((-1445074560 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((2890149120 : Rat) / 151763803) [(1, 1), (8, 2), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 970 for generator 18. -/
theorem ep_Q2_041_partial_18_0970_valid :
    mulPoly ep_Q2_041_coefficient_18_0970
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0970 := by
  native_decide

/-- Coefficient term 971 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0971 : Poly :=
[
  term ((-202901470522409707052904385412193142007057336794166326566951660 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 4)]
]

/-- Partial product 971 for generator 18. -/
def ep_Q2_041_partial_18_0971 : Poly :=
[
  term ((202901470522409707052904385412193142007057336794166326566951660 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 4)],
  term ((-405802941044819414105808770824386284014114673588332653133903320 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 2), (10, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 971 for generator 18. -/
theorem ep_Q2_041_partial_18_0971_valid :
    mulPoly ep_Q2_041_coefficient_18_0971
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0971 := by
  native_decide

/-- Coefficient term 972 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0972 : Poly :=
[
  term ((1331985810 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 972 for generator 18. -/
def ep_Q2_041_partial_18_0972 : Poly :=
[
  term ((-1331985810 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((2663971620 : Rat) / 151763803) [(1, 1), (8, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 972 for generator 18. -/
theorem ep_Q2_041_partial_18_0972_valid :
    mulPoly ep_Q2_041_coefficient_18_0972
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0972 := by
  native_decide

/-- Coefficient term 973 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0973 : Poly :=
[
  term ((7783433272235322954607029914495165879823757607029953139560 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (10, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 973 for generator 18. -/
def ep_Q2_041_partial_18_0973 : Poly :=
[
  term ((-7783433272235322954607029914495165879823757607029953139560 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((15566866544470645909214059828990331759647515214059906279120 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 2), (10, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 973 for generator 18. -/
theorem ep_Q2_041_partial_18_0973_valid :
    mulPoly ep_Q2_041_coefficient_18_0973
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0973 := by
  native_decide

/-- Coefficient term 974 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0974 : Poly :=
[
  term ((-100083920503607074271516080338329626046130896079885801988200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (13, 2), (15, 1)]
]

/-- Partial product 974 for generator 18. -/
def ep_Q2_041_partial_18_0974 : Poly :=
[
  term ((100083920503607074271516080338329626046130896079885801988200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (13, 2), (15, 1)],
  term ((-200167841007214148543032160676659252092261792159771603976400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 974 for generator 18. -/
theorem ep_Q2_041_partial_18_0974_valid :
    mulPoly ep_Q2_041_coefficient_18_0974
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0974 := by
  native_decide

/-- Coefficient term 975 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0975 : Poly :=
[
  term ((-66357816800524245524285883507035829667185542710602004537440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (13, 2), (15, 3)]
]

/-- Partial product 975 for generator 18. -/
def ep_Q2_041_partial_18_0975 : Poly :=
[
  term ((66357816800524245524285883507035829667185542710602004537440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (13, 2), (15, 3)],
  term ((-132715633601048491048571767014071659334371085421204009074880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (10, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 975 for generator 18. -/
theorem ep_Q2_041_partial_18_0975_valid :
    mulPoly ep_Q2_041_coefficient_18_0975
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0975 := by
  native_decide

/-- Coefficient term 976 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0976 : Poly :=
[
  term ((41758352198820560820 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 976 for generator 18. -/
def ep_Q2_041_partial_18_0976 : Poly :=
[
  term ((-41758352198820560820 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((83516704397641121640 : Rat) / 259001945121800951) [(1, 1), (8, 2), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 976 for generator 18. -/
theorem ep_Q2_041_partial_18_0976_valid :
    mulPoly ep_Q2_041_coefficient_18_0976
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0976 := by
  native_decide

/-- Coefficient term 977 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0977 : Poly :=
[
  term ((3782474700 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 977 for generator 18. -/
def ep_Q2_041_partial_18_0977 : Poly :=
[
  term ((-3782474700 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((7564949400 : Rat) / 151763803) [(1, 1), (8, 2), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 977 for generator 18. -/
theorem ep_Q2_041_partial_18_0977_valid :
    mulPoly ep_Q2_041_coefficient_18_0977
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0977 := by
  native_decide

/-- Coefficient term 978 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0978 : Poly :=
[
  term ((-154287543343841711455 : Rat) / 518003890243601902) [(1, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 978 for generator 18. -/
def ep_Q2_041_partial_18_0978 : Poly :=
[
  term ((154287543343841711455 : Rat) / 518003890243601902) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((-154287543343841711455 : Rat) / 259001945121800951) [(1, 1), (8, 2), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 978 for generator 18. -/
theorem ep_Q2_041_partial_18_0978_valid :
    mulPoly ep_Q2_041_coefficient_18_0978
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0978 := by
  native_decide

/-- Coefficient term 979 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0979 : Poly :=
[
  term ((-4469805857 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 979 for generator 18. -/
def ep_Q2_041_partial_18_0979 : Poly :=
[
  term ((4469805857 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8939611714 : Rat) / 151763803) [(1, 1), (8, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 979 for generator 18. -/
theorem ep_Q2_041_partial_18_0979_valid :
    mulPoly ep_Q2_041_coefficient_18_0979
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0979 := by
  native_decide

/-- Coefficient term 980 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0980 : Poly :=
[
  term ((241953625345884902413540484415595865791965738828557803182428926958934955 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (10, 1), (15, 3)]
]

/-- Partial product 980 for generator 18. -/
def ep_Q2_041_partial_18_0980 : Poly :=
[
  term ((-241953625345884902413540484415595865791965738828557803182428926958934955 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (10, 1), (15, 3)],
  term ((241953625345884902413540484415595865791965738828557803182428926958934955 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 2), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 980 for generator 18. -/
theorem ep_Q2_041_partial_18_0980_valid :
    mulPoly ep_Q2_041_coefficient_18_0980
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0980 := by
  native_decide

/-- Coefficient term 981 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0981 : Poly :=
[
  term ((35837153657424 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 981 for generator 18. -/
def ep_Q2_041_partial_18_0981 : Poly :=
[
  term ((-35837153657424 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((71674307314848 : Rat) / 275754830051) [(1, 1), (8, 2), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 981 for generator 18. -/
theorem ep_Q2_041_partial_18_0981_valid :
    mulPoly ep_Q2_041_coefficient_18_0981
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0981 := by
  native_decide

/-- Coefficient term 982 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0982 : Poly :=
[
  term ((27779284645264200487 : Rat) / 74000555749085986) [(1, 1), (8, 1), (11, 1)]
]

/-- Partial product 982 for generator 18. -/
def ep_Q2_041_partial_18_0982 : Poly :=
[
  term ((-27779284645264200487 : Rat) / 74000555749085986) [(1, 1), (8, 1), (11, 1)],
  term ((27779284645264200487 : Rat) / 37000277874542993) [(1, 1), (8, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 982 for generator 18. -/
theorem ep_Q2_041_partial_18_0982_valid :
    mulPoly ep_Q2_041_coefficient_18_0982
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0982 := by
  native_decide

/-- Coefficient term 983 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0983 : Poly :=
[
  term ((-7064716814021244243 : Rat) / 37000277874542993) [(1, 1), (8, 1), (11, 1), (12, 1)]
]

/-- Partial product 983 for generator 18. -/
def ep_Q2_041_partial_18_0983 : Poly :=
[
  term ((7064716814021244243 : Rat) / 37000277874542993) [(1, 1), (8, 1), (11, 1), (12, 1)],
  term ((-14129433628042488486 : Rat) / 37000277874542993) [(1, 1), (8, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 983 for generator 18. -/
theorem ep_Q2_041_partial_18_0983_valid :
    mulPoly ep_Q2_041_coefficient_18_0983
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0983 := by
  native_decide

/-- Coefficient term 984 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0984 : Poly :=
[
  term ((-1992177306884364423113207823908998415442727724923596882512360 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 984 for generator 18. -/
def ep_Q2_041_partial_18_0984 : Poly :=
[
  term ((1992177306884364423113207823908998415442727724923596882512360 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3984354613768728846226415647817996830885455449847193765024720 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 984 for generator 18. -/
theorem ep_Q2_041_partial_18_0984_valid :
    mulPoly ep_Q2_041_coefficient_18_0984
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0984 := by
  native_decide

/-- Coefficient term 985 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0985 : Poly :=
[
  term ((-9860314301734458755294908071767883250814503718406681259715808409561263 : Rat) / 81961249831677012552875583878085542298963531864855244972908278959678) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 985 for generator 18. -/
def ep_Q2_041_partial_18_0985 : Poly :=
[
  term ((9860314301734458755294908071767883250814503718406681259715808409561263 : Rat) / 81961249831677012552875583878085542298963531864855244972908278959678) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-9860314301734458755294908071767883250814503718406681259715808409561263 : Rat) / 40980624915838506276437791939042771149481765932427622486454139479839) [(1, 1), (8, 2), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 985 for generator 18. -/
theorem ep_Q2_041_partial_18_0985_valid :
    mulPoly ep_Q2_041_coefficient_18_0985
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0985 := by
  native_decide

/-- Coefficient term 986 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0986 : Poly :=
[
  term ((-9199718713632 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 986 for generator 18. -/
def ep_Q2_041_partial_18_0986 : Poly :=
[
  term ((9199718713632 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18399437427264 : Rat) / 275754830051) [(1, 1), (8, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 986 for generator 18. -/
theorem ep_Q2_041_partial_18_0986_valid :
    mulPoly ep_Q2_041_coefficient_18_0986
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0986 := by
  native_decide

/-- Coefficient term 987 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0987 : Poly :=
[
  term ((-112118095097230234668438010336896593016350724692886181276908900 : Rat) / 516131341403464932550743498651347741654902067386892651920997) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 3)]
]

/-- Partial product 987 for generator 18. -/
def ep_Q2_041_partial_18_0987 : Poly :=
[
  term ((112118095097230234668438010336896593016350724692886181276908900 : Rat) / 516131341403464932550743498651347741654902067386892651920997) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((-224236190194460469336876020673793186032701449385772362553817800 : Rat) / 516131341403464932550743498651347741654902067386892651920997) [(1, 1), (8, 2), (11, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 987 for generator 18. -/
theorem ep_Q2_041_partial_18_0987_valid :
    mulPoly ep_Q2_041_coefficient_18_0987
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0987 := by
  native_decide

/-- Coefficient term 988 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0988 : Poly :=
[
  term ((-194973752614921380972 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 2)]
]

/-- Partial product 988 for generator 18. -/
def ep_Q2_041_partial_18_0988 : Poly :=
[
  term ((194973752614921380972 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 2)],
  term ((-389947505229842761944 : Rat) / 259001945121800951) [(1, 1), (8, 2), (11, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 988 for generator 18. -/
theorem ep_Q2_041_partial_18_0988_valid :
    mulPoly ep_Q2_041_coefficient_18_0988
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0988 := by
  native_decide

/-- Coefficient term 989 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0989 : Poly :=
[
  term ((15385311578172068604879705855079254934652208982254051227289675960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 2)]
]

/-- Partial product 989 for generator 18. -/
def ep_Q2_041_partial_18_0989 : Poly :=
[
  term ((-15385311578172068604879705855079254934652208982254051227289675960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 2)],
  term ((30770623156344137209759411710158509869304417964508102454579351920 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 2), (11, 1), (12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 989 for generator 18. -/
theorem ep_Q2_041_partial_18_0989_valid :
    mulPoly ep_Q2_041_coefficient_18_0989
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0989 := by
  native_decide

/-- Coefficient term 990 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0990 : Poly :=
[
  term ((-13728208320 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 990 for generator 18. -/
def ep_Q2_041_partial_18_0990 : Poly :=
[
  term ((13728208320 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-27456416640 : Rat) / 151763803) [(1, 1), (8, 2), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 990 for generator 18. -/
theorem ep_Q2_041_partial_18_0990_valid :
    mulPoly ep_Q2_041_coefficient_18_0990
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0990 := by
  native_decide

/-- Coefficient term 991 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0991 : Poly :=
[
  term ((630399259604980332480715893316840381838262655750719043105680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 3), (15, 1)]
]

/-- Partial product 991 for generator 18. -/
def ep_Q2_041_partial_18_0991 : Poly :=
[
  term ((-630399259604980332480715893316840381838262655750719043105680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 3), (15, 1)],
  term ((1260798519209960664961431786633680763676525311501438086211360 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 1), (12, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 991 for generator 18. -/
theorem ep_Q2_041_partial_18_0991_valid :
    mulPoly ep_Q2_041_coefficient_18_0991
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0991 := by
  native_decide

/-- Coefficient term 992 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0992 : Poly :=
[
  term ((160120062782470523905 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 992 for generator 18. -/
def ep_Q2_041_partial_18_0992 : Poly :=
[
  term ((-160120062782470523905 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((320240125564941047810 : Rat) / 259001945121800951) [(1, 1), (8, 2), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 992 for generator 18. -/
theorem ep_Q2_041_partial_18_0992_valid :
    mulPoly ep_Q2_041_coefficient_18_0992
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0992 := by
  native_decide

/-- Coefficient term 993 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0993 : Poly :=
[
  term ((-1896154472989780846727718248615031303987937857474800489185160 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 993 for generator 18. -/
def ep_Q2_041_partial_18_0993 : Poly :=
[
  term ((1896154472989780846727718248615031303987937857474800489185160 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-3792308945979561693455436497230062607975875714949600978370320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 1), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 993 for generator 18. -/
theorem ep_Q2_041_partial_18_0993_valid :
    mulPoly ep_Q2_041_coefficient_18_0993
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0993 := by
  native_decide

/-- Coefficient term 994 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0994 : Poly :=
[
  term ((13601184130 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 994 for generator 18. -/
def ep_Q2_041_partial_18_0994 : Poly :=
[
  term ((-13601184130 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((27202368260 : Rat) / 151763803) [(1, 1), (8, 2), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 994 for generator 18. -/
theorem ep_Q2_041_partial_18_0994_valid :
    mulPoly ep_Q2_041_coefficient_18_0994
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0994 := by
  native_decide

/-- Coefficient term 995 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0995 : Poly :=
[
  term ((-318782087636006412398919022013928133887597266734706210951902882481720895 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 995 for generator 18. -/
def ep_Q2_041_partial_18_0995 : Poly :=
[
  term ((318782087636006412398919022013928133887597266734706210951902882481720895 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-637564175272012824797838044027856267775194533469412421903805764963441790 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 2), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 995 for generator 18. -/
theorem ep_Q2_041_partial_18_0995_valid :
    mulPoly ep_Q2_041_coefficient_18_0995
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0995 := by
  native_decide

/-- Coefficient term 996 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0996 : Poly :=
[
  term ((1805197192512 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 996 for generator 18. -/
def ep_Q2_041_partial_18_0996 : Poly :=
[
  term ((-1805197192512 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((3610394385024 : Rat) / 275754830051) [(1, 1), (8, 2), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 996 for generator 18. -/
theorem ep_Q2_041_partial_18_0996_valid :
    mulPoly ep_Q2_041_coefficient_18_0996
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0996 := by
  native_decide

/-- Coefficient term 997 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0997 : Poly :=
[
  term ((56159021076651869919490936919247260048030796099265671596075500 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 4)]
]

/-- Partial product 997 for generator 18. -/
def ep_Q2_041_partial_18_0997 : Poly :=
[
  term ((-56159021076651869919490936919247260048030796099265671596075500 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 4)],
  term ((112318042153303739838981873838494520096061592198531343192151000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (8, 2), (11, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 997 for generator 18. -/
theorem ep_Q2_041_partial_18_0997_valid :
    mulPoly ep_Q2_041_coefficient_18_0997
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0997 := by
  native_decide

/-- Coefficient term 998 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0998 : Poly :=
[
  term ((-4541489546 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 998 for generator 18. -/
def ep_Q2_041_partial_18_0998 : Poly :=
[
  term ((4541489546 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-9082979092 : Rat) / 151763803) [(1, 1), (8, 2), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 998 for generator 18. -/
theorem ep_Q2_041_partial_18_0998_valid :
    mulPoly ep_Q2_041_coefficient_18_0998
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0998 := by
  native_decide

/-- Coefficient term 999 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0999 : Poly :=
[
  term ((-56629803391078529756 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (12, 2)]
]

/-- Partial product 999 for generator 18. -/
def ep_Q2_041_partial_18_0999 : Poly :=
[
  term ((56629803391078529756 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (12, 2)],
  term ((-113259606782157059512 : Rat) / 259001945121800951) [(1, 1), (8, 2), (11, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 999 for generator 18. -/
theorem ep_Q2_041_partial_18_0999_valid :
    mulPoly ep_Q2_041_coefficient_18_0999
        ep_Q2_041_generator_18_0900_0999 =
      ep_Q2_041_partial_18_0999 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_041_partials_18_0900_0999 : List Poly :=
[
  ep_Q2_041_partial_18_0900,
  ep_Q2_041_partial_18_0901,
  ep_Q2_041_partial_18_0902,
  ep_Q2_041_partial_18_0903,
  ep_Q2_041_partial_18_0904,
  ep_Q2_041_partial_18_0905,
  ep_Q2_041_partial_18_0906,
  ep_Q2_041_partial_18_0907,
  ep_Q2_041_partial_18_0908,
  ep_Q2_041_partial_18_0909,
  ep_Q2_041_partial_18_0910,
  ep_Q2_041_partial_18_0911,
  ep_Q2_041_partial_18_0912,
  ep_Q2_041_partial_18_0913,
  ep_Q2_041_partial_18_0914,
  ep_Q2_041_partial_18_0915,
  ep_Q2_041_partial_18_0916,
  ep_Q2_041_partial_18_0917,
  ep_Q2_041_partial_18_0918,
  ep_Q2_041_partial_18_0919,
  ep_Q2_041_partial_18_0920,
  ep_Q2_041_partial_18_0921,
  ep_Q2_041_partial_18_0922,
  ep_Q2_041_partial_18_0923,
  ep_Q2_041_partial_18_0924,
  ep_Q2_041_partial_18_0925,
  ep_Q2_041_partial_18_0926,
  ep_Q2_041_partial_18_0927,
  ep_Q2_041_partial_18_0928,
  ep_Q2_041_partial_18_0929,
  ep_Q2_041_partial_18_0930,
  ep_Q2_041_partial_18_0931,
  ep_Q2_041_partial_18_0932,
  ep_Q2_041_partial_18_0933,
  ep_Q2_041_partial_18_0934,
  ep_Q2_041_partial_18_0935,
  ep_Q2_041_partial_18_0936,
  ep_Q2_041_partial_18_0937,
  ep_Q2_041_partial_18_0938,
  ep_Q2_041_partial_18_0939,
  ep_Q2_041_partial_18_0940,
  ep_Q2_041_partial_18_0941,
  ep_Q2_041_partial_18_0942,
  ep_Q2_041_partial_18_0943,
  ep_Q2_041_partial_18_0944,
  ep_Q2_041_partial_18_0945,
  ep_Q2_041_partial_18_0946,
  ep_Q2_041_partial_18_0947,
  ep_Q2_041_partial_18_0948,
  ep_Q2_041_partial_18_0949,
  ep_Q2_041_partial_18_0950,
  ep_Q2_041_partial_18_0951,
  ep_Q2_041_partial_18_0952,
  ep_Q2_041_partial_18_0953,
  ep_Q2_041_partial_18_0954,
  ep_Q2_041_partial_18_0955,
  ep_Q2_041_partial_18_0956,
  ep_Q2_041_partial_18_0957,
  ep_Q2_041_partial_18_0958,
  ep_Q2_041_partial_18_0959,
  ep_Q2_041_partial_18_0960,
  ep_Q2_041_partial_18_0961,
  ep_Q2_041_partial_18_0962,
  ep_Q2_041_partial_18_0963,
  ep_Q2_041_partial_18_0964,
  ep_Q2_041_partial_18_0965,
  ep_Q2_041_partial_18_0966,
  ep_Q2_041_partial_18_0967,
  ep_Q2_041_partial_18_0968,
  ep_Q2_041_partial_18_0969,
  ep_Q2_041_partial_18_0970,
  ep_Q2_041_partial_18_0971,
  ep_Q2_041_partial_18_0972,
  ep_Q2_041_partial_18_0973,
  ep_Q2_041_partial_18_0974,
  ep_Q2_041_partial_18_0975,
  ep_Q2_041_partial_18_0976,
  ep_Q2_041_partial_18_0977,
  ep_Q2_041_partial_18_0978,
  ep_Q2_041_partial_18_0979,
  ep_Q2_041_partial_18_0980,
  ep_Q2_041_partial_18_0981,
  ep_Q2_041_partial_18_0982,
  ep_Q2_041_partial_18_0983,
  ep_Q2_041_partial_18_0984,
  ep_Q2_041_partial_18_0985,
  ep_Q2_041_partial_18_0986,
  ep_Q2_041_partial_18_0987,
  ep_Q2_041_partial_18_0988,
  ep_Q2_041_partial_18_0989,
  ep_Q2_041_partial_18_0990,
  ep_Q2_041_partial_18_0991,
  ep_Q2_041_partial_18_0992,
  ep_Q2_041_partial_18_0993,
  ep_Q2_041_partial_18_0994,
  ep_Q2_041_partial_18_0995,
  ep_Q2_041_partial_18_0996,
  ep_Q2_041_partial_18_0997,
  ep_Q2_041_partial_18_0998,
  ep_Q2_041_partial_18_0999
]

/-- Sum of partial products in this block. -/
def ep_Q2_041_block_18_0900_0999 : Poly :=
[
  term ((-12958053108890840573183943955421761019113525880917146054640 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (7, 1), (8, 1), (13, 1), (14, 3), (15, 1)],
  term ((-190971591319545843174783575756528894271560476719212375874100 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((7623098454191973965669544849550149355305848595898547021926800 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 3)],
  term ((259859008449834379904 : Rat) / 777005835365402853) [(1, 1), (7, 1), (8, 1), (14, 1)],
  term ((-109718976425305403425147401797400885758259794870901760347218576457718560 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (8, 1), (14, 1), (15, 2)],
  term ((21542684728320 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((5981069560 : Rat) / 151763803) [(1, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((-15408000939200296682 : Rat) / 37000277874542993) [(1, 1), (7, 1), (8, 1), (14, 2)],
  term ((38414445860702834121120682617555402516498498128901634371012684648626310 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (8, 1), (14, 2), (15, 2)],
  term ((-2692835591040 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-9026443860 : Rat) / 151763803) [(1, 1), (7, 1), (8, 1), (14, 2), (16, 1)],
  term ((49999700530128263420 : Rat) / 777005835365402853) [(1, 1), (7, 1), (8, 1), (14, 3)],
  term ((1272243512 : Rat) / 151763803) [(1, 1), (7, 1), (8, 1), (14, 3), (16, 1)],
  term ((-16252243794807783781470894235171777965279876604942415666981374919572175 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 1), (7, 1), (8, 1), (15, 2)],
  term ((-9424924568640 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((1522687150 : Rat) / 151763803) [(1, 1), (7, 1), (8, 1), (16, 1)],
  term ((6479026554445420286591971977710880509556762940458573027320 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (7, 1), (13, 1), (14, 3), (15, 1)],
  term ((95485795659772921587391787878264447135780238359606187937050 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-3811549227095986982834772424775074677652924297949273510963400 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (7, 1), (13, 1), (15, 3)],
  term ((-129929504224917189952 : Rat) / 777005835365402853) [(1, 1), (7, 1), (14, 1)],
  term ((54859488212652701712573700898700442879129897435450880173609288228859280 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (14, 1), (15, 2)],
  term ((-10771342364160 : Rat) / 275754830051) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2990534780 : Rat) / 151763803) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term ((7704000469600148341 : Rat) / 37000277874542993) [(1, 1), (7, 1), (14, 2)],
  term ((-19207222930351417060560341308777701258249249064450817185506342324313155 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (14, 2), (15, 2)],
  term ((1346417795520 : Rat) / 275754830051) [(1, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((4513221930 : Rat) / 151763803) [(1, 1), (7, 1), (14, 2), (16, 1)],
  term ((-24999850265064131710 : Rat) / 777005835365402853) [(1, 1), (7, 1), (14, 3)],
  term ((-636121756 : Rat) / 151763803) [(1, 1), (7, 1), (14, 3), (16, 1)],
  term ((16252243794807783781470894235171777965279876604942415666981374919572175 : Rat) / 7072084985476130797419550380337666792653424749481795423376657213092216) [(1, 1), (7, 1), (15, 2)],
  term ((4712462284320 : Rat) / 275754830051) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-761343575 : Rat) / 151763803) [(1, 1), (7, 1), (16, 1)],
  term ((-474828081684604044914996211880323457455413390006337535227180960 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 2), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((1397044601831294023458502317031741999106574861298310373047418720 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 2), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-4101736211925428651865742700942511461745163038622478499813225834377739516 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 2), (8, 1), (10, 1), (15, 1)],
  term ((-17344740767760 : Rat) / 275754830051) [(1, 1), (7, 2), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((434952736944267869017889965621580372642915807238934125827772000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 2), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-579936982592357158690519954162107163523887742985245501103696000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 2), (8, 1), (11, 1), (14, 2), (15, 2)],
  term ((137215772175455531382051807291902688395505274726173846394682400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 2), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-182954362900607375176069076389203584527340366301565128526243200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 2), (8, 1), (13, 1), (14, 2), (15, 2)],
  term ((-64462986387732370974668125452651049880231527459413867203098458644806050 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 2), (8, 1), (14, 1), (15, 1)],
  term ((-24235520319360 : Rat) / 275754830051) [(1, 1), (7, 2), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((85950648516976494632890833936868066506975369945885156270797944859741400 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 2), (8, 1), (14, 2), (15, 1)],
  term ((32314027092480 : Rat) / 275754830051) [(1, 1), (7, 2), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((289968491296178579345259977081053581761943871492622750551848000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 2), (8, 2), (11, 1), (14, 1), (15, 2)],
  term ((-52554450453876556887761871140891853034237176489453982938257520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 2), (8, 2), (11, 1), (15, 2)],
  term ((91477181450303687588034538194601792263670183150782564263121600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 2), (8, 2), (13, 1), (14, 1), (15, 2)],
  term ((-789999482365950699317285696710472791816957613799937750786830960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 2), (8, 2), (13, 1), (15, 2)],
  term ((-42975324258488247316445416968434033253487684972942578135398972429870700 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 2), (8, 2), (14, 1), (15, 1)],
  term ((-16157013546240 : Rat) / 275754830051) [(1, 1), (7, 2), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((2093843430221202573249316767439689764126069204284181828042011889618740458 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 2), (8, 2), (15, 1)],
  term ((24829383930120 : Rat) / 275754830051) [(1, 1), (7, 2), (8, 2), (15, 1), (16, 1)],
  term ((237414040842302022457498105940161728727706695003168767613590480 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 2), (10, 1), (11, 1), (15, 2)],
  term ((-698522300915647011729251158515870999553287430649155186523709360 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 2), (10, 1), (13, 1), (15, 2)],
  term ((2050868105962714325932871350471255730872581519311239249906612917188869758 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 2), (10, 1), (15, 1)],
  term ((8672370383880 : Rat) / 275754830051) [(1, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-289968491296178579345259977081053581761943871492622750551848000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 2), (11, 1), (14, 1), (15, 2)],
  term ((289968491296178579345259977081053581761943871492622750551848000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 2), (11, 1), (14, 2), (15, 2)],
  term ((13138612613469139221940467785222963258559294122363495734564380 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 2), (11, 1), (15, 2)],
  term ((-91477181450303687588034538194601792263670183150782564263121600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 2), (13, 1), (14, 1), (15, 2)],
  term ((91477181450303687588034538194601792263670183150782564263121600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 2), (13, 1), (14, 2), (15, 2)],
  term ((197499870591487674829321424177618197954239403449984437696707740 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 2), (13, 1), (15, 2)],
  term ((42975324258488247316445416968434033253487684972942578135398972429870700 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 2), (14, 1), (15, 1)],
  term ((16157013546240 : Rat) / 275754830051) [(1, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-42975324258488247316445416968434033253487684972942578135398972429870700 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 2), (14, 2), (15, 1)],
  term ((-16157013546240 : Rat) / 275754830051) [(1, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((-1046921715110601286624658383719844882063034602142090914021005944809370229 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (7, 2), (15, 1)],
  term ((-6207345982530 : Rat) / 275754830051) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-6985696753566031486 : Rat) / 37000277874542993) [(1, 1), (8, 1), (10, 1), (11, 1)],
  term ((-20836401579622699433 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((45599887597959813589266870936863464887364592830676130011280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((28141485490105910864488796107832096938629520911132357368840 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-1305153278 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((316607767978434134466652045309040698932695847279890170408600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((212104952274147156199754915973233120016235714498508767159114241630802 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((1445074560 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1274425241192731137893378820301769365314591228246790196571851820 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 3)],
  term ((-66357816800524245524285883507035829667185542710602004537440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 2), (15, 2)],
  term ((43263706185058267732 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((-28141485490105910864488796107832096938629520911132357368840 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((3755642168 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((2436024629436762076450363066684604094249494279427255704740285863285613395 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((35837153657424 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((643166223055551654464416921386725791769200503852386850876807300 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 4)],
  term ((-2458410876 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-28141485490105910864488796107832096938629520911132357368840 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((589721392773979873880283123219359506498367579225439664284480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((-110733224240005311322248134089613324090887490483430126861080 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-1078217268802902955200357157544261834138890336542354812905370 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-643166223055551654464416921386725791769200503852386850876807300 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (10, 1), (11, 2), (15, 3)],
  term ((-45599887597959813589266870936863464887364592830676130011280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((20836401579622699433 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((1305153278 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2761578227626427503 : Rat) / 37000277874542993) [(1, 1), (8, 1), (10, 1), (13, 1)],
  term ((-1505353986237706912 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((45599887597959813589266870936863464887364592830676130011280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((26832532 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-315620298154365945106810333885306115787060997342978583920378687897602 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-1445074560 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((202901470522409707052904385412193142007057336794166326566951660 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 4)],
  term ((-1331985810 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-7783433272235322954607029914495165879823757607029953139560 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((100083920503607074271516080338329626046130896079885801988200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (13, 2), (15, 1)],
  term ((66357816800524245524285883507035829667185542710602004537440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (13, 2), (15, 3)],
  term ((-41758352198820560820 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-3782474700 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((154287543343841711455 : Rat) / 518003890243601902) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((4469805857 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-241953625345884902413540484415595865791965738828557803182428926958934955 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (10, 1), (15, 3)],
  term ((-35837153657424 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-27779284645264200487 : Rat) / 74000555749085986) [(1, 1), (8, 1), (11, 1)],
  term ((7064716814021244243 : Rat) / 37000277874542993) [(1, 1), (8, 1), (11, 1), (12, 1)],
  term ((1992177306884364423113207823908998415442727724923596882512360 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((9860314301734458755294908071767883250814503718406681259715808409561263 : Rat) / 81961249831677012552875583878085542298963531864855244972908278959678) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((9199718713632 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((112118095097230234668438010336896593016350724692886181276908900 : Rat) / 516131341403464932550743498651347741654902067386892651920997) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((194973752614921380972 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 2)],
  term ((-15385311578172068604879705855079254934652208982254051227289675960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 2)],
  term ((13728208320 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-630399259604980332480715893316840381838262655750719043105680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 3), (15, 1)],
  term ((-160120062782470523905 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((1896154472989780846727718248615031303987937857474800489185160 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-13601184130 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((318782087636006412398919022013928133887597266734706210951902882481720895 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-1805197192512 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-56159021076651869919490936919247260048030796099265671596075500 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 4)],
  term ((4541489546 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((56629803391078529756 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (12, 2)],
  term ((13971393507132062972 : Rat) / 37000277874542993) [(1, 1), (8, 2), (10, 1), (11, 1)],
  term ((41672803159245398866 : Rat) / 259001945121800951) [(1, 1), (8, 2), (10, 1), (11, 1), (12, 1)],
  term ((-91199775195919627178533741873726929774729185661352260022560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-56282970980211821728977592215664193877259041822264714737680 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 2), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((2610306556 : Rat) / 151763803) [(1, 1), (8, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-633215535956868268933304090618081397865391694559780340817200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-424209904548294312399509831946466240032471428997017534318228483261604 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (8, 2), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2890149120 : Rat) / 151763803) [(1, 1), (8, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2548850482385462275786757640603538730629182456493580393143703640 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 2), (10, 1), (11, 1), (13, 1), (15, 3)],
  term ((132715633601048491048571767014071659334371085421204009074880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (10, 1), (11, 1), (13, 2), (15, 2)],
  term ((-86527412370116535464 : Rat) / 259001945121800951) [(1, 1), (8, 2), (10, 1), (11, 1), (14, 1)],
  term ((56282970980211821728977592215664193877259041822264714737680 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 2), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-7511284336 : Rat) / 151763803) [(1, 1), (8, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2436024629436762076450363066684604094249494279427255704740285863285613395 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 2), (10, 1), (11, 1), (15, 2)],
  term ((-71674307314848 : Rat) / 275754830051) [(1, 1), (8, 2), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1286332446111103308928833842773451583538401007704773701753614600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 2), (10, 1), (11, 1), (15, 4)],
  term ((4916821752 : Rat) / 151763803) [(1, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((56282970980211821728977592215664193877259041822264714737680 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 2), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1179442785547959747760566246438719012996735158450879328568960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((221466448480010622644496268179226648181774980966860253722160 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((2156434537605805910400714315088523668277780673084709625810740 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (10, 1), (11, 2), (15, 1)],
  term ((1286332446111103308928833842773451583538401007704773701753614600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 2), (10, 1), (11, 2), (15, 3)],
  term ((91199775195919627178533741873726929774729185661352260022560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-41672803159245398866 : Rat) / 259001945121800951) [(1, 1), (8, 2), (10, 1), (12, 1), (15, 1)],
  term ((-2610306556 : Rat) / 151763803) [(1, 1), (8, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((5523156455252855006 : Rat) / 37000277874542993) [(1, 1), (8, 2), (10, 1), (13, 1)],
  term ((3010707972475413824 : Rat) / 259001945121800951) [(1, 1), (8, 2), (10, 1), (13, 1), (14, 1)],
  term ((-91199775195919627178533741873726929774729185661352260022560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-53665064 : Rat) / 151763803) [(1, 1), (8, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((631240596308731890213620667770612231574121994685957167840757375795204 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (8, 2), (10, 1), (13, 1), (15, 2)],
  term ((2890149120 : Rat) / 151763803) [(1, 1), (8, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-405802941044819414105808770824386284014114673588332653133903320 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 2), (10, 1), (13, 1), (15, 4)],
  term ((2663971620 : Rat) / 151763803) [(1, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((15566866544470645909214059828990331759647515214059906279120 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 2), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-200167841007214148543032160676659252092261792159771603976400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (10, 1), (13, 2), (15, 1)],
  term ((-132715633601048491048571767014071659334371085421204009074880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (10, 1), (13, 2), (15, 3)],
  term ((83516704397641121640 : Rat) / 259001945121800951) [(1, 1), (8, 2), (10, 1), (14, 1), (15, 1)],
  term ((7564949400 : Rat) / 151763803) [(1, 1), (8, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-154287543343841711455 : Rat) / 259001945121800951) [(1, 1), (8, 2), (10, 1), (15, 1)],
  term ((-8939611714 : Rat) / 151763803) [(1, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((241953625345884902413540484415595865791965738828557803182428926958934955 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 2), (10, 1), (15, 3)],
  term ((71674307314848 : Rat) / 275754830051) [(1, 1), (8, 2), (10, 1), (15, 3), (16, 1)],
  term ((27779284645264200487 : Rat) / 37000277874542993) [(1, 1), (8, 2), (11, 1)],
  term ((-14129433628042488486 : Rat) / 37000277874542993) [(1, 1), (8, 2), (11, 1), (12, 1)],
  term ((-3984354613768728846226415647817996830885455449847193765024720 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-9860314301734458755294908071767883250814503718406681259715808409561263 : Rat) / 40980624915838506276437791939042771149481765932427622486454139479839) [(1, 1), (8, 2), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-18399437427264 : Rat) / 275754830051) [(1, 1), (8, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-224236190194460469336876020673793186032701449385772362553817800 : Rat) / 516131341403464932550743498651347741654902067386892651920997) [(1, 1), (8, 2), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((-389947505229842761944 : Rat) / 259001945121800951) [(1, 1), (8, 2), (11, 1), (12, 1), (13, 2)],
  term ((30770623156344137209759411710158509869304417964508102454579351920 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 2), (11, 1), (12, 1), (13, 2), (15, 2)],
  term ((-27456416640 : Rat) / 151763803) [(1, 1), (8, 2), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((1260798519209960664961431786633680763676525311501438086211360 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 1), (12, 1), (13, 3), (15, 1)],
  term ((320240125564941047810 : Rat) / 259001945121800951) [(1, 1), (8, 2), (11, 1), (12, 1), (14, 1)],
  term ((-3792308945979561693455436497230062607975875714949600978370320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((27202368260 : Rat) / 151763803) [(1, 1), (8, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-637564175272012824797838044027856267775194533469412421903805764963441790 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 2), (11, 1), (12, 1), (15, 2)],
  term ((3610394385024 : Rat) / 275754830051) [(1, 1), (8, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((112318042153303739838981873838494520096061592198531343192151000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (8, 2), (11, 1), (12, 1), (15, 4)],
  term ((-9082979092 : Rat) / 151763803) [(1, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((-113259606782157059512 : Rat) / 259001945121800951) [(1, 1), (8, 2), (11, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 900 through 999. -/
theorem ep_Q2_041_block_18_0900_0999_valid :
    checkProductSumEq ep_Q2_041_partials_18_0900_0999
      ep_Q2_041_block_18_0900_0999 = true := by
  native_decide

end EpQ2041TermShards

end Patterns

end EndpointCertificate

end Problem97
