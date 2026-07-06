/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 5:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 5 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_05_0100_0199 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0100 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 5. -/
def ep_Q2_024_partial_05_0100 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (2, 2), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (3, 2), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 5. -/
theorem ep_Q2_024_partial_05_0100_valid :
    mulPoly ep_Q2_024_coefficient_05_0100
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0101 : Poly :=
[
  term ((2145093596645849219495004953877108926626236865692501316507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (5, 1), (13, 1), (15, 1)]
]

/-- Partial product 101 for generator 5. -/
def ep_Q2_024_partial_05_0101 : Poly :=
[
  term ((2145093596645849219495004953877108926626236865692501316507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (2, 2), (5, 1), (13, 1), (15, 1)],
  term ((2145093596645849219495004953877108926626236865692501316507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (3, 2), (5, 1), (13, 1), (15, 1)],
  term ((-2145093596645849219495004953877108926626236865692501316507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2145093596645849219495004953877108926626236865692501316507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (5, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 5. -/
theorem ep_Q2_024_partial_05_0101_valid :
    mulPoly ep_Q2_024_coefficient_05_0101
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0102 : Poly :=
[
  term ((49730484048564751 : Rat) / 6976681326919158) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 5. -/
def ep_Q2_024_partial_05_0102 : Poly :=
[
  term ((49730484048564751 : Rat) / 6976681326919158) [(1, 1), (2, 2), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((49730484048564751 : Rat) / 6976681326919158) [(1, 1), (3, 2), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-49730484048564751 : Rat) / 6976681326919158) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-49730484048564751 : Rat) / 6976681326919158) [(1, 1), (5, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 5. -/
theorem ep_Q2_024_partial_05_0102_valid :
    mulPoly ep_Q2_024_coefficient_05_0102
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0103 : Poly :=
[
  term ((-26487263738155951584262085343655170784 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (13, 2)]
]

/-- Partial product 103 for generator 5. -/
def ep_Q2_024_partial_05_0103 : Poly :=
[
  term ((-26487263738155951584262085343655170784 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (2, 2), (5, 1), (13, 2)],
  term ((-26487263738155951584262085343655170784 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (3, 2), (5, 1), (13, 2)],
  term ((26487263738155951584262085343655170784 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (13, 2), (14, 2)],
  term ((26487263738155951584262085343655170784 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 5. -/
theorem ep_Q2_024_partial_05_0103_valid :
    mulPoly ep_Q2_024_coefficient_05_0103
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0104 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (13, 2), (14, 1)]
]

/-- Partial product 104 for generator 5. -/
def ep_Q2_024_partial_05_0104 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (5, 1), (13, 2), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (5, 1), (13, 2), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (13, 2), (14, 1), (15, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 5. -/
theorem ep_Q2_024_partial_05_0104_valid :
    mulPoly ep_Q2_024_coefficient_05_0104
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0105 : Poly :=
[
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (14, 1)]
]

/-- Partial product 105 for generator 5. -/
def ep_Q2_024_partial_05_0105 : Poly :=
[
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (5, 1), (14, 1)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (5, 1), (14, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (14, 1), (15, 2)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 5. -/
theorem ep_Q2_024_partial_05_0105_valid :
    mulPoly ep_Q2_024_coefficient_05_0105
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0106 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (14, 1), (15, 2)]
]

/-- Partial product 106 for generator 5. -/
def ep_Q2_024_partial_05_0106 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 2), (5, 1), (14, 1), (15, 2)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 2), (5, 1), (14, 1), (15, 2)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (14, 1), (15, 4)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 5. -/
theorem ep_Q2_024_partial_05_0106_valid :
    mulPoly ep_Q2_024_coefficient_05_0106
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0107 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 107 for generator 5. -/
def ep_Q2_024_partial_05_0107 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (2, 2), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (3, 2), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (14, 1), (15, 4), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 5. -/
theorem ep_Q2_024_partial_05_0107_valid :
    mulPoly ep_Q2_024_coefficient_05_0107
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0108 : Poly :=
[
  term ((-475418534318063580141443576875141509826674210915175752793 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (5, 1), (15, 2)]
]

/-- Partial product 108 for generator 5. -/
def ep_Q2_024_partial_05_0108 : Poly :=
[
  term ((-475418534318063580141443576875141509826674210915175752793 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (2, 2), (5, 1), (15, 2)],
  term ((-475418534318063580141443576875141509826674210915175752793 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (3, 2), (5, 1), (15, 2)],
  term ((475418534318063580141443576875141509826674210915175752793 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (5, 1), (14, 2), (15, 2)],
  term ((475418534318063580141443576875141509826674210915175752793 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (5, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 5. -/
theorem ep_Q2_024_partial_05_0108_valid :
    mulPoly ep_Q2_024_coefficient_05_0108
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0109 : Poly :=
[
  term ((-23958955931124895 : Rat) / 6976681326919158) [(1, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 109 for generator 5. -/
def ep_Q2_024_partial_05_0109 : Poly :=
[
  term ((-23958955931124895 : Rat) / 6976681326919158) [(1, 1), (2, 2), (5, 1), (15, 2), (16, 1)],
  term ((-23958955931124895 : Rat) / 6976681326919158) [(1, 1), (3, 2), (5, 1), (15, 2), (16, 1)],
  term ((23958955931124895 : Rat) / 6976681326919158) [(1, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((23958955931124895 : Rat) / 6976681326919158) [(1, 1), (5, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 5. -/
theorem ep_Q2_024_partial_05_0109_valid :
    mulPoly ep_Q2_024_coefficient_05_0109
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0110 : Poly :=
[
  term ((-57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (9, 1)]
]

/-- Partial product 110 for generator 5. -/
def ep_Q2_024_partial_05_0110 : Poly :=
[
  term ((-57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (5, 2), (9, 1)],
  term ((-57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (5, 2), (9, 1)],
  term ((57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (9, 1), (14, 2)],
  term ((57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 5. -/
theorem ep_Q2_024_partial_05_0110_valid :
    mulPoly ep_Q2_024_coefficient_05_0110
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0111 : Poly :=
[
  term ((-319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (13, 1)]
]

/-- Partial product 111 for generator 5. -/
def ep_Q2_024_partial_05_0111 : Poly :=
[
  term ((-319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (5, 2), (13, 1)],
  term ((-319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (5, 2), (13, 1)],
  term ((319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (13, 1), (14, 2)],
  term ((319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 5. -/
theorem ep_Q2_024_partial_05_0111_valid :
    mulPoly ep_Q2_024_coefficient_05_0111
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0112 : Poly :=
[
  term ((-611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (15, 1)]
]

/-- Partial product 112 for generator 5. -/
def ep_Q2_024_partial_05_0112 : Poly :=
[
  term ((-611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (2, 2), (5, 2), (15, 1)],
  term ((-611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (3, 2), (5, 2), (15, 1)],
  term ((611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (14, 2), (15, 1)],
  term ((611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 5. -/
theorem ep_Q2_024_partial_05_0112_valid :
    mulPoly ep_Q2_024_coefficient_05_0112
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0113 : Poly :=
[
  term ((2568602061245288 : Rat) / 1162780221153193) [(1, 1), (5, 2), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 5. -/
def ep_Q2_024_partial_05_0113 : Poly :=
[
  term ((2568602061245288 : Rat) / 1162780221153193) [(1, 1), (2, 2), (5, 2), (15, 1), (16, 1)],
  term ((2568602061245288 : Rat) / 1162780221153193) [(1, 1), (3, 2), (5, 2), (15, 1), (16, 1)],
  term ((-2568602061245288 : Rat) / 1162780221153193) [(1, 1), (5, 2), (14, 2), (15, 1), (16, 1)],
  term ((-2568602061245288 : Rat) / 1162780221153193) [(1, 1), (5, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 5. -/
theorem ep_Q2_024_partial_05_0113_valid :
    mulPoly ep_Q2_024_coefficient_05_0113
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0114 : Poly :=
[
  term ((-907450556046215195256401401922709572872 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1)]
]

/-- Partial product 114 for generator 5. -/
def ep_Q2_024_partial_05_0114 : Poly :=
[
  term ((-907450556046215195256401401922709572872 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (7, 1)],
  term ((-907450556046215195256401401922709572872 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (7, 1)],
  term ((907450556046215195256401401922709572872 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (14, 2)],
  term ((907450556046215195256401401922709572872 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 5. -/
theorem ep_Q2_024_partial_05_0114_valid :
    mulPoly ep_Q2_024_coefficient_05_0114
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0115 : Poly :=
[
  term ((-3452924603613141561560579250626960304556 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 1)]
]

/-- Partial product 115 for generator 5. -/
def ep_Q2_024_partial_05_0115 : Poly :=
[
  term ((-3452924603613141561560579250626960304556 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (8, 1), (9, 1)],
  term ((-3452924603613141561560579250626960304556 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (8, 1), (9, 1)],
  term ((3452924603613141561560579250626960304556 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 1), (14, 2)],
  term ((3452924603613141561560579250626960304556 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 5. -/
theorem ep_Q2_024_partial_05_0115_valid :
    mulPoly ep_Q2_024_coefficient_05_0115
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0116 : Poly :=
[
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 116 for generator 5. -/
def ep_Q2_024_partial_05_0116 : Poly :=
[
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 2), (8, 1), (12, 1), (13, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 2), (8, 1), (12, 1), (13, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 2)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 5. -/
theorem ep_Q2_024_partial_05_0116_valid :
    mulPoly ep_Q2_024_coefficient_05_0116
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0117 : Poly :=
[
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 117 for generator 5. -/
def ep_Q2_024_partial_05_0117 : Poly :=
[
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (2, 2), (8, 1), (12, 1), (15, 1)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (3, 2), (8, 1), (12, 1), (15, 1)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (8, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 5. -/
theorem ep_Q2_024_partial_05_0117_valid :
    mulPoly ep_Q2_024_coefficient_05_0117
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0118 : Poly :=
[
  term ((-1086154201315805 : Rat) / 1162780221153193) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 118 for generator 5. -/
def ep_Q2_024_partial_05_0118 : Poly :=
[
  term ((-1086154201315805 : Rat) / 1162780221153193) [(1, 1), (2, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1086154201315805 : Rat) / 1162780221153193) [(1, 1), (3, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(1, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(1, 1), (8, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 5. -/
theorem ep_Q2_024_partial_05_0118_valid :
    mulPoly ep_Q2_024_coefficient_05_0118
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0119 : Poly :=
[
  term ((-8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (13, 1)]
]

/-- Partial product 119 for generator 5. -/
def ep_Q2_024_partial_05_0119 : Poly :=
[
  term ((-8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (8, 1), (13, 1)],
  term ((-8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 2), (8, 1), (13, 1)],
  term ((8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (13, 1), (14, 2)],
  term ((8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 5. -/
theorem ep_Q2_024_partial_05_0119_valid :
    mulPoly ep_Q2_024_coefficient_05_0119
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0120 : Poly :=
[
  term ((-8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 120 for generator 5. -/
def ep_Q2_024_partial_05_0120 : Poly :=
[
  term ((-8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (2, 2), (8, 1), (15, 1)],
  term ((-8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 2), (8, 1), (15, 1)],
  term ((8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 1), (14, 2), (15, 1)],
  term ((8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 5. -/
theorem ep_Q2_024_partial_05_0120_valid :
    mulPoly ep_Q2_024_coefficient_05_0120
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0121 : Poly :=
[
  term ((8683303471552472 : Rat) / 3488340663459579) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 121 for generator 5. -/
def ep_Q2_024_partial_05_0121 : Poly :=
[
  term ((8683303471552472 : Rat) / 3488340663459579) [(1, 1), (2, 2), (8, 1), (15, 1), (16, 1)],
  term ((8683303471552472 : Rat) / 3488340663459579) [(1, 1), (3, 2), (8, 1), (15, 1), (16, 1)],
  term ((-8683303471552472 : Rat) / 3488340663459579) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8683303471552472 : Rat) / 3488340663459579) [(1, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 5. -/
theorem ep_Q2_024_partial_05_0121_valid :
    mulPoly ep_Q2_024_coefficient_05_0121
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0122 : Poly :=
[
  term ((326078684845295515420725567943401896389 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1)]
]

/-- Partial product 122 for generator 5. -/
def ep_Q2_024_partial_05_0122 : Poly :=
[
  term ((326078684845295515420725567943401896389 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 2), (9, 1)],
  term ((326078684845295515420725567943401896389 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 2), (9, 1)],
  term ((-326078684845295515420725567943401896389 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (14, 2)],
  term ((-326078684845295515420725567943401896389 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 5. -/
theorem ep_Q2_024_partial_05_0122_valid :
    mulPoly ep_Q2_024_coefficient_05_0122
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0123 : Poly :=
[
  term ((-84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 123 for generator 5. -/
def ep_Q2_024_partial_05_0123 : Poly :=
[
  term ((-84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (9, 1), (11, 1), (15, 1)],
  term ((-84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (9, 1), (11, 1), (15, 1)],
  term ((84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 5. -/
theorem ep_Q2_024_partial_05_0123_valid :
    mulPoly ep_Q2_024_coefficient_05_0123
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0124 : Poly :=
[
  term ((-969228957419244882311240360734253085340 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 124 for generator 5. -/
def ep_Q2_024_partial_05_0124 : Poly :=
[
  term ((-969228957419244882311240360734253085340 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 2), (9, 1), (12, 1)],
  term ((-969228957419244882311240360734253085340 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 2), (9, 1), (12, 1)],
  term ((969228957419244882311240360734253085340 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (9, 1), (12, 1), (14, 2)],
  term ((969228957419244882311240360734253085340 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 5. -/
theorem ep_Q2_024_partial_05_0124_valid :
    mulPoly ep_Q2_024_coefficient_05_0124
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0125 : Poly :=
[
  term ((2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 125 for generator 5. -/
def ep_Q2_024_partial_05_0125 : Poly :=
[
  term ((2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (9, 1), (13, 1), (15, 1)],
  term ((2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 2), (9, 1), (13, 1), (15, 1)],
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 5. -/
theorem ep_Q2_024_partial_05_0125_valid :
    mulPoly ep_Q2_024_coefficient_05_0125
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0126 : Poly :=
[
  term ((-1495148449544936 : Rat) / 1162780221153193) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 126 for generator 5. -/
def ep_Q2_024_partial_05_0126 : Poly :=
[
  term ((-1495148449544936 : Rat) / 1162780221153193) [(1, 1), (2, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1495148449544936 : Rat) / 1162780221153193) [(1, 1), (3, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(1, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 5. -/
theorem ep_Q2_024_partial_05_0126_valid :
    mulPoly ep_Q2_024_coefficient_05_0126
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0127 : Poly :=
[
  term ((-156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (13, 2)]
]

/-- Partial product 127 for generator 5. -/
def ep_Q2_024_partial_05_0127 : Poly :=
[
  term ((-156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (9, 1), (13, 2)],
  term ((-156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (9, 1), (13, 2)],
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (13, 2), (14, 2)],
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 5. -/
theorem ep_Q2_024_partial_05_0127_valid :
    mulPoly ep_Q2_024_coefficient_05_0127
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0128 : Poly :=
[
  term ((241325305719370233097203105089965295796 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (14, 1)]
]

/-- Partial product 128 for generator 5. -/
def ep_Q2_024_partial_05_0128 : Poly :=
[
  term ((241325305719370233097203105089965295796 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 2), (9, 1), (14, 1)],
  term ((241325305719370233097203105089965295796 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 2), (9, 1), (14, 1)],
  term ((-241325305719370233097203105089965295796 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (14, 1), (15, 2)],
  term ((-241325305719370233097203105089965295796 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 5. -/
theorem ep_Q2_024_partial_05_0128_valid :
    mulPoly ep_Q2_024_coefficient_05_0128
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0129 : Poly :=
[
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 2), (13, 1)]
]

/-- Partial product 129 for generator 5. -/
def ep_Q2_024_partial_05_0129 : Poly :=
[
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (9, 2), (13, 1)],
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (9, 2), (13, 1)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 2), (13, 1), (14, 2)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 5. -/
theorem ep_Q2_024_partial_05_0129_valid :
    mulPoly ep_Q2_024_coefficient_05_0129
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0130 : Poly :=
[
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1)]
]

/-- Partial product 130 for generator 5. -/
def ep_Q2_024_partial_05_0130 : Poly :=
[
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (11, 1)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 2), (11, 1)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (14, 2)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 5. -/
theorem ep_Q2_024_partial_05_0130_valid :
    mulPoly ep_Q2_024_coefficient_05_0130
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0131 : Poly :=
[
  term ((121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 131 for generator 5. -/
def ep_Q2_024_partial_05_0131 : Poly :=
[
  term ((121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (11, 1), (13, 1), (15, 1)],
  term ((121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (11, 1), (13, 1), (15, 1)],
  term ((-121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 5. -/
theorem ep_Q2_024_partial_05_0131_valid :
    mulPoly ep_Q2_024_coefficient_05_0131
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0132 : Poly :=
[
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (11, 1), (15, 2)]
]

/-- Partial product 132 for generator 5. -/
def ep_Q2_024_partial_05_0132 : Poly :=
[
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (2, 2), (11, 1), (15, 2)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (3, 2), (11, 1), (15, 2)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (11, 1), (14, 2), (15, 2)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 5. -/
theorem ep_Q2_024_partial_05_0132_valid :
    mulPoly ep_Q2_024_coefficient_05_0132
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0133 : Poly :=
[
  term ((-9851670194564511 : Rat) / 2325560442306386) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 133 for generator 5. -/
def ep_Q2_024_partial_05_0133 : Poly :=
[
  term ((-9851670194564511 : Rat) / 2325560442306386) [(1, 1), (2, 2), (11, 1), (15, 2), (16, 1)],
  term ((-9851670194564511 : Rat) / 2325560442306386) [(1, 1), (3, 2), (11, 1), (15, 2), (16, 1)],
  term ((9851670194564511 : Rat) / 2325560442306386) [(1, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((9851670194564511 : Rat) / 2325560442306386) [(1, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 5. -/
theorem ep_Q2_024_partial_05_0133_valid :
    mulPoly ep_Q2_024_coefficient_05_0133
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0134 : Poly :=
[
  term ((-9981185373239110214473941937942036621576 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 134 for generator 5. -/
def ep_Q2_024_partial_05_0134 : Poly :=
[
  term ((-9981185373239110214473941937942036621576 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (12, 1), (13, 1)],
  term ((-9981185373239110214473941937942036621576 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 2), (12, 1), (13, 1)],
  term ((9981185373239110214473941937942036621576 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (12, 1), (13, 1), (14, 2)],
  term ((9981185373239110214473941937942036621576 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 5. -/
theorem ep_Q2_024_partial_05_0134_valid :
    mulPoly ep_Q2_024_coefficient_05_0134
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0135 : Poly :=
[
  term ((769867564479366812953571209038643495678 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 135 for generator 5. -/
def ep_Q2_024_partial_05_0135 : Poly :=
[
  term ((769867564479366812953571209038643495678 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (12, 1), (13, 1), (14, 1)],
  term ((769867564479366812953571209038643495678 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (12, 1), (13, 1), (14, 1)],
  term ((-769867564479366812953571209038643495678 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-769867564479366812953571209038643495678 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 5. -/
theorem ep_Q2_024_partial_05_0135_valid :
    mulPoly ep_Q2_024_coefficient_05_0135
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0136 : Poly :=
[
  term ((-63809728717467962303828533817595549908556377600616461799 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 136 for generator 5. -/
def ep_Q2_024_partial_05_0136 : Poly :=
[
  term ((-63809728717467962303828533817595549908556377600616461799 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (2, 2), (12, 1), (14, 1), (15, 1)],
  term ((-63809728717467962303828533817595549908556377600616461799 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (3, 2), (12, 1), (14, 1), (15, 1)],
  term ((63809728717467962303828533817595549908556377600616461799 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (12, 1), (14, 1), (15, 3)],
  term ((63809728717467962303828533817595549908556377600616461799 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 5. -/
theorem ep_Q2_024_partial_05_0136_valid :
    mulPoly ep_Q2_024_coefficient_05_0136
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0137 : Poly :=
[
  term ((10702511684117951 : Rat) / 2325560442306386) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 5. -/
def ep_Q2_024_partial_05_0137 : Poly :=
[
  term ((10702511684117951 : Rat) / 2325560442306386) [(1, 1), (2, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((10702511684117951 : Rat) / 2325560442306386) [(1, 1), (3, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10702511684117951 : Rat) / 2325560442306386) [(1, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-10702511684117951 : Rat) / 2325560442306386) [(1, 1), (12, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 5. -/
theorem ep_Q2_024_partial_05_0137_valid :
    mulPoly ep_Q2_024_coefficient_05_0137
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0138 : Poly :=
[
  term ((33661771713525067919160686794417181588961937234180595867 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 138 for generator 5. -/
def ep_Q2_024_partial_05_0138 : Poly :=
[
  term ((33661771713525067919160686794417181588961937234180595867 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(1, 1), (2, 2), (12, 1), (15, 1)],
  term ((33661771713525067919160686794417181588961937234180595867 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(1, 1), (3, 2), (12, 1), (15, 1)],
  term ((-33661771713525067919160686794417181588961937234180595867 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(1, 1), (12, 1), (14, 2), (15, 1)],
  term ((-33661771713525067919160686794417181588961937234180595867 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(1, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 5. -/
theorem ep_Q2_024_partial_05_0138_valid :
    mulPoly ep_Q2_024_coefficient_05_0138
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0139 : Poly :=
[
  term ((41256772435372561 : Rat) / 13953362653838316) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 139 for generator 5. -/
def ep_Q2_024_partial_05_0139 : Poly :=
[
  term ((41256772435372561 : Rat) / 13953362653838316) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((41256772435372561 : Rat) / 13953362653838316) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-41256772435372561 : Rat) / 13953362653838316) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-41256772435372561 : Rat) / 13953362653838316) [(1, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 5. -/
theorem ep_Q2_024_partial_05_0139_valid :
    mulPoly ep_Q2_024_coefficient_05_0139
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0140 : Poly :=
[
  term ((-474985800932387171145377037529163131234 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 2), (13, 1)]
]

/-- Partial product 140 for generator 5. -/
def ep_Q2_024_partial_05_0140 : Poly :=
[
  term ((-474985800932387171145377037529163131234 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (12, 2), (13, 1)],
  term ((-474985800932387171145377037529163131234 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (12, 2), (13, 1)],
  term ((474985800932387171145377037529163131234 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 2), (13, 1), (14, 2)],
  term ((474985800932387171145377037529163131234 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 5. -/
theorem ep_Q2_024_partial_05_0140_valid :
    mulPoly ep_Q2_024_coefficient_05_0140
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0141 : Poly :=
[
  term ((36144625411604114220433409966369222218981052478500806513 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (12, 2), (15, 1)]
]

/-- Partial product 141 for generator 5. -/
def ep_Q2_024_partial_05_0141 : Poly :=
[
  term ((36144625411604114220433409966369222218981052478500806513 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (2, 2), (12, 2), (15, 1)],
  term ((36144625411604114220433409966369222218981052478500806513 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (3, 2), (12, 2), (15, 1)],
  term ((-36144625411604114220433409966369222218981052478500806513 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (12, 2), (14, 2), (15, 1)],
  term ((-36144625411604114220433409966369222218981052478500806513 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 5. -/
theorem ep_Q2_024_partial_05_0141_valid :
    mulPoly ep_Q2_024_coefficient_05_0141
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0142 : Poly :=
[
  term ((-11017641963391001 : Rat) / 2325560442306386) [(1, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 142 for generator 5. -/
def ep_Q2_024_partial_05_0142 : Poly :=
[
  term ((-11017641963391001 : Rat) / 2325560442306386) [(1, 1), (2, 2), (12, 2), (15, 1), (16, 1)],
  term ((-11017641963391001 : Rat) / 2325560442306386) [(1, 1), (3, 2), (12, 2), (15, 1), (16, 1)],
  term ((11017641963391001 : Rat) / 2325560442306386) [(1, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((11017641963391001 : Rat) / 2325560442306386) [(1, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 5. -/
theorem ep_Q2_024_partial_05_0142_valid :
    mulPoly ep_Q2_024_coefficient_05_0142
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0143 : Poly :=
[
  term ((-227262778724543925892420926175159206548 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (13, 1)]
]

/-- Partial product 143 for generator 5. -/
def ep_Q2_024_partial_05_0143 : Poly :=
[
  term ((-227262778724543925892420926175159206548 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (2, 2), (13, 1)],
  term ((-227262778724543925892420926175159206548 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (3, 2), (13, 1)],
  term ((227262778724543925892420926175159206548 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (13, 1), (14, 2)],
  term ((227262778724543925892420926175159206548 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 5. -/
theorem ep_Q2_024_partial_05_0143_valid :
    mulPoly ep_Q2_024_coefficient_05_0143
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0144 : Poly :=
[
  term ((6435545303078006446336310144335796012672 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 144 for generator 5. -/
def ep_Q2_024_partial_05_0144 : Poly :=
[
  term ((6435545303078006446336310144335796012672 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (13, 1), (14, 1)],
  term ((6435545303078006446336310144335796012672 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 2), (13, 1), (14, 1)],
  term ((-6435545303078006446336310144335796012672 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-6435545303078006446336310144335796012672 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 5. -/
theorem ep_Q2_024_partial_05_0144_valid :
    mulPoly ep_Q2_024_coefficient_05_0144
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0145 : Poly :=
[
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 1), (14, 2)]
]

/-- Partial product 145 for generator 5. -/
def ep_Q2_024_partial_05_0145 : Poly :=
[
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (13, 1), (14, 2)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (13, 1), (14, 2)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 1), (14, 2), (15, 2)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 1), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 5. -/
theorem ep_Q2_024_partial_05_0145_valid :
    mulPoly ep_Q2_024_coefficient_05_0145
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0146 : Poly :=
[
  term ((-15109217256518315323716689223387286634317328803199609516 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (13, 1), (15, 2)]
]

/-- Partial product 146 for generator 5. -/
def ep_Q2_024_partial_05_0146 : Poly :=
[
  term ((-15109217256518315323716689223387286634317328803199609516 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (13, 1), (15, 2)],
  term ((-15109217256518315323716689223387286634317328803199609516 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 2), (13, 1), (15, 2)],
  term ((15109217256518315323716689223387286634317328803199609516 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (13, 1), (14, 2), (15, 2)],
  term ((15109217256518315323716689223387286634317328803199609516 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 5. -/
theorem ep_Q2_024_partial_05_0146_valid :
    mulPoly ep_Q2_024_coefficient_05_0146
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0147 : Poly :=
[
  term ((2130221066942416 : Rat) / 1162780221153193) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 147 for generator 5. -/
def ep_Q2_024_partial_05_0147 : Poly :=
[
  term ((2130221066942416 : Rat) / 1162780221153193) [(1, 1), (2, 2), (13, 1), (15, 2), (16, 1)],
  term ((2130221066942416 : Rat) / 1162780221153193) [(1, 1), (3, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2130221066942416 : Rat) / 1162780221153193) [(1, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2130221066942416 : Rat) / 1162780221153193) [(1, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 5. -/
theorem ep_Q2_024_partial_05_0147_valid :
    mulPoly ep_Q2_024_coefficient_05_0147
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0148 : Poly :=
[
  term ((11530512132661982754025626129402130138490986283296027556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (13, 2), (15, 1)]
]

/-- Partial product 148 for generator 5. -/
def ep_Q2_024_partial_05_0148 : Poly :=
[
  term ((11530512132661982754025626129402130138490986283296027556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (13, 2), (15, 1)],
  term ((11530512132661982754025626129402130138490986283296027556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 2), (13, 2), (15, 1)],
  term ((-11530512132661982754025626129402130138490986283296027556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (13, 2), (14, 2), (15, 1)],
  term ((-11530512132661982754025626129402130138490986283296027556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 5. -/
theorem ep_Q2_024_partial_05_0148_valid :
    mulPoly ep_Q2_024_coefficient_05_0148
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0149 : Poly :=
[
  term ((-150661185588720 : Rat) / 1162780221153193) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 149 for generator 5. -/
def ep_Q2_024_partial_05_0149 : Poly :=
[
  term ((-150661185588720 : Rat) / 1162780221153193) [(1, 1), (2, 2), (13, 2), (15, 1), (16, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(1, 1), (3, 2), (13, 2), (15, 1), (16, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(1, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(1, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 5. -/
theorem ep_Q2_024_partial_05_0149_valid :
    mulPoly ep_Q2_024_coefficient_05_0149
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0150 : Poly :=
[
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 3)]
]

/-- Partial product 150 for generator 5. -/
def ep_Q2_024_partial_05_0150 : Poly :=
[
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (13, 3)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (13, 3)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 3), (14, 2)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 5. -/
theorem ep_Q2_024_partial_05_0150_valid :
    mulPoly ep_Q2_024_coefficient_05_0150
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0151 : Poly :=
[
  term ((-233885638111528796671242769364030897678967916048479315841 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 151 for generator 5. -/
def ep_Q2_024_partial_05_0151 : Poly :=
[
  term ((-233885638111528796671242769364030897678967916048479315841 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (2, 2), (14, 1), (15, 1)],
  term ((-233885638111528796671242769364030897678967916048479315841 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((233885638111528796671242769364030897678967916048479315841 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (14, 1), (15, 3)],
  term ((233885638111528796671242769364030897678967916048479315841 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 5. -/
theorem ep_Q2_024_partial_05_0151_valid :
    mulPoly ep_Q2_024_coefficient_05_0151
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0152 : Poly :=
[
  term ((139503008883585145 : Rat) / 13953362653838316) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 152 for generator 5. -/
def ep_Q2_024_partial_05_0152 : Poly :=
[
  term ((139503008883585145 : Rat) / 13953362653838316) [(1, 1), (2, 2), (14, 1), (15, 1), (16, 1)],
  term ((139503008883585145 : Rat) / 13953362653838316) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((-139503008883585145 : Rat) / 13953362653838316) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((-139503008883585145 : Rat) / 13953362653838316) [(1, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 5. -/
theorem ep_Q2_024_partial_05_0152_valid :
    mulPoly ep_Q2_024_coefficient_05_0152
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0153 : Poly :=
[
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (14, 2), (15, 1)]
]

/-- Partial product 153 for generator 5. -/
def ep_Q2_024_partial_05_0153 : Poly :=
[
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 2), (14, 2), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 2), (14, 2), (15, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (14, 2), (15, 3)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 5. -/
theorem ep_Q2_024_partial_05_0153_valid :
    mulPoly ep_Q2_024_coefficient_05_0153
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0154 : Poly :=
[
  term ((-416983870520476 : Rat) / 1162780221153193) [(1, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 154 for generator 5. -/
def ep_Q2_024_partial_05_0154 : Poly :=
[
  term ((-416983870520476 : Rat) / 1162780221153193) [(1, 1), (2, 2), (14, 2), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(1, 1), (3, 2), (14, 2), (15, 1), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(1, 1), (14, 2), (15, 3), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(1, 1), (14, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 5. -/
theorem ep_Q2_024_partial_05_0154_valid :
    mulPoly ep_Q2_024_coefficient_05_0154
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0155 : Poly :=
[
  term ((-2276783146395046960353176783349682704246168878841537837923 : Rat) / 66959924553505426932343687020211144617648942473817219360) [(1, 1), (15, 1)]
]

/-- Partial product 155 for generator 5. -/
def ep_Q2_024_partial_05_0155 : Poly :=
[
  term ((-2276783146395046960353176783349682704246168878841537837923 : Rat) / 66959924553505426932343687020211144617648942473817219360) [(1, 1), (2, 2), (15, 1)],
  term ((-2276783146395046960353176783349682704246168878841537837923 : Rat) / 66959924553505426932343687020211144617648942473817219360) [(1, 1), (3, 2), (15, 1)],
  term ((2276783146395046960353176783349682704246168878841537837923 : Rat) / 66959924553505426932343687020211144617648942473817219360) [(1, 1), (14, 2), (15, 1)],
  term ((2276783146395046960353176783349682704246168878841537837923 : Rat) / 66959924553505426932343687020211144617648942473817219360) [(1, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 5. -/
theorem ep_Q2_024_partial_05_0155_valid :
    mulPoly ep_Q2_024_coefficient_05_0155
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0156 : Poly :=
[
  term ((-158939915531830591 : Rat) / 27906725307676632) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 156 for generator 5. -/
def ep_Q2_024_partial_05_0156 : Poly :=
[
  term ((-158939915531830591 : Rat) / 27906725307676632) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-158939915531830591 : Rat) / 27906725307676632) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((158939915531830591 : Rat) / 27906725307676632) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((158939915531830591 : Rat) / 27906725307676632) [(1, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 5. -/
theorem ep_Q2_024_partial_05_0156_valid :
    mulPoly ep_Q2_024_coefficient_05_0156
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0157 : Poly :=
[
  term ((-30319949922420581909856687343539306148 : Rat) / 599854728701238648283346764014769633995) [(2, 1)]
]

/-- Partial product 157 for generator 5. -/
def ep_Q2_024_partial_05_0157 : Poly :=
[
  term ((-30319949922420581909856687343539306148 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2)],
  term ((30319949922420581909856687343539306148 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (14, 2)],
  term ((30319949922420581909856687343539306148 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (15, 2)],
  term ((-30319949922420581909856687343539306148 : Rat) / 599854728701238648283346764014769633995) [(2, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 5. -/
theorem ep_Q2_024_partial_05_0157_valid :
    mulPoly ep_Q2_024_coefficient_05_0157
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0158 : Poly :=
[
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (9, 1)]
]

/-- Partial product 158 for generator 5. -/
def ep_Q2_024_partial_05_0158 : Poly :=
[
  term ((-4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (9, 1), (14, 2)],
  term ((-4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (9, 1), (15, 2)],
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 3), (9, 1)],
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 3), (3, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 5. -/
theorem ep_Q2_024_partial_05_0158_valid :
    mulPoly ep_Q2_024_coefficient_05_0158
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0159 : Poly :=
[
  term ((471259151178452164992338943788144678504 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1)]
]

/-- Partial product 159 for generator 5. -/
def ep_Q2_024_partial_05_0159 : Poly :=
[
  term ((471259151178452164992338943788144678504 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 2), (5, 1), (9, 1)],
  term ((-471259151178452164992338943788144678504 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1), (14, 2)],
  term ((-471259151178452164992338943788144678504 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1), (15, 2)],
  term ((471259151178452164992338943788144678504 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 5. -/
theorem ep_Q2_024_partial_05_0159_valid :
    mulPoly ep_Q2_024_coefficient_05_0159
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0160 : Poly :=
[
  term ((-8568573160462905287672866446906963424 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (13, 1)]
]

/-- Partial product 160 for generator 5. -/
def ep_Q2_024_partial_05_0160 : Poly :=
[
  term ((-8568573160462905287672866446906963424 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 2), (5, 1), (13, 1)],
  term ((8568573160462905287672866446906963424 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (13, 1), (14, 2)],
  term ((8568573160462905287672866446906963424 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (13, 1), (15, 2)],
  term ((-8568573160462905287672866446906963424 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 5. -/
theorem ep_Q2_024_partial_05_0160_valid :
    mulPoly ep_Q2_024_coefficient_05_0160
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0161 : Poly :=
[
  term ((2203341111325589270383472251862405380471228908781825308 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 161 for generator 5. -/
def ep_Q2_024_partial_05_0161 : Poly :=
[
  term ((2203341111325589270383472251862405380471228908781825308 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (3, 2), (5, 1), (15, 1)],
  term ((-2203341111325589270383472251862405380471228908781825308 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 1), (14, 2), (15, 1)],
  term ((-2203341111325589270383472251862405380471228908781825308 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 1), (15, 3)],
  term ((2203341111325589270383472251862405380471228908781825308 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 3), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 5. -/
theorem ep_Q2_024_partial_05_0161_valid :
    mulPoly ep_Q2_024_coefficient_05_0161
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0162 : Poly :=
[
  term ((-570220563132784 : Rat) / 1162780221153193) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 162 for generator 5. -/
def ep_Q2_024_partial_05_0162 : Poly :=
[
  term ((-570220563132784 : Rat) / 1162780221153193) [(2, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((570220563132784 : Rat) / 1162780221153193) [(2, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((570220563132784 : Rat) / 1162780221153193) [(2, 1), (5, 1), (15, 3), (16, 1)],
  term ((-570220563132784 : Rat) / 1162780221153193) [(2, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 5. -/
theorem ep_Q2_024_partial_05_0162_valid :
    mulPoly ep_Q2_024_coefficient_05_0162
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0163 : Poly :=
[
  term ((-1320395533120304220261212135047939590164 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1)]
]

/-- Partial product 163 for generator 5. -/
def ep_Q2_024_partial_05_0163 : Poly :=
[
  term ((-1320395533120304220261212135047939590164 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2), (7, 1), (9, 1)],
  term ((1320395533120304220261212135047939590164 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1), (14, 2)],
  term ((1320395533120304220261212135047939590164 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1), (15, 2)],
  term ((-1320395533120304220261212135047939590164 : Rat) / 599854728701238648283346764014769633995) [(2, 3), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 5. -/
theorem ep_Q2_024_partial_05_0163_valid :
    mulPoly ep_Q2_024_coefficient_05_0163
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0164 : Poly :=
[
  term ((-1077277655786558224075185495810441573248 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (13, 1)]
]

/-- Partial product 164 for generator 5. -/
def ep_Q2_024_partial_05_0164 : Poly :=
[
  term ((-1077277655786558224075185495810441573248 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2), (7, 1), (13, 1)],
  term ((1077277655786558224075185495810441573248 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (13, 1), (14, 2)],
  term ((1077277655786558224075185495810441573248 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((-1077277655786558224075185495810441573248 : Rat) / 599854728701238648283346764014769633995) [(2, 3), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 5. -/
theorem ep_Q2_024_partial_05_0164_valid :
    mulPoly ep_Q2_024_coefficient_05_0164
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0165 : Poly :=
[
  term ((-37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 165 for generator 5. -/
def ep_Q2_024_partial_05_0165 : Poly :=
[
  term ((-37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (3, 2), (7, 1), (15, 1)],
  term ((37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (7, 1), (14, 2), (15, 1)],
  term ((37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (7, 1), (15, 3)],
  term ((-37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 5. -/
theorem ep_Q2_024_partial_05_0165_valid :
    mulPoly ep_Q2_024_coefficient_05_0165
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0166 : Poly :=
[
  term ((5146839986298265 : Rat) / 1162780221153193) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 166 for generator 5. -/
def ep_Q2_024_partial_05_0166 : Poly :=
[
  term ((5146839986298265 : Rat) / 1162780221153193) [(2, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-5146839986298265 : Rat) / 1162780221153193) [(2, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5146839986298265 : Rat) / 1162780221153193) [(2, 1), (7, 1), (15, 3), (16, 1)],
  term ((5146839986298265 : Rat) / 1162780221153193) [(2, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 5. -/
theorem ep_Q2_024_partial_05_0166_valid :
    mulPoly ep_Q2_024_coefficient_05_0166
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0167 : Poly :=
[
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (8, 1)]
]

/-- Partial product 167 for generator 5. -/
def ep_Q2_024_partial_05_0167 : Poly :=
[
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 2), (8, 1)],
  term ((1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (8, 1), (14, 2)],
  term ((1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (8, 1), (15, 2)],
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 3), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 5. -/
theorem ep_Q2_024_partial_05_0167_valid :
    mulPoly ep_Q2_024_coefficient_05_0167
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0168 : Poly :=
[
  term ((-219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 168 for generator 5. -/
def ep_Q2_024_partial_05_0168 : Poly :=
[
  term ((-219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2), (9, 1), (12, 1), (13, 1)],
  term ((219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(2, 3), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 5. -/
theorem ep_Q2_024_partial_05_0168_valid :
    mulPoly ep_Q2_024_coefficient_05_0168
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0169 : Poly :=
[
  term ((12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 169 for generator 5. -/
def ep_Q2_024_partial_05_0169 : Poly :=
[
  term ((12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (9, 1), (12, 1), (15, 3)],
  term ((12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 3), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 5. -/
theorem ep_Q2_024_partial_05_0169_valid :
    mulPoly ep_Q2_024_coefficient_05_0169
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0170 : Poly :=
[
  term ((-1765379642691762 : Rat) / 1162780221153193) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 170 for generator 5. -/
def ep_Q2_024_partial_05_0170 : Poly :=
[
  term ((-1765379642691762 : Rat) / 1162780221153193) [(2, 1), (3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1765379642691762 : Rat) / 1162780221153193) [(2, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1765379642691762 : Rat) / 1162780221153193) [(2, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1765379642691762 : Rat) / 1162780221153193) [(2, 3), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 5. -/
theorem ep_Q2_024_partial_05_0170_valid :
    mulPoly ep_Q2_024_coefficient_05_0170
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0171 : Poly :=
[
  term ((1443674398969407308672183005387760253952 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (13, 1)]
]

/-- Partial product 171 for generator 5. -/
def ep_Q2_024_partial_05_0171 : Poly :=
[
  term ((1443674398969407308672183005387760253952 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2), (9, 1), (13, 1)],
  term ((-1443674398969407308672183005387760253952 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (13, 1), (14, 2)],
  term ((-1443674398969407308672183005387760253952 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (13, 1), (15, 2)],
  term ((1443674398969407308672183005387760253952 : Rat) / 599854728701238648283346764014769633995) [(2, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 5. -/
theorem ep_Q2_024_partial_05_0171_valid :
    mulPoly ep_Q2_024_coefficient_05_0171
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0172 : Poly :=
[
  term ((9056175032874610498059599184486365114086519523772254381 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 172 for generator 5. -/
def ep_Q2_024_partial_05_0172 : Poly :=
[
  term ((9056175032874610498059599184486365114086519523772254381 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 1), (3, 2), (9, 1), (15, 1)],
  term ((-9056175032874610498059599184486365114086519523772254381 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((-9056175032874610498059599184486365114086519523772254381 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 1), (9, 1), (15, 3)],
  term ((9056175032874610498059599184486365114086519523772254381 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 5. -/
theorem ep_Q2_024_partial_05_0172_valid :
    mulPoly ep_Q2_024_coefficient_05_0172
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0173 : Poly :=
[
  term ((-4992932602580610 : Rat) / 1162780221153193) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 173 for generator 5. -/
def ep_Q2_024_partial_05_0173 : Poly :=
[
  term ((-4992932602580610 : Rat) / 1162780221153193) [(2, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((4992932602580610 : Rat) / 1162780221153193) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((4992932602580610 : Rat) / 1162780221153193) [(2, 1), (9, 1), (15, 3), (16, 1)],
  term ((-4992932602580610 : Rat) / 1162780221153193) [(2, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 5. -/
theorem ep_Q2_024_partial_05_0173_valid :
    mulPoly ep_Q2_024_coefficient_05_0173
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0174 : Poly :=
[
  term ((525041470367147397815123902793938464676 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (9, 2)]
]

/-- Partial product 174 for generator 5. -/
def ep_Q2_024_partial_05_0174 : Poly :=
[
  term ((525041470367147397815123902793938464676 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (9, 2)],
  term ((-525041470367147397815123902793938464676 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (9, 2), (14, 2)],
  term ((-525041470367147397815123902793938464676 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (9, 2), (15, 2)],
  term ((525041470367147397815123902793938464676 : Rat) / 119970945740247729656669352802953926799) [(2, 3), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 5. -/
theorem ep_Q2_024_partial_05_0174_valid :
    mulPoly ep_Q2_024_coefficient_05_0174
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0175 : Poly :=
[
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (12, 1)]
]

/-- Partial product 175 for generator 5. -/
def ep_Q2_024_partial_05_0175 : Poly :=
[
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 2), (12, 1)],
  term ((1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (12, 1), (14, 2)],
  term ((1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (12, 1), (15, 2)],
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 5. -/
theorem ep_Q2_024_partial_05_0175_valid :
    mulPoly ep_Q2_024_coefficient_05_0175
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0176 : Poly :=
[
  term ((-5936662281894181571187310497844244858728820934468400988 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 176 for generator 5. -/
def ep_Q2_024_partial_05_0176 : Poly :=
[
  term ((-5936662281894181571187310497844244858728820934468400988 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((5936662281894181571187310497844244858728820934468400988 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((5936662281894181571187310497844244858728820934468400988 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (13, 1), (15, 3)],
  term ((-5936662281894181571187310497844244858728820934468400988 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 5. -/
theorem ep_Q2_024_partial_05_0176_valid :
    mulPoly ep_Q2_024_coefficient_05_0176
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0177 : Poly :=
[
  term ((2338229914966144 : Rat) / 1162780221153193) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 177 for generator 5. -/
def ep_Q2_024_partial_05_0177 : Poly :=
[
  term ((2338229914966144 : Rat) / 1162780221153193) [(2, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2338229914966144 : Rat) / 1162780221153193) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2338229914966144 : Rat) / 1162780221153193) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((2338229914966144 : Rat) / 1162780221153193) [(2, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 5. -/
theorem ep_Q2_024_partial_05_0177_valid :
    mulPoly ep_Q2_024_coefficient_05_0177
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0178 : Poly :=
[
  term ((-358074210114821436679525373456997061912 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (13, 2)]
]

/-- Partial product 178 for generator 5. -/
def ep_Q2_024_partial_05_0178 : Poly :=
[
  term ((-358074210114821436679525373456997061912 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2), (13, 2)],
  term ((358074210114821436679525373456997061912 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (13, 2), (14, 2)],
  term ((358074210114821436679525373456997061912 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (13, 2), (15, 2)],
  term ((-358074210114821436679525373456997061912 : Rat) / 599854728701238648283346764014769633995) [(2, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 5. -/
theorem ep_Q2_024_partial_05_0178_valid :
    mulPoly ep_Q2_024_coefficient_05_0178
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0179 : Poly :=
[
  term ((19623874411894189808887221951571966976 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (14, 1)]
]

/-- Partial product 179 for generator 5. -/
def ep_Q2_024_partial_05_0179 : Poly :=
[
  term ((19623874411894189808887221951571966976 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 2), (14, 1)],
  term ((-19623874411894189808887221951571966976 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (14, 1), (15, 2)],
  term ((-19623874411894189808887221951571966976 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (14, 3)],
  term ((19623874411894189808887221951571966976 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 5. -/
theorem ep_Q2_024_partial_05_0179_valid :
    mulPoly ep_Q2_024_coefficient_05_0179
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0180 : Poly :=
[
  term ((4205022070911486745852062934742411579250833710902202306 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (15, 2)]
]

/-- Partial product 180 for generator 5. -/
def ep_Q2_024_partial_05_0180 : Poly :=
[
  term ((4205022070911486745852062934742411579250833710902202306 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 2), (15, 2)],
  term ((-4205022070911486745852062934742411579250833710902202306 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (14, 2), (15, 2)],
  term ((-4205022070911486745852062934742411579250833710902202306 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (15, 4)],
  term ((4205022070911486745852062934742411579250833710902202306 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 5. -/
theorem ep_Q2_024_partial_05_0180_valid :
    mulPoly ep_Q2_024_coefficient_05_0180
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0181 : Poly :=
[
  term ((-391419201826808 : Rat) / 1162780221153193) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 181 for generator 5. -/
def ep_Q2_024_partial_05_0181 : Poly :=
[
  term ((-391419201826808 : Rat) / 1162780221153193) [(2, 1), (3, 2), (15, 2), (16, 1)],
  term ((391419201826808 : Rat) / 1162780221153193) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((391419201826808 : Rat) / 1162780221153193) [(2, 1), (15, 4), (16, 1)],
  term ((-391419201826808 : Rat) / 1162780221153193) [(2, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 5. -/
theorem ep_Q2_024_partial_05_0181_valid :
    mulPoly ep_Q2_024_coefficient_05_0181
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0182 : Poly :=
[
  term ((-2904812759270305900015568083246447237744 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (9, 1)]
]

/-- Partial product 182 for generator 5. -/
def ep_Q2_024_partial_05_0182 : Poly :=
[
  term ((-2904812759270305900015568083246447237744 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (4, 1), (9, 1)],
  term ((2904812759270305900015568083246447237744 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (9, 1), (14, 2)],
  term ((2904812759270305900015568083246447237744 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (9, 1), (15, 2)],
  term ((-2904812759270305900015568083246447237744 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (4, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 5. -/
theorem ep_Q2_024_partial_05_0182_valid :
    mulPoly ep_Q2_024_coefficient_05_0182
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0183 : Poly :=
[
  term ((10110037398755982233029146430231170768 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (13, 1)]
]

/-- Partial product 183 for generator 5. -/
def ep_Q2_024_partial_05_0183 : Poly :=
[
  term ((10110037398755982233029146430231170768 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (4, 1), (13, 1)],
  term ((-10110037398755982233029146430231170768 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (13, 1), (14, 2)],
  term ((-10110037398755982233029146430231170768 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (13, 1), (15, 2)],
  term ((10110037398755982233029146430231170768 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (4, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 5. -/
theorem ep_Q2_024_partial_05_0183_valid :
    mulPoly ep_Q2_024_coefficient_05_0183
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0184 : Poly :=
[
  term ((-543406129438182815857355846439330733917642672607978912 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (4, 1), (15, 1)]
]

/-- Partial product 184 for generator 5. -/
def ep_Q2_024_partial_05_0184 : Poly :=
[
  term ((-543406129438182815857355846439330733917642672607978912 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (3, 1), (4, 1), (15, 1)],
  term ((543406129438182815857355846439330733917642672607978912 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (4, 1), (14, 2), (15, 1)],
  term ((543406129438182815857355846439330733917642672607978912 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (4, 1), (15, 3)],
  term ((-543406129438182815857355846439330733917642672607978912 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 3), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 5. -/
theorem ep_Q2_024_partial_05_0184_valid :
    mulPoly ep_Q2_024_coefficient_05_0184
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0185 : Poly :=
[
  term ((-51735384255808 : Rat) / 1162780221153193) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 185 for generator 5. -/
def ep_Q2_024_partial_05_0185 : Poly :=
[
  term ((-51735384255808 : Rat) / 1162780221153193) [(2, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((51735384255808 : Rat) / 1162780221153193) [(3, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((51735384255808 : Rat) / 1162780221153193) [(3, 1), (4, 1), (15, 3), (16, 1)],
  term ((-51735384255808 : Rat) / 1162780221153193) [(3, 3), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 5. -/
theorem ep_Q2_024_partial_05_0185_valid :
    mulPoly ep_Q2_024_coefficient_05_0185
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0186 : Poly :=
[
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (9, 1)]
]

/-- Partial product 186 for generator 5. -/
def ep_Q2_024_partial_05_0186 : Poly :=
[
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (5, 1), (7, 1), (9, 1)],
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 2)],
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2)],
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (5, 1), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 5. -/
theorem ep_Q2_024_partial_05_0186_valid :
    mulPoly ep_Q2_024_coefficient_05_0186
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0187 : Poly :=
[
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (13, 1)]
]

/-- Partial product 187 for generator 5. -/
def ep_Q2_024_partial_05_0187 : Poly :=
[
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 2)],
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2)],
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (5, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 5. -/
theorem ep_Q2_024_partial_05_0187_valid :
    mulPoly ep_Q2_024_coefficient_05_0187
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0188 : Poly :=
[
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (7, 1), (15, 1)]
]

/-- Partial product 188 for generator 5. -/
def ep_Q2_024_partial_05_0188 : Poly :=
[
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (7, 1), (14, 2), (15, 1)],
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (7, 1), (15, 3)],
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 3), (5, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 5. -/
theorem ep_Q2_024_partial_05_0188_valid :
    mulPoly ep_Q2_024_coefficient_05_0188
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0189 : Poly :=
[
  term ((-103470768511616 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 189 for generator 5. -/
def ep_Q2_024_partial_05_0189 : Poly :=
[
  term ((-103470768511616 : Rat) / 1162780221153193) [(2, 2), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((103470768511616 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((103470768511616 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((-103470768511616 : Rat) / 1162780221153193) [(3, 3), (5, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 5. -/
theorem ep_Q2_024_partial_05_0189_valid :
    mulPoly ep_Q2_024_coefficient_05_0189
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0190 : Poly :=
[
  term ((-195472833730678188627374464114891944832 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (9, 1), (13, 1)]
]

/-- Partial product 190 for generator 5. -/
def ep_Q2_024_partial_05_0190 : Poly :=
[
  term ((-195472833730678188627374464114891944832 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((195472833730678188627374464114891944832 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 2)],
  term ((195472833730678188627374464114891944832 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2)],
  term ((-195472833730678188627374464114891944832 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (5, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 5. -/
theorem ep_Q2_024_partial_05_0190_valid :
    mulPoly ep_Q2_024_coefficient_05_0190
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0191 : Poly :=
[
  term ((-372888177235126313188097315327845719657294457097438278 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (9, 1), (15, 1)]
]

/-- Partial product 191 for generator 5. -/
def ep_Q2_024_partial_05_0191 : Poly :=
[
  term ((-372888177235126313188097315327845719657294457097438278 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (3, 1), (5, 1), (9, 1), (15, 1)],
  term ((372888177235126313188097315327845719657294457097438278 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (9, 1), (14, 2), (15, 1)],
  term ((372888177235126313188097315327845719657294457097438278 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (9, 1), (15, 3)],
  term ((-372888177235126313188097315327845719657294457097438278 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 3), (5, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 5. -/
theorem ep_Q2_024_partial_05_0191_valid :
    mulPoly ep_Q2_024_coefficient_05_0191
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0192 : Poly :=
[
  term ((720356459271080 : Rat) / 1162780221153193) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 192 for generator 5. -/
def ep_Q2_024_partial_05_0192 : Poly :=
[
  term ((720356459271080 : Rat) / 1162780221153193) [(2, 2), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-720356459271080 : Rat) / 1162780221153193) [(3, 1), (5, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-720356459271080 : Rat) / 1162780221153193) [(3, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((720356459271080 : Rat) / 1162780221153193) [(3, 3), (5, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 5. -/
theorem ep_Q2_024_partial_05_0192_valid :
    mulPoly ep_Q2_024_coefficient_05_0192
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0193 : Poly :=
[
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 2)]
]

/-- Partial product 193 for generator 5. -/
def ep_Q2_024_partial_05_0193 : Poly :=
[
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (5, 1), (9, 2)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 2), (14, 2)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 2), (15, 2)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (5, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 5. -/
theorem ep_Q2_024_partial_05_0193_valid :
    mulPoly ep_Q2_024_coefficient_05_0193
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0194 : Poly :=
[
  term ((845108628777893564674938625406014780694 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1)]
]

/-- Partial product 194 for generator 5. -/
def ep_Q2_024_partial_05_0194 : Poly :=
[
  term ((845108628777893564674938625406014780694 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (7, 1)],
  term ((-845108628777893564674938625406014780694 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (14, 2)],
  term ((-845108628777893564674938625406014780694 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (15, 2)],
  term ((845108628777893564674938625406014780694 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 5. -/
theorem ep_Q2_024_partial_05_0194_valid :
    mulPoly ep_Q2_024_coefficient_05_0194
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0195 : Poly :=
[
  term ((-78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 195 for generator 5. -/
def ep_Q2_024_partial_05_0195 : Poly :=
[
  term ((-78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (7, 1), (9, 1), (13, 1)],
  term ((78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 2)],
  term ((78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((-78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (7, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 5. -/
theorem ep_Q2_024_partial_05_0195_valid :
    mulPoly ep_Q2_024_coefficient_05_0195
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0196 : Poly :=
[
  term ((1224510104923201687356037336946774208653866347508271591 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 196 for generator 5. -/
def ep_Q2_024_partial_05_0196 : Poly :=
[
  term ((1224510104923201687356037336946774208653866347508271591 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-1224510104923201687356037336946774208653866347508271591 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 1), (9, 1), (14, 2), (15, 1)],
  term ((-1224510104923201687356037336946774208653866347508271591 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 1), (9, 1), (15, 3)],
  term ((1224510104923201687356037336946774208653866347508271591 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 3), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 5. -/
theorem ep_Q2_024_partial_05_0196_valid :
    mulPoly ep_Q2_024_coefficient_05_0196
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0197 : Poly :=
[
  term ((-747574224772468 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 197 for generator 5. -/
def ep_Q2_024_partial_05_0197 : Poly :=
[
  term ((-747574224772468 : Rat) / 1162780221153193) [(2, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((747574224772468 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((747574224772468 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-747574224772468 : Rat) / 1162780221153193) [(3, 3), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 5. -/
theorem ep_Q2_024_partial_05_0197_valid :
    mulPoly ep_Q2_024_coefficient_05_0197
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0198 : Poly :=
[
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 2)]
]

/-- Partial product 198 for generator 5. -/
def ep_Q2_024_partial_05_0198 : Poly :=
[
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (7, 1), (9, 2)],
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 2), (14, 2)],
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 2), (15, 2)],
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (7, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 5. -/
theorem ep_Q2_024_partial_05_0198_valid :
    mulPoly ep_Q2_024_coefficient_05_0198
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0199 : Poly :=
[
  term ((1913272632689510489745685993931557676202398478467969062 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 199 for generator 5. -/
def ep_Q2_024_partial_05_0199 : Poly :=
[
  term ((1913272632689510489745685993931557676202398478467969062 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-1913272632689510489745685993931557676202398478467969062 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1913272632689510489745685993931557676202398478467969062 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (7, 1), (13, 1), (15, 3)],
  term ((1913272632689510489745685993931557676202398478467969062 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 3), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 5. -/
theorem ep_Q2_024_partial_05_0199_valid :
    mulPoly ep_Q2_024_coefficient_05_0199
        ep_Q2_024_generator_05_0100_0199 =
      ep_Q2_024_partial_05_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_05_0100_0199 : List Poly :=
[
  ep_Q2_024_partial_05_0100,
  ep_Q2_024_partial_05_0101,
  ep_Q2_024_partial_05_0102,
  ep_Q2_024_partial_05_0103,
  ep_Q2_024_partial_05_0104,
  ep_Q2_024_partial_05_0105,
  ep_Q2_024_partial_05_0106,
  ep_Q2_024_partial_05_0107,
  ep_Q2_024_partial_05_0108,
  ep_Q2_024_partial_05_0109,
  ep_Q2_024_partial_05_0110,
  ep_Q2_024_partial_05_0111,
  ep_Q2_024_partial_05_0112,
  ep_Q2_024_partial_05_0113,
  ep_Q2_024_partial_05_0114,
  ep_Q2_024_partial_05_0115,
  ep_Q2_024_partial_05_0116,
  ep_Q2_024_partial_05_0117,
  ep_Q2_024_partial_05_0118,
  ep_Q2_024_partial_05_0119,
  ep_Q2_024_partial_05_0120,
  ep_Q2_024_partial_05_0121,
  ep_Q2_024_partial_05_0122,
  ep_Q2_024_partial_05_0123,
  ep_Q2_024_partial_05_0124,
  ep_Q2_024_partial_05_0125,
  ep_Q2_024_partial_05_0126,
  ep_Q2_024_partial_05_0127,
  ep_Q2_024_partial_05_0128,
  ep_Q2_024_partial_05_0129,
  ep_Q2_024_partial_05_0130,
  ep_Q2_024_partial_05_0131,
  ep_Q2_024_partial_05_0132,
  ep_Q2_024_partial_05_0133,
  ep_Q2_024_partial_05_0134,
  ep_Q2_024_partial_05_0135,
  ep_Q2_024_partial_05_0136,
  ep_Q2_024_partial_05_0137,
  ep_Q2_024_partial_05_0138,
  ep_Q2_024_partial_05_0139,
  ep_Q2_024_partial_05_0140,
  ep_Q2_024_partial_05_0141,
  ep_Q2_024_partial_05_0142,
  ep_Q2_024_partial_05_0143,
  ep_Q2_024_partial_05_0144,
  ep_Q2_024_partial_05_0145,
  ep_Q2_024_partial_05_0146,
  ep_Q2_024_partial_05_0147,
  ep_Q2_024_partial_05_0148,
  ep_Q2_024_partial_05_0149,
  ep_Q2_024_partial_05_0150,
  ep_Q2_024_partial_05_0151,
  ep_Q2_024_partial_05_0152,
  ep_Q2_024_partial_05_0153,
  ep_Q2_024_partial_05_0154,
  ep_Q2_024_partial_05_0155,
  ep_Q2_024_partial_05_0156,
  ep_Q2_024_partial_05_0157,
  ep_Q2_024_partial_05_0158,
  ep_Q2_024_partial_05_0159,
  ep_Q2_024_partial_05_0160,
  ep_Q2_024_partial_05_0161,
  ep_Q2_024_partial_05_0162,
  ep_Q2_024_partial_05_0163,
  ep_Q2_024_partial_05_0164,
  ep_Q2_024_partial_05_0165,
  ep_Q2_024_partial_05_0166,
  ep_Q2_024_partial_05_0167,
  ep_Q2_024_partial_05_0168,
  ep_Q2_024_partial_05_0169,
  ep_Q2_024_partial_05_0170,
  ep_Q2_024_partial_05_0171,
  ep_Q2_024_partial_05_0172,
  ep_Q2_024_partial_05_0173,
  ep_Q2_024_partial_05_0174,
  ep_Q2_024_partial_05_0175,
  ep_Q2_024_partial_05_0176,
  ep_Q2_024_partial_05_0177,
  ep_Q2_024_partial_05_0178,
  ep_Q2_024_partial_05_0179,
  ep_Q2_024_partial_05_0180,
  ep_Q2_024_partial_05_0181,
  ep_Q2_024_partial_05_0182,
  ep_Q2_024_partial_05_0183,
  ep_Q2_024_partial_05_0184,
  ep_Q2_024_partial_05_0185,
  ep_Q2_024_partial_05_0186,
  ep_Q2_024_partial_05_0187,
  ep_Q2_024_partial_05_0188,
  ep_Q2_024_partial_05_0189,
  ep_Q2_024_partial_05_0190,
  ep_Q2_024_partial_05_0191,
  ep_Q2_024_partial_05_0192,
  ep_Q2_024_partial_05_0193,
  ep_Q2_024_partial_05_0194,
  ep_Q2_024_partial_05_0195,
  ep_Q2_024_partial_05_0196,
  ep_Q2_024_partial_05_0197,
  ep_Q2_024_partial_05_0198,
  ep_Q2_024_partial_05_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_05_0100_0199 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (2, 2), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2145093596645849219495004953877108926626236865692501316507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (2, 2), (5, 1), (13, 1), (15, 1)],
  term ((49730484048564751 : Rat) / 6976681326919158) [(1, 1), (2, 2), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-26487263738155951584262085343655170784 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (2, 2), (5, 1), (13, 2)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (5, 1), (13, 2), (14, 1)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (5, 1), (14, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 2), (5, 1), (14, 1), (15, 2)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (2, 2), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-475418534318063580141443576875141509826674210915175752793 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (2, 2), (5, 1), (15, 2)],
  term ((-23958955931124895 : Rat) / 6976681326919158) [(1, 1), (2, 2), (5, 1), (15, 2), (16, 1)],
  term ((-57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (5, 2), (9, 1)],
  term ((-319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (5, 2), (13, 1)],
  term ((-611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (2, 2), (5, 2), (15, 1)],
  term ((2568602061245288 : Rat) / 1162780221153193) [(1, 1), (2, 2), (5, 2), (15, 1), (16, 1)],
  term ((-907450556046215195256401401922709572872 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (7, 1)],
  term ((-3452924603613141561560579250626960304556 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (8, 1), (9, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 2), (8, 1), (12, 1), (13, 1)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (2, 2), (8, 1), (12, 1), (15, 1)],
  term ((-1086154201315805 : Rat) / 1162780221153193) [(1, 1), (2, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (8, 1), (13, 1)],
  term ((-8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (2, 2), (8, 1), (15, 1)],
  term ((8683303471552472 : Rat) / 3488340663459579) [(1, 1), (2, 2), (8, 1), (15, 1), (16, 1)],
  term ((326078684845295515420725567943401896389 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 2), (9, 1)],
  term ((-84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (9, 1), (11, 1), (15, 1)],
  term ((-969228957419244882311240360734253085340 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 2), (9, 1), (12, 1)],
  term ((2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (9, 1), (13, 1), (15, 1)],
  term ((-1495148449544936 : Rat) / 1162780221153193) [(1, 1), (2, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (9, 1), (13, 2)],
  term ((241325305719370233097203105089965295796 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 2), (9, 1), (14, 1)],
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (9, 2), (13, 1)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (11, 1)],
  term ((121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (11, 1), (13, 1), (15, 1)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (2, 2), (11, 1), (15, 2)],
  term ((-9851670194564511 : Rat) / 2325560442306386) [(1, 1), (2, 2), (11, 1), (15, 2), (16, 1)],
  term ((-9981185373239110214473941937942036621576 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (12, 1), (13, 1)],
  term ((769867564479366812953571209038643495678 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (12, 1), (13, 1), (14, 1)],
  term ((-63809728717467962303828533817595549908556377600616461799 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (2, 2), (12, 1), (14, 1), (15, 1)],
  term ((10702511684117951 : Rat) / 2325560442306386) [(1, 1), (2, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((33661771713525067919160686794417181588961937234180595867 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(1, 1), (2, 2), (12, 1), (15, 1)],
  term ((41256772435372561 : Rat) / 13953362653838316) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((-474985800932387171145377037529163131234 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (12, 2), (13, 1)],
  term ((36144625411604114220433409966369222218981052478500806513 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (2, 2), (12, 2), (15, 1)],
  term ((-11017641963391001 : Rat) / 2325560442306386) [(1, 1), (2, 2), (12, 2), (15, 1), (16, 1)],
  term ((-227262778724543925892420926175159206548 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (2, 2), (13, 1)],
  term ((6435545303078006446336310144335796012672 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (13, 1), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (13, 1), (14, 2)],
  term ((-15109217256518315323716689223387286634317328803199609516 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (13, 1), (15, 2)],
  term ((2130221066942416 : Rat) / 1162780221153193) [(1, 1), (2, 2), (13, 1), (15, 2), (16, 1)],
  term ((11530512132661982754025626129402130138490986283296027556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (13, 2), (15, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(1, 1), (2, 2), (13, 2), (15, 1), (16, 1)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (13, 3)],
  term ((-233885638111528796671242769364030897678967916048479315841 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (2, 2), (14, 1), (15, 1)],
  term ((139503008883585145 : Rat) / 13953362653838316) [(1, 1), (2, 2), (14, 1), (15, 1), (16, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 2), (14, 2), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(1, 1), (2, 2), (14, 2), (15, 1), (16, 1)],
  term ((-2276783146395046960353176783349682704246168878841537837923 : Rat) / 66959924553505426932343687020211144617648942473817219360) [(1, 1), (2, 2), (15, 1)],
  term ((-158939915531830591 : Rat) / 27906725307676632) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (3, 2), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2145093596645849219495004953877108926626236865692501316507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (3, 2), (5, 1), (13, 1), (15, 1)],
  term ((49730484048564751 : Rat) / 6976681326919158) [(1, 1), (3, 2), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-26487263738155951584262085343655170784 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (3, 2), (5, 1), (13, 2)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (5, 1), (13, 2), (14, 1)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (5, 1), (14, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 2), (5, 1), (14, 1), (15, 2)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (3, 2), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-475418534318063580141443576875141509826674210915175752793 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (3, 2), (5, 1), (15, 2)],
  term ((-23958955931124895 : Rat) / 6976681326919158) [(1, 1), (3, 2), (5, 1), (15, 2), (16, 1)],
  term ((-57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (5, 2), (9, 1)],
  term ((-319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (5, 2), (13, 1)],
  term ((-611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (3, 2), (5, 2), (15, 1)],
  term ((2568602061245288 : Rat) / 1162780221153193) [(1, 1), (3, 2), (5, 2), (15, 1), (16, 1)],
  term ((-907450556046215195256401401922709572872 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (7, 1)],
  term ((-3452924603613141561560579250626960304556 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (8, 1), (9, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 2), (8, 1), (12, 1), (13, 1)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (3, 2), (8, 1), (12, 1), (15, 1)],
  term ((-1086154201315805 : Rat) / 1162780221153193) [(1, 1), (3, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 2), (8, 1), (13, 1)],
  term ((-8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 2), (8, 1), (15, 1)],
  term ((8683303471552472 : Rat) / 3488340663459579) [(1, 1), (3, 2), (8, 1), (15, 1), (16, 1)],
  term ((326078684845295515420725567943401896389 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 2), (9, 1)],
  term ((-84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (9, 1), (11, 1), (15, 1)],
  term ((-969228957419244882311240360734253085340 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 2), (9, 1), (12, 1)],
  term ((2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 2), (9, 1), (13, 1), (15, 1)],
  term ((-1495148449544936 : Rat) / 1162780221153193) [(1, 1), (3, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (9, 1), (13, 2)],
  term ((241325305719370233097203105089965295796 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 2), (9, 1), (14, 1)],
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (9, 2), (13, 1)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 2), (11, 1)],
  term ((121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (11, 1), (13, 1), (15, 1)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (3, 2), (11, 1), (15, 2)],
  term ((-9851670194564511 : Rat) / 2325560442306386) [(1, 1), (3, 2), (11, 1), (15, 2), (16, 1)],
  term ((-9981185373239110214473941937942036621576 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 2), (12, 1), (13, 1)],
  term ((769867564479366812953571209038643495678 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (12, 1), (13, 1), (14, 1)],
  term ((-63809728717467962303828533817595549908556377600616461799 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (3, 2), (12, 1), (14, 1), (15, 1)],
  term ((10702511684117951 : Rat) / 2325560442306386) [(1, 1), (3, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((33661771713525067919160686794417181588961937234180595867 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(1, 1), (3, 2), (12, 1), (15, 1)],
  term ((41256772435372561 : Rat) / 13953362653838316) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-474985800932387171145377037529163131234 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (12, 2), (13, 1)],
  term ((36144625411604114220433409966369222218981052478500806513 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (3, 2), (12, 2), (15, 1)],
  term ((-11017641963391001 : Rat) / 2325560442306386) [(1, 1), (3, 2), (12, 2), (15, 1), (16, 1)],
  term ((-227262778724543925892420926175159206548 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (3, 2), (13, 1)],
  term ((6435545303078006446336310144335796012672 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 2), (13, 1), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (13, 1), (14, 2)],
  term ((-15109217256518315323716689223387286634317328803199609516 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 2), (13, 1), (15, 2)],
  term ((2130221066942416 : Rat) / 1162780221153193) [(1, 1), (3, 2), (13, 1), (15, 2), (16, 1)],
  term ((11530512132661982754025626129402130138490986283296027556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 2), (13, 2), (15, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(1, 1), (3, 2), (13, 2), (15, 1), (16, 1)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (13, 3)],
  term ((-233885638111528796671242769364030897678967916048479315841 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((139503008883585145 : Rat) / 13953362653838316) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 2), (14, 2), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(1, 1), (3, 2), (14, 2), (15, 1), (16, 1)],
  term ((-2276783146395046960353176783349682704246168878841537837923 : Rat) / 66959924553505426932343687020211144617648942473817219360) [(1, 1), (3, 2), (15, 1)],
  term ((-158939915531830591 : Rat) / 27906725307676632) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2145093596645849219495004953877108926626236865692501316507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1)],
  term ((-49730484048564751 : Rat) / 6976681326919158) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-2145093596645849219495004953877108926626236865692501316507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (5, 1), (13, 1), (15, 3)],
  term ((-49730484048564751 : Rat) / 6976681326919158) [(1, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (13, 2), (14, 1), (15, 2)],
  term ((26487263738155951584262085343655170784 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (13, 2), (14, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (13, 2), (14, 3)],
  term ((26487263738155951584262085343655170784 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (13, 2), (15, 2)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (14, 1), (15, 2)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (14, 1), (15, 4)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (14, 1), (15, 4), (16, 1)],
  term ((475418534318063580141443576875141509826674210915175752793 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (5, 1), (14, 2), (15, 2)],
  term ((23958955931124895 : Rat) / 6976681326919158) [(1, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (14, 3)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (14, 3), (15, 2)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (14, 3), (15, 2), (16, 1)],
  term ((475418534318063580141443576875141509826674210915175752793 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (5, 1), (15, 4)],
  term ((23958955931124895 : Rat) / 6976681326919158) [(1, 1), (5, 1), (15, 4), (16, 1)],
  term ((57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (9, 1), (14, 2)],
  term ((57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (9, 1), (15, 2)],
  term ((319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (13, 1), (14, 2)],
  term ((319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (13, 1), (15, 2)],
  term ((611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (14, 2), (15, 1)],
  term ((-2568602061245288 : Rat) / 1162780221153193) [(1, 1), (5, 2), (14, 2), (15, 1), (16, 1)],
  term ((611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (15, 3)],
  term ((-2568602061245288 : Rat) / 1162780221153193) [(1, 1), (5, 2), (15, 3), (16, 1)],
  term ((907450556046215195256401401922709572872 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (14, 2)],
  term ((907450556046215195256401401922709572872 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (15, 2)],
  term ((3452924603613141561560579250626960304556 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 1), (14, 2)],
  term ((3452924603613141561560579250626960304556 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 1), (15, 2)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 2)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(1, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (8, 1), (12, 1), (15, 3)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(1, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (13, 1), (14, 2)],
  term ((8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (13, 1), (15, 2)],
  term ((8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 1), (14, 2), (15, 1)],
  term ((-8683303471552472 : Rat) / 3488340663459579) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 1), (15, 3)],
  term ((-8683303471552472 : Rat) / 3488340663459579) [(1, 1), (8, 1), (15, 3), (16, 1)],
  term ((84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 1), (15, 3)],
  term ((969228957419244882311240360734253085340 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (9, 1), (12, 1), (14, 2)],
  term ((969228957419244882311240360734253085340 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (9, 1), (12, 1), (15, 2)],
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 1), (13, 1), (15, 3)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(1, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (13, 2), (14, 2)],
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (13, 2), (15, 2)],
  term ((-241325305719370233097203105089965295796 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (14, 1), (15, 2)],
  term ((-326078684845295515420725567943401896389 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (14, 2)],
  term ((-241325305719370233097203105089965295796 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (14, 3)],
  term ((-326078684845295515420725567943401896389 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (15, 2)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 2), (13, 1), (14, 2)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 2), (13, 1), (15, 2)],
  term ((-121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 1), (13, 1), (15, 3)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (14, 2)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (11, 1), (14, 2), (15, 2)],
  term ((9851670194564511 : Rat) / 2325560442306386) [(1, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (15, 2)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (11, 1), (15, 4)],
  term ((9851670194564511 : Rat) / 2325560442306386) [(1, 1), (11, 1), (15, 4), (16, 1)],
  term ((-769867564479366812953571209038643495678 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((9981185373239110214473941937942036621576 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (12, 1), (13, 1), (14, 2)],
  term ((-769867564479366812953571209038643495678 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 1), (13, 1), (14, 3)],
  term ((9981185373239110214473941937942036621576 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((63809728717467962303828533817595549908556377600616461799 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (12, 1), (14, 1), (15, 3)],
  term ((-10702511684117951 : Rat) / 2325560442306386) [(1, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-33661771713525067919160686794417181588961937234180595867 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(1, 1), (12, 1), (14, 2), (15, 1)],
  term ((-41256772435372561 : Rat) / 13953362653838316) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((63809728717467962303828533817595549908556377600616461799 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (12, 1), (14, 3), (15, 1)],
  term ((-10702511684117951 : Rat) / 2325560442306386) [(1, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((-33661771713525067919160686794417181588961937234180595867 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(1, 1), (12, 1), (15, 3)],
  term ((-41256772435372561 : Rat) / 13953362653838316) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((474985800932387171145377037529163131234 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 2), (13, 1), (14, 2)],
  term ((474985800932387171145377037529163131234 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 2), (13, 1), (15, 2)],
  term ((-36144625411604114220433409966369222218981052478500806513 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (12, 2), (14, 2), (15, 1)],
  term ((11017641963391001 : Rat) / 2325560442306386) [(1, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-36144625411604114220433409966369222218981052478500806513 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (12, 2), (15, 3)],
  term ((11017641963391001 : Rat) / 2325560442306386) [(1, 1), (12, 2), (15, 3), (16, 1)],
  term ((-6435545303078006446336310144335796012672 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((227262778724543925892420926175159206548 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (13, 1), (14, 2)],
  term ((15111684312850475693391513597635115984068455271785825612 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (13, 1), (14, 2), (15, 2)],
  term ((-2130221066942416 : Rat) / 1162780221153193) [(1, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-6435545303078006446336310144335796012672 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (13, 1), (14, 3)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 1), (14, 4)],
  term ((227262778724543925892420926175159206548 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (13, 1), (15, 2)],
  term ((15109217256518315323716689223387286634317328803199609516 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (13, 1), (15, 4)],
  term ((-2130221066942416 : Rat) / 1162780221153193) [(1, 1), (13, 1), (15, 4), (16, 1)],
  term ((-11530512132661982754025626129402130138490986283296027556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (13, 2), (14, 2), (15, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(1, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-11530512132661982754025626129402130138490986283296027556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (13, 2), (15, 3)],
  term ((150661185588720 : Rat) / 1162780221153193) [(1, 1), (13, 2), (15, 3), (16, 1)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 3), (14, 2)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 3), (15, 2)],
  term ((233885638111528796671242769364030897678967916048479315841 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (14, 1), (15, 3)],
  term ((-139503008883585145 : Rat) / 13953362653838316) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((2276783146395046960353176783349682704246168878841537837923 : Rat) / 66959924553505426932343687020211144617648942473817219360) [(1, 1), (14, 2), (15, 1)],
  term ((158939915531830591 : Rat) / 27906725307676632) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (14, 2), (15, 3)],
  term ((416983870520476 : Rat) / 1162780221153193) [(1, 1), (14, 2), (15, 3), (16, 1)],
  term ((233885638111528796671242769364030897678967916048479315841 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (14, 3), (15, 1)],
  term ((-139503008883585145 : Rat) / 13953362653838316) [(1, 1), (14, 3), (15, 1), (16, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (14, 4), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(1, 1), (14, 4), (15, 1), (16, 1)],
  term ((2276783146395046960353176783349682704246168878841537837923 : Rat) / 66959924553505426932343687020211144617648942473817219360) [(1, 1), (15, 3)],
  term ((158939915531830591 : Rat) / 27906725307676632) [(1, 1), (15, 3), (16, 1)],
  term ((-4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (9, 1), (14, 2)],
  term ((-4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (9, 1), (15, 2)],
  term ((-30319949922420581909856687343539306148 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2)],
  term ((471259151178452164992338943788144678504 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 2), (5, 1), (9, 1)],
  term ((-8568573160462905287672866446906963424 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 2), (5, 1), (13, 1)],
  term ((2203341111325589270383472251862405380471228908781825308 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (3, 2), (5, 1), (15, 1)],
  term ((-570220563132784 : Rat) / 1162780221153193) [(2, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1320395533120304220261212135047939590164 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2), (7, 1), (9, 1)],
  term ((-1077277655786558224075185495810441573248 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2), (7, 1), (13, 1)],
  term ((-37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (3, 2), (7, 1), (15, 1)],
  term ((5146839986298265 : Rat) / 1162780221153193) [(2, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 2), (8, 1)],
  term ((-219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2), (9, 1), (12, 1), (13, 1)],
  term ((12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-1765379642691762 : Rat) / 1162780221153193) [(2, 1), (3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1443674398969407308672183005387760253952 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2), (9, 1), (13, 1)],
  term ((9056175032874610498059599184486365114086519523772254381 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 1), (3, 2), (9, 1), (15, 1)],
  term ((-4992932602580610 : Rat) / 1162780221153193) [(2, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((525041470367147397815123902793938464676 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (9, 2)],
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 2), (12, 1)],
  term ((-5936662281894181571187310497844244858728820934468400988 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((2338229914966144 : Rat) / 1162780221153193) [(2, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-358074210114821436679525373456997061912 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2), (13, 2)],
  term ((19623874411894189808887221951571966976 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 2), (14, 1)],
  term ((4205022070911486745852062934742411579250833710902202306 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 2), (15, 2)],
  term ((-391419201826808 : Rat) / 1162780221153193) [(2, 1), (3, 2), (15, 2), (16, 1)],
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 3), (9, 1)],
  term ((-471259151178452164992338943788144678504 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1), (14, 2)],
  term ((-471259151178452164992338943788144678504 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1), (15, 2)],
  term ((8568573160462905287672866446906963424 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (13, 1), (14, 2)],
  term ((8568573160462905287672866446906963424 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (13, 1), (15, 2)],
  term ((-2203341111325589270383472251862405380471228908781825308 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 1), (14, 2), (15, 1)],
  term ((570220563132784 : Rat) / 1162780221153193) [(2, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2203341111325589270383472251862405380471228908781825308 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 1), (15, 3)],
  term ((570220563132784 : Rat) / 1162780221153193) [(2, 1), (5, 1), (15, 3), (16, 1)],
  term ((1320395533120304220261212135047939590164 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1), (14, 2)],
  term ((1320395533120304220261212135047939590164 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1), (15, 2)],
  term ((1077277655786558224075185495810441573248 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (13, 1), (14, 2)],
  term ((1077277655786558224075185495810441573248 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (7, 1), (14, 2), (15, 1)],
  term ((-5146839986298265 : Rat) / 1162780221153193) [(2, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (7, 1), (15, 3)],
  term ((-5146839986298265 : Rat) / 1162780221153193) [(2, 1), (7, 1), (15, 3), (16, 1)],
  term ((1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (8, 1), (14, 2)],
  term ((1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (8, 1), (15, 2)],
  term ((219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((1765379642691762 : Rat) / 1162780221153193) [(2, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (9, 1), (12, 1), (15, 3)],
  term ((1765379642691762 : Rat) / 1162780221153193) [(2, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1443674398969407308672183005387760253952 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (13, 1), (14, 2)],
  term ((-1443674398969407308672183005387760253952 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (13, 1), (15, 2)],
  term ((-9056175032874610498059599184486365114086519523772254381 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((4992932602580610 : Rat) / 1162780221153193) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9056175032874610498059599184486365114086519523772254381 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 1), (9, 1), (15, 3)],
  term ((4992932602580610 : Rat) / 1162780221153193) [(2, 1), (9, 1), (15, 3), (16, 1)],
  term ((-525041470367147397815123902793938464676 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (9, 2), (14, 2)],
  term ((-525041470367147397815123902793938464676 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (9, 2), (15, 2)],
  term ((1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (12, 1), (14, 2)],
  term ((1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (12, 1), (15, 2)],
  term ((5936662281894181571187310497844244858728820934468400988 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2338229914966144 : Rat) / 1162780221153193) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((5936662281894181571187310497844244858728820934468400988 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (13, 1), (15, 3)],
  term ((-2338229914966144 : Rat) / 1162780221153193) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((358074210114821436679525373456997061912 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (13, 2), (14, 2)],
  term ((358074210114821436679525373456997061912 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (13, 2), (15, 2)],
  term ((-19623874411894189808887221951571966976 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (14, 1), (15, 2)],
  term ((30319949922420581909856687343539306148 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (14, 2)],
  term ((-4205022070911486745852062934742411579250833710902202306 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (14, 2), (15, 2)],
  term ((391419201826808 : Rat) / 1162780221153193) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((-19623874411894189808887221951571966976 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (14, 3)],
  term ((30319949922420581909856687343539306148 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (15, 2)],
  term ((-4205022070911486745852062934742411579250833710902202306 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (15, 4)],
  term ((391419201826808 : Rat) / 1162780221153193) [(2, 1), (15, 4), (16, 1)],
  term ((-2904812759270305900015568083246447237744 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (4, 1), (9, 1)],
  term ((10110037398755982233029146430231170768 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (4, 1), (13, 1)],
  term ((-543406129438182815857355846439330733917642672607978912 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (3, 1), (4, 1), (15, 1)],
  term ((-51735384255808 : Rat) / 1162780221153193) [(2, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (5, 1), (7, 1), (9, 1)],
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-103470768511616 : Rat) / 1162780221153193) [(2, 2), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-195472833730678188627374464114891944832 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-372888177235126313188097315327845719657294457097438278 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (3, 1), (5, 1), (9, 1), (15, 1)],
  term ((720356459271080 : Rat) / 1162780221153193) [(2, 2), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (5, 1), (9, 2)],
  term ((845108628777893564674938625406014780694 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (7, 1)],
  term ((-78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (7, 1), (9, 1), (13, 1)],
  term ((1224510104923201687356037336946774208653866347508271591 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-747574224772468 : Rat) / 1162780221153193) [(2, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (7, 1), (9, 2)],
  term ((1913272632689510489745685993931557676202398478467969062 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-30319949922420581909856687343539306148 : Rat) / 599854728701238648283346764014769633995) [(2, 3)],
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 3), (3, 1), (9, 1)],
  term ((471259151178452164992338943788144678504 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (5, 1), (9, 1)],
  term ((-8568573160462905287672866446906963424 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (5, 1), (13, 1)],
  term ((2203341111325589270383472251862405380471228908781825308 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 3), (5, 1), (15, 1)],
  term ((-570220563132784 : Rat) / 1162780221153193) [(2, 3), (5, 1), (15, 1), (16, 1)],
  term ((-1320395533120304220261212135047939590164 : Rat) / 599854728701238648283346764014769633995) [(2, 3), (7, 1), (9, 1)],
  term ((-1077277655786558224075185495810441573248 : Rat) / 599854728701238648283346764014769633995) [(2, 3), (7, 1), (13, 1)],
  term ((-37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 3), (7, 1), (15, 1)],
  term ((5146839986298265 : Rat) / 1162780221153193) [(2, 3), (7, 1), (15, 1), (16, 1)],
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 3), (8, 1)],
  term ((-219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(2, 3), (9, 1), (12, 1), (13, 1)],
  term ((12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 3), (9, 1), (12, 1), (15, 1)],
  term ((-1765379642691762 : Rat) / 1162780221153193) [(2, 3), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1443674398969407308672183005387760253952 : Rat) / 599854728701238648283346764014769633995) [(2, 3), (9, 1), (13, 1)],
  term ((9056175032874610498059599184486365114086519523772254381 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 3), (9, 1), (15, 1)],
  term ((-4992932602580610 : Rat) / 1162780221153193) [(2, 3), (9, 1), (15, 1), (16, 1)],
  term ((525041470367147397815123902793938464676 : Rat) / 119970945740247729656669352802953926799) [(2, 3), (9, 2)],
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 3), (12, 1)],
  term ((-5936662281894181571187310497844244858728820934468400988 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 3), (13, 1), (15, 1)],
  term ((2338229914966144 : Rat) / 1162780221153193) [(2, 3), (13, 1), (15, 1), (16, 1)],
  term ((-358074210114821436679525373456997061912 : Rat) / 599854728701238648283346764014769633995) [(2, 3), (13, 2)],
  term ((19623874411894189808887221951571966976 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (14, 1)],
  term ((4205022070911486745852062934742411579250833710902202306 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 3), (15, 2)],
  term ((-391419201826808 : Rat) / 1162780221153193) [(2, 3), (15, 2), (16, 1)],
  term ((2904812759270305900015568083246447237744 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (9, 1), (14, 2)],
  term ((2904812759270305900015568083246447237744 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (9, 1), (15, 2)],
  term ((-10110037398755982233029146430231170768 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (13, 1), (14, 2)],
  term ((-10110037398755982233029146430231170768 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (13, 1), (15, 2)],
  term ((543406129438182815857355846439330733917642672607978912 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (4, 1), (14, 2), (15, 1)],
  term ((51735384255808 : Rat) / 1162780221153193) [(3, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((543406129438182815857355846439330733917642672607978912 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (4, 1), (15, 3)],
  term ((51735384255808 : Rat) / 1162780221153193) [(3, 1), (4, 1), (15, 3), (16, 1)],
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 2)],
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2)],
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 2)],
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2)],
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (7, 1), (14, 2), (15, 1)],
  term ((103470768511616 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (7, 1), (15, 3)],
  term ((103470768511616 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((195472833730678188627374464114891944832 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 2)],
  term ((195472833730678188627374464114891944832 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2)],
  term ((372888177235126313188097315327845719657294457097438278 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (9, 1), (14, 2), (15, 1)],
  term ((-720356459271080 : Rat) / 1162780221153193) [(3, 1), (5, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((372888177235126313188097315327845719657294457097438278 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (9, 1), (15, 3)],
  term ((-720356459271080 : Rat) / 1162780221153193) [(3, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 2), (14, 2)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 2), (15, 2)],
  term ((78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 2)],
  term ((78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((-1224510104923201687356037336946774208653866347508271591 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 1), (9, 1), (14, 2), (15, 1)],
  term ((747574224772468 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1224510104923201687356037336946774208653866347508271591 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 1), (9, 1), (15, 3)],
  term ((747574224772468 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 2), (14, 2)],
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 2), (15, 2)],
  term ((-1913272632689510489745685993931557676202398478467969062 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1913272632689510489745685993931557676202398478467969062 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (7, 1), (13, 1), (15, 3)],
  term ((-845108628777893564674938625406014780694 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (14, 2)],
  term ((-845108628777893564674938625406014780694 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (15, 2)],
  term ((-2904812759270305900015568083246447237744 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (4, 1), (9, 1)],
  term ((10110037398755982233029146430231170768 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (4, 1), (13, 1)],
  term ((-543406129438182815857355846439330733917642672607978912 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 3), (4, 1), (15, 1)],
  term ((-51735384255808 : Rat) / 1162780221153193) [(3, 3), (4, 1), (15, 1), (16, 1)],
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (5, 1), (7, 1), (9, 1)],
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (5, 1), (7, 1), (13, 1)],
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 3), (5, 1), (7, 1), (15, 1)],
  term ((-103470768511616 : Rat) / 1162780221153193) [(3, 3), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-195472833730678188627374464114891944832 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (5, 1), (9, 1), (13, 1)],
  term ((-372888177235126313188097315327845719657294457097438278 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 3), (5, 1), (9, 1), (15, 1)],
  term ((720356459271080 : Rat) / 1162780221153193) [(3, 3), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (5, 1), (9, 2)],
  term ((845108628777893564674938625406014780694 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (7, 1)],
  term ((-78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (7, 1), (9, 1), (13, 1)],
  term ((1224510104923201687356037336946774208653866347508271591 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 3), (7, 1), (9, 1), (15, 1)],
  term ((-747574224772468 : Rat) / 1162780221153193) [(3, 3), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (7, 1), (9, 2)],
  term ((1913272632689510489745685993931557676202398478467969062 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 3), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 100 through 199. -/
theorem ep_Q2_024_block_05_0100_0199_valid :
    checkProductSumEq ep_Q2_024_partials_05_0100_0199
      ep_Q2_024_block_05_0100_0199 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
