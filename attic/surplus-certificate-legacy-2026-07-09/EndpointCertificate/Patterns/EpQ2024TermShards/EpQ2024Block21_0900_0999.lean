/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 21:900-999

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_21_0900_0999 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 900 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0900 : Poly :=
[
  term ((18513734145245607042872260259687386608 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 900 for generator 21. -/
def ep_Q2_024_partial_21_0900 : Poly :=
[
  term ((37027468290491214085744520519374773216 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-18513734145245607042872260259687386608 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 900 for generator 21. -/
theorem ep_Q2_024_partial_21_0900_valid :
    mulPoly ep_Q2_024_coefficient_21_0900
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0900 := by
  native_decide

/-- Coefficient term 901 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0901 : Poly :=
[
  term ((365796635166128005531168494147648500425384687476294696 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 901 for generator 21. -/
def ep_Q2_024_partial_21_0901 : Poly :=
[
  term ((731593270332256011062336988295297000850769374952589392 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-365796635166128005531168494147648500425384687476294696 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 901 for generator 21. -/
theorem ep_Q2_024_partial_21_0901_valid :
    mulPoly ep_Q2_024_coefficient_21_0901
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0901 := by
  native_decide

/-- Coefficient term 902 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0902 : Poly :=
[
  term ((-464227327740800 : Rat) / 1162780221153193) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 902 for generator 21. -/
def ep_Q2_024_partial_21_0902 : Poly :=
[
  term ((-928454655481600 : Rat) / 1162780221153193) [(4, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((464227327740800 : Rat) / 1162780221153193) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 902 for generator 21. -/
theorem ep_Q2_024_partial_21_0902_valid :
    mulPoly ep_Q2_024_coefficient_21_0902
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0902 := by
  native_decide

/-- Coefficient term 903 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0903 : Poly :=
[
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (12, 1)]
]

/-- Partial product 903 for generator 21. -/
def ep_Q2_024_partial_21_0903 : Poly :=
[
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (10, 1), (12, 1)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 903 for generator 21. -/
theorem ep_Q2_024_partial_21_0903_valid :
    mulPoly ep_Q2_024_coefficient_21_0903
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0903 := by
  native_decide

/-- Coefficient term 904 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0904 : Poly :=
[
  term ((510644537565667145915966582387804409489521849339695528 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 904 for generator 21. -/
def ep_Q2_024_partial_21_0904 : Poly :=
[
  term ((1021289075131334291831933164775608818979043698679391056 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-510644537565667145915966582387804409489521849339695528 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 904 for generator 21. -/
theorem ep_Q2_024_partial_21_0904_valid :
    mulPoly ep_Q2_024_coefficient_21_0904
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0904 := by
  native_decide

/-- Coefficient term 905 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0905 : Poly :=
[
  term ((-350852685727264 : Rat) / 1162780221153193) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 905 for generator 21. -/
def ep_Q2_024_partial_21_0905 : Poly :=
[
  term ((-701705371454528 : Rat) / 1162780221153193) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((350852685727264 : Rat) / 1162780221153193) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 905 for generator 21. -/
theorem ep_Q2_024_partial_21_0905_valid :
    mulPoly ep_Q2_024_coefficient_21_0905
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0905 := by
  native_decide

/-- Coefficient term 906 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0906 : Poly :=
[
  term ((1073882345178587794074733681550903584 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (12, 1), (13, 2)]
]

/-- Partial product 906 for generator 21. -/
def ep_Q2_024_partial_21_0906 : Poly :=
[
  term ((2147764690357175588149467363101807168 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (10, 1), (12, 1), (13, 2)],
  term ((-1073882345178587794074733681550903584 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 906 for generator 21. -/
theorem ep_Q2_024_partial_21_0906_valid :
    mulPoly ep_Q2_024_coefficient_21_0906
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0906 := by
  native_decide

/-- Coefficient term 907 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0907 : Poly :=
[
  term ((-182898317583064002765584247073824250212692343738147348 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 907 for generator 21. -/
def ep_Q2_024_partial_21_0907 : Poly :=
[
  term ((-365796635166128005531168494147648500425384687476294696 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term ((182898317583064002765584247073824250212692343738147348 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 907 for generator 21. -/
theorem ep_Q2_024_partial_21_0907_valid :
    mulPoly ep_Q2_024_coefficient_21_0907
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0907 := by
  native_decide

/-- Coefficient term 908 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0908 : Poly :=
[
  term ((232113663870400 : Rat) / 1162780221153193) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 908 for generator 21. -/
def ep_Q2_024_partial_21_0908 : Poly :=
[
  term ((464227327740800 : Rat) / 1162780221153193) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-232113663870400 : Rat) / 1162780221153193) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 908 for generator 21. -/
theorem ep_Q2_024_partial_21_0908_valid :
    mulPoly ep_Q2_024_coefficient_21_0908
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0908 := by
  native_decide

/-- Coefficient term 909 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0909 : Poly :=
[
  term ((-9256867072622803521436130129843693304 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (13, 2)]
]

/-- Partial product 909 for generator 21. -/
def ep_Q2_024_partial_21_0909 : Poly :=
[
  term ((-18513734145245607042872260259687386608 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (10, 1), (13, 2)],
  term ((9256867072622803521436130129843693304 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 909 for generator 21. -/
theorem ep_Q2_024_partial_21_0909_valid :
    mulPoly ep_Q2_024_coefficient_21_0909
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0909 := by
  native_decide

/-- Coefficient term 910 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0910 : Poly :=
[
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (8, 1)]
]

/-- Partial product 910 for generator 21. -/
def ep_Q2_024_partial_21_0910 : Poly :=
[
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (8, 1)],
  term ((-5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (8, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 910 for generator 21. -/
theorem ep_Q2_024_partial_21_0910_valid :
    mulPoly ep_Q2_024_coefficient_21_0910
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0910 := by
  native_decide

/-- Coefficient term 911 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0911 : Poly :=
[
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (12, 1)]
]

/-- Partial product 911 for generator 21. -/
def ep_Q2_024_partial_21_0911 : Poly :=
[
  term ((5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (10, 1), (12, 1)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 911 for generator 21. -/
theorem ep_Q2_024_partial_21_0911_valid :
    mulPoly ep_Q2_024_coefficient_21_0911
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0911 := by
  native_decide

/-- Coefficient term 912 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0912 : Poly :=
[
  term ((39356336260818292697062851203095641530 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (9, 1)]
]

/-- Partial product 912 for generator 21. -/
def ep_Q2_024_partial_21_0912 : Poly :=
[
  term ((-39356336260818292697062851203095641530 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (9, 1)],
  term ((78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 912 for generator 21. -/
theorem ep_Q2_024_partial_21_0912_valid :
    mulPoly ep_Q2_024_coefficient_21_0912
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0912 := by
  native_decide

/-- Coefficient term 913 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0913 : Poly :=
[
  term ((87523393721084015496294258649550623636 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 913 for generator 21. -/
def ep_Q2_024_partial_21_0913 : Poly :=
[
  term ((175046787442168030992588517299101247272 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-87523393721084015496294258649550623636 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 913 for generator 21. -/
theorem ep_Q2_024_partial_21_0913_valid :
    mulPoly ep_Q2_024_coefficient_21_0913
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0913 := by
  native_decide

/-- Coefficient term 914 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0914 : Poly :=
[
  term ((-5615162933473648375120314597520139357719412890664605124 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 914 for generator 21. -/
def ep_Q2_024_partial_21_0914 : Poly :=
[
  term ((-11230325866947296750240629195040278715438825781329210248 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((5615162933473648375120314597520139357719412890664605124 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 914 for generator 21. -/
theorem ep_Q2_024_partial_21_0914_valid :
    mulPoly ep_Q2_024_coefficient_21_0914
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0914 := by
  native_decide

/-- Coefficient term 915 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0915 : Poly :=
[
  term ((-958235945051344 : Rat) / 1162780221153193) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 915 for generator 21. -/
def ep_Q2_024_partial_21_0915 : Poly :=
[
  term ((-1916471890102688 : Rat) / 1162780221153193) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((958235945051344 : Rat) / 1162780221153193) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 915 for generator 21. -/
theorem ep_Q2_024_partial_21_0915_valid :
    mulPoly ep_Q2_024_coefficient_21_0915
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0915 := by
  native_decide

/-- Coefficient term 916 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0916 : Poly :=
[
  term ((-4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (9, 1), (12, 1)]
]

/-- Partial product 916 for generator 21. -/
def ep_Q2_024_partial_21_0916 : Poly :=
[
  term ((-8106674556350821614499410747889522520 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 916 for generator 21. -/
theorem ep_Q2_024_partial_21_0916_valid :
    mulPoly ep_Q2_024_coefficient_21_0916
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0916 := by
  native_decide

/-- Coefficient term 917 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0917 : Poly :=
[
  term ((4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (9, 1), (14, 1)]
]

/-- Partial product 917 for generator 21. -/
def ep_Q2_024_partial_21_0917 : Poly :=
[
  term ((8106674556350821614499410747889522520 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((-4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 917 for generator 21. -/
theorem ep_Q2_024_partial_21_0917_valid :
    mulPoly ep_Q2_024_coefficient_21_0917
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0917 := by
  native_decide

/-- Coefficient term 918 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0918 : Poly :=
[
  term ((54048653648670671523063732942876943996 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 2), (11, 1)]
]

/-- Partial product 918 for generator 21. -/
def ep_Q2_024_partial_21_0918 : Poly :=
[
  term ((108097307297341343046127465885753887992 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 2), (10, 1), (11, 1)],
  term ((-54048653648670671523063732942876943996 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 918 for generator 21. -/
theorem ep_Q2_024_partial_21_0918_valid :
    mulPoly ep_Q2_024_coefficient_21_0918
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0918 := by
  native_decide

/-- Coefficient term 919 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0919 : Poly :=
[
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (8, 1), (11, 1)]
]

/-- Partial product 919 for generator 21. -/
def ep_Q2_024_partial_21_0919 : Poly :=
[
  term ((-5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (8, 1), (10, 1), (11, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 919 for generator 21. -/
theorem ep_Q2_024_partial_21_0919_valid :
    mulPoly ep_Q2_024_coefficient_21_0919
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0919 := by
  native_decide

/-- Coefficient term 920 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0920 : Poly :=
[
  term ((181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 920 for generator 21. -/
def ep_Q2_024_partial_21_0920 : Poly :=
[
  term ((362284247913818166067182223900731779716919672252456728 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 920 for generator 21. -/
theorem ep_Q2_024_partial_21_0920_valid :
    mulPoly ep_Q2_024_coefficient_21_0920
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0920 := by
  native_decide

/-- Coefficient term 921 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0921 : Poly :=
[
  term ((-751294408028112 : Rat) / 1162780221153193) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 921 for generator 21. -/
def ep_Q2_024_partial_21_0921 : Poly :=
[
  term ((-1502588816056224 : Rat) / 1162780221153193) [(5, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((751294408028112 : Rat) / 1162780221153193) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 921 for generator 21. -/
theorem ep_Q2_024_partial_21_0921_valid :
    mulPoly ep_Q2_024_coefficient_21_0921
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0921 := by
  native_decide

/-- Coefficient term 922 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0922 : Poly :=
[
  term ((26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (11, 1), (13, 2)]
]

/-- Partial product 922 for generator 21. -/
def ep_Q2_024_partial_21_0922 : Poly :=
[
  term ((53633115470366065055858292117804268528 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (10, 1), (11, 1), (13, 2)],
  term ((-26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 922 for generator 21. -/
theorem ep_Q2_024_partial_21_0922_valid :
    mulPoly ep_Q2_024_coefficient_21_0922
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0922 := by
  native_decide

/-- Coefficient term 923 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0923 : Poly :=
[
  term ((-35087091888972966991949624912465711912 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 923 for generator 21. -/
def ep_Q2_024_partial_21_0923 : Poly :=
[
  term ((-70174183777945933983899249824931423824 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((35087091888972966991949624912465711912 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (8, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 923 for generator 21. -/
theorem ep_Q2_024_partial_21_0923_valid :
    mulPoly ep_Q2_024_coefficient_21_0923
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0923 := by
  native_decide

/-- Coefficient term 924 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0924 : Poly :=
[
  term ((1762417639487067222459299550517136254542873266808291589 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 924 for generator 21. -/
def ep_Q2_024_partial_21_0924 : Poly :=
[
  term ((3524835278974134444918599101034272509085746533616583178 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1762417639487067222459299550517136254542873266808291589 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 924 for generator 21. -/
theorem ep_Q2_024_partial_21_0924_valid :
    mulPoly ep_Q2_024_coefficient_21_0924
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0924 := by
  native_decide

/-- Coefficient term 925 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0925 : Poly :=
[
  term ((-214869591391068 : Rat) / 1162780221153193) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 925 for generator 21. -/
def ep_Q2_024_partial_21_0925 : Poly :=
[
  term ((-429739182782136 : Rat) / 1162780221153193) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((214869591391068 : Rat) / 1162780221153193) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 925 for generator 21. -/
theorem ep_Q2_024_partial_21_0925_valid :
    mulPoly ep_Q2_024_coefficient_21_0925
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0925 := by
  native_decide

/-- Coefficient term 926 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0926 : Poly :=
[
  term ((-3566284606740933627466515201141305188144 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (8, 1), (13, 1)]
]

/-- Partial product 926 for generator 21. -/
def ep_Q2_024_partial_21_0926 : Poly :=
[
  term ((-7132569213481867254933030402282610376288 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (8, 1), (10, 1), (13, 1)],
  term ((3566284606740933627466515201141305188144 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 926 for generator 21. -/
theorem ep_Q2_024_partial_21_0926_valid :
    mulPoly ep_Q2_024_coefficient_21_0926
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0926 := by
  native_decide

/-- Coefficient term 927 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0927 : Poly :=
[
  term ((79388829424721085893609401059009996056 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 927 for generator 21. -/
def ep_Q2_024_partial_21_0927 : Poly :=
[
  term ((158777658849442171787218802118019992112 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-79388829424721085893609401059009996056 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 927 for generator 21. -/
theorem ep_Q2_024_partial_21_0927_valid :
    mulPoly ep_Q2_024_coefficient_21_0927
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0927 := by
  native_decide

/-- Coefficient term 928 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0928 : Poly :=
[
  term ((193670115439969813645562885899858386768667374713683385 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 928 for generator 21. -/
def ep_Q2_024_partial_21_0928 : Poly :=
[
  term ((193670115439969813645562885899858386768667374713683385 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-193670115439969813645562885899858386768667374713683385 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 928 for generator 21. -/
theorem ep_Q2_024_partial_21_0928_valid :
    mulPoly ep_Q2_024_coefficient_21_0928
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0928 := by
  native_decide

/-- Coefficient term 929 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0929 : Poly :=
[
  term ((-959786343288350 : Rat) / 1162780221153193) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 929 for generator 21. -/
def ep_Q2_024_partial_21_0929 : Poly :=
[
  term ((-1919572686576700 : Rat) / 1162780221153193) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((959786343288350 : Rat) / 1162780221153193) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 929 for generator 21. -/
theorem ep_Q2_024_partial_21_0929_valid :
    mulPoly ep_Q2_024_coefficient_21_0929
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0929 := by
  native_decide

/-- Coefficient term 930 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0930 : Poly :=
[
  term ((-54805693310089908493956012483267081475473687630831750659 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 930 for generator 21. -/
def ep_Q2_024_partial_21_0930 : Poly :=
[
  term ((-54805693310089908493956012483267081475473687630831750659 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(5, 1), (8, 1), (10, 1), (15, 1)],
  term ((54805693310089908493956012483267081475473687630831750659 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(5, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 930 for generator 21. -/
theorem ep_Q2_024_partial_21_0930_valid :
    mulPoly ep_Q2_024_coefficient_21_0930
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0930 := by
  native_decide

/-- Coefficient term 931 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0931 : Poly :=
[
  term ((865806139073211 : Rat) / 1162780221153193) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 931 for generator 21. -/
def ep_Q2_024_partial_21_0931 : Poly :=
[
  term ((1731612278146422 : Rat) / 1162780221153193) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-865806139073211 : Rat) / 1162780221153193) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 931 for generator 21. -/
theorem ep_Q2_024_partial_21_0931_valid :
    mulPoly ep_Q2_024_coefficient_21_0931
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0931 := by
  native_decide

/-- Coefficient term 932 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0932 : Poly :=
[
  term ((-27024326824335335761531866471438471998 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 2), (9, 1)]
]

/-- Partial product 932 for generator 21. -/
def ep_Q2_024_partial_21_0932 : Poly :=
[
  term ((27024326824335335761531866471438471998 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 2), (9, 1)],
  term ((-54048653648670671523063732942876943996 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 2), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 932 for generator 21. -/
theorem ep_Q2_024_partial_21_0932_valid :
    mulPoly ep_Q2_024_coefficient_21_0932
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0932 := by
  native_decide

/-- Coefficient term 933 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0933 : Poly :=
[
  term ((-33628353665103480730022865889913408668 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 2), (13, 1)]
]

/-- Partial product 933 for generator 21. -/
def ep_Q2_024_partial_21_0933 : Poly :=
[
  term ((-67256707330206961460045731779826817336 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 2), (10, 1), (13, 1)],
  term ((33628353665103480730022865889913408668 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 933 for generator 21. -/
theorem ep_Q2_024_partial_21_0933_valid :
    mulPoly ep_Q2_024_coefficient_21_0933
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0933 := by
  native_decide

/-- Coefficient term 934 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0934 : Poly :=
[
  term ((2807581466736824187560157298760069678859706445332302562 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 2), (15, 1)]
]

/-- Partial product 934 for generator 21. -/
def ep_Q2_024_partial_21_0934 : Poly :=
[
  term ((5615162933473648375120314597520139357719412890664605124 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 2), (10, 1), (15, 1)],
  term ((-2807581466736824187560157298760069678859706445332302562 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 934 for generator 21. -/
theorem ep_Q2_024_partial_21_0934_valid :
    mulPoly ep_Q2_024_coefficient_21_0934
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0934 := by
  native_decide

/-- Coefficient term 935 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0935 : Poly :=
[
  term ((479117972525672 : Rat) / 1162780221153193) [(5, 1), (8, 2), (15, 1), (16, 1)]
]

/-- Partial product 935 for generator 21. -/
def ep_Q2_024_partial_21_0935 : Poly :=
[
  term ((958235945051344 : Rat) / 1162780221153193) [(5, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-479117972525672 : Rat) / 1162780221153193) [(5, 1), (8, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 935 for generator 21. -/
theorem ep_Q2_024_partial_21_0935_valid :
    mulPoly ep_Q2_024_coefficient_21_0935
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0935 := by
  native_decide

/-- Coefficient term 936 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0936 : Poly :=
[
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1)]
]

/-- Partial product 936 for generator 21. -/
def ep_Q2_024_partial_21_0936 : Poly :=
[
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 936 for generator 21. -/
theorem ep_Q2_024_partial_21_0936_valid :
    mulPoly ep_Q2_024_coefficient_21_0936
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0936 := by
  native_decide

/-- Coefficient term 937 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0937 : Poly :=
[
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (10, 1)]
]

/-- Partial product 937 for generator 21. -/
def ep_Q2_024_partial_21_0937 : Poly :=
[
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (10, 1)],
  term ((5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 937 for generator 21. -/
theorem ep_Q2_024_partial_21_0937_valid :
    mulPoly ep_Q2_024_coefficient_21_0937
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0937 := by
  native_decide

/-- Coefficient term 938 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0938 : Poly :=
[
  term ((-26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 938 for generator 21. -/
def ep_Q2_024_partial_21_0938 : Poly :=
[
  term ((-53633115470366065055858292117804268528 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 938 for generator 21. -/
theorem ep_Q2_024_partial_21_0938_valid :
    mulPoly ep_Q2_024_coefficient_21_0938
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0938 := by
  native_decide

/-- Coefficient term 939 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0939 : Poly :=
[
  term ((-181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 939 for generator 21. -/
def ep_Q2_024_partial_21_0939 : Poly :=
[
  term ((-362284247913818166067182223900731779716919672252456728 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 939 for generator 21. -/
theorem ep_Q2_024_partial_21_0939_valid :
    mulPoly ep_Q2_024_coefficient_21_0939
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0939 := by
  native_decide

/-- Coefficient term 940 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0940 : Poly :=
[
  term ((751294408028112 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 940 for generator 21. -/
def ep_Q2_024_partial_21_0940 : Poly :=
[
  term ((1502588816056224 : Rat) / 1162780221153193) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-751294408028112 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 940 for generator 21. -/
theorem ep_Q2_024_partial_21_0940_valid :
    mulPoly ep_Q2_024_coefficient_21_0940
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0940 := by
  native_decide

/-- Coefficient term 941 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0941 : Poly :=
[
  term ((3992767850510899949397909775174180174348 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (12, 1)]
]

/-- Partial product 941 for generator 21. -/
def ep_Q2_024_partial_21_0941 : Poly :=
[
  term ((7985535701021799898795819550348360348696 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (10, 1), (12, 1)],
  term ((-3992767850510899949397909775174180174348 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 941 for generator 21. -/
theorem ep_Q2_024_partial_21_0941_valid :
    mulPoly ep_Q2_024_coefficient_21_0941
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0941 := by
  native_decide

/-- Coefficient term 942 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0942 : Poly :=
[
  term ((-67256707330206961460045731779826817336 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (10, 1), (13, 1)]
]

/-- Partial product 942 for generator 21. -/
def ep_Q2_024_partial_21_0942 : Poly :=
[
  term ((67256707330206961460045731779826817336 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (10, 1), (13, 1)],
  term ((-134513414660413922920091463559653634672 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 942 for generator 21. -/
theorem ep_Q2_024_partial_21_0942_valid :
    mulPoly ep_Q2_024_coefficient_21_0942
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0942 := by
  native_decide

/-- Coefficient term 943 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0943 : Poly :=
[
  term ((5615162933473648375120314597520139357719412890664605124 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 2), (10, 1), (15, 1)]
]

/-- Partial product 943 for generator 21. -/
def ep_Q2_024_partial_21_0943 : Poly :=
[
  term ((-5615162933473648375120314597520139357719412890664605124 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 2), (10, 1), (15, 1)],
  term ((11230325866947296750240629195040278715438825781329210248 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 2), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 943 for generator 21. -/
theorem ep_Q2_024_partial_21_0943_valid :
    mulPoly ep_Q2_024_coefficient_21_0943
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0943 := by
  native_decide

/-- Coefficient term 944 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0944 : Poly :=
[
  term ((958235945051344 : Rat) / 1162780221153193) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 944 for generator 21. -/
def ep_Q2_024_partial_21_0944 : Poly :=
[
  term ((-958235945051344 : Rat) / 1162780221153193) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((1916471890102688 : Rat) / 1162780221153193) [(5, 1), (9, 2), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 944 for generator 21. -/
theorem ep_Q2_024_partial_21_0944_valid :
    mulPoly ep_Q2_024_coefficient_21_0944
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0944 := by
  native_decide

/-- Coefficient term 945 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0945 : Poly :=
[
  term ((-4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 2), (11, 1), (12, 1)]
]

/-- Partial product 945 for generator 21. -/
def ep_Q2_024_partial_21_0945 : Poly :=
[
  term ((-8106674556350821614499410747889522520 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 1)],
  term ((4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 945 for generator 21. -/
theorem ep_Q2_024_partial_21_0945_valid :
    mulPoly ep_Q2_024_coefficient_21_0945
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0945 := by
  native_decide

/-- Coefficient term 946 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0946 : Poly :=
[
  term ((-33628353665103480730022865889913408668 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (13, 1)]
]

/-- Partial product 946 for generator 21. -/
def ep_Q2_024_partial_21_0946 : Poly :=
[
  term ((-67256707330206961460045731779826817336 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (10, 1), (13, 1)],
  term ((33628353665103480730022865889913408668 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 946 for generator 21. -/
theorem ep_Q2_024_partial_21_0946_valid :
    mulPoly ep_Q2_024_coefficient_21_0946
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0946 := by
  native_decide

/-- Coefficient term 947 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0947 : Poly :=
[
  term ((2807581466736824187560157298760069678859706445332302562 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 2), (15, 1)]
]

/-- Partial product 947 for generator 21. -/
def ep_Q2_024_partial_21_0947 : Poly :=
[
  term ((5615162933473648375120314597520139357719412890664605124 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 2), (10, 1), (15, 1)],
  term ((-2807581466736824187560157298760069678859706445332302562 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 947 for generator 21. -/
theorem ep_Q2_024_partial_21_0947_valid :
    mulPoly ep_Q2_024_coefficient_21_0947
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0947 := by
  native_decide

/-- Coefficient term 948 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0948 : Poly :=
[
  term ((479117972525672 : Rat) / 1162780221153193) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 948 for generator 21. -/
def ep_Q2_024_partial_21_0948 : Poly :=
[
  term ((958235945051344 : Rat) / 1162780221153193) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-479117972525672 : Rat) / 1162780221153193) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 948 for generator 21. -/
theorem ep_Q2_024_partial_21_0948_valid :
    mulPoly ep_Q2_024_coefficient_21_0948
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0948 := by
  native_decide

/-- Coefficient term 949 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0949 : Poly :=
[
  term ((-27024326824335335761531866471438471998 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 3)]
]

/-- Partial product 949 for generator 21. -/
def ep_Q2_024_partial_21_0949 : Poly :=
[
  term ((27024326824335335761531866471438471998 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 3)],
  term ((-54048653648670671523063732942876943996 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 3), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 949 for generator 21. -/
theorem ep_Q2_024_partial_21_0949_valid :
    mulPoly ep_Q2_024_coefficient_21_0949
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0949 := by
  native_decide

/-- Coefficient term 950 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0950 : Poly :=
[
  term ((-54048653648670671523063732942876943996 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 3), (10, 1)]
]

/-- Partial product 950 for generator 21. -/
def ep_Q2_024_partial_21_0950 : Poly :=
[
  term ((54048653648670671523063732942876943996 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 3), (10, 1)],
  term ((-108097307297341343046127465885753887992 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 3), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 950 for generator 21. -/
theorem ep_Q2_024_partial_21_0950_valid :
    mulPoly ep_Q2_024_coefficient_21_0950
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0950 := by
  native_decide

/-- Coefficient term 951 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0951 : Poly :=
[
  term ((-7113448570382486634585561621360051752 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 951 for generator 21. -/
def ep_Q2_024_partial_21_0951 : Poly :=
[
  term ((-14226897140764973269171123242720103504 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (10, 1), (12, 1), (13, 1)],
  term ((7113448570382486634585561621360051752 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 951 for generator 21. -/
theorem ep_Q2_024_partial_21_0951_valid :
    mulPoly ep_Q2_024_coefficient_21_0951
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0951 := by
  native_decide

/-- Coefficient term 952 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0952 : Poly :=
[
  term ((-1060843780828011690178037117696406736 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 952 for generator 21. -/
def ep_Q2_024_partial_21_0952 : Poly :=
[
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((1060843780828011690178037117696406736 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 952 for generator 21. -/
theorem ep_Q2_024_partial_21_0952_valid :
    mulPoly ep_Q2_024_coefficient_21_0952
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0952 := by
  native_decide

/-- Coefficient term 953 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0953 : Poly :=
[
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 953 for generator 21. -/
def ep_Q2_024_partial_21_0953 : Poly :=
[
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 953 for generator 21. -/
theorem ep_Q2_024_partial_21_0953_valid :
    mulPoly ep_Q2_024_coefficient_21_0953
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0953 := by
  native_decide

/-- Coefficient term 954 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0954 : Poly :=
[
  term ((-208491935260238 : Rat) / 1162780221153193) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 954 for generator 21. -/
def ep_Q2_024_partial_21_0954 : Poly :=
[
  term ((-416983870520476 : Rat) / 1162780221153193) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((208491935260238 : Rat) / 1162780221153193) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 954 for generator 21. -/
theorem ep_Q2_024_partial_21_0954_valid :
    mulPoly ep_Q2_024_coefficient_21_0954
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0954 := by
  native_decide

/-- Coefficient term 955 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0955 : Poly :=
[
  term ((-184744853828697913697888159497283137409990300367651351 : Rat) / 92999895213201981850477343083626589746734642324746138) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 955 for generator 21. -/
def ep_Q2_024_partial_21_0955 : Poly :=
[
  term ((-184744853828697913697888159497283137409990300367651351 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (10, 1), (12, 1), (15, 1)],
  term ((184744853828697913697888159497283137409990300367651351 : Rat) / 92999895213201981850477343083626589746734642324746138) [(5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 955 for generator 21. -/
theorem ep_Q2_024_partial_21_0955_valid :
    mulPoly ep_Q2_024_coefficient_21_0955
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0955 := by
  native_decide

/-- Coefficient term 956 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0956 : Poly :=
[
  term ((89752913403374 : Rat) / 1162780221153193) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 956 for generator 21. -/
def ep_Q2_024_partial_21_0956 : Poly :=
[
  term ((179505826806748 : Rat) / 1162780221153193) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-89752913403374 : Rat) / 1162780221153193) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 956 for generator 21. -/
theorem ep_Q2_024_partial_21_0956_valid :
    mulPoly ep_Q2_024_coefficient_21_0956
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0956 := by
  native_decide

/-- Coefficient term 957 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0957 : Poly :=
[
  term ((58584860508959984548273744671715578336 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (12, 2), (13, 1)]
]

/-- Partial product 957 for generator 21. -/
def ep_Q2_024_partial_21_0957 : Poly :=
[
  term ((117169721017919969096547489343431156672 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (10, 1), (12, 2), (13, 1)],
  term ((-58584860508959984548273744671715578336 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 957 for generator 21. -/
theorem ep_Q2_024_partial_21_0957_valid :
    mulPoly ep_Q2_024_coefficient_21_0957
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0957 := by
  native_decide

/-- Coefficient term 958 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0958 : Poly :=
[
  term ((-5396288850334692873317446482465112039389870266563526977 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (12, 2), (15, 1)]
]

/-- Partial product 958 for generator 21. -/
def ep_Q2_024_partial_21_0958 : Poly :=
[
  term ((-10792577700669385746634892964930224078779740533127053954 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (10, 1), (12, 2), (15, 1)],
  term ((5396288850334692873317446482465112039389870266563526977 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 958 for generator 21. -/
theorem ep_Q2_024_partial_21_0958_valid :
    mulPoly ep_Q2_024_coefficient_21_0958
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0958 := by
  native_decide

/-- Coefficient term 959 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0959 : Poly :=
[
  term ((1547430374826924 : Rat) / 1162780221153193) [(5, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 959 for generator 21. -/
def ep_Q2_024_partial_21_0959 : Poly :=
[
  term ((3094860749653848 : Rat) / 1162780221153193) [(5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1547430374826924 : Rat) / 1162780221153193) [(5, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 959 for generator 21. -/
theorem ep_Q2_024_partial_21_0959_valid :
    mulPoly ep_Q2_024_coefficient_21_0959
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0959 := by
  native_decide

/-- Coefficient term 960 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0960 : Poly :=
[
  term ((-108142889876027042198777022484642450168 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (8, 1), (9, 1)]
]

/-- Partial product 960 for generator 21. -/
def ep_Q2_024_partial_21_0960 : Poly :=
[
  term ((108142889876027042198777022484642450168 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (8, 1), (9, 1)],
  term ((-216285779752054084397554044969284900336 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (8, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 960 for generator 21. -/
theorem ep_Q2_024_partial_21_0960_valid :
    mulPoly ep_Q2_024_coefficient_21_0960
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0960 := by
  native_decide

/-- Coefficient term 961 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0961 : Poly :=
[
  term ((709142227526871057093496069349195019754 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (9, 1), (12, 1)]
]

/-- Partial product 961 for generator 21. -/
def ep_Q2_024_partial_21_0961 : Poly :=
[
  term ((1418284455053742114186992138698390039508 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((-709142227526871057093496069349195019754 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 961 for generator 21. -/
theorem ep_Q2_024_partial_21_0961_valid :
    mulPoly ep_Q2_024_coefficient_21_0961
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0961 := by
  native_decide

/-- Coefficient term 962 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0962 : Poly :=
[
  term ((-676213086050591368592897368991884456 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (8, 1), (9, 1), (14, 1)]
]

/-- Partial product 962 for generator 21. -/
def ep_Q2_024_partial_21_0962 : Poly :=
[
  term ((-1352426172101182737185794737983768912 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((676213086050591368592897368991884456 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (8, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 962 for generator 21. -/
theorem ep_Q2_024_partial_21_0962_valid :
    mulPoly ep_Q2_024_coefficient_21_0962
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0962 := by
  native_decide

/-- Coefficient term 963 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0963 : Poly :=
[
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (8, 1), (11, 1)]
]

/-- Partial product 963 for generator 21. -/
def ep_Q2_024_partial_21_0963 : Poly :=
[
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 963 for generator 21. -/
theorem ep_Q2_024_partial_21_0963_valid :
    mulPoly ep_Q2_024_coefficient_21_0963
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0963 := by
  native_decide

/-- Coefficient term 964 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0964 : Poly :=
[
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 964 for generator 21. -/
def ep_Q2_024_partial_21_0964 : Poly :=
[
  term ((174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 964 for generator 21. -/
theorem ep_Q2_024_partial_21_0964_valid :
    mulPoly ep_Q2_024_coefficient_21_0964
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0964 := by
  native_decide

/-- Coefficient term 965 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0965 : Poly :=
[
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 965 for generator 21. -/
def ep_Q2_024_partial_21_0965 : Poly :=
[
  term ((16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 965 for generator 21. -/
theorem ep_Q2_024_partial_21_0965_valid :
    mulPoly ep_Q2_024_coefficient_21_0965
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0965 := by
  native_decide

/-- Coefficient term 966 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0966 : Poly :=
[
  term ((57972216906980 : Rat) / 1162780221153193) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 966 for generator 21. -/
def ep_Q2_024_partial_21_0966 : Poly :=
[
  term ((115944433813960 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 966 for generator 21. -/
theorem ep_Q2_024_partial_21_0966_valid :
    mulPoly ep_Q2_024_coefficient_21_0966
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0966 := by
  native_decide

/-- Coefficient term 967 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0967 : Poly :=
[
  term ((-81730976694291241886439722037607501898 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 967 for generator 21. -/
def ep_Q2_024_partial_21_0967 : Poly :=
[
  term ((-163461953388582483772879444075215003796 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((81730976694291241886439722037607501898 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (8, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 967 for generator 21. -/
theorem ep_Q2_024_partial_21_0967_valid :
    mulPoly ep_Q2_024_coefficient_21_0967
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0967 := by
  native_decide

/-- Coefficient term 968 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0968 : Poly :=
[
  term ((-51740090026032145735973014812320781808 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 968 for generator 21. -/
def ep_Q2_024_partial_21_0968 : Poly :=
[
  term ((-103480180052064291471946029624641563616 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((51740090026032145735973014812320781808 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 968 for generator 21. -/
theorem ep_Q2_024_partial_21_0968_valid :
    mulPoly ep_Q2_024_coefficient_21_0968
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0968 := by
  native_decide

/-- Coefficient term 969 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0969 : Poly :=
[
  term ((6954791040655159872333137773074190517658106839433947733 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 969 for generator 21. -/
def ep_Q2_024_partial_21_0969 : Poly :=
[
  term ((13909582081310319744666275546148381035316213678867895466 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-6954791040655159872333137773074190517658106839433947733 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 969 for generator 21. -/
theorem ep_Q2_024_partial_21_0969_valid :
    mulPoly ep_Q2_024_coefficient_21_0969
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0969 := by
  native_decide

/-- Coefficient term 970 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0970 : Poly :=
[
  term ((-2595156029826876 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 970 for generator 21. -/
def ep_Q2_024_partial_21_0970 : Poly :=
[
  term ((-5190312059653752 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2595156029826876 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 970 for generator 21. -/
theorem ep_Q2_024_partial_21_0970_valid :
    mulPoly ep_Q2_024_coefficient_21_0970
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0970 := by
  native_decide

/-- Coefficient term 971 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0971 : Poly :=
[
  term ((-64969775860595452199616527648191718688832709263523546999 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 971 for generator 21. -/
def ep_Q2_024_partial_21_0971 : Poly :=
[
  term ((-64969775860595452199616527648191718688832709263523546999 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((64969775860595452199616527648191718688832709263523546999 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 971 for generator 21. -/
theorem ep_Q2_024_partial_21_0971_valid :
    mulPoly ep_Q2_024_coefficient_21_0971
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0971 := by
  native_decide

/-- Coefficient term 972 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0972 : Poly :=
[
  term ((-3983788675240561 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 972 for generator 21. -/
def ep_Q2_024_partial_21_0972 : Poly :=
[
  term ((-7967577350481122 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((3983788675240561 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 972 for generator 21. -/
theorem ep_Q2_024_partial_21_0972_valid :
    mulPoly ep_Q2_024_coefficient_21_0972
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0972 := by
  native_decide

/-- Coefficient term 973 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0973 : Poly :=
[
  term ((602250474567464162959958800176093816604 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (12, 2), (13, 1)]
]

/-- Partial product 973 for generator 21. -/
def ep_Q2_024_partial_21_0973 : Poly :=
[
  term ((1204500949134928325919917600352187633208 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (10, 1), (12, 2), (13, 1)],
  term ((-602250474567464162959958800176093816604 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 973 for generator 21. -/
theorem ep_Q2_024_partial_21_0973_valid :
    mulPoly ep_Q2_024_coefficient_21_0973
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0973 := by
  native_decide

/-- Coefficient term 974 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0974 : Poly :=
[
  term ((-4373283040555244735964336602921559704927312631246897239 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (8, 1), (12, 2), (15, 1)]
]

/-- Partial product 974 for generator 21. -/
def ep_Q2_024_partial_21_0974 : Poly :=
[
  term ((-4373283040555244735964336602921559704927312631246897239 : Rat) / 92999895213201981850477343083626589746734642324746138) [(7, 1), (8, 1), (10, 1), (12, 2), (15, 1)],
  term ((4373283040555244735964336602921559704927312631246897239 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (8, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 974 for generator 21. -/
theorem ep_Q2_024_partial_21_0974_valid :
    mulPoly ep_Q2_024_coefficient_21_0974
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0974 := by
  native_decide

/-- Coefficient term 975 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0975 : Poly :=
[
  term ((4473006499520779 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 975 for generator 21. -/
def ep_Q2_024_partial_21_0975 : Poly :=
[
  term ((8946012999041558 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4473006499520779 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 975 for generator 21. -/
theorem ep_Q2_024_partial_21_0975_valid :
    mulPoly ep_Q2_024_coefficient_21_0975
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0975 := by
  native_decide

/-- Coefficient term 976 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0976 : Poly :=
[
  term ((1757859671793049639944581167197024069376 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 976 for generator 21. -/
def ep_Q2_024_partial_21_0976 : Poly :=
[
  term ((3515719343586099279889162334394048138752 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-1757859671793049639944581167197024069376 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 976 for generator 21. -/
theorem ep_Q2_024_partial_21_0976_valid :
    mulPoly ep_Q2_024_coefficient_21_0976
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0976 := by
  native_decide

/-- Coefficient term 977 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0977 : Poly :=
[
  term ((-8141645059018279550062865804762825616 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 977 for generator 21. -/
def ep_Q2_024_partial_21_0977 : Poly :=
[
  term ((-16283290118036559100125731609525651232 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((8141645059018279550062865804762825616 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 977 for generator 21. -/
theorem ep_Q2_024_partial_21_0977_valid :
    mulPoly ep_Q2_024_coefficient_21_0977
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0977 := by
  native_decide

/-- Coefficient term 978 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0978 : Poly :=
[
  term ((-12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (13, 1), (14, 2)]
]

/-- Partial product 978 for generator 21. -/
def ep_Q2_024_partial_21_0978 : Poly :=
[
  term ((-25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 2)],
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 978 for generator 21. -/
theorem ep_Q2_024_partial_21_0978_valid :
    mulPoly ep_Q2_024_coefficient_21_0978
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0978 := by
  native_decide

/-- Coefficient term 979 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0979 : Poly :=
[
  term ((918563172225295011246949470175160100295167296238870824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 979 for generator 21. -/
def ep_Q2_024_partial_21_0979 : Poly :=
[
  term ((1837126344450590022493898940350320200590334592477741648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-918563172225295011246949470175160100295167296238870824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (8, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 979 for generator 21. -/
theorem ep_Q2_024_partial_21_0979_valid :
    mulPoly ep_Q2_024_coefficient_21_0979
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0979 := by
  native_decide

/-- Coefficient term 980 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0980 : Poly :=
[
  term ((-799980240156864 : Rat) / 1162780221153193) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 980 for generator 21. -/
def ep_Q2_024_partial_21_0980 : Poly :=
[
  term ((-1599960480313728 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((799980240156864 : Rat) / 1162780221153193) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 980 for generator 21. -/
theorem ep_Q2_024_partial_21_0980_valid :
    mulPoly ep_Q2_024_coefficient_21_0980
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0980 := by
  native_decide

/-- Coefficient term 981 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0981 : Poly :=
[
  term ((9557471666663685775714840411621758048 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (13, 2), (15, 1)]
]

/-- Partial product 981 for generator 21. -/
def ep_Q2_024_partial_21_0981 : Poly :=
[
  term ((19114943333327371551429680823243516096 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (10, 1), (13, 2), (15, 1)],
  term ((-9557471666663685775714840411621758048 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 981 for generator 21. -/
theorem ep_Q2_024_partial_21_0981_valid :
    mulPoly ep_Q2_024_coefficient_21_0981
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0981 := by
  native_decide

/-- Coefficient term 982 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0982 : Poly :=
[
  term ((53824762600716421491094410962189703401457332436241210747 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 982 for generator 21. -/
def ep_Q2_024_partial_21_0982 : Poly :=
[
  term ((53824762600716421491094410962189703401457332436241210747 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-53824762600716421491094410962189703401457332436241210747 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 982 for generator 21. -/
theorem ep_Q2_024_partial_21_0982_valid :
    mulPoly ep_Q2_024_coefficient_21_0982
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0982 := by
  native_decide

/-- Coefficient term 983 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0983 : Poly :=
[
  term ((-3756917212699698 : Rat) / 1162780221153193) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 983 for generator 21. -/
def ep_Q2_024_partial_21_0983 : Poly :=
[
  term ((-7513834425399396 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((3756917212699698 : Rat) / 1162780221153193) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 983 for generator 21. -/
theorem ep_Q2_024_partial_21_0983_valid :
    mulPoly ep_Q2_024_coefficient_21_0983
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0983 := by
  native_decide

/-- Coefficient term 984 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0984 : Poly :=
[
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (14, 2), (15, 1)]
]

/-- Partial product 984 for generator 21. -/
def ep_Q2_024_partial_21_0984 : Poly :=
[
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 984 for generator 21. -/
theorem ep_Q2_024_partial_21_0984_valid :
    mulPoly ep_Q2_024_coefficient_21_0984
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0984 := by
  native_decide

/-- Coefficient term 985 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0985 : Poly :=
[
  term ((312276948646616 : Rat) / 1162780221153193) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 985 for generator 21. -/
def ep_Q2_024_partial_21_0985 : Poly :=
[
  term ((624553897293232 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 985 for generator 21. -/
theorem ep_Q2_024_partial_21_0985_valid :
    mulPoly ep_Q2_024_coefficient_21_0985
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0985 := by
  native_decide

/-- Coefficient term 986 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0986 : Poly :=
[
  term ((-459605872589467395132898205219008568350671210667963567157 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 986 for generator 21. -/
def ep_Q2_024_partial_21_0986 : Poly :=
[
  term ((-459605872589467395132898205219008568350671210667963567157 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((459605872589467395132898205219008568350671210667963567157 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 986 for generator 21. -/
theorem ep_Q2_024_partial_21_0986_valid :
    mulPoly ep_Q2_024_coefficient_21_0986
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0986 := by
  native_decide

/-- Coefficient term 987 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0987 : Poly :=
[
  term ((8238281905398233 : Rat) / 2325560442306386) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 987 for generator 21. -/
def ep_Q2_024_partial_21_0987 : Poly :=
[
  term ((8238281905398233 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8238281905398233 : Rat) / 2325560442306386) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 987 for generator 21. -/
theorem ep_Q2_024_partial_21_0987_valid :
    mulPoly ep_Q2_024_coefficient_21_0987
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0987 := by
  native_decide

/-- Coefficient term 988 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0988 : Poly :=
[
  term ((329622572685935617396589637795597603421187700410314534 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (8, 1), (15, 3)]
]

/-- Partial product 988 for generator 21. -/
def ep_Q2_024_partial_21_0988 : Poly :=
[
  term ((659245145371871234793179275591195206842375400820629068 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (8, 1), (10, 1), (15, 3)],
  term ((-329622572685935617396589637795597603421187700410314534 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 988 for generator 21. -/
theorem ep_Q2_024_partial_21_0988_valid :
    mulPoly ep_Q2_024_coefficient_21_0988
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0988 := by
  native_decide

/-- Coefficient term 989 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0989 : Poly :=
[
  term ((-136850605782984 : Rat) / 1162780221153193) [(7, 1), (8, 1), (15, 3), (16, 1)]
]

/-- Partial product 989 for generator 21. -/
def ep_Q2_024_partial_21_0989 : Poly :=
[
  term ((-273701211565968 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((136850605782984 : Rat) / 1162780221153193) [(7, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 989 for generator 21. -/
theorem ep_Q2_024_partial_21_0989_valid :
    mulPoly ep_Q2_024_coefficient_21_0989
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0989 := by
  native_decide

/-- Coefficient term 990 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0990 : Poly :=
[
  term ((-1225265322114654679026622704559141817402 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (9, 1)]
]

/-- Partial product 990 for generator 21. -/
def ep_Q2_024_partial_21_0990 : Poly :=
[
  term ((1225265322114654679026622704559141817402 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (9, 1)],
  term ((-2450530644229309358053245409118283634804 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 990 for generator 21. -/
theorem ep_Q2_024_partial_21_0990_valid :
    mulPoly ep_Q2_024_coefficient_21_0990
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0990 := by
  native_decide

/-- Coefficient term 991 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0991 : Poly :=
[
  term ((-25298165874506516766865488992203696292 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 2), (12, 1), (13, 1)]
]

/-- Partial product 991 for generator 21. -/
def ep_Q2_024_partial_21_0991 : Poly :=
[
  term ((-50596331749013033533730977984407392584 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 2), (10, 1), (12, 1), (13, 1)],
  term ((25298165874506516766865488992203696292 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 991 for generator 21. -/
theorem ep_Q2_024_partial_21_0991_valid :
    mulPoly ep_Q2_024_coefficient_21_0991
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0991 := by
  native_decide

/-- Coefficient term 992 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0992 : Poly :=
[
  term ((4678910223116561885498892093094954879251581098910006897 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (8, 2), (12, 1), (15, 1)]
]

/-- Partial product 992 for generator 21. -/
def ep_Q2_024_partial_21_0992 : Poly :=
[
  term ((4678910223116561885498892093094954879251581098910006897 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (8, 2), (10, 1), (12, 1), (15, 1)],
  term ((-4678910223116561885498892093094954879251581098910006897 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (8, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 992 for generator 21. -/
theorem ep_Q2_024_partial_21_0992_valid :
    mulPoly ep_Q2_024_coefficient_21_0992
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0992 := by
  native_decide

/-- Coefficient term 993 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0993 : Poly :=
[
  term ((-1146295204983097 : Rat) / 1162780221153193) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 993 for generator 21. -/
def ep_Q2_024_partial_21_0993 : Poly :=
[
  term ((-2292590409966194 : Rat) / 1162780221153193) [(7, 1), (8, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1146295204983097 : Rat) / 1162780221153193) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 993 for generator 21. -/
theorem ep_Q2_024_partial_21_0993_valid :
    mulPoly ep_Q2_024_coefficient_21_0993
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0993 := by
  native_decide

/-- Coefficient term 994 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0994 : Poly :=
[
  term ((84493850184000825786514095782442813484 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 2), (13, 1)]
]

/-- Partial product 994 for generator 21. -/
def ep_Q2_024_partial_21_0994 : Poly :=
[
  term ((168987700368001651573028191564885626968 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 2), (10, 1), (13, 1)],
  term ((-84493850184000825786514095782442813484 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 994 for generator 21. -/
theorem ep_Q2_024_partial_21_0994_valid :
    mulPoly ep_Q2_024_coefficient_21_0994
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0994 := by
  native_decide

/-- Coefficient term 995 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0995 : Poly :=
[
  term ((177146052459990833086843034621145881016452606292749398931 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 1), (8, 2), (15, 1)]
]

/-- Partial product 995 for generator 21. -/
def ep_Q2_024_partial_21_0995 : Poly :=
[
  term ((177146052459990833086843034621145881016452606292749398931 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (8, 2), (10, 1), (15, 1)],
  term ((-177146052459990833086843034621145881016452606292749398931 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 1), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 995 for generator 21. -/
theorem ep_Q2_024_partial_21_0995_valid :
    mulPoly ep_Q2_024_coefficient_21_0995
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0995 := by
  native_decide

/-- Coefficient term 996 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0996 : Poly :=
[
  term ((-1082535559364413 : Rat) / 2325560442306386) [(7, 1), (8, 2), (15, 1), (16, 1)]
]

/-- Partial product 996 for generator 21. -/
def ep_Q2_024_partial_21_0996 : Poly :=
[
  term ((-1082535559364413 : Rat) / 1162780221153193) [(7, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((1082535559364413 : Rat) / 2325560442306386) [(7, 1), (8, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 996 for generator 21. -/
theorem ep_Q2_024_partial_21_0996_valid :
    mulPoly ep_Q2_024_coefficient_21_0996
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0996 := by
  native_decide

/-- Coefficient term 997 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0997 : Poly :=
[
  term ((459611831851322940129223789282031031587 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (12, 1)]
]

/-- Partial product 997 for generator 21. -/
def ep_Q2_024_partial_21_0997 : Poly :=
[
  term ((919223663702645880258447578564062063174 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (10, 1), (12, 1)],
  term ((-459611831851322940129223789282031031587 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 997 for generator 21. -/
theorem ep_Q2_024_partial_21_0997_valid :
    mulPoly ep_Q2_024_coefficient_21_0997
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0997 := by
  native_decide

/-- Coefficient term 998 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0998 : Poly :=
[
  term ((676213086050591368592897368991884456 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 998 for generator 21. -/
def ep_Q2_024_partial_21_0998 : Poly :=
[
  term ((1352426172101182737185794737983768912 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-676213086050591368592897368991884456 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 998 for generator 21. -/
theorem ep_Q2_024_partial_21_0998_valid :
    mulPoly ep_Q2_024_coefficient_21_0998
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0998 := by
  native_decide

/-- Coefficient term 999 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0999 : Poly :=
[
  term ((-3993831043486647702866554363354132024 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (12, 2)]
]

/-- Partial product 999 for generator 21. -/
def ep_Q2_024_partial_21_0999 : Poly :=
[
  term ((-7987662086973295405733108726708264048 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (10, 1), (12, 2)],
  term ((3993831043486647702866554363354132024 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 999 for generator 21. -/
theorem ep_Q2_024_partial_21_0999_valid :
    mulPoly ep_Q2_024_coefficient_21_0999
        ep_Q2_024_generator_21_0900_0999 =
      ep_Q2_024_partial_21_0999 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_21_0900_0999 : List Poly :=
[
  ep_Q2_024_partial_21_0900,
  ep_Q2_024_partial_21_0901,
  ep_Q2_024_partial_21_0902,
  ep_Q2_024_partial_21_0903,
  ep_Q2_024_partial_21_0904,
  ep_Q2_024_partial_21_0905,
  ep_Q2_024_partial_21_0906,
  ep_Q2_024_partial_21_0907,
  ep_Q2_024_partial_21_0908,
  ep_Q2_024_partial_21_0909,
  ep_Q2_024_partial_21_0910,
  ep_Q2_024_partial_21_0911,
  ep_Q2_024_partial_21_0912,
  ep_Q2_024_partial_21_0913,
  ep_Q2_024_partial_21_0914,
  ep_Q2_024_partial_21_0915,
  ep_Q2_024_partial_21_0916,
  ep_Q2_024_partial_21_0917,
  ep_Q2_024_partial_21_0918,
  ep_Q2_024_partial_21_0919,
  ep_Q2_024_partial_21_0920,
  ep_Q2_024_partial_21_0921,
  ep_Q2_024_partial_21_0922,
  ep_Q2_024_partial_21_0923,
  ep_Q2_024_partial_21_0924,
  ep_Q2_024_partial_21_0925,
  ep_Q2_024_partial_21_0926,
  ep_Q2_024_partial_21_0927,
  ep_Q2_024_partial_21_0928,
  ep_Q2_024_partial_21_0929,
  ep_Q2_024_partial_21_0930,
  ep_Q2_024_partial_21_0931,
  ep_Q2_024_partial_21_0932,
  ep_Q2_024_partial_21_0933,
  ep_Q2_024_partial_21_0934,
  ep_Q2_024_partial_21_0935,
  ep_Q2_024_partial_21_0936,
  ep_Q2_024_partial_21_0937,
  ep_Q2_024_partial_21_0938,
  ep_Q2_024_partial_21_0939,
  ep_Q2_024_partial_21_0940,
  ep_Q2_024_partial_21_0941,
  ep_Q2_024_partial_21_0942,
  ep_Q2_024_partial_21_0943,
  ep_Q2_024_partial_21_0944,
  ep_Q2_024_partial_21_0945,
  ep_Q2_024_partial_21_0946,
  ep_Q2_024_partial_21_0947,
  ep_Q2_024_partial_21_0948,
  ep_Q2_024_partial_21_0949,
  ep_Q2_024_partial_21_0950,
  ep_Q2_024_partial_21_0951,
  ep_Q2_024_partial_21_0952,
  ep_Q2_024_partial_21_0953,
  ep_Q2_024_partial_21_0954,
  ep_Q2_024_partial_21_0955,
  ep_Q2_024_partial_21_0956,
  ep_Q2_024_partial_21_0957,
  ep_Q2_024_partial_21_0958,
  ep_Q2_024_partial_21_0959,
  ep_Q2_024_partial_21_0960,
  ep_Q2_024_partial_21_0961,
  ep_Q2_024_partial_21_0962,
  ep_Q2_024_partial_21_0963,
  ep_Q2_024_partial_21_0964,
  ep_Q2_024_partial_21_0965,
  ep_Q2_024_partial_21_0966,
  ep_Q2_024_partial_21_0967,
  ep_Q2_024_partial_21_0968,
  ep_Q2_024_partial_21_0969,
  ep_Q2_024_partial_21_0970,
  ep_Q2_024_partial_21_0971,
  ep_Q2_024_partial_21_0972,
  ep_Q2_024_partial_21_0973,
  ep_Q2_024_partial_21_0974,
  ep_Q2_024_partial_21_0975,
  ep_Q2_024_partial_21_0976,
  ep_Q2_024_partial_21_0977,
  ep_Q2_024_partial_21_0978,
  ep_Q2_024_partial_21_0979,
  ep_Q2_024_partial_21_0980,
  ep_Q2_024_partial_21_0981,
  ep_Q2_024_partial_21_0982,
  ep_Q2_024_partial_21_0983,
  ep_Q2_024_partial_21_0984,
  ep_Q2_024_partial_21_0985,
  ep_Q2_024_partial_21_0986,
  ep_Q2_024_partial_21_0987,
  ep_Q2_024_partial_21_0988,
  ep_Q2_024_partial_21_0989,
  ep_Q2_024_partial_21_0990,
  ep_Q2_024_partial_21_0991,
  ep_Q2_024_partial_21_0992,
  ep_Q2_024_partial_21_0993,
  ep_Q2_024_partial_21_0994,
  ep_Q2_024_partial_21_0995,
  ep_Q2_024_partial_21_0996,
  ep_Q2_024_partial_21_0997,
  ep_Q2_024_partial_21_0998,
  ep_Q2_024_partial_21_0999
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_21_0900_0999 : Poly :=
[
  term ((37027468290491214085744520519374773216 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((731593270332256011062336988295297000850769374952589392 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-928454655481600 : Rat) / 1162780221153193) [(4, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (10, 1), (12, 1)],
  term ((1021289075131334291831933164775608818979043698679391056 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-701705371454528 : Rat) / 1162780221153193) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2147764690357175588149467363101807168 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (10, 1), (12, 1), (13, 2)],
  term ((-365796635166128005531168494147648500425384687476294696 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term ((464227327740800 : Rat) / 1162780221153193) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18513734145245607042872260259687386608 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (10, 1), (13, 2)],
  term ((-18513734145245607042872260259687386608 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (11, 1), (12, 1), (13, 1)],
  term ((-365796635166128005531168494147648500425384687476294696 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((464227327740800 : Rat) / 1162780221153193) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (12, 1)],
  term ((-510644537565667145915966582387804409489521849339695528 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((350852685727264 : Rat) / 1162780221153193) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1073882345178587794074733681550903584 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (12, 1), (13, 2)],
  term ((182898317583064002765584247073824250212692343738147348 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (13, 1), (15, 1)],
  term ((-232113663870400 : Rat) / 1162780221153193) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((9256867072622803521436130129843693304 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (13, 2)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (8, 1)],
  term ((-5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (8, 1), (10, 1)],
  term ((5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (10, 1), (12, 1)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (12, 1)],
  term ((-39356336260818292697062851203095641530 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (9, 1)],
  term ((78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (9, 1), (10, 1)],
  term ((175046787442168030992588517299101247272 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-11230325866947296750240629195040278715438825781329210248 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1916471890102688 : Rat) / 1162780221153193) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8106674556350821614499410747889522520 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((8106674556350821614499410747889522520 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((-87523393721084015496294258649550623636 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((5615162933473648375120314597520139357719412890664605124 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((958235945051344 : Rat) / 1162780221153193) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (9, 1), (12, 1)],
  term ((-4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (9, 1), (14, 1)],
  term ((108097307297341343046127465885753887992 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 2), (10, 1), (11, 1)],
  term ((-54048653648670671523063732942876943996 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 2), (11, 1)],
  term ((-5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (8, 1), (10, 1), (11, 1)],
  term ((362284247913818166067182223900731779716919672252456728 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1502588816056224 : Rat) / 1162780221153193) [(5, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((53633115470366065055858292117804268528 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (10, 1), (11, 1), (13, 2)],
  term ((-70174183777945933983899249824931423824 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((3524835278974134444918599101034272509085746533616583178 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-429739182782136 : Rat) / 1162780221153193) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7132569213481867254933030402282610376288 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (8, 1), (10, 1), (13, 1)],
  term ((158777658849442171787218802118019992112 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((193670115439969813645562885899858386768667374713683385 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1919572686576700 : Rat) / 1162780221153193) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-54805693310089908493956012483267081475473687630831750659 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(5, 1), (8, 1), (10, 1), (15, 1)],
  term ((1731612278146422 : Rat) / 1162780221153193) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (8, 1), (11, 1)],
  term ((-181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((751294408028112 : Rat) / 1162780221153193) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (11, 1), (13, 2)],
  term ((35087091888972966991949624912465711912 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (8, 1), (12, 1), (13, 1)],
  term ((-1762417639487067222459299550517136254542873266808291589 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (12, 1), (15, 1)],
  term ((214869591391068 : Rat) / 1162780221153193) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((3566284606740933627466515201141305188144 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (8, 1), (13, 1)],
  term ((-79388829424721085893609401059009996056 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (13, 1), (14, 1)],
  term ((-193670115439969813645562885899858386768667374713683385 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (8, 1), (14, 1), (15, 1)],
  term ((959786343288350 : Rat) / 1162780221153193) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((54805693310089908493956012483267081475473687630831750659 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(5, 1), (8, 1), (15, 1)],
  term ((-865806139073211 : Rat) / 1162780221153193) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((27024326824335335761531866471438471998 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 2), (9, 1)],
  term ((-54048653648670671523063732942876943996 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 2), (9, 1), (10, 1)],
  term ((-67256707330206961460045731779826817336 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 2), (10, 1), (13, 1)],
  term ((5615162933473648375120314597520139357719412890664605124 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 2), (10, 1), (15, 1)],
  term ((958235945051344 : Rat) / 1162780221153193) [(5, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((33628353665103480730022865889913408668 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 2), (13, 1)],
  term ((-2807581466736824187560157298760069678859706445332302562 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 2), (15, 1)],
  term ((-479117972525672 : Rat) / 1162780221153193) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1)],
  term ((-53633115470366065055858292117804268528 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-362284247913818166067182223900731779716919672252456728 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((1502588816056224 : Rat) / 1162780221153193) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7985535701021799898795819550348360348696 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (10, 1), (12, 1)],
  term ((5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (10, 2)],
  term ((26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-751294408028112 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3992767850510899949397909775174180174348 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (12, 1)],
  term ((-8106674556350821614499410747889522520 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 1)],
  term ((-134513414660413922920091463559653634672 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (10, 2), (13, 1)],
  term ((11230325866947296750240629195040278715438825781329210248 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 2), (10, 2), (15, 1)],
  term ((1916471890102688 : Rat) / 1162780221153193) [(5, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 2), (11, 1), (12, 1)],
  term ((33628353665103480730022865889913408668 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (13, 1)],
  term ((-2807581466736824187560157298760069678859706445332302562 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 2), (15, 1)],
  term ((-479117972525672 : Rat) / 1162780221153193) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((27024326824335335761531866471438471998 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 3)],
  term ((-108097307297341343046127465885753887992 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 3), (10, 2)],
  term ((-14226897140764973269171123242720103504 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (10, 1), (12, 1), (13, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-184744853828697913697888159497283137409990300367651351 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (10, 1), (12, 1), (15, 1)],
  term ((179505826806748 : Rat) / 1162780221153193) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((117169721017919969096547489343431156672 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (10, 1), (12, 2), (13, 1)],
  term ((-10792577700669385746634892964930224078779740533127053954 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (10, 1), (12, 2), (15, 1)],
  term ((3094860749653848 : Rat) / 1162780221153193) [(5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((7113448570382486634585561621360051752 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (12, 1), (13, 1)],
  term ((1060843780828011690178037117696406736 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((208491935260238 : Rat) / 1162780221153193) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((184744853828697913697888159497283137409990300367651351 : Rat) / 92999895213201981850477343083626589746734642324746138) [(5, 1), (12, 1), (15, 1)],
  term ((-89752913403374 : Rat) / 1162780221153193) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-58584860508959984548273744671715578336 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (12, 2), (13, 1)],
  term ((5396288850334692873317446482465112039389870266563526977 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (12, 2), (15, 1)],
  term ((-1547430374826924 : Rat) / 1162780221153193) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((108142889876027042198777022484642450168 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (8, 1), (9, 1)],
  term ((-216285779752054084397554044969284900336 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (8, 1), (9, 1), (10, 1)],
  term ((1418284455053742114186992138698390039508 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((-1352426172101182737185794737983768912 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((-709142227526871057093496069349195019754 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (9, 1), (12, 1)],
  term ((676213086050591368592897368991884456 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (8, 1), (9, 1), (14, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((115944433813960 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-163461953388582483772879444075215003796 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-103480180052064291471946029624641563616 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((13909582081310319744666275546148381035316213678867895466 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5190312059653752 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64969775860595452199616527648191718688832709263523546999 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-7967577350481122 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1204500949134928325919917600352187633208 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (10, 1), (12, 2), (13, 1)],
  term ((-4373283040555244735964336602921559704927312631246897239 : Rat) / 92999895213201981850477343083626589746734642324746138) [(7, 1), (8, 1), (10, 1), (12, 2), (15, 1)],
  term ((8946012999041558 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((3515719343586099279889162334394048138752 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-16283290118036559100125731609525651232 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 2)],
  term ((1837126344450590022493898940350320200590334592477741648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-1599960480313728 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((19114943333327371551429680823243516096 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (10, 1), (13, 2), (15, 1)],
  term ((53824762600716421491094410962189703401457332436241210747 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-7513834425399396 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((624553897293232 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-459605872589467395132898205219008568350671210667963567157 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((8238281905398233 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((659245145371871234793179275591195206842375400820629068 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (8, 1), (10, 1), (15, 3)],
  term ((-273701211565968 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (8, 1), (11, 1)],
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (11, 1), (15, 2)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((81730976694291241886439722037607501898 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (8, 1), (12, 1), (13, 1)],
  term ((51740090026032145735973014812320781808 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-6954791040655159872333137773074190517658106839433947733 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((2595156029826876 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((64969775860595452199616527648191718688832709263523546999 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((3983788675240561 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-602250474567464162959958800176093816604 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (12, 2), (13, 1)],
  term ((4373283040555244735964336602921559704927312631246897239 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (8, 1), (12, 2), (15, 1)],
  term ((-4473006499520779 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1757859671793049639944581167197024069376 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (8, 1), (13, 1)],
  term ((8141645059018279550062865804762825616 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (13, 1), (14, 1)],
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (13, 1), (14, 2)],
  term ((-918563172225295011246949470175160100295167296238870824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (8, 1), (13, 1), (15, 2)],
  term ((799980240156864 : Rat) / 1162780221153193) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9557471666663685775714840411621758048 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (13, 2), (15, 1)],
  term ((-53824762600716421491094410962189703401457332436241210747 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (8, 1), (14, 1), (15, 1)],
  term ((3756917212699698 : Rat) / 1162780221153193) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (14, 2), (15, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((459605872589467395132898205219008568350671210667963567157 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(7, 1), (8, 1), (15, 1)],
  term ((-8238281905398233 : Rat) / 2325560442306386) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-329622572685935617396589637795597603421187700410314534 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (8, 1), (15, 3)],
  term ((136850605782984 : Rat) / 1162780221153193) [(7, 1), (8, 1), (15, 3), (16, 1)],
  term ((1225265322114654679026622704559141817402 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (9, 1)],
  term ((-2450530644229309358053245409118283634804 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (9, 1), (10, 1)],
  term ((-50596331749013033533730977984407392584 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 2), (10, 1), (12, 1), (13, 1)],
  term ((4678910223116561885498892093094954879251581098910006897 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (8, 2), (10, 1), (12, 1), (15, 1)],
  term ((-2292590409966194 : Rat) / 1162780221153193) [(7, 1), (8, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((168987700368001651573028191564885626968 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 2), (10, 1), (13, 1)],
  term ((177146052459990833086843034621145881016452606292749398931 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (8, 2), (10, 1), (15, 1)],
  term ((-1082535559364413 : Rat) / 1162780221153193) [(7, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((25298165874506516766865488992203696292 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 2), (12, 1), (13, 1)],
  term ((-4678910223116561885498892093094954879251581098910006897 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (8, 2), (12, 1), (15, 1)],
  term ((1146295204983097 : Rat) / 1162780221153193) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-84493850184000825786514095782442813484 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 2), (13, 1)],
  term ((-177146052459990833086843034621145881016452606292749398931 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 1), (8, 2), (15, 1)],
  term ((1082535559364413 : Rat) / 2325560442306386) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((919223663702645880258447578564062063174 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (10, 1), (12, 1)],
  term ((1352426172101182737185794737983768912 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-7987662086973295405733108726708264048 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (10, 1), (12, 2)],
  term ((-459611831851322940129223789282031031587 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (12, 1)],
  term ((-676213086050591368592897368991884456 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 1), (12, 1), (14, 1)],
  term ((3993831043486647702866554363354132024 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 900 through 999. -/
theorem ep_Q2_024_block_21_0900_0999_valid :
    checkProductSumEq ep_Q2_024_partials_21_0900_0999
      ep_Q2_024_block_21_0900_0999 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
