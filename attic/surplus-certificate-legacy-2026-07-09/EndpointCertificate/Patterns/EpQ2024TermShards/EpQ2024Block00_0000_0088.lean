/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 0:0-88

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 0 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_00_0000_0088 : Poly :=
[
  term (2 : Rat) [(0, 1), (4, 1)],
  term (2 : Rat) [(1, 1), (5, 1)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0000 : Poly :=
[
  term ((329908071970601275439451126441523362761 : Rat) / 3599128372207431889700080584088617803970) []
]

/-- Partial product 0 for generator 0. -/
def ep_Q2_024_partial_00_0000 : Poly :=
[
  term ((329908071970601275439451126441523362761 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (4, 1)],
  term ((329908071970601275439451126441523362761 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1)],
  term ((-329908071970601275439451126441523362761 : Rat) / 3599128372207431889700080584088617803970) [(4, 2)],
  term ((-329908071970601275439451126441523362761 : Rat) / 3599128372207431889700080584088617803970) [(5, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 0. -/
theorem ep_Q2_024_partial_00_0000_valid :
    mulPoly ep_Q2_024_coefficient_00_0000
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0001 : Poly :=
[
  term ((-18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1)]
]

/-- Partial product 1 for generator 0. -/
def ep_Q2_024_partial_00_0001 : Poly :=
[
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (4, 1), (9, 1)],
  term ((18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 2), (9, 1)],
  term ((18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (9, 1)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 0. -/
theorem ep_Q2_024_partial_00_0001_valid :
    mulPoly ep_Q2_024_coefficient_00_0001
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0002 : Poly :=
[
  term ((-4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (13, 1)]
]

/-- Partial product 2 for generator 0. -/
def ep_Q2_024_partial_00_0002 : Poly :=
[
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (1, 1), (4, 1), (13, 1)],
  term ((4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 2), (13, 1)],
  term ((4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 2), (13, 1)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 2), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 0. -/
theorem ep_Q2_024_partial_00_0002_valid :
    mulPoly ep_Q2_024_coefficient_00_0002
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0003 : Poly :=
[
  term ((1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (15, 1)]
]

/-- Partial product 3 for generator 0. -/
def ep_Q2_024_partial_00_0003 : Poly :=
[
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (1, 1), (4, 1), (15, 1)],
  term ((-1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 2), (15, 1)],
  term ((-1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 2), (15, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 0. -/
theorem ep_Q2_024_partial_00_0003_valid :
    mulPoly ep_Q2_024_coefficient_00_0003
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0004 : Poly :=
[
  term ((427382588269864 : Rat) / 1162780221153193) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 0. -/
def ep_Q2_024_partial_00_0004 : Poly :=
[
  term ((854765176539728 : Rat) / 1162780221153193) [(0, 1), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((-427382588269864 : Rat) / 1162780221153193) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((-427382588269864 : Rat) / 1162780221153193) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(1, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 0. -/
theorem ep_Q2_024_partial_00_0004_valid :
    mulPoly ep_Q2_024_coefficient_00_0004
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0005 : Poly :=
[
  term ((-1209921365001638099368767273200596583971 : Rat) / 1799564186103715944850040292044308901985) [(2, 1)]
]

/-- Partial product 5 for generator 0. -/
def ep_Q2_024_partial_00_0005 : Poly :=
[
  term ((-2419842730003276198737534546401193167942 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (2, 1), (4, 1)],
  term ((-2419842730003276198737534546401193167942 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (5, 1)],
  term ((1209921365001638099368767273200596583971 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (4, 2)],
  term ((1209921365001638099368767273200596583971 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (5, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 0. -/
theorem ep_Q2_024_partial_00_0005_valid :
    mulPoly ep_Q2_024_coefficient_00_0005
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0006 : Poly :=
[
  term ((-46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 6 for generator 0. -/
def ep_Q2_024_partial_00_0006 : Poly :=
[
  term ((-93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1)],
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 2), (13, 1), (15, 1)],
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 0. -/
theorem ep_Q2_024_partial_00_0006_valid :
    mulPoly ep_Q2_024_coefficient_00_0006
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0007 : Poly :=
[
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (15, 2)]
]

/-- Partial product 7 for generator 0. -/
def ep_Q2_024_partial_00_0007 : Poly :=
[
  term ((-8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (2, 1), (4, 1), (15, 2)],
  term ((-8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 1), (5, 1), (15, 2)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (4, 2), (15, 2)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 0. -/
theorem ep_Q2_024_partial_00_0007_valid :
    mulPoly ep_Q2_024_coefficient_00_0007
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0008 : Poly :=
[
  term ((898255108859200 : Rat) / 1162780221153193) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 8 for generator 0. -/
def ep_Q2_024_partial_00_0008 : Poly :=
[
  term ((1796510217718400 : Rat) / 1162780221153193) [(0, 1), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((1796510217718400 : Rat) / 1162780221153193) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(2, 1), (4, 2), (15, 2), (16, 1)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(2, 1), (5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 0. -/
theorem ep_Q2_024_partial_00_0008_valid :
    mulPoly ep_Q2_024_coefficient_00_0008
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0009 : Poly :=
[
  term ((28712178205325458407952328388012090724 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1)]
]

/-- Partial product 9 for generator 0. -/
def ep_Q2_024_partial_00_0009 : Poly :=
[
  term ((57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (5, 1), (8, 1), (9, 1)],
  term ((57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (8, 1), (9, 1)],
  term ((-28712178205325458407952328388012090724 : Rat) / 199951576233746216094448921338256544665) [(4, 2), (5, 1), (8, 1), (9, 1)],
  term ((-28712178205325458407952328388012090724 : Rat) / 199951576233746216094448921338256544665) [(5, 3), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 0. -/
theorem ep_Q2_024_partial_00_0009_valid :
    mulPoly ep_Q2_024_coefficient_00_0009
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0010 : Poly :=
[
  term ((159507479511669304376772657357014241016 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (13, 1)]
]

/-- Partial product 10 for generator 0. -/
def ep_Q2_024_partial_00_0010 : Poly :=
[
  term ((319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (5, 1), (8, 1), (13, 1)],
  term ((319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (8, 1), (13, 1)],
  term ((-159507479511669304376772657357014241016 : Rat) / 599854728701238648283346764014769633995) [(4, 2), (5, 1), (8, 1), (13, 1)],
  term ((-159507479511669304376772657357014241016 : Rat) / 599854728701238648283346764014769633995) [(5, 3), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 0. -/
theorem ep_Q2_024_partial_00_0010_valid :
    mulPoly ep_Q2_024_coefficient_00_0010
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0011 : Poly :=
[
  term ((305645220242408885625268463091545324188293793650969449 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 11 for generator 0. -/
def ep_Q2_024_partial_00_0011 : Poly :=
[
  term ((611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (4, 1), (5, 1), (8, 1), (15, 1)],
  term ((611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (8, 1), (15, 1)],
  term ((-305645220242408885625268463091545324188293793650969449 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 2), (5, 1), (8, 1), (15, 1)],
  term ((-305645220242408885625268463091545324188293793650969449 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 3), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 0. -/
theorem ep_Q2_024_partial_00_0011_valid :
    mulPoly ep_Q2_024_coefficient_00_0011
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0012 : Poly :=
[
  term ((-1284301030622644 : Rat) / 1162780221153193) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 0. -/
def ep_Q2_024_partial_00_0012 : Poly :=
[
  term ((-2568602061245288 : Rat) / 1162780221153193) [(0, 1), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2568602061245288 : Rat) / 1162780221153193) [(1, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((1284301030622644 : Rat) / 1162780221153193) [(4, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((1284301030622644 : Rat) / 1162780221153193) [(5, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 0. -/
theorem ep_Q2_024_partial_00_0012_valid :
    mulPoly ep_Q2_024_coefficient_00_0012
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0013 : Poly :=
[
  term ((-28712178205325458407952328388012090724 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (14, 1)]
]

/-- Partial product 13 for generator 0. -/
def ep_Q2_024_partial_00_0013 : Poly :=
[
  term ((-57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (5, 1), (9, 1), (14, 1)],
  term ((-57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (9, 1), (14, 1)],
  term ((28712178205325458407952328388012090724 : Rat) / 199951576233746216094448921338256544665) [(4, 2), (5, 1), (9, 1), (14, 1)],
  term ((28712178205325458407952328388012090724 : Rat) / 199951576233746216094448921338256544665) [(5, 3), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 0. -/
theorem ep_Q2_024_partial_00_0013_valid :
    mulPoly ep_Q2_024_coefficient_00_0013
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0014 : Poly :=
[
  term ((-159507479511669304376772657357014241016 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 14 for generator 0. -/
def ep_Q2_024_partial_00_0014 : Poly :=
[
  term ((-319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (5, 1), (13, 1), (14, 1)],
  term ((-319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (13, 1), (14, 1)],
  term ((159507479511669304376772657357014241016 : Rat) / 599854728701238648283346764014769633995) [(4, 2), (5, 1), (13, 1), (14, 1)],
  term ((159507479511669304376772657357014241016 : Rat) / 599854728701238648283346764014769633995) [(5, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 0. -/
theorem ep_Q2_024_partial_00_0014_valid :
    mulPoly ep_Q2_024_coefficient_00_0014
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0015 : Poly :=
[
  term ((-305645220242408885625268463091545324188293793650969449 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 15 for generator 0. -/
def ep_Q2_024_partial_00_0015 : Poly :=
[
  term ((-611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (4, 1), (5, 1), (14, 1), (15, 1)],
  term ((-611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (14, 1), (15, 1)],
  term ((305645220242408885625268463091545324188293793650969449 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 2), (5, 1), (14, 1), (15, 1)],
  term ((305645220242408885625268463091545324188293793650969449 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 0. -/
theorem ep_Q2_024_partial_00_0015_valid :
    mulPoly ep_Q2_024_coefficient_00_0015
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0016 : Poly :=
[
  term ((1284301030622644 : Rat) / 1162780221153193) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 0. -/
def ep_Q2_024_partial_00_0016 : Poly :=
[
  term ((2568602061245288 : Rat) / 1162780221153193) [(0, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((2568602061245288 : Rat) / 1162780221153193) [(1, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1284301030622644 : Rat) / 1162780221153193) [(4, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1284301030622644 : Rat) / 1162780221153193) [(5, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 0. -/
theorem ep_Q2_024_partial_00_0016_valid :
    mulPoly ep_Q2_024_coefficient_00_0016
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0017 : Poly :=
[
  term ((781230546615652314315611763365815318071 : Rat) / 399903152467492432188897842676513089330) [(8, 1)]
]

/-- Partial product 17 for generator 0. -/
def ep_Q2_024_partial_00_0017 : Poly :=
[
  term ((781230546615652314315611763365815318071 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (8, 1)],
  term ((781230546615652314315611763365815318071 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 1)],
  term ((-781230546615652314315611763365815318071 : Rat) / 399903152467492432188897842676513089330) [(4, 2), (8, 1)],
  term ((-781230546615652314315611763365815318071 : Rat) / 399903152467492432188897842676513089330) [(5, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 0. -/
theorem ep_Q2_024_partial_00_0017_valid :
    mulPoly ep_Q2_024_coefficient_00_0017
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0018 : Poly :=
[
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 18 for generator 0. -/
def ep_Q2_024_partial_00_0018 : Poly :=
[
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(4, 2), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (8, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 0. -/
theorem ep_Q2_024_partial_00_0018_valid :
    mulPoly ep_Q2_024_coefficient_00_0018
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0019 : Poly :=
[
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 19 for generator 0. -/
def ep_Q2_024_partial_00_0019 : Poly :=
[
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(4, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 2), (8, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 0. -/
theorem ep_Q2_024_partial_00_0019_valid :
    mulPoly ep_Q2_024_coefficient_00_0019
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0020 : Poly :=
[
  term ((-425478577289470 : Rat) / 1162780221153193) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 0. -/
def ep_Q2_024_partial_00_0020 : Poly :=
[
  term ((-850957154578940 : Rat) / 1162780221153193) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((425478577289470 : Rat) / 1162780221153193) [(4, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((425478577289470 : Rat) / 1162780221153193) [(5, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 0. -/
theorem ep_Q2_024_partial_00_0020_valid :
    mulPoly ep_Q2_024_coefficient_00_0020
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0021 : Poly :=
[
  term ((783488989698832718869136850903229306364 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 21 for generator 0. -/
def ep_Q2_024_partial_00_0021 : Poly :=
[
  term ((1566977979397665437738273701806458612728 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (8, 1), (9, 1), (13, 1)],
  term ((1566977979397665437738273701806458612728 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1)],
  term ((-783488989698832718869136850903229306364 : Rat) / 199951576233746216094448921338256544665) [(4, 2), (8, 1), (9, 1), (13, 1)],
  term ((-783488989698832718869136850903229306364 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (8, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 0. -/
theorem ep_Q2_024_partial_00_0021_valid :
    mulPoly ep_Q2_024_coefficient_00_0021
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0022 : Poly :=
[
  term ((60014409539569963935744582355375799709409709725627656817 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 22 for generator 0. -/
def ep_Q2_024_partial_00_0022 : Poly :=
[
  term ((60014409539569963935744582355375799709409709725627656817 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((60014409539569963935744582355375799709409709725627656817 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1)],
  term ((-60014409539569963935744582355375799709409709725627656817 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 2), (8, 1), (9, 1), (15, 1)],
  term ((-60014409539569963935744582355375799709409709725627656817 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 2), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 0. -/
theorem ep_Q2_024_partial_00_0022_valid :
    mulPoly ep_Q2_024_coefficient_00_0022
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0023 : Poly :=
[
  term ((-6628550662794570 : Rat) / 1162780221153193) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 0. -/
def ep_Q2_024_partial_00_0023 : Poly :=
[
  term ((-13257101325589140 : Rat) / 1162780221153193) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-13257101325589140 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((6628550662794570 : Rat) / 1162780221153193) [(4, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((6628550662794570 : Rat) / 1162780221153193) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 0. -/
theorem ep_Q2_024_partial_00_0023_valid :
    mulPoly ep_Q2_024_coefficient_00_0023
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0024 : Poly :=
[
  term ((-318448357957218598682654572629196213388 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2)]
]

/-- Partial product 24 for generator 0. -/
def ep_Q2_024_partial_00_0024 : Poly :=
[
  term ((-636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (8, 1), (9, 2)],
  term ((-636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (9, 2)],
  term ((318448357957218598682654572629196213388 : Rat) / 599854728701238648283346764014769633995) [(4, 2), (8, 1), (9, 2)],
  term ((318448357957218598682654572629196213388 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (8, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 0. -/
theorem ep_Q2_024_partial_00_0024_valid :
    mulPoly ep_Q2_024_coefficient_00_0024
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0025 : Poly :=
[
  term ((9243609330048111973130073013258126302 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (12, 1)]
]

/-- Partial product 25 for generator 0. -/
def ep_Q2_024_partial_00_0025 : Poly :=
[
  term ((18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (8, 1), (12, 1)],
  term ((18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 1), (12, 1)],
  term ((-9243609330048111973130073013258126302 : Rat) / 199951576233746216094448921338256544665) [(4, 2), (8, 1), (12, 1)],
  term ((-9243609330048111973130073013258126302 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (8, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 0. -/
theorem ep_Q2_024_partial_00_0025_valid :
    mulPoly ep_Q2_024_coefficient_00_0025
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0026 : Poly :=
[
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 26 for generator 0. -/
def ep_Q2_024_partial_00_0026 : Poly :=
[
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(0, 1), (4, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (5, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(4, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(5, 2), (8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 0. -/
theorem ep_Q2_024_partial_00_0026_valid :
    mulPoly ep_Q2_024_coefficient_00_0026
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0027 : Poly :=
[
  term ((-4569079916135479 : Rat) / 2325560442306386) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 0. -/
def ep_Q2_024_partial_00_0027 : Poly :=
[
  term ((-4569079916135479 : Rat) / 1162780221153193) [(0, 1), (4, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4569079916135479 : Rat) / 2325560442306386) [(4, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4569079916135479 : Rat) / 2325560442306386) [(5, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 0. -/
theorem ep_Q2_024_partial_00_0027_valid :
    mulPoly ep_Q2_024_coefficient_00_0027
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0028 : Poly :=
[
  term ((-349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (12, 1), (13, 2)]
]

/-- Partial product 28 for generator 0. -/
def ep_Q2_024_partial_00_0028 : Poly :=
[
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (8, 1), (12, 1), (13, 2)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (12, 1), (13, 2)],
  term ((349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(4, 2), (8, 1), (12, 1), (13, 2)],
  term ((349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (8, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 0. -/
theorem ep_Q2_024_partial_00_0028_valid :
    mulPoly ep_Q2_024_coefficient_00_0028
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0029 : Poly :=
[
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 29 for generator 0. -/
def ep_Q2_024_partial_00_0029 : Poly :=
[
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (4, 1), (8, 1), (12, 1), (15, 2)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 2)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(4, 2), (8, 1), (12, 1), (15, 2)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(5, 2), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 0. -/
theorem ep_Q2_024_partial_00_0029_valid :
    mulPoly ep_Q2_024_coefficient_00_0029
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0030 : Poly :=
[
  term ((13204414907240807 : Rat) / 2325560442306386) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 30 for generator 0. -/
def ep_Q2_024_partial_00_0030 : Poly :=
[
  term ((13204414907240807 : Rat) / 1162780221153193) [(0, 1), (4, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-13204414907240807 : Rat) / 2325560442306386) [(4, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-13204414907240807 : Rat) / 2325560442306386) [(5, 2), (8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 0. -/
theorem ep_Q2_024_partial_00_0030_valid :
    mulPoly ep_Q2_024_coefficient_00_0030
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0031 : Poly :=
[
  term ((840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 31 for generator 0. -/
def ep_Q2_024_partial_00_0031 : Poly :=
[
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 2), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 2), (8, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 0. -/
theorem ep_Q2_024_partial_00_0031_valid :
    mulPoly ep_Q2_024_coefficient_00_0031
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0032 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 0. -/
def ep_Q2_024_partial_00_0032 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (4, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(5, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 0. -/
theorem ep_Q2_024_partial_00_0032_valid :
    mulPoly ep_Q2_024_coefficient_00_0032
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0033 : Poly :=
[
  term ((-2300293940901617579712204761708815612370321311071652528027 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 33 for generator 0. -/
def ep_Q2_024_partial_00_0033 : Poly :=
[
  term ((-2300293940901617579712204761708815612370321311071652528027 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 1)],
  term ((-2300293940901617579712204761708815612370321311071652528027 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1)],
  term ((2300293940901617579712204761708815612370321311071652528027 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(4, 2), (8, 1), (13, 1), (15, 1)],
  term ((2300293940901617579712204761708815612370321311071652528027 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(5, 2), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 0. -/
theorem ep_Q2_024_partial_00_0033_valid :
    mulPoly ep_Q2_024_coefficient_00_0033
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0034 : Poly :=
[
  term ((-50972133270704143 : Rat) / 13953362653838316) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 0. -/
def ep_Q2_024_partial_00_0034 : Poly :=
[
  term ((-50972133270704143 : Rat) / 6976681326919158) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-50972133270704143 : Rat) / 6976681326919158) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((50972133270704143 : Rat) / 13953362653838316) [(4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((50972133270704143 : Rat) / 13953362653838316) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 0. -/
theorem ep_Q2_024_partial_00_0034_valid :
    mulPoly ep_Q2_024_coefficient_00_0034
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0035 : Poly :=
[
  term ((4206759873271145070426777103445745776 : Rat) / 30501087900062982116102377831259472915) [(8, 1), (13, 2)]
]

/-- Partial product 35 for generator 0. -/
def ep_Q2_024_partial_00_0035 : Poly :=
[
  term ((8413519746542290140853554206891491552 : Rat) / 30501087900062982116102377831259472915) [(0, 1), (4, 1), (8, 1), (13, 2)],
  term ((8413519746542290140853554206891491552 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (5, 1), (8, 1), (13, 2)],
  term ((-4206759873271145070426777103445745776 : Rat) / 30501087900062982116102377831259472915) [(4, 2), (8, 1), (13, 2)],
  term ((-4206759873271145070426777103445745776 : Rat) / 30501087900062982116102377831259472915) [(5, 2), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 0. -/
theorem ep_Q2_024_partial_00_0035_valid :
    mulPoly ep_Q2_024_coefficient_00_0035
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0036 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (13, 2), (14, 1)]
]

/-- Partial product 36 for generator 0. -/
def ep_Q2_024_partial_00_0036 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (8, 1), (13, 2), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (13, 2), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 2), (8, 1), (13, 2), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (8, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 0. -/
theorem ep_Q2_024_partial_00_0036_valid :
    mulPoly ep_Q2_024_coefficient_00_0036
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0037 : Poly :=
[
  term ((4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (14, 1)]
]

/-- Partial product 37 for generator 0. -/
def ep_Q2_024_partial_00_0037 : Poly :=
[
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (8, 1), (14, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 1), (14, 1)],
  term ((-4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(4, 2), (8, 1), (14, 1)],
  term ((-4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 0. -/
theorem ep_Q2_024_partial_00_0037_valid :
    mulPoly ep_Q2_024_coefficient_00_0037
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0038 : Poly :=
[
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(8, 1), (14, 1), (15, 2)]
]

/-- Partial product 38 for generator 0. -/
def ep_Q2_024_partial_00_0038 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (4, 1), (8, 1), (14, 1), (15, 2)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (8, 1), (14, 1), (15, 2)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 2), (8, 1), (14, 1), (15, 2)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 2), (8, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 0. -/
theorem ep_Q2_024_partial_00_0038_valid :
    mulPoly ep_Q2_024_coefficient_00_0038
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0039 : Poly :=
[
  term ((-416983870520476 : Rat) / 1162780221153193) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 39 for generator 0. -/
def ep_Q2_024_partial_00_0039 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (4, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(4, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(5, 2), (8, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 0. -/
theorem ep_Q2_024_partial_00_0039_valid :
    mulPoly ep_Q2_024_coefficient_00_0039
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0040 : Poly :=
[
  term ((170382485865479578859614638254207105010341468316427837427 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(8, 1), (15, 2)]
]

/-- Partial product 40 for generator 0. -/
def ep_Q2_024_partial_00_0040 : Poly :=
[
  term ((170382485865479578859614638254207105010341468316427837427 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (4, 1), (8, 1), (15, 2)],
  term ((170382485865479578859614638254207105010341468316427837427 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (5, 1), (8, 1), (15, 2)],
  term ((-170382485865479578859614638254207105010341468316427837427 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(4, 2), (8, 1), (15, 2)],
  term ((-170382485865479578859614638254207105010341468316427837427 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(5, 2), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 0. -/
theorem ep_Q2_024_partial_00_0040_valid :
    mulPoly ep_Q2_024_coefficient_00_0040
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0041 : Poly :=
[
  term ((18569425277969695 : Rat) / 13953362653838316) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 41 for generator 0. -/
def ep_Q2_024_partial_00_0041 : Poly :=
[
  term ((18569425277969695 : Rat) / 6976681326919158) [(0, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((18569425277969695 : Rat) / 6976681326919158) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-18569425277969695 : Rat) / 13953362653838316) [(4, 2), (8, 1), (15, 2), (16, 1)],
  term ((-18569425277969695 : Rat) / 13953362653838316) [(5, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 0. -/
theorem ep_Q2_024_partial_00_0041_valid :
    mulPoly ep_Q2_024_coefficient_00_0041
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0042 : Poly :=
[
  term ((-39356336260818292697062851203095641530 : Rat) / 39990315246749243218889784267651308933) [(9, 1), (11, 1)]
]

/-- Partial product 42 for generator 0. -/
def ep_Q2_024_partial_00_0042 : Poly :=
[
  term ((-78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (4, 1), (9, 1), (11, 1)],
  term ((-78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (9, 1), (11, 1)],
  term ((39356336260818292697062851203095641530 : Rat) / 39990315246749243218889784267651308933) [(4, 2), (9, 1), (11, 1)],
  term ((39356336260818292697062851203095641530 : Rat) / 39990315246749243218889784267651308933) [(5, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 0. -/
theorem ep_Q2_024_partial_00_0042_valid :
    mulPoly ep_Q2_024_coefficient_00_0042
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0043 : Poly :=
[
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 43 for generator 0. -/
def ep_Q2_024_partial_00_0043 : Poly :=
[
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(4, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 0. -/
theorem ep_Q2_024_partial_00_0043_valid :
    mulPoly ep_Q2_024_coefficient_00_0043
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0044 : Poly :=
[
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 44 for generator 0. -/
def ep_Q2_024_partial_00_0044 : Poly :=
[
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(4, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 2), (9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 0. -/
theorem ep_Q2_024_partial_00_0044_valid :
    mulPoly ep_Q2_024_coefficient_00_0044
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0045 : Poly :=
[
  term ((425478577289470 : Rat) / 1162780221153193) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 0. -/
def ep_Q2_024_partial_00_0045 : Poly :=
[
  term ((850957154578940 : Rat) / 1162780221153193) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-425478577289470 : Rat) / 1162780221153193) [(4, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-425478577289470 : Rat) / 1162780221153193) [(5, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 0. -/
theorem ep_Q2_024_partial_00_0045_valid :
    mulPoly ep_Q2_024_coefficient_00_0045
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0046 : Poly :=
[
  term ((31321264201580177352252398779909111124 : Rat) / 119970945740247729656669352802953926799) [(9, 1), (13, 1)]
]

/-- Partial product 46 for generator 0. -/
def ep_Q2_024_partial_00_0046 : Poly :=
[
  term ((62642528403160354704504797559818222248 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (4, 1), (9, 1), (13, 1)],
  term ((62642528403160354704504797559818222248 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (5, 1), (9, 1), (13, 1)],
  term ((-31321264201580177352252398779909111124 : Rat) / 119970945740247729656669352802953926799) [(4, 2), (9, 1), (13, 1)],
  term ((-31321264201580177352252398779909111124 : Rat) / 119970945740247729656669352802953926799) [(5, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 0. -/
theorem ep_Q2_024_partial_00_0046_valid :
    mulPoly ep_Q2_024_coefficient_00_0046
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0047 : Poly :=
[
  term ((-783488989698832718869136850903229306364 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 47 for generator 0. -/
def ep_Q2_024_partial_00_0047 : Poly :=
[
  term ((-1566977979397665437738273701806458612728 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (9, 1), (13, 1), (14, 1)],
  term ((-1566977979397665437738273701806458612728 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (13, 1), (14, 1)],
  term ((783488989698832718869136850903229306364 : Rat) / 199951576233746216094448921338256544665) [(4, 2), (9, 1), (13, 1), (14, 1)],
  term ((783488989698832718869136850903229306364 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 0. -/
theorem ep_Q2_024_partial_00_0047_valid :
    mulPoly ep_Q2_024_coefficient_00_0047
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0048 : Poly :=
[
  term ((-60014409539569963935744582355375799709409709725627656817 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 48 for generator 0. -/
def ep_Q2_024_partial_00_0048 : Poly :=
[
  term ((-60014409539569963935744582355375799709409709725627656817 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-60014409539569963935744582355375799709409709725627656817 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 1), (14, 1), (15, 1)],
  term ((60014409539569963935744582355375799709409709725627656817 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 2), (9, 1), (14, 1), (15, 1)],
  term ((60014409539569963935744582355375799709409709725627656817 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 2), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 0. -/
theorem ep_Q2_024_partial_00_0048_valid :
    mulPoly ep_Q2_024_coefficient_00_0048
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0049 : Poly :=
[
  term ((6628550662794570 : Rat) / 1162780221153193) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 0. -/
def ep_Q2_024_partial_00_0049 : Poly :=
[
  term ((13257101325589140 : Rat) / 1162780221153193) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((13257101325589140 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6628550662794570 : Rat) / 1162780221153193) [(4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6628550662794570 : Rat) / 1162780221153193) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 0. -/
theorem ep_Q2_024_partial_00_0049_valid :
    mulPoly ep_Q2_024_coefficient_00_0049
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0050 : Poly :=
[
  term ((-815023144475829866126296965819156994569354136024232691 : Rat) / 464999476066009909252386715418132948733673211623730690) [(9, 1), (15, 1)]
]

/-- Partial product 50 for generator 0. -/
def ep_Q2_024_partial_00_0050 : Poly :=
[
  term ((-815023144475829866126296965819156994569354136024232691 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (9, 1), (15, 1)],
  term ((-815023144475829866126296965819156994569354136024232691 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 1), (15, 1)],
  term ((815023144475829866126296965819156994569354136024232691 : Rat) / 464999476066009909252386715418132948733673211623730690) [(4, 2), (9, 1), (15, 1)],
  term ((815023144475829866126296965819156994569354136024232691 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 0. -/
theorem ep_Q2_024_partial_00_0050_valid :
    mulPoly ep_Q2_024_coefficient_00_0050
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0051 : Poly :=
[
  term ((506536062890582 : Rat) / 1162780221153193) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 0. -/
def ep_Q2_024_partial_00_0051 : Poly :=
[
  term ((1013072125781164 : Rat) / 1162780221153193) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((1013072125781164 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-506536062890582 : Rat) / 1162780221153193) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-506536062890582 : Rat) / 1162780221153193) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 0. -/
theorem ep_Q2_024_partial_00_0051_valid :
    mulPoly ep_Q2_024_coefficient_00_0051
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0052 : Poly :=
[
  term ((2534894526234079539431438842570523486 : Rat) / 199951576233746216094448921338256544665) [(9, 2)]
]

/-- Partial product 52 for generator 0. -/
def ep_Q2_024_partial_00_0052 : Poly :=
[
  term ((5069789052468159078862877685141046972 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (9, 2)],
  term ((5069789052468159078862877685141046972 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 2)],
  term ((-2534894526234079539431438842570523486 : Rat) / 199951576233746216094448921338256544665) [(4, 2), (9, 2)],
  term ((-2534894526234079539431438842570523486 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 0. -/
theorem ep_Q2_024_partial_00_0052_valid :
    mulPoly ep_Q2_024_coefficient_00_0052
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0053 : Poly :=
[
  term ((318448357957218598682654572629196213388 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (14, 1)]
]

/-- Partial product 53 for generator 0. -/
def ep_Q2_024_partial_00_0053 : Poly :=
[
  term ((636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (9, 2), (14, 1)],
  term ((636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2), (14, 1)],
  term ((-318448357957218598682654572629196213388 : Rat) / 599854728701238648283346764014769633995) [(4, 2), (9, 2), (14, 1)],
  term ((-318448357957218598682654572629196213388 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 0. -/
theorem ep_Q2_024_partial_00_0053_valid :
    mulPoly ep_Q2_024_coefficient_00_0053
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0054 : Poly :=
[
  term ((92036593164029543330385196269507803232 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 54 for generator 0. -/
def ep_Q2_024_partial_00_0054 : Poly :=
[
  term ((184073186328059086660770392539015606464 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((184073186328059086660770392539015606464 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((-92036593164029543330385196269507803232 : Rat) / 199951576233746216094448921338256544665) [(4, 2), (11, 1), (12, 1), (13, 1)],
  term ((-92036593164029543330385196269507803232 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 0. -/
theorem ep_Q2_024_partial_00_0054_valid :
    mulPoly ep_Q2_024_coefficient_00_0054
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0055 : Poly :=
[
  term ((-7553772572040638365028735010346273333735520864663264858 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 55 for generator 0. -/
def ep_Q2_024_partial_00_0055 : Poly :=
[
  term ((-15107545144081276730057470020692546667471041729326529716 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-15107545144081276730057470020692546667471041729326529716 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((7553772572040638365028735010346273333735520864663264858 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((7553772572040638365028735010346273333735520864663264858 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 0. -/
theorem ep_Q2_024_partial_00_0055_valid :
    mulPoly ep_Q2_024_coefficient_00_0055
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0056 : Poly :=
[
  term ((2162741688518840 : Rat) / 1162780221153193) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 56 for generator 0. -/
def ep_Q2_024_partial_00_0056 : Poly :=
[
  term ((4325483377037680 : Rat) / 1162780221153193) [(0, 1), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4325483377037680 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2162741688518840 : Rat) / 1162780221153193) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2162741688518840 : Rat) / 1162780221153193) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 0. -/
theorem ep_Q2_024_partial_00_0056_valid :
    mulPoly ep_Q2_024_coefficient_00_0056
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0057 : Poly :=
[
  term ((-322754652619014327413904075208344711628 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (13, 1)]
]

/-- Partial product 57 for generator 0. -/
def ep_Q2_024_partial_00_0057 : Poly :=
[
  term ((-645509305238028654827808150416689423256 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (11, 1), (13, 1)],
  term ((-645509305238028654827808150416689423256 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((322754652619014327413904075208344711628 : Rat) / 599854728701238648283346764014769633995) [(4, 2), (11, 1), (13, 1)],
  term ((322754652619014327413904075208344711628 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 0. -/
theorem ep_Q2_024_partial_00_0057_valid :
    mulPoly ep_Q2_024_coefficient_00_0057
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0058 : Poly :=
[
  term ((30267784736447798612613278086015225474391329205534420654 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(11, 1), (15, 1)]
]

/-- Partial product 58 for generator 0. -/
def ep_Q2_024_partial_00_0058 : Poly :=
[
  term ((60535569472895597225226556172030450948782658411068841308 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (4, 1), (11, 1), (15, 1)],
  term ((60535569472895597225226556172030450948782658411068841308 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((-30267784736447798612613278086015225474391329205534420654 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 2), (11, 1), (15, 1)],
  term ((-30267784736447798612613278086015225474391329205534420654 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(5, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 0. -/
theorem ep_Q2_024_partial_00_0058_valid :
    mulPoly ep_Q2_024_coefficient_00_0058
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0059 : Poly :=
[
  term ((-1958137860542752 : Rat) / 1162780221153193) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 59 for generator 0. -/
def ep_Q2_024_partial_00_0059 : Poly :=
[
  term ((-3916275721085504 : Rat) / 1162780221153193) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3916275721085504 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((1958137860542752 : Rat) / 1162780221153193) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((1958137860542752 : Rat) / 1162780221153193) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 0. -/
theorem ep_Q2_024_partial_00_0059_valid :
    mulPoly ep_Q2_024_coefficient_00_0059
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0060 : Poly :=
[
  term ((76584100056116431419179280287954761503 : Rat) / 199951576233746216094448921338256544665) [(12, 1)]
]

/-- Partial product 60 for generator 0. -/
def ep_Q2_024_partial_00_0060 : Poly :=
[
  term ((153168200112232862838358560575909523006 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (12, 1)],
  term ((153168200112232862838358560575909523006 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (12, 1)],
  term ((-76584100056116431419179280287954761503 : Rat) / 199951576233746216094448921338256544665) [(4, 2), (12, 1)],
  term ((-76584100056116431419179280287954761503 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 0. -/
theorem ep_Q2_024_partial_00_0060_valid :
    mulPoly ep_Q2_024_coefficient_00_0060
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0061 : Poly :=
[
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 61 for generator 0. -/
def ep_Q2_024_partial_00_0061 : Poly :=
[
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(0, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(4, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(5, 2), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 0. -/
theorem ep_Q2_024_partial_00_0061_valid :
    mulPoly ep_Q2_024_coefficient_00_0061
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0062 : Poly :=
[
  term ((4569079916135479 : Rat) / 2325560442306386) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 62 for generator 0. -/
def ep_Q2_024_partial_00_0062 : Poly :=
[
  term ((4569079916135479 : Rat) / 1162780221153193) [(0, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4569079916135479 : Rat) / 2325560442306386) [(4, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4569079916135479 : Rat) / 2325560442306386) [(5, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 0. -/
theorem ep_Q2_024_partial_00_0062_valid :
    mulPoly ep_Q2_024_coefficient_00_0062
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0063 : Poly :=
[
  term ((9631682252380296687568063001063658675115658503614812146 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 63 for generator 0. -/
def ep_Q2_024_partial_00_0063 : Poly :=
[
  term ((19263364504760593375136126002127317350231317007229624292 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((19263364504760593375136126002127317350231317007229624292 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((-9631682252380296687568063001063658675115658503614812146 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 2), (12, 1), (13, 1), (15, 1)],
  term ((-9631682252380296687568063001063658675115658503614812146 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 0. -/
theorem ep_Q2_024_partial_00_0063_valid :
    mulPoly ep_Q2_024_coefficient_00_0063
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0064 : Poly :=
[
  term ((-2393155378199320 : Rat) / 1162780221153193) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 64 for generator 0. -/
def ep_Q2_024_partial_00_0064 : Poly :=
[
  term ((-4786310756398640 : Rat) / 1162780221153193) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4786310756398640 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2393155378199320 : Rat) / 1162780221153193) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2393155378199320 : Rat) / 1162780221153193) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 0. -/
theorem ep_Q2_024_partial_00_0064_valid :
    mulPoly ep_Q2_024_coefficient_00_0064
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0065 : Poly :=
[
  term ((-362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(12, 1), (13, 2)]
]

/-- Partial product 65 for generator 0. -/
def ep_Q2_024_partial_00_0065 : Poly :=
[
  term ((-724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (12, 1), (13, 2)],
  term ((-724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (12, 1), (13, 2)],
  term ((362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 2), (12, 1), (13, 2)],
  term ((362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 0. -/
theorem ep_Q2_024_partial_00_0065_valid :
    mulPoly ep_Q2_024_coefficient_00_0065
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0066 : Poly :=
[
  term ((349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(12, 1), (13, 2), (14, 1)]
]

/-- Partial product 66 for generator 0. -/
def ep_Q2_024_partial_00_0066 : Poly :=
[
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (12, 1), (13, 2), (14, 1)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (12, 1), (13, 2), (14, 1)],
  term ((-349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(4, 2), (12, 1), (13, 2), (14, 1)],
  term ((-349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 0. -/
theorem ep_Q2_024_partial_00_0066_valid :
    mulPoly ep_Q2_024_coefficient_00_0066
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0067 : Poly :=
[
  term ((-9243609330048111973130073013258126302 : Rat) / 199951576233746216094448921338256544665) [(12, 1), (14, 1)]
]

/-- Partial product 67 for generator 0. -/
def ep_Q2_024_partial_00_0067 : Poly :=
[
  term ((-18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (12, 1), (14, 1)],
  term ((-18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (12, 1), (14, 1)],
  term ((9243609330048111973130073013258126302 : Rat) / 199951576233746216094448921338256544665) [(4, 2), (12, 1), (14, 1)],
  term ((9243609330048111973130073013258126302 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 0. -/
theorem ep_Q2_024_partial_00_0067_valid :
    mulPoly ep_Q2_024_coefficient_00_0067
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0068 : Poly :=
[
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 68 for generator 0. -/
def ep_Q2_024_partial_00_0068 : Poly :=
[
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (4, 1), (12, 1), (14, 1), (15, 2)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (12, 1), (14, 1), (15, 2)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(4, 2), (12, 1), (14, 1), (15, 2)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(5, 2), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 0. -/
theorem ep_Q2_024_partial_00_0068_valid :
    mulPoly ep_Q2_024_coefficient_00_0068
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0069 : Poly :=
[
  term ((-13204414907240807 : Rat) / 2325560442306386) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 69 for generator 0. -/
def ep_Q2_024_partial_00_0069 : Poly :=
[
  term ((-13204414907240807 : Rat) / 1162780221153193) [(0, 1), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((13204414907240807 : Rat) / 2325560442306386) [(4, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((13204414907240807 : Rat) / 2325560442306386) [(5, 2), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 0. -/
theorem ep_Q2_024_partial_00_0069_valid :
    mulPoly ep_Q2_024_coefficient_00_0069
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0070 : Poly :=
[
  term ((12035429633238567107267073574440394883486006276274071722 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 1), (15, 2)]
]

/-- Partial product 70 for generator 0. -/
def ep_Q2_024_partial_00_0070 : Poly :=
[
  term ((24070859266477134214534147148880789766972012552548143444 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (12, 1), (15, 2)],
  term ((24070859266477134214534147148880789766972012552548143444 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (12, 1), (15, 2)],
  term ((-12035429633238567107267073574440394883486006276274071722 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 2), (12, 1), (15, 2)],
  term ((-12035429633238567107267073574440394883486006276274071722 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 0. -/
theorem ep_Q2_024_partial_00_0070_valid :
    mulPoly ep_Q2_024_coefficient_00_0070
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0071 : Poly :=
[
  term ((-3279710662127160 : Rat) / 1162780221153193) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 71 for generator 0. -/
def ep_Q2_024_partial_00_0071 : Poly :=
[
  term ((-6559421324254320 : Rat) / 1162780221153193) [(0, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-6559421324254320 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((3279710662127160 : Rat) / 1162780221153193) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((3279710662127160 : Rat) / 1162780221153193) [(5, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 0. -/
theorem ep_Q2_024_partial_00_0071_valid :
    mulPoly ep_Q2_024_coefficient_00_0071
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0072 : Poly :=
[
  term ((468388707002765155459744101761589996702808887264153294575 : Rat) / 6695992455350542693234368702021114461764894247381721936) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 72 for generator 0. -/
def ep_Q2_024_partial_00_0072 : Poly :=
[
  term ((468388707002765155459744101761589996702808887264153294575 : Rat) / 3347996227675271346617184351010557230882447123690860968) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((468388707002765155459744101761589996702808887264153294575 : Rat) / 3347996227675271346617184351010557230882447123690860968) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-468388707002765155459744101761589996702808887264153294575 : Rat) / 6695992455350542693234368702021114461764894247381721936) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((-468388707002765155459744101761589996702808887264153294575 : Rat) / 6695992455350542693234368702021114461764894247381721936) [(5, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 0. -/
theorem ep_Q2_024_partial_00_0072_valid :
    mulPoly ep_Q2_024_coefficient_00_0072
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0073 : Poly :=
[
  term ((55975939716949855 : Rat) / 13953362653838316) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 73 for generator 0. -/
def ep_Q2_024_partial_00_0073 : Poly :=
[
  term ((55975939716949855 : Rat) / 6976681326919158) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((55975939716949855 : Rat) / 6976681326919158) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-55975939716949855 : Rat) / 13953362653838316) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-55975939716949855 : Rat) / 13953362653838316) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 0. -/
theorem ep_Q2_024_partial_00_0073_valid :
    mulPoly ep_Q2_024_coefficient_00_0073
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0074 : Poly :=
[
  term ((-840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 74 for generator 0. -/
def ep_Q2_024_partial_00_0074 : Poly :=
[
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1)],
  term ((840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 2), (13, 1), (14, 2), (15, 1)],
  term ((840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 0. -/
theorem ep_Q2_024_partial_00_0074_valid :
    mulPoly ep_Q2_024_coefficient_00_0074
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0075 : Poly :=
[
  term ((-416983870520476 : Rat) / 1162780221153193) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 75 for generator 0. -/
def ep_Q2_024_partial_00_0075 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(4, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(5, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 0. -/
theorem ep_Q2_024_partial_00_0075_valid :
    mulPoly ep_Q2_024_coefficient_00_0075
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0076 : Poly :=
[
  term ((-7686841759851317363938420445725222177184237134054071937 : Rat) / 697499214099014863878580073127199423100509817435596035) [(13, 1), (15, 1)]
]

/-- Partial product 76 for generator 0. -/
def ep_Q2_024_partial_00_0076 : Poly :=
[
  term ((-15373683519702634727876840891450444354368474268108143874 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (13, 1), (15, 1)],
  term ((-15373683519702634727876840891450444354368474268108143874 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((7686841759851317363938420445725222177184237134054071937 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 2), (13, 1), (15, 1)],
  term ((7686841759851317363938420445725222177184237134054071937 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 0. -/
theorem ep_Q2_024_partial_00_0076_valid :
    mulPoly ep_Q2_024_coefficient_00_0076
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0077 : Poly :=
[
  term ((-504060510541316 : Rat) / 1162780221153193) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 77 for generator 0. -/
def ep_Q2_024_partial_00_0077 : Poly :=
[
  term ((-1008121021082632 : Rat) / 1162780221153193) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1008121021082632 : Rat) / 1162780221153193) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((504060510541316 : Rat) / 1162780221153193) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((504060510541316 : Rat) / 1162780221153193) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 0. -/
theorem ep_Q2_024_partial_00_0077_valid :
    mulPoly ep_Q2_024_coefficient_00_0077
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0078 : Poly :=
[
  term ((600868246162518374889934225988414245216 : Rat) / 599854728701238648283346764014769633995) [(13, 2)]
]

/-- Partial product 78 for generator 0. -/
def ep_Q2_024_partial_00_0078 : Poly :=
[
  term ((1201736492325036749779868451976828490432 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (13, 2)],
  term ((1201736492325036749779868451976828490432 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (13, 2)],
  term ((-600868246162518374889934225988414245216 : Rat) / 599854728701238648283346764014769633995) [(4, 2), (13, 2)],
  term ((-600868246162518374889934225988414245216 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 0. -/
theorem ep_Q2_024_partial_00_0078_valid :
    mulPoly ep_Q2_024_coefficient_00_0078
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0079 : Poly :=
[
  term ((-241833769838029489014111626397120560368 : Rat) / 1799564186103715944850040292044308901985) [(13, 2), (14, 1)]
]

/-- Partial product 79 for generator 0. -/
def ep_Q2_024_partial_00_0079 : Poly :=
[
  term ((-483667539676058978028223252794241120736 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (4, 1), (13, 2), (14, 1)],
  term ((-483667539676058978028223252794241120736 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (13, 2), (14, 1)],
  term ((241833769838029489014111626397120560368 : Rat) / 1799564186103715944850040292044308901985) [(4, 2), (13, 2), (14, 1)],
  term ((241833769838029489014111626397120560368 : Rat) / 1799564186103715944850040292044308901985) [(5, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 0. -/
theorem ep_Q2_024_partial_00_0079_valid :
    mulPoly ep_Q2_024_coefficient_00_0079
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0080 : Poly :=
[
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(13, 2), (14, 2)]
]

/-- Partial product 80 for generator 0. -/
def ep_Q2_024_partial_00_0080 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (13, 2), (14, 2)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (13, 2), (14, 2)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 2), (13, 2), (14, 2)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 0. -/
theorem ep_Q2_024_partial_00_0080_valid :
    mulPoly ep_Q2_024_coefficient_00_0080
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0081 : Poly :=
[
  term ((-2692859941793748916857608867727985071769 : Rat) / 3599128372207431889700080584088617803970) [(14, 1)]
]

/-- Partial product 81 for generator 0. -/
def ep_Q2_024_partial_00_0081 : Poly :=
[
  term ((-2692859941793748916857608867727985071769 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (4, 1), (14, 1)],
  term ((-2692859941793748916857608867727985071769 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (14, 1)],
  term ((2692859941793748916857608867727985071769 : Rat) / 3599128372207431889700080584088617803970) [(4, 2), (14, 1)],
  term ((2692859941793748916857608867727985071769 : Rat) / 3599128372207431889700080584088617803970) [(5, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 0. -/
theorem ep_Q2_024_partial_00_0081_valid :
    mulPoly ep_Q2_024_coefficient_00_0081
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0082 : Poly :=
[
  term ((-488907664915971448335173123915211381262534394718277620233 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(14, 1), (15, 2)]
]

/-- Partial product 82 for generator 0. -/
def ep_Q2_024_partial_00_0082 : Poly :=
[
  term ((-488907664915971448335173123915211381262534394718277620233 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (4, 1), (14, 1), (15, 2)],
  term ((-488907664915971448335173123915211381262534394718277620233 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (5, 1), (14, 1), (15, 2)],
  term ((488907664915971448335173123915211381262534394718277620233 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(4, 2), (14, 1), (15, 2)],
  term ((488907664915971448335173123915211381262534394718277620233 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(5, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 0. -/
theorem ep_Q2_024_partial_00_0082_valid :
    mulPoly ep_Q2_024_coefficient_00_0082
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0083 : Poly :=
[
  term ((-28962762377370607 : Rat) / 13953362653838316) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 83 for generator 0. -/
def ep_Q2_024_partial_00_0083 : Poly :=
[
  term ((-28962762377370607 : Rat) / 6976681326919158) [(0, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-28962762377370607 : Rat) / 6976681326919158) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((28962762377370607 : Rat) / 13953362653838316) [(4, 2), (14, 1), (15, 2), (16, 1)],
  term ((28962762377370607 : Rat) / 13953362653838316) [(5, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 0. -/
theorem ep_Q2_024_partial_00_0083_valid :
    mulPoly ep_Q2_024_coefficient_00_0083
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0084 : Poly :=
[
  term ((-4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(14, 2)]
]

/-- Partial product 84 for generator 0. -/
def ep_Q2_024_partial_00_0084 : Poly :=
[
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (14, 2)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (14, 2)],
  term ((4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(4, 2), (14, 2)],
  term ((4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 0. -/
theorem ep_Q2_024_partial_00_0084_valid :
    mulPoly ep_Q2_024_coefficient_00_0084
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0085 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(14, 2), (15, 2)]
]

/-- Partial product 85 for generator 0. -/
def ep_Q2_024_partial_00_0085 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (4, 1), (14, 2), (15, 2)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (14, 2), (15, 2)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 2), (14, 2), (15, 2)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 0. -/
theorem ep_Q2_024_partial_00_0085_valid :
    mulPoly ep_Q2_024_coefficient_00_0085
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0086 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 86 for generator 0. -/
def ep_Q2_024_partial_00_0086 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (4, 1), (14, 2), (15, 2), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 2), (14, 2), (15, 2), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(5, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 0. -/
theorem ep_Q2_024_partial_00_0086_valid :
    mulPoly ep_Q2_024_coefficient_00_0086
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0087 : Poly :=
[
  term ((-66394866246762201136439855887841549515332746797531618859 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(15, 2)]
]

/-- Partial product 87 for generator 0. -/
def ep_Q2_024_partial_00_0087 : Poly :=
[
  term ((-66394866246762201136439855887841549515332746797531618859 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (4, 1), (15, 2)],
  term ((-66394866246762201136439855887841549515332746797531618859 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (5, 1), (15, 2)],
  term ((66394866246762201136439855887841549515332746797531618859 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(4, 2), (15, 2)],
  term ((66394866246762201136439855887841549515332746797531618859 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 0. -/
theorem ep_Q2_024_partial_00_0087_valid :
    mulPoly ep_Q2_024_coefficient_00_0087
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 0. -/
def ep_Q2_024_coefficient_00_0088 : Poly :=
[
  term ((3486417580466374 : Rat) / 1162780221153193) [(15, 2), (16, 1)]
]

/-- Partial product 88 for generator 0. -/
def ep_Q2_024_partial_00_0088 : Poly :=
[
  term ((6972835160932748 : Rat) / 1162780221153193) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((6972835160932748 : Rat) / 1162780221153193) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-3486417580466374 : Rat) / 1162780221153193) [(4, 2), (15, 2), (16, 1)],
  term ((-3486417580466374 : Rat) / 1162780221153193) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 0. -/
theorem ep_Q2_024_partial_00_0088_valid :
    mulPoly ep_Q2_024_coefficient_00_0088
        ep_Q2_024_generator_00_0000_0088 =
      ep_Q2_024_partial_00_0088 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_00_0000_0088 : List Poly :=
[
  ep_Q2_024_partial_00_0000,
  ep_Q2_024_partial_00_0001,
  ep_Q2_024_partial_00_0002,
  ep_Q2_024_partial_00_0003,
  ep_Q2_024_partial_00_0004,
  ep_Q2_024_partial_00_0005,
  ep_Q2_024_partial_00_0006,
  ep_Q2_024_partial_00_0007,
  ep_Q2_024_partial_00_0008,
  ep_Q2_024_partial_00_0009,
  ep_Q2_024_partial_00_0010,
  ep_Q2_024_partial_00_0011,
  ep_Q2_024_partial_00_0012,
  ep_Q2_024_partial_00_0013,
  ep_Q2_024_partial_00_0014,
  ep_Q2_024_partial_00_0015,
  ep_Q2_024_partial_00_0016,
  ep_Q2_024_partial_00_0017,
  ep_Q2_024_partial_00_0018,
  ep_Q2_024_partial_00_0019,
  ep_Q2_024_partial_00_0020,
  ep_Q2_024_partial_00_0021,
  ep_Q2_024_partial_00_0022,
  ep_Q2_024_partial_00_0023,
  ep_Q2_024_partial_00_0024,
  ep_Q2_024_partial_00_0025,
  ep_Q2_024_partial_00_0026,
  ep_Q2_024_partial_00_0027,
  ep_Q2_024_partial_00_0028,
  ep_Q2_024_partial_00_0029,
  ep_Q2_024_partial_00_0030,
  ep_Q2_024_partial_00_0031,
  ep_Q2_024_partial_00_0032,
  ep_Q2_024_partial_00_0033,
  ep_Q2_024_partial_00_0034,
  ep_Q2_024_partial_00_0035,
  ep_Q2_024_partial_00_0036,
  ep_Q2_024_partial_00_0037,
  ep_Q2_024_partial_00_0038,
  ep_Q2_024_partial_00_0039,
  ep_Q2_024_partial_00_0040,
  ep_Q2_024_partial_00_0041,
  ep_Q2_024_partial_00_0042,
  ep_Q2_024_partial_00_0043,
  ep_Q2_024_partial_00_0044,
  ep_Q2_024_partial_00_0045,
  ep_Q2_024_partial_00_0046,
  ep_Q2_024_partial_00_0047,
  ep_Q2_024_partial_00_0048,
  ep_Q2_024_partial_00_0049,
  ep_Q2_024_partial_00_0050,
  ep_Q2_024_partial_00_0051,
  ep_Q2_024_partial_00_0052,
  ep_Q2_024_partial_00_0053,
  ep_Q2_024_partial_00_0054,
  ep_Q2_024_partial_00_0055,
  ep_Q2_024_partial_00_0056,
  ep_Q2_024_partial_00_0057,
  ep_Q2_024_partial_00_0058,
  ep_Q2_024_partial_00_0059,
  ep_Q2_024_partial_00_0060,
  ep_Q2_024_partial_00_0061,
  ep_Q2_024_partial_00_0062,
  ep_Q2_024_partial_00_0063,
  ep_Q2_024_partial_00_0064,
  ep_Q2_024_partial_00_0065,
  ep_Q2_024_partial_00_0066,
  ep_Q2_024_partial_00_0067,
  ep_Q2_024_partial_00_0068,
  ep_Q2_024_partial_00_0069,
  ep_Q2_024_partial_00_0070,
  ep_Q2_024_partial_00_0071,
  ep_Q2_024_partial_00_0072,
  ep_Q2_024_partial_00_0073,
  ep_Q2_024_partial_00_0074,
  ep_Q2_024_partial_00_0075,
  ep_Q2_024_partial_00_0076,
  ep_Q2_024_partial_00_0077,
  ep_Q2_024_partial_00_0078,
  ep_Q2_024_partial_00_0079,
  ep_Q2_024_partial_00_0080,
  ep_Q2_024_partial_00_0081,
  ep_Q2_024_partial_00_0082,
  ep_Q2_024_partial_00_0083,
  ep_Q2_024_partial_00_0084,
  ep_Q2_024_partial_00_0085,
  ep_Q2_024_partial_00_0086,
  ep_Q2_024_partial_00_0087,
  ep_Q2_024_partial_00_0088
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_00_0000_0088 : Poly :=
[
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (4, 1), (9, 1)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (1, 1), (4, 1), (13, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (1, 1), (4, 1), (15, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(0, 1), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((-2419842730003276198737534546401193167942 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (2, 1), (4, 1)],
  term ((-93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (2, 1), (4, 1), (15, 2)],
  term ((1796510217718400 : Rat) / 1162780221153193) [(0, 1), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((329908071970601275439451126441523362761 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (4, 1)],
  term ((57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (5, 1), (8, 1), (9, 1)],
  term ((319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (5, 1), (8, 1), (13, 1)],
  term ((611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (4, 1), (5, 1), (8, 1), (15, 1)],
  term ((-2568602061245288 : Rat) / 1162780221153193) [(0, 1), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (5, 1), (9, 1), (14, 1)],
  term ((-319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (5, 1), (13, 1), (14, 1)],
  term ((-611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (4, 1), (5, 1), (14, 1), (15, 1)],
  term ((2568602061245288 : Rat) / 1162780221153193) [(0, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((781230546615652314315611763365815318071 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (8, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1566977979397665437738273701806458612728 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (8, 1), (9, 1), (13, 1)],
  term ((60014409539569963935744582355375799709409709725627656817 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-13257101325589140 : Rat) / 1162780221153193) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (8, 1), (9, 2)],
  term ((18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (8, 1), (12, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(0, 1), (4, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(0, 1), (4, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (8, 1), (12, 1), (13, 2)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (4, 1), (8, 1), (12, 1), (15, 2)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(0, 1), (4, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (4, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2300293940901617579712204761708815612370321311071652528027 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 1)],
  term ((-50972133270704143 : Rat) / 6976681326919158) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((8413519746542290140853554206891491552 : Rat) / 30501087900062982116102377831259472915) [(0, 1), (4, 1), (8, 1), (13, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (8, 1), (13, 2), (14, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (8, 1), (14, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (4, 1), (8, 1), (14, 1), (15, 2)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (4, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((170382485865479578859614638254207105010341468316427837427 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (4, 1), (8, 1), (15, 2)],
  term ((18569425277969695 : Rat) / 6976681326919158) [(0, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((-78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (4, 1), (9, 1), (11, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((62642528403160354704504797559818222248 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (4, 1), (9, 1), (13, 1)],
  term ((-1566977979397665437738273701806458612728 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (9, 1), (13, 1), (14, 1)],
  term ((-60014409539569963935744582355375799709409709725627656817 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((13257101325589140 : Rat) / 1162780221153193) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-815023144475829866126296965819156994569354136024232691 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (9, 1), (15, 1)],
  term ((1013072125781164 : Rat) / 1162780221153193) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((5069789052468159078862877685141046972 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (9, 2)],
  term ((636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (9, 2), (14, 1)],
  term ((184073186328059086660770392539015606464 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((-15107545144081276730057470020692546667471041729326529716 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((4325483377037680 : Rat) / 1162780221153193) [(0, 1), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-645509305238028654827808150416689423256 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (11, 1), (13, 1)],
  term ((60535569472895597225226556172030450948782658411068841308 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (4, 1), (11, 1), (15, 1)],
  term ((-3916275721085504 : Rat) / 1162780221153193) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((153168200112232862838358560575909523006 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (12, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(0, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(0, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((19263364504760593375136126002127317350231317007229624292 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4786310756398640 : Rat) / 1162780221153193) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (12, 1), (13, 2)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (12, 1), (13, 2), (14, 1)],
  term ((-18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (12, 1), (14, 1)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (4, 1), (12, 1), (14, 1), (15, 2)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(0, 1), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((24070859266477134214534147148880789766972012552548143444 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (12, 1), (15, 2)],
  term ((-6559421324254320 : Rat) / 1162780221153193) [(0, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((468388707002765155459744101761589996702808887264153294575 : Rat) / 3347996227675271346617184351010557230882447123690860968) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((55975939716949855 : Rat) / 6976681326919158) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (13, 1), (14, 2), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-15373683519702634727876840891450444354368474268108143874 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (13, 1), (15, 1)],
  term ((-1008121021082632 : Rat) / 1162780221153193) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((1201736492325036749779868451976828490432 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (13, 2)],
  term ((-483667539676058978028223252794241120736 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (4, 1), (13, 2), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (13, 2), (14, 2)],
  term ((-2692859941793748916857608867727985071769 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (4, 1), (14, 1)],
  term ((-488907664915971448335173123915211381262534394718277620233 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (4, 1), (14, 1), (15, 2)],
  term ((-28962762377370607 : Rat) / 6976681326919158) [(0, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (14, 2)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (4, 1), (14, 2), (15, 2)],
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (4, 1), (14, 2), (15, 2), (16, 1)],
  term ((-66394866246762201136439855887841549515332746797531618859 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (4, 1), (15, 2)],
  term ((6972835160932748 : Rat) / 1162780221153193) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((-2419842730003276198737534546401193167942 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (5, 1)],
  term ((-93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1)],
  term ((-8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 1), (5, 1), (15, 2)],
  term ((1796510217718400 : Rat) / 1162780221153193) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)],
  term ((18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 2), (9, 1)],
  term ((4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 2), (13, 1)],
  term ((-1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 2), (15, 1)],
  term ((-427382588269864 : Rat) / 1162780221153193) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((329908071970601275439451126441523362761 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1)],
  term ((781230546615652314315611763365815318071 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1566977979397665437738273701806458612728 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1)],
  term ((60014409539569963935744582355375799709409709725627656817 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1)],
  term ((-13257101325589140 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (9, 2)],
  term ((18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 1), (12, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (5, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (12, 1), (13, 2)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 2)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2300293940901617579712204761708815612370321311071652528027 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1)],
  term ((-50972133270704143 : Rat) / 6976681326919158) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((8413519746542290140853554206891491552 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (5, 1), (8, 1), (13, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (13, 2), (14, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 1), (14, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (8, 1), (14, 1), (15, 2)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((170382485865479578859614638254207105010341468316427837427 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (5, 1), (8, 1), (15, 2)],
  term ((18569425277969695 : Rat) / 6976681326919158) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (9, 1), (11, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((62642528403160354704504797559818222248 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (5, 1), (9, 1), (13, 1)],
  term ((-1566977979397665437738273701806458612728 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (13, 1), (14, 1)],
  term ((-60014409539569963935744582355375799709409709725627656817 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 1), (14, 1), (15, 1)],
  term ((13257101325589140 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-815023144475829866126296965819156994569354136024232691 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 1), (15, 1)],
  term ((1013072125781164 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((5069789052468159078862877685141046972 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 2)],
  term ((636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2), (14, 1)],
  term ((184073186328059086660770392539015606464 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((-15107545144081276730057470020692546667471041729326529716 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((4325483377037680 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-645509305238028654827808150416689423256 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((60535569472895597225226556172030450948782658411068841308 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((-3916275721085504 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((153168200112232862838358560575909523006 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (12, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((19263364504760593375136126002127317350231317007229624292 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4786310756398640 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (12, 1), (13, 2)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (12, 1), (13, 2), (14, 1)],
  term ((-18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (12, 1), (14, 1)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (12, 1), (14, 1), (15, 2)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((24070859266477134214534147148880789766972012552548143444 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (12, 1), (15, 2)],
  term ((-6559421324254320 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((468388707002765155459744101761589996702808887264153294575 : Rat) / 3347996227675271346617184351010557230882447123690860968) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((55975939716949855 : Rat) / 6976681326919158) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-15373683519702634727876840891450444354368474268108143874 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((-1008121021082632 : Rat) / 1162780221153193) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((1201736492325036749779868451976828490432 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (13, 2)],
  term ((-483667539676058978028223252794241120736 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (13, 2), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (13, 2), (14, 2)],
  term ((-2692859941793748916857608867727985071769 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (14, 1)],
  term ((-488907664915971448335173123915211381262534394718277620233 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (5, 1), (14, 1), (15, 2)],
  term ((-28962762377370607 : Rat) / 6976681326919158) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (14, 2)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (14, 2), (15, 2)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((-66394866246762201136439855887841549515332746797531618859 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (5, 1), (15, 2)],
  term ((6972835160932748 : Rat) / 1162780221153193) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (8, 1), (9, 1)],
  term ((319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (8, 1), (13, 1)],
  term ((611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (8, 1), (15, 1)],
  term ((-2568602061245288 : Rat) / 1162780221153193) [(1, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (9, 1)],
  term ((-57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (9, 1), (14, 1)],
  term ((4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 2), (13, 1)],
  term ((-319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (13, 1), (14, 1)],
  term ((-611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (14, 1), (15, 1)],
  term ((2568602061245288 : Rat) / 1162780221153193) [(1, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 2), (15, 1)],
  term ((-427382588269864 : Rat) / 1162780221153193) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (5, 1), (9, 1)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 2), (5, 1), (13, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (15, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((1209921365001638099368767273200596583971 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (4, 2)],
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 2), (13, 1), (15, 1)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (4, 2), (15, 2)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(2, 1), (4, 2), (15, 2), (16, 1)],
  term ((1209921365001638099368767273200596583971 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (5, 2)],
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 2), (13, 1), (15, 1)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 2), (15, 2)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(2, 1), (5, 2), (15, 2), (16, 1)],
  term ((-329908071970601275439451126441523362761 : Rat) / 3599128372207431889700080584088617803970) [(4, 2)],
  term ((-28712178205325458407952328388012090724 : Rat) / 199951576233746216094448921338256544665) [(4, 2), (5, 1), (8, 1), (9, 1)],
  term ((-159507479511669304376772657357014241016 : Rat) / 599854728701238648283346764014769633995) [(4, 2), (5, 1), (8, 1), (13, 1)],
  term ((-305645220242408885625268463091545324188293793650969449 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 2), (5, 1), (8, 1), (15, 1)],
  term ((1284301030622644 : Rat) / 1162780221153193) [(4, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((28712178205325458407952328388012090724 : Rat) / 199951576233746216094448921338256544665) [(4, 2), (5, 1), (9, 1), (14, 1)],
  term ((159507479511669304376772657357014241016 : Rat) / 599854728701238648283346764014769633995) [(4, 2), (5, 1), (13, 1), (14, 1)],
  term ((305645220242408885625268463091545324188293793650969449 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 2), (5, 1), (14, 1), (15, 1)],
  term ((-1284301030622644 : Rat) / 1162780221153193) [(4, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-781230546615652314315611763365815318071 : Rat) / 399903152467492432188897842676513089330) [(4, 2), (8, 1)],
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(4, 2), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(4, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((425478577289470 : Rat) / 1162780221153193) [(4, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-783488989698832718869136850903229306364 : Rat) / 199951576233746216094448921338256544665) [(4, 2), (8, 1), (9, 1), (13, 1)],
  term ((-60014409539569963935744582355375799709409709725627656817 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 2), (8, 1), (9, 1), (15, 1)],
  term ((6628550662794570 : Rat) / 1162780221153193) [(4, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((318448357957218598682654572629196213388 : Rat) / 599854728701238648283346764014769633995) [(4, 2), (8, 1), (9, 2)],
  term ((-9243609330048111973130073013258126302 : Rat) / 199951576233746216094448921338256544665) [(4, 2), (8, 1), (12, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(4, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((4569079916135479 : Rat) / 2325560442306386) [(4, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(4, 2), (8, 1), (12, 1), (13, 2)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(4, 2), (8, 1), (12, 1), (15, 2)],
  term ((-13204414907240807 : Rat) / 2325560442306386) [(4, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 2), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2300293940901617579712204761708815612370321311071652528027 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(4, 2), (8, 1), (13, 1), (15, 1)],
  term ((50972133270704143 : Rat) / 13953362653838316) [(4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4206759873271145070426777103445745776 : Rat) / 30501087900062982116102377831259472915) [(4, 2), (8, 1), (13, 2)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 2), (8, 1), (13, 2), (14, 1)],
  term ((-4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(4, 2), (8, 1), (14, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 2), (8, 1), (14, 1), (15, 2)],
  term ((416983870520476 : Rat) / 1162780221153193) [(4, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-170382485865479578859614638254207105010341468316427837427 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(4, 2), (8, 1), (15, 2)],
  term ((-18569425277969695 : Rat) / 13953362653838316) [(4, 2), (8, 1), (15, 2), (16, 1)],
  term ((39356336260818292697062851203095641530 : Rat) / 39990315246749243218889784267651308933) [(4, 2), (9, 1), (11, 1)],
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(4, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(4, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-425478577289470 : Rat) / 1162780221153193) [(4, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31321264201580177352252398779909111124 : Rat) / 119970945740247729656669352802953926799) [(4, 2), (9, 1), (13, 1)],
  term ((783488989698832718869136850903229306364 : Rat) / 199951576233746216094448921338256544665) [(4, 2), (9, 1), (13, 1), (14, 1)],
  term ((60014409539569963935744582355375799709409709725627656817 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 2), (9, 1), (14, 1), (15, 1)],
  term ((-6628550662794570 : Rat) / 1162780221153193) [(4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((815023144475829866126296965819156994569354136024232691 : Rat) / 464999476066009909252386715418132948733673211623730690) [(4, 2), (9, 1), (15, 1)],
  term ((-506536062890582 : Rat) / 1162780221153193) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2534894526234079539431438842570523486 : Rat) / 199951576233746216094448921338256544665) [(4, 2), (9, 2)],
  term ((-318448357957218598682654572629196213388 : Rat) / 599854728701238648283346764014769633995) [(4, 2), (9, 2), (14, 1)],
  term ((-92036593164029543330385196269507803232 : Rat) / 199951576233746216094448921338256544665) [(4, 2), (11, 1), (12, 1), (13, 1)],
  term ((7553772572040638365028735010346273333735520864663264858 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((-2162741688518840 : Rat) / 1162780221153193) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((322754652619014327413904075208344711628 : Rat) / 599854728701238648283346764014769633995) [(4, 2), (11, 1), (13, 1)],
  term ((-30267784736447798612613278086015225474391329205534420654 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 2), (11, 1), (15, 1)],
  term ((1958137860542752 : Rat) / 1162780221153193) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-76584100056116431419179280287954761503 : Rat) / 199951576233746216094448921338256544665) [(4, 2), (12, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(4, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4569079916135479 : Rat) / 2325560442306386) [(4, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9631682252380296687568063001063658675115658503614812146 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 2), (12, 1), (13, 1), (15, 1)],
  term ((2393155378199320 : Rat) / 1162780221153193) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 2), (12, 1), (13, 2)],
  term ((-349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(4, 2), (12, 1), (13, 2), (14, 1)],
  term ((9243609330048111973130073013258126302 : Rat) / 199951576233746216094448921338256544665) [(4, 2), (12, 1), (14, 1)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(4, 2), (12, 1), (14, 1), (15, 2)],
  term ((13204414907240807 : Rat) / 2325560442306386) [(4, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12035429633238567107267073574440394883486006276274071722 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 2), (12, 1), (15, 2)],
  term ((3279710662127160 : Rat) / 1162780221153193) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((-468388707002765155459744101761589996702808887264153294575 : Rat) / 6695992455350542693234368702021114461764894247381721936) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((-55975939716949855 : Rat) / 13953362653838316) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 2), (13, 1), (14, 2), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(4, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((7686841759851317363938420445725222177184237134054071937 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 2), (13, 1), (15, 1)],
  term ((504060510541316 : Rat) / 1162780221153193) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-600868246162518374889934225988414245216 : Rat) / 599854728701238648283346764014769633995) [(4, 2), (13, 2)],
  term ((241833769838029489014111626397120560368 : Rat) / 1799564186103715944850040292044308901985) [(4, 2), (13, 2), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 2), (13, 2), (14, 2)],
  term ((2692859941793748916857608867727985071769 : Rat) / 3599128372207431889700080584088617803970) [(4, 2), (14, 1)],
  term ((488907664915971448335173123915211381262534394718277620233 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(4, 2), (14, 1), (15, 2)],
  term ((28962762377370607 : Rat) / 13953362653838316) [(4, 2), (14, 1), (15, 2), (16, 1)],
  term ((4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(4, 2), (14, 2)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 2), (14, 2), (15, 2)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 2), (14, 2), (15, 2), (16, 1)],
  term ((66394866246762201136439855887841549515332746797531618859 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(4, 2), (15, 2)],
  term ((-3486417580466374 : Rat) / 1162780221153193) [(4, 2), (15, 2), (16, 1)],
  term ((-329908071970601275439451126441523362761 : Rat) / 3599128372207431889700080584088617803970) [(5, 2)],
  term ((-781230546615652314315611763365815318071 : Rat) / 399903152467492432188897842676513089330) [(5, 2), (8, 1)],
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((425478577289470 : Rat) / 1162780221153193) [(5, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-783488989698832718869136850903229306364 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (8, 1), (9, 1), (13, 1)],
  term ((-60014409539569963935744582355375799709409709725627656817 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 2), (8, 1), (9, 1), (15, 1)],
  term ((6628550662794570 : Rat) / 1162780221153193) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((318448357957218598682654572629196213388 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (8, 1), (9, 2)],
  term ((-9243609330048111973130073013258126302 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (8, 1), (12, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(5, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((4569079916135479 : Rat) / 2325560442306386) [(5, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (8, 1), (12, 1), (13, 2)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(5, 2), (8, 1), (12, 1), (15, 2)],
  term ((-13204414907240807 : Rat) / 2325560442306386) [(5, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 2), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(5, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2300293940901617579712204761708815612370321311071652528027 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(5, 2), (8, 1), (13, 1), (15, 1)],
  term ((50972133270704143 : Rat) / 13953362653838316) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4206759873271145070426777103445745776 : Rat) / 30501087900062982116102377831259472915) [(5, 2), (8, 1), (13, 2)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (8, 1), (13, 2), (14, 1)],
  term ((-4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (8, 1), (14, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 2), (8, 1), (14, 1), (15, 2)],
  term ((416983870520476 : Rat) / 1162780221153193) [(5, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-170382485865479578859614638254207105010341468316427837427 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(5, 2), (8, 1), (15, 2)],
  term ((-18569425277969695 : Rat) / 13953362653838316) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term ((39356336260818292697062851203095641530 : Rat) / 39990315246749243218889784267651308933) [(5, 2), (9, 1), (11, 1)],
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-425478577289470 : Rat) / 1162780221153193) [(5, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31321264201580177352252398779909111124 : Rat) / 119970945740247729656669352802953926799) [(5, 2), (9, 1), (13, 1)],
  term ((783488989698832718869136850903229306364 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 1), (13, 1), (14, 1)],
  term ((60014409539569963935744582355375799709409709725627656817 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 2), (9, 1), (14, 1), (15, 1)],
  term ((-6628550662794570 : Rat) / 1162780221153193) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((815023144475829866126296965819156994569354136024232691 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 2), (9, 1), (15, 1)],
  term ((-506536062890582 : Rat) / 1162780221153193) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2534894526234079539431438842570523486 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 2)],
  term ((-318448357957218598682654572629196213388 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 2), (14, 1)],
  term ((-92036593164029543330385196269507803232 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (11, 1), (12, 1), (13, 1)],
  term ((7553772572040638365028735010346273333735520864663264858 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((-2162741688518840 : Rat) / 1162780221153193) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((322754652619014327413904075208344711628 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (11, 1), (13, 1)],
  term ((-30267784736447798612613278086015225474391329205534420654 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(5, 2), (11, 1), (15, 1)],
  term ((1958137860542752 : Rat) / 1162780221153193) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-76584100056116431419179280287954761503 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (12, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(5, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4569079916135479 : Rat) / 2325560442306386) [(5, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9631682252380296687568063001063658675115658503614812146 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 2), (12, 1), (13, 1), (15, 1)],
  term ((2393155378199320 : Rat) / 1162780221153193) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (12, 1), (13, 2)],
  term ((-349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (12, 1), (13, 2), (14, 1)],
  term ((9243609330048111973130073013258126302 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (12, 1), (14, 1)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(5, 2), (12, 1), (14, 1), (15, 2)],
  term ((13204414907240807 : Rat) / 2325560442306386) [(5, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12035429633238567107267073574440394883486006276274071722 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 2), (12, 1), (15, 2)],
  term ((3279710662127160 : Rat) / 1162780221153193) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-468388707002765155459744101761589996702808887264153294575 : Rat) / 6695992455350542693234368702021114461764894247381721936) [(5, 2), (13, 1), (14, 1), (15, 1)],
  term ((-55975939716949855 : Rat) / 13953362653838316) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 2), (13, 1), (14, 2), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(5, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((7686841759851317363938420445725222177184237134054071937 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 2), (13, 1), (15, 1)],
  term ((504060510541316 : Rat) / 1162780221153193) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-600868246162518374889934225988414245216 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (13, 2)],
  term ((241833769838029489014111626397120560368 : Rat) / 1799564186103715944850040292044308901985) [(5, 2), (13, 2), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (13, 2), (14, 2)],
  term ((2692859941793748916857608867727985071769 : Rat) / 3599128372207431889700080584088617803970) [(5, 2), (14, 1)],
  term ((488907664915971448335173123915211381262534394718277620233 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(5, 2), (14, 1), (15, 2)],
  term ((28962762377370607 : Rat) / 13953362653838316) [(5, 2), (14, 1), (15, 2), (16, 1)],
  term ((4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (14, 2)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 2), (14, 2), (15, 2)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(5, 2), (14, 2), (15, 2), (16, 1)],
  term ((66394866246762201136439855887841549515332746797531618859 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(5, 2), (15, 2)],
  term ((-3486417580466374 : Rat) / 1162780221153193) [(5, 2), (15, 2), (16, 1)],
  term ((-28712178205325458407952328388012090724 : Rat) / 199951576233746216094448921338256544665) [(5, 3), (8, 1), (9, 1)],
  term ((-159507479511669304376772657357014241016 : Rat) / 599854728701238648283346764014769633995) [(5, 3), (8, 1), (13, 1)],
  term ((-305645220242408885625268463091545324188293793650969449 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 3), (8, 1), (15, 1)],
  term ((1284301030622644 : Rat) / 1162780221153193) [(5, 3), (8, 1), (15, 1), (16, 1)],
  term ((28712178205325458407952328388012090724 : Rat) / 199951576233746216094448921338256544665) [(5, 3), (9, 1), (14, 1)],
  term ((159507479511669304376772657357014241016 : Rat) / 599854728701238648283346764014769633995) [(5, 3), (13, 1), (14, 1)],
  term ((305645220242408885625268463091545324188293793650969449 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 3), (14, 1), (15, 1)],
  term ((-1284301030622644 : Rat) / 1162780221153193) [(5, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 0, terms 0 through 88. -/
theorem ep_Q2_024_block_00_0000_0088_valid :
    checkProductSumEq ep_Q2_024_partials_00_0000_0088
      ep_Q2_024_block_00_0000_0088 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
