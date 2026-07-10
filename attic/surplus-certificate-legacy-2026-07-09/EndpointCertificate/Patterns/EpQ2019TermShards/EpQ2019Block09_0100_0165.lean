/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_019, term block 9:100-165

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_019`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2019TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q2_019`. -/
def ep_Q2_019_generator_09_0100_0165 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0100 : Poly :=
[
  term ((9474741316458170096225691967887191004 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 100 for generator 9. -/
def ep_Q2_019_partial_09_0100 : Poly :=
[
  term ((-18949482632916340192451383935774382008 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((9474741316458170096225691967887191004 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-18949482632916340192451383935774382008 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((9474741316458170096225691967887191004 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 9. -/
theorem ep_Q2_019_partial_09_0100_valid :
    mulPoly ep_Q2_019_coefficient_09_0100
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0101 : Poly :=
[
  term ((1402072525492854928890923567909523294 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (16, 1)]
]

/-- Partial product 101 for generator 9. -/
def ep_Q2_019_partial_09_0101 : Poly :=
[
  term ((-2804145050985709857781847135819046588 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (6, 1), (16, 1)],
  term ((1402072525492854928890923567909523294 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (6, 1), (16, 1)],
  term ((-2804145050985709857781847135819046588 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (16, 1)],
  term ((1402072525492854928890923567909523294 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 9. -/
theorem ep_Q2_019_partial_09_0101_valid :
    mulPoly ep_Q2_019_coefficient_09_0101
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0102 : Poly :=
[
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 102 for generator 9. -/
def ep_Q2_019_partial_09_0102 : Poly :=
[
  term ((-26091349276280512451695885830493703232 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-26091349276280512451695885830493703232 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 9. -/
theorem ep_Q2_019_partial_09_0102_valid :
    mulPoly ep_Q2_019_coefficient_09_0102
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0103 : Poly :=
[
  term ((-17623747615809039201792401816796368 : Rat) / 368217145428147030573952495086863395) [(7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 103 for generator 9. -/
def ep_Q2_019_partial_09_0103 : Poly :=
[
  term ((35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(0, 1), (2, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-17623747615809039201792401816796368 : Rat) / 368217145428147030573952495086863395) [(0, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(1, 1), (3, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-17623747615809039201792401816796368 : Rat) / 368217145428147030573952495086863395) [(1, 2), (7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 9. -/
theorem ep_Q2_019_partial_09_0103_valid :
    mulPoly ep_Q2_019_coefficient_09_0103
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0104 : Poly :=
[
  term ((4839619083876609006689454764811287796 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 104 for generator 9. -/
def ep_Q2_019_partial_09_0104 : Poly :=
[
  term ((-9679238167753218013378909529622575592 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (9, 1), (16, 1)],
  term ((4839619083876609006689454764811287796 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((-9679238167753218013378909529622575592 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (9, 1), (16, 1)],
  term ((4839619083876609006689454764811287796 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 9. -/
theorem ep_Q2_019_partial_09_0104_valid :
    mulPoly ep_Q2_019_coefficient_09_0104
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0105 : Poly :=
[
  term ((-2881323508471038710947138684692679296 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 9. -/
def ep_Q2_019_partial_09_0105 : Poly :=
[
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2881323508471038710947138684692679296 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2881323508471038710947138684692679296 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 9. -/
theorem ep_Q2_019_partial_09_0105_valid :
    mulPoly ep_Q2_019_coefficient_09_0105
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0106 : Poly :=
[
  term ((1161300354099378842749568073343562288 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 106 for generator 9. -/
def ep_Q2_019_partial_09_0106 : Poly :=
[
  term ((-2322600708198757685499136146687124576 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((1161300354099378842749568073343562288 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2322600708198757685499136146687124576 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((1161300354099378842749568073343562288 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 9. -/
theorem ep_Q2_019_partial_09_0106_valid :
    mulPoly ep_Q2_019_coefficient_09_0106
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0107 : Poly :=
[
  term ((68285181895169416858631915145683616 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 107 for generator 9. -/
def ep_Q2_019_partial_09_0107 : Poly :=
[
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((68285181895169416858631915145683616 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((68285181895169416858631915145683616 : Rat) / 1251938294455699903951438483295335543) [(1, 2), (7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 9. -/
theorem ep_Q2_019_partial_09_0107_valid :
    mulPoly ep_Q2_019_coefficient_09_0107
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0108 : Poly :=
[
  term ((-1014529433444810307784545391306152608 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 108 for generator 9. -/
def ep_Q2_019_partial_09_0108 : Poly :=
[
  term ((2029058866889620615569090782612305216 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (11, 1), (16, 1)],
  term ((-1014529433444810307784545391306152608 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((2029058866889620615569090782612305216 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((-1014529433444810307784545391306152608 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 9. -/
theorem ep_Q2_019_partial_09_0108_valid :
    mulPoly ep_Q2_019_coefficient_09_0108
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0109 : Poly :=
[
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 109 for generator 9. -/
def ep_Q2_019_partial_09_0109 : Poly :=
[
  term ((-2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 9. -/
theorem ep_Q2_019_partial_09_0109_valid :
    mulPoly ep_Q2_019_coefficient_09_0109
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0110 : Poly :=
[
  term ((-2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 9. -/
def ep_Q2_019_partial_09_0110 : Poly :=
[
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 9. -/
theorem ep_Q2_019_partial_09_0110_valid :
    mulPoly ep_Q2_019_coefficient_09_0110
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0111 : Poly :=
[
  term ((2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 111 for generator 9. -/
def ep_Q2_019_partial_09_0111 : Poly :=
[
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 9. -/
theorem ep_Q2_019_partial_09_0111_valid :
    mulPoly ep_Q2_019_coefficient_09_0111
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0112 : Poly :=
[
  term ((619718965814690237460838257354981312 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 112 for generator 9. -/
def ep_Q2_019_partial_09_0112 : Poly :=
[
  term ((-1239437931629380474921676514709962624 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((619718965814690237460838257354981312 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1239437931629380474921676514709962624 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((619718965814690237460838257354981312 : Rat) / 1251938294455699903951438483295335543) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 9. -/
theorem ep_Q2_019_partial_09_0112_valid :
    mulPoly ep_Q2_019_coefficient_09_0112
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0113 : Poly :=
[
  term ((-2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 113 for generator 9. -/
def ep_Q2_019_partial_09_0113 : Poly :=
[
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 9. -/
theorem ep_Q2_019_partial_09_0113_valid :
    mulPoly ep_Q2_019_coefficient_09_0113
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0114 : Poly :=
[
  term ((-3978291896181373452961393167863668896 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 114 for generator 9. -/
def ep_Q2_019_partial_09_0114 : Poly :=
[
  term ((7956583792362746905922786335727337792 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-3978291896181373452961393167863668896 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((7956583792362746905922786335727337792 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((-3978291896181373452961393167863668896 : Rat) / 1251938294455699903951438483295335543) [(1, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 9. -/
theorem ep_Q2_019_partial_09_0114_valid :
    mulPoly ep_Q2_019_coefficient_09_0114
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0115 : Poly :=
[
  term ((-536915343705742918120468191968635248 : Rat) / 894241638896928502822456059496668245) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 9. -/
def ep_Q2_019_partial_09_0115 : Poly :=
[
  term ((1073830687411485836240936383937270496 : Rat) / 894241638896928502822456059496668245) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-536915343705742918120468191968635248 : Rat) / 894241638896928502822456059496668245) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((1073830687411485836240936383937270496 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-536915343705742918120468191968635248 : Rat) / 894241638896928502822456059496668245) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 9. -/
theorem ep_Q2_019_partial_09_0115_valid :
    mulPoly ep_Q2_019_coefficient_09_0115
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0116 : Poly :=
[
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 9. -/
def ep_Q2_019_partial_09_0116 : Poly :=
[
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 9. -/
theorem ep_Q2_019_partial_09_0116_valid :
    mulPoly ep_Q2_019_coefficient_09_0116
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0117 : Poly :=
[
  term ((-1868031169260412464940913758620523488 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 117 for generator 9. -/
def ep_Q2_019_partial_09_0117 : Poly :=
[
  term ((3736062338520824929881827517241046976 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1868031169260412464940913758620523488 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((3736062338520824929881827517241046976 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1868031169260412464940913758620523488 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 9. -/
theorem ep_Q2_019_partial_09_0117_valid :
    mulPoly ep_Q2_019_coefficient_09_0117
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0118 : Poly :=
[
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 118 for generator 9. -/
def ep_Q2_019_partial_09_0118 : Poly :=
[
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (15, 3), (16, 1)],
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (15, 3), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (15, 3), (16, 1)],
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 9. -/
theorem ep_Q2_019_partial_09_0118_valid :
    mulPoly ep_Q2_019_coefficient_09_0118
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0119 : Poly :=
[
  term ((-6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (8, 1), (16, 1)]
]

/-- Partial product 119 for generator 9. -/
def ep_Q2_019_partial_09_0119 : Poly :=
[
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 2), (8, 1), (16, 1)],
  term ((-6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 2), (8, 1), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 2), (8, 1), (16, 1)],
  term ((-6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 9. -/
theorem ep_Q2_019_partial_09_0119_valid :
    mulPoly ep_Q2_019_coefficient_09_0119
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0120 : Poly :=
[
  term ((10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (12, 1), (16, 1)]
]

/-- Partial product 120 for generator 9. -/
def ep_Q2_019_partial_09_0120 : Poly :=
[
  term ((-20996164749914544914082650193068097312 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 2), (12, 1), (16, 1)],
  term ((10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 2), (12, 1), (16, 1)],
  term ((-20996164749914544914082650193068097312 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 2), (12, 1), (16, 1)],
  term ((10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 9. -/
theorem ep_Q2_019_partial_09_0120_valid :
    mulPoly ep_Q2_019_coefficient_09_0120
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0121 : Poly :=
[
  term ((7771490708626300711206313047590154264 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (16, 1)]
]

/-- Partial product 121 for generator 9. -/
def ep_Q2_019_partial_09_0121 : Poly :=
[
  term ((-15542981417252601422412626095180308528 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 2), (16, 1)],
  term ((7771490708626300711206313047590154264 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 2), (16, 1)],
  term ((-15542981417252601422412626095180308528 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((7771490708626300711206313047590154264 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 9. -/
theorem ep_Q2_019_partial_09_0121_valid :
    mulPoly ep_Q2_019_coefficient_09_0121
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0122 : Poly :=
[
  term ((6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (16, 1)]
]

/-- Partial product 122 for generator 9. -/
def ep_Q2_019_partial_09_0122 : Poly :=
[
  term ((-13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (8, 1), (16, 1)],
  term ((6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (8, 1), (16, 1)],
  term ((-13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (8, 1), (16, 1)],
  term ((6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 9. -/
theorem ep_Q2_019_partial_09_0122_valid :
    mulPoly ep_Q2_019_coefficient_09_0122
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0123 : Poly :=
[
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 123 for generator 9. -/
def ep_Q2_019_partial_09_0123 : Poly :=
[
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 9. -/
theorem ep_Q2_019_partial_09_0123_valid :
    mulPoly ep_Q2_019_coefficient_09_0123
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0124 : Poly :=
[
  term ((3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 124 for generator 9. -/
def ep_Q2_019_partial_09_0124 : Poly :=
[
  term ((-7305198132634997086576448955102385008 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-7305198132634997086576448955102385008 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 9. -/
theorem ep_Q2_019_partial_09_0124_valid :
    mulPoly ep_Q2_019_coefficient_09_0124
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0125 : Poly :=
[
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 125 for generator 9. -/
def ep_Q2_019_partial_09_0125 : Poly :=
[
  term ((-370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(0, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 9. -/
theorem ep_Q2_019_partial_09_0125_valid :
    mulPoly ep_Q2_019_coefficient_09_0125
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0126 : Poly :=
[
  term ((-128287044237256683674441647380020456 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 126 for generator 9. -/
def ep_Q2_019_partial_09_0126 : Poly :=
[
  term ((256574088474513367348883294760040912 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((-128287044237256683674441647380020456 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((256574088474513367348883294760040912 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((-128287044237256683674441647380020456 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 9. -/
theorem ep_Q2_019_partial_09_0126_valid :
    mulPoly ep_Q2_019_coefficient_09_0126
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0127 : Poly :=
[
  term ((656174437532445631891902175295822783774 : Rat) / 569631923977343456297904509899377672065) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 127 for generator 9. -/
def ep_Q2_019_partial_09_0127 : Poly :=
[
  term ((-1312348875064891263783804350591645567548 : Rat) / 569631923977343456297904509899377672065) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((656174437532445631891902175295822783774 : Rat) / 569631923977343456297904509899377672065) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1312348875064891263783804350591645567548 : Rat) / 569631923977343456297904509899377672065) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((656174437532445631891902175295822783774 : Rat) / 569631923977343456297904509899377672065) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 9. -/
theorem ep_Q2_019_partial_09_0127_valid :
    mulPoly ep_Q2_019_coefficient_09_0127
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0128 : Poly :=
[
  term ((29046579701361875415442057947535569892 : Rat) / 2577520017997029214017667465608043765) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 128 for generator 9. -/
def ep_Q2_019_partial_09_0128 : Poly :=
[
  term ((-58093159402723750830884115895071139784 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((29046579701361875415442057947535569892 : Rat) / 2577520017997029214017667465608043765) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-58093159402723750830884115895071139784 : Rat) / 2577520017997029214017667465608043765) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((29046579701361875415442057947535569892 : Rat) / 2577520017997029214017667465608043765) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 9. -/
theorem ep_Q2_019_partial_09_0128_valid :
    mulPoly ep_Q2_019_coefficient_09_0128
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0129 : Poly :=
[
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 129 for generator 9. -/
def ep_Q2_019_partial_09_0129 : Poly :=
[
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (2, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(0, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(1, 2), (9, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 9. -/
theorem ep_Q2_019_partial_09_0129_valid :
    mulPoly ep_Q2_019_coefficient_09_0129
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0130 : Poly :=
[
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 130 for generator 9. -/
def ep_Q2_019_partial_09_0130 : Poly :=
[
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 9. -/
theorem ep_Q2_019_partial_09_0130_valid :
    mulPoly ep_Q2_019_coefficient_09_0130
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0131 : Poly :=
[
  term ((513982039417242418196251298308104080176 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 131 for generator 9. -/
def ep_Q2_019_partial_09_0131 : Poly :=
[
  term ((-1027964078834484836392502596616208160352 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((513982039417242418196251298308104080176 : Rat) / 43817840305949496638300346915336744005) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-1027964078834484836392502596616208160352 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((513982039417242418196251298308104080176 : Rat) / 43817840305949496638300346915336744005) [(1, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 9. -/
theorem ep_Q2_019_partial_09_0131_valid :
    mulPoly ep_Q2_019_coefficient_09_0131
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0132 : Poly :=
[
  term ((467724605676793496859144529065795304264 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 132 for generator 9. -/
def ep_Q2_019_partial_09_0132 : Poly :=
[
  term ((-935449211353586993718289058131590608528 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((467724605676793496859144529065795304264 : Rat) / 43817840305949496638300346915336744005) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-935449211353586993718289058131590608528 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((467724605676793496859144529065795304264 : Rat) / 43817840305949496638300346915336744005) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 9. -/
theorem ep_Q2_019_partial_09_0132_valid :
    mulPoly ep_Q2_019_coefficient_09_0132
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0133 : Poly :=
[
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 133 for generator 9. -/
def ep_Q2_019_partial_09_0133 : Poly :=
[
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(0, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(1, 2), (9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 9. -/
theorem ep_Q2_019_partial_09_0133_valid :
    mulPoly ep_Q2_019_coefficient_09_0133
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0134 : Poly :=
[
  term ((-50166813043826687950785602177855241332816 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 134 for generator 9. -/
def ep_Q2_019_partial_09_0134 : Poly :=
[
  term ((100333626087653375901571204355710482665632 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-50166813043826687950785602177855241332816 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((100333626087653375901571204355710482665632 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-50166813043826687950785602177855241332816 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 9. -/
theorem ep_Q2_019_partial_09_0134_valid :
    mulPoly ep_Q2_019_coefficient_09_0134
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0135 : Poly :=
[
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 135 for generator 9. -/
def ep_Q2_019_partial_09_0135 : Poly :=
[
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (2, 1), (9, 1), (15, 3), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (15, 3), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(1, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 9. -/
theorem ep_Q2_019_partial_09_0135_valid :
    mulPoly ep_Q2_019_coefficient_09_0135
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0136 : Poly :=
[
  term ((-1497490739400318009140445861426082096204 : Rat) / 78872112550709093948940624447606139209) [(9, 2), (16, 1)]
]

/-- Partial product 136 for generator 9. -/
def ep_Q2_019_partial_09_0136 : Poly :=
[
  term ((2994981478800636018280891722852164192408 : Rat) / 78872112550709093948940624447606139209) [(0, 1), (2, 1), (9, 2), (16, 1)],
  term ((-1497490739400318009140445861426082096204 : Rat) / 78872112550709093948940624447606139209) [(0, 2), (9, 2), (16, 1)],
  term ((2994981478800636018280891722852164192408 : Rat) / 78872112550709093948940624447606139209) [(1, 1), (3, 1), (9, 2), (16, 1)],
  term ((-1497490739400318009140445861426082096204 : Rat) / 78872112550709093948940624447606139209) [(1, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 9. -/
theorem ep_Q2_019_partial_09_0136_valid :
    mulPoly ep_Q2_019_coefficient_09_0136
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0137 : Poly :=
[
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 9. -/
def ep_Q2_019_partial_09_0137 : Poly :=
[
  term ((-3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 9. -/
theorem ep_Q2_019_partial_09_0137_valid :
    mulPoly ep_Q2_019_coefficient_09_0137
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0138 : Poly :=
[
  term ((-11268363150790462772287966451982585724804 : Rat) / 1708895771932030368893713529698133016195) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 138 for generator 9. -/
def ep_Q2_019_partial_09_0138 : Poly :=
[
  term ((22536726301580925544575932903965171449608 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11268363150790462772287966451982585724804 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((22536726301580925544575932903965171449608 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11268363150790462772287966451982585724804 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 9. -/
theorem ep_Q2_019_partial_09_0138_valid :
    mulPoly ep_Q2_019_coefficient_09_0138
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0139 : Poly :=
[
  term ((251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 139 for generator 9. -/
def ep_Q2_019_partial_09_0139 : Poly :=
[
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 9. -/
theorem ep_Q2_019_partial_09_0139_valid :
    mulPoly ep_Q2_019_coefficient_09_0139
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0140 : Poly :=
[
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 140 for generator 9. -/
def ep_Q2_019_partial_09_0140 : Poly :=
[
  term ((-11525294033884154843788554738770717184 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11525294033884154843788554738770717184 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 9. -/
theorem ep_Q2_019_partial_09_0140_valid :
    mulPoly ep_Q2_019_coefficient_09_0140
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0141 : Poly :=
[
  term ((-502840874799100694726392203929216768 : Rat) / 1251938294455699903951438483295335543) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 141 for generator 9. -/
def ep_Q2_019_partial_09_0141 : Poly :=
[
  term ((1005681749598201389452784407858433536 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-502840874799100694726392203929216768 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((1005681749598201389452784407858433536 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-502840874799100694726392203929216768 : Rat) / 1251938294455699903951438483295335543) [(1, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 9. -/
theorem ep_Q2_019_partial_09_0141_valid :
    mulPoly ep_Q2_019_coefficient_09_0141
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0142 : Poly :=
[
  term ((-26184256150296973789984001123326563764 : Rat) / 6259691472278499519757192416476677715) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 142 for generator 9. -/
def ep_Q2_019_partial_09_0142 : Poly :=
[
  term ((52368512300593947579968002246653127528 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26184256150296973789984001123326563764 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((52368512300593947579968002246653127528 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26184256150296973789984001123326563764 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 9. -/
theorem ep_Q2_019_partial_09_0142_valid :
    mulPoly ep_Q2_019_coefficient_09_0142
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0143 : Poly :=
[
  term ((12816383847392133445727870878831476022834 : Rat) / 301569842105652418040067093476141120505) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 143 for generator 9. -/
def ep_Q2_019_partial_09_0143 : Poly :=
[
  term ((-25632767694784266891455741757662952045668 : Rat) / 301569842105652418040067093476141120505) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((12816383847392133445727870878831476022834 : Rat) / 301569842105652418040067093476141120505) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-25632767694784266891455741757662952045668 : Rat) / 301569842105652418040067093476141120505) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((12816383847392133445727870878831476022834 : Rat) / 301569842105652418040067093476141120505) [(1, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 9. -/
theorem ep_Q2_019_partial_09_0143_valid :
    mulPoly ep_Q2_019_coefficient_09_0143
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0144 : Poly :=
[
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 144 for generator 9. -/
def ep_Q2_019_partial_09_0144 : Poly :=
[
  term ((273140727580677667434527660582734464 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (11, 1), (15, 3), (16, 1)],
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((273140727580677667434527660582734464 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 1), (11, 1), (15, 3), (16, 1)],
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(1, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 9. -/
theorem ep_Q2_019_partial_09_0144_valid :
    mulPoly ep_Q2_019_coefficient_09_0144
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0145 : Poly :=
[
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 145 for generator 9. -/
def ep_Q2_019_partial_09_0145 : Poly :=
[
  term ((-1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(0, 1), (2, 1), (11, 2), (14, 1), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(0, 2), (11, 2), (14, 1), (16, 1)],
  term ((-1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 1), (11, 2), (14, 1), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(1, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 9. -/
theorem ep_Q2_019_partial_09_0145_valid :
    mulPoly ep_Q2_019_coefficient_09_0145
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0146 : Poly :=
[
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(11, 2), (16, 1)]
]

/-- Partial product 146 for generator 9. -/
def ep_Q2_019_partial_09_0146 : Poly :=
[
  term ((1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(0, 1), (2, 1), (11, 2), (16, 1)],
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(0, 2), (11, 2), (16, 1)],
  term ((1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(1, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 9. -/
theorem ep_Q2_019_partial_09_0146_valid :
    mulPoly ep_Q2_019_coefficient_09_0146
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0147 : Poly :=
[
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 147 for generator 9. -/
def ep_Q2_019_partial_09_0147 : Poly :=
[
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 9. -/
theorem ep_Q2_019_partial_09_0147_valid :
    mulPoly ep_Q2_019_coefficient_09_0147
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0148 : Poly :=
[
  term ((263436432455006706325148133304114601968 : Rat) / 100523280701884139346689031158713706835) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 148 for generator 9. -/
def ep_Q2_019_partial_09_0148 : Poly :=
[
  term ((-526872864910013412650296266608229203936 : Rat) / 100523280701884139346689031158713706835) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((263436432455006706325148133304114601968 : Rat) / 100523280701884139346689031158713706835) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-526872864910013412650296266608229203936 : Rat) / 100523280701884139346689031158713706835) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((263436432455006706325148133304114601968 : Rat) / 100523280701884139346689031158713706835) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 9. -/
theorem ep_Q2_019_partial_09_0148_valid :
    mulPoly ep_Q2_019_coefficient_09_0148
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0149 : Poly :=
[
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 149 for generator 9. -/
def ep_Q2_019_partial_09_0149 : Poly :=
[
  term ((-8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 9. -/
theorem ep_Q2_019_partial_09_0149_valid :
    mulPoly ep_Q2_019_coefficient_09_0149
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0150 : Poly :=
[
  term ((-33259184915252313078000527873099536116 : Rat) / 6259691472278499519757192416476677715) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 150 for generator 9. -/
def ep_Q2_019_partial_09_0150 : Poly :=
[
  term ((66518369830504626156001055746199072232 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (12, 1), (14, 1), (16, 1)],
  term ((-33259184915252313078000527873099536116 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((66518369830504626156001055746199072232 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (12, 1), (14, 1), (16, 1)],
  term ((-33259184915252313078000527873099536116 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 9. -/
theorem ep_Q2_019_partial_09_0150_valid :
    mulPoly ep_Q2_019_coefficient_09_0150
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0151 : Poly :=
[
  term ((-5186244394820738472103949087841190418632 : Rat) / 1708895771932030368893713529698133016195) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 151 for generator 9. -/
def ep_Q2_019_partial_09_0151 : Poly :=
[
  term ((10372488789641476944207898175682380837264 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5186244394820738472103949087841190418632 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((10372488789641476944207898175682380837264 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5186244394820738472103949087841190418632 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 9. -/
theorem ep_Q2_019_partial_09_0151_valid :
    mulPoly ep_Q2_019_coefficient_09_0151
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0152 : Poly :=
[
  term ((793983479364651604162129524687250852 : Rat) / 178848327779385700564491211899333649) [(12, 1), (16, 1)]
]

/-- Partial product 152 for generator 9. -/
def ep_Q2_019_partial_09_0152 : Poly :=
[
  term ((-1587966958729303208324259049374501704 : Rat) / 178848327779385700564491211899333649) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term ((793983479364651604162129524687250852 : Rat) / 178848327779385700564491211899333649) [(0, 2), (12, 1), (16, 1)],
  term ((-1587966958729303208324259049374501704 : Rat) / 178848327779385700564491211899333649) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term ((793983479364651604162129524687250852 : Rat) / 178848327779385700564491211899333649) [(1, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 9. -/
theorem ep_Q2_019_partial_09_0152_valid :
    mulPoly ep_Q2_019_coefficient_09_0152
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0153 : Poly :=
[
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(12, 2), (15, 2), (16, 1)]
]

/-- Partial product 153 for generator 9. -/
def ep_Q2_019_partial_09_0153 : Poly :=
[
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (12, 2), (15, 2), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (12, 2), (15, 2), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (12, 2), (15, 2), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 9. -/
theorem ep_Q2_019_partial_09_0153_valid :
    mulPoly ep_Q2_019_coefficient_09_0153
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0154 : Poly :=
[
  term ((5983934600273400180291505287478287684 : Rat) / 6259691472278499519757192416476677715) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 154 for generator 9. -/
def ep_Q2_019_partial_09_0154 : Poly :=
[
  term ((-11967869200546800360583010574956575368 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5983934600273400180291505287478287684 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11967869200546800360583010574956575368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5983934600273400180291505287478287684 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 9. -/
theorem ep_Q2_019_partial_09_0154_valid :
    mulPoly ep_Q2_019_coefficient_09_0154
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0155 : Poly :=
[
  term ((-10817213530244271594533791999862985991234 : Rat) / 1708895771932030368893713529698133016195) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 155 for generator 9. -/
def ep_Q2_019_partial_09_0155 : Poly :=
[
  term ((21634427060488543189067583999725971982468 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10817213530244271594533791999862985991234 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((21634427060488543189067583999725971982468 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10817213530244271594533791999862985991234 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 9. -/
theorem ep_Q2_019_partial_09_0155_valid :
    mulPoly ep_Q2_019_coefficient_09_0155
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0156 : Poly :=
[
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 156 for generator 9. -/
def ep_Q2_019_partial_09_0156 : Poly :=
[
  term ((-8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (13, 1), (15, 3), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((-8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (13, 1), (15, 3), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 9. -/
theorem ep_Q2_019_partial_09_0156_valid :
    mulPoly ep_Q2_019_coefficient_09_0156
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0157 : Poly :=
[
  term ((-3204162606925639790031685528110283788 : Rat) / 894241638896928502822456059496668245) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 157 for generator 9. -/
def ep_Q2_019_partial_09_0157 : Poly :=
[
  term ((6408325213851279580063371056220567576 : Rat) / 894241638896928502822456059496668245) [(0, 1), (2, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3204162606925639790031685528110283788 : Rat) / 894241638896928502822456059496668245) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((6408325213851279580063371056220567576 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3204162606925639790031685528110283788 : Rat) / 894241638896928502822456059496668245) [(1, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 9. -/
theorem ep_Q2_019_partial_09_0157_valid :
    mulPoly ep_Q2_019_coefficient_09_0157
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0158 : Poly :=
[
  term ((798121920557966947201638234573341892 : Rat) / 178848327779385700564491211899333649) [(13, 2), (16, 1)]
]

/-- Partial product 158 for generator 9. -/
def ep_Q2_019_partial_09_0158 : Poly :=
[
  term ((-1596243841115933894403276469146683784 : Rat) / 178848327779385700564491211899333649) [(0, 1), (2, 1), (13, 2), (16, 1)],
  term ((798121920557966947201638234573341892 : Rat) / 178848327779385700564491211899333649) [(0, 2), (13, 2), (16, 1)],
  term ((-1596243841115933894403276469146683784 : Rat) / 178848327779385700564491211899333649) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((798121920557966947201638234573341892 : Rat) / 178848327779385700564491211899333649) [(1, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 9. -/
theorem ep_Q2_019_partial_09_0158_valid :
    mulPoly ep_Q2_019_coefficient_09_0158
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0159 : Poly :=
[
  term ((23133249721646489776718935609508481570664 : Rat) / 1708895771932030368893713529698133016195) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 159 for generator 9. -/
def ep_Q2_019_partial_09_0159 : Poly :=
[
  term ((-46266499443292979553437871219016963141328 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((23133249721646489776718935609508481570664 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-46266499443292979553437871219016963141328 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((23133249721646489776718935609508481570664 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 9. -/
theorem ep_Q2_019_partial_09_0159_valid :
    mulPoly ep_Q2_019_coefficient_09_0159
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0160 : Poly :=
[
  term ((3031630270565359665402874087888648127468 : Rat) / 78872112550709093948940624447606139209) [(14, 1), (16, 1)]
]

/-- Partial product 160 for generator 9. -/
def ep_Q2_019_partial_09_0160 : Poly :=
[
  term ((-6063260541130719330805748175777296254936 : Rat) / 78872112550709093948940624447606139209) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((3031630270565359665402874087888648127468 : Rat) / 78872112550709093948940624447606139209) [(0, 2), (14, 1), (16, 1)],
  term ((-6063260541130719330805748175777296254936 : Rat) / 78872112550709093948940624447606139209) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term ((3031630270565359665402874087888648127468 : Rat) / 78872112550709093948940624447606139209) [(1, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 9. -/
theorem ep_Q2_019_partial_09_0160_valid :
    mulPoly ep_Q2_019_coefficient_09_0160
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0161 : Poly :=
[
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 161 for generator 9. -/
def ep_Q2_019_partial_09_0161 : Poly :=
[
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (14, 2), (15, 2), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (14, 2), (15, 2), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (14, 2), (15, 2), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 9. -/
theorem ep_Q2_019_partial_09_0161_valid :
    mulPoly ep_Q2_019_coefficient_09_0161
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0162 : Poly :=
[
  term ((-14061564865481031578220642962512588931686 : Rat) / 394360562753545469744703122238030696045) [(14, 2), (16, 1)]
]

/-- Partial product 162 for generator 9. -/
def ep_Q2_019_partial_09_0162 : Poly :=
[
  term ((28123129730962063156441285925025177863372 : Rat) / 394360562753545469744703122238030696045) [(0, 1), (2, 1), (14, 2), (16, 1)],
  term ((-14061564865481031578220642962512588931686 : Rat) / 394360562753545469744703122238030696045) [(0, 2), (14, 2), (16, 1)],
  term ((28123129730962063156441285925025177863372 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 1), (14, 2), (16, 1)],
  term ((-14061564865481031578220642962512588931686 : Rat) / 394360562753545469744703122238030696045) [(1, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 9. -/
theorem ep_Q2_019_partial_09_0162_valid :
    mulPoly ep_Q2_019_coefficient_09_0162
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0163 : Poly :=
[
  term ((-4722746456272970264408352017888231263516 : Rat) / 394360562753545469744703122238030696045) [(15, 2), (16, 1)]
]

/-- Partial product 163 for generator 9. -/
def ep_Q2_019_partial_09_0163 : Poly :=
[
  term ((9445492912545940528816704035776462527032 : Rat) / 394360562753545469744703122238030696045) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((-4722746456272970264408352017888231263516 : Rat) / 394360562753545469744703122238030696045) [(0, 2), (15, 2), (16, 1)],
  term ((9445492912545940528816704035776462527032 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-4722746456272970264408352017888231263516 : Rat) / 394360562753545469744703122238030696045) [(1, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 9. -/
theorem ep_Q2_019_partial_09_0163_valid :
    mulPoly ep_Q2_019_coefficient_09_0163
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0164 : Poly :=
[
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(15, 4), (16, 1)]
]

/-- Partial product 164 for generator 9. -/
def ep_Q2_019_partial_09_0164 : Poly :=
[
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (15, 4), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (15, 4), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (15, 4), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 9. -/
theorem ep_Q2_019_partial_09_0164_valid :
    mulPoly ep_Q2_019_coefficient_09_0164
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0165 : Poly :=
[
  term ((-8332282025485366532063639693372060082164 : Rat) / 394360562753545469744703122238030696045) [(16, 1)]
]

/-- Partial product 165 for generator 9. -/
def ep_Q2_019_partial_09_0165 : Poly :=
[
  term ((16664564050970733064127279386744120164328 : Rat) / 394360562753545469744703122238030696045) [(0, 1), (2, 1), (16, 1)],
  term ((-8332282025485366532063639693372060082164 : Rat) / 394360562753545469744703122238030696045) [(0, 2), (16, 1)],
  term ((16664564050970733064127279386744120164328 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 1), (16, 1)],
  term ((-8332282025485366532063639693372060082164 : Rat) / 394360562753545469744703122238030696045) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 9. -/
theorem ep_Q2_019_partial_09_0165_valid :
    mulPoly ep_Q2_019_coefficient_09_0165
        ep_Q2_019_generator_09_0100_0165 =
      ep_Q2_019_partial_09_0165 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_019_partials_09_0100_0165 : List Poly :=
[
  ep_Q2_019_partial_09_0100,
  ep_Q2_019_partial_09_0101,
  ep_Q2_019_partial_09_0102,
  ep_Q2_019_partial_09_0103,
  ep_Q2_019_partial_09_0104,
  ep_Q2_019_partial_09_0105,
  ep_Q2_019_partial_09_0106,
  ep_Q2_019_partial_09_0107,
  ep_Q2_019_partial_09_0108,
  ep_Q2_019_partial_09_0109,
  ep_Q2_019_partial_09_0110,
  ep_Q2_019_partial_09_0111,
  ep_Q2_019_partial_09_0112,
  ep_Q2_019_partial_09_0113,
  ep_Q2_019_partial_09_0114,
  ep_Q2_019_partial_09_0115,
  ep_Q2_019_partial_09_0116,
  ep_Q2_019_partial_09_0117,
  ep_Q2_019_partial_09_0118,
  ep_Q2_019_partial_09_0119,
  ep_Q2_019_partial_09_0120,
  ep_Q2_019_partial_09_0121,
  ep_Q2_019_partial_09_0122,
  ep_Q2_019_partial_09_0123,
  ep_Q2_019_partial_09_0124,
  ep_Q2_019_partial_09_0125,
  ep_Q2_019_partial_09_0126,
  ep_Q2_019_partial_09_0127,
  ep_Q2_019_partial_09_0128,
  ep_Q2_019_partial_09_0129,
  ep_Q2_019_partial_09_0130,
  ep_Q2_019_partial_09_0131,
  ep_Q2_019_partial_09_0132,
  ep_Q2_019_partial_09_0133,
  ep_Q2_019_partial_09_0134,
  ep_Q2_019_partial_09_0135,
  ep_Q2_019_partial_09_0136,
  ep_Q2_019_partial_09_0137,
  ep_Q2_019_partial_09_0138,
  ep_Q2_019_partial_09_0139,
  ep_Q2_019_partial_09_0140,
  ep_Q2_019_partial_09_0141,
  ep_Q2_019_partial_09_0142,
  ep_Q2_019_partial_09_0143,
  ep_Q2_019_partial_09_0144,
  ep_Q2_019_partial_09_0145,
  ep_Q2_019_partial_09_0146,
  ep_Q2_019_partial_09_0147,
  ep_Q2_019_partial_09_0148,
  ep_Q2_019_partial_09_0149,
  ep_Q2_019_partial_09_0150,
  ep_Q2_019_partial_09_0151,
  ep_Q2_019_partial_09_0152,
  ep_Q2_019_partial_09_0153,
  ep_Q2_019_partial_09_0154,
  ep_Q2_019_partial_09_0155,
  ep_Q2_019_partial_09_0156,
  ep_Q2_019_partial_09_0157,
  ep_Q2_019_partial_09_0158,
  ep_Q2_019_partial_09_0159,
  ep_Q2_019_partial_09_0160,
  ep_Q2_019_partial_09_0161,
  ep_Q2_019_partial_09_0162,
  ep_Q2_019_partial_09_0163,
  ep_Q2_019_partial_09_0164,
  ep_Q2_019_partial_09_0165
]

/-- Sum of partial products in this block. -/
def ep_Q2_019_block_09_0100_0165 : Poly :=
[
  term ((-18949482632916340192451383935774382008 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-2804145050985709857781847135819046588 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (6, 1), (16, 1)],
  term ((-26091349276280512451695885830493703232 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(0, 1), (2, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-9679238167753218013378909529622575592 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (9, 1), (16, 1)],
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2322600708198757685499136146687124576 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((2029058866889620615569090782612305216 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (11, 1), (16, 1)],
  term ((-2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1239437931629380474921676514709962624 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((7956583792362746905922786335727337792 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((1073830687411485836240936383937270496 : Rat) / 894241638896928502822456059496668245) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((3736062338520824929881827517241046976 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (15, 3), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 2), (8, 1), (16, 1)],
  term ((-20996164749914544914082650193068097312 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 2), (12, 1), (16, 1)],
  term ((-15542981417252601422412626095180308528 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 2), (16, 1)],
  term ((-13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (8, 1), (16, 1)],
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7305198132634997086576448955102385008 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((256574088474513367348883294760040912 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1312348875064891263783804350591645567548 : Rat) / 569631923977343456297904509899377672065) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-58093159402723750830884115895071139784 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (2, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1027964078834484836392502596616208160352 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-935449211353586993718289058131590608528 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((100333626087653375901571204355710482665632 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (2, 1), (9, 1), (15, 3), (16, 1)],
  term ((2994981478800636018280891722852164192408 : Rat) / 78872112550709093948940624447606139209) [(0, 1), (2, 1), (9, 2), (16, 1)],
  term ((-3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((22536726301580925544575932903965171449608 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-11525294033884154843788554738770717184 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1005681749598201389452784407858433536 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((52368512300593947579968002246653127528 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25632767694784266891455741757662952045668 : Rat) / 301569842105652418040067093476141120505) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((273140727580677667434527660582734464 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(0, 1), (2, 1), (11, 2), (14, 1), (16, 1)],
  term ((1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(0, 1), (2, 1), (11, 2), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-526872864910013412650296266608229203936 : Rat) / 100523280701884139346689031158713706835) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((66518369830504626156001055746199072232 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (12, 1), (14, 1), (16, 1)],
  term ((10372488789641476944207898175682380837264 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1587966958729303208324259049374501704 : Rat) / 178848327779385700564491211899333649) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (12, 2), (15, 2), (16, 1)],
  term ((-11967869200546800360583010574956575368 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((21634427060488543189067583999725971982468 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (13, 1), (15, 3), (16, 1)],
  term ((6408325213851279580063371056220567576 : Rat) / 894241638896928502822456059496668245) [(0, 1), (2, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1596243841115933894403276469146683784 : Rat) / 178848327779385700564491211899333649) [(0, 1), (2, 1), (13, 2), (16, 1)],
  term ((-46266499443292979553437871219016963141328 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6063260541130719330805748175777296254936 : Rat) / 78872112550709093948940624447606139209) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (14, 2), (15, 2), (16, 1)],
  term ((28123129730962063156441285925025177863372 : Rat) / 394360562753545469744703122238030696045) [(0, 1), (2, 1), (14, 2), (16, 1)],
  term ((9445492912545940528816704035776462527032 : Rat) / 394360562753545469744703122238030696045) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (15, 4), (16, 1)],
  term ((16664564050970733064127279386744120164328 : Rat) / 394360562753545469744703122238030696045) [(0, 1), (2, 1), (16, 1)],
  term ((9474741316458170096225691967887191004 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((1402072525492854928890923567909523294 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (6, 1), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-17623747615809039201792401816796368 : Rat) / 368217145428147030573952495086863395) [(0, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((4839619083876609006689454764811287796 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((-2881323508471038710947138684692679296 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1161300354099378842749568073343562288 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((68285181895169416858631915145683616 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1014529433444810307784545391306152608 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((619718965814690237460838257354981312 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3978291896181373452961393167863668896 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-536915343705742918120468191968635248 : Rat) / 894241638896928502822456059496668245) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1868031169260412464940913758620523488 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (15, 3), (16, 1)],
  term ((-6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 2), (8, 1), (16, 1)],
  term ((10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 2), (12, 1), (16, 1)],
  term ((7771490708626300711206313047590154264 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 2), (16, 1)],
  term ((6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (8, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(0, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-128287044237256683674441647380020456 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((656174437532445631891902175295822783774 : Rat) / 569631923977343456297904509899377672065) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((29046579701361875415442057947535569892 : Rat) / 2577520017997029214017667465608043765) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(0, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((513982039417242418196251298308104080176 : Rat) / 43817840305949496638300346915336744005) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((467724605676793496859144529065795304264 : Rat) / 43817840305949496638300346915336744005) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(0, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-50166813043826687950785602177855241332816 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((-1497490739400318009140445861426082096204 : Rat) / 78872112550709093948940624447606139209) [(0, 2), (9, 2), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11268363150790462772287966451982585724804 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-502840874799100694726392203929216768 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-26184256150296973789984001123326563764 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((12816383847392133445727870878831476022834 : Rat) / 301569842105652418040067093476141120505) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(0, 2), (11, 2), (14, 1), (16, 1)],
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(0, 2), (11, 2), (16, 1)],
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((263436432455006706325148133304114601968 : Rat) / 100523280701884139346689031158713706835) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-33259184915252313078000527873099536116 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((-5186244394820738472103949087841190418632 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((793983479364651604162129524687250852 : Rat) / 178848327779385700564491211899333649) [(0, 2), (12, 1), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (12, 2), (15, 2), (16, 1)],
  term ((5983934600273400180291505287478287684 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10817213530244271594533791999862985991234 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((-3204162606925639790031685528110283788 : Rat) / 894241638896928502822456059496668245) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((798121920557966947201638234573341892 : Rat) / 178848327779385700564491211899333649) [(0, 2), (13, 2), (16, 1)],
  term ((23133249721646489776718935609508481570664 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((3031630270565359665402874087888648127468 : Rat) / 78872112550709093948940624447606139209) [(0, 2), (14, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (14, 2), (15, 2), (16, 1)],
  term ((-14061564865481031578220642962512588931686 : Rat) / 394360562753545469744703122238030696045) [(0, 2), (14, 2), (16, 1)],
  term ((-4722746456272970264408352017888231263516 : Rat) / 394360562753545469744703122238030696045) [(0, 2), (15, 2), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (15, 4), (16, 1)],
  term ((-8332282025485366532063639693372060082164 : Rat) / 394360562753545469744703122238030696045) [(0, 2), (16, 1)],
  term ((-18949482632916340192451383935774382008 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((-2804145050985709857781847135819046588 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (16, 1)],
  term ((-26091349276280512451695885830493703232 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(1, 1), (3, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-9679238167753218013378909529622575592 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (9, 1), (16, 1)],
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2322600708198757685499136146687124576 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((2029058866889620615569090782612305216 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((-2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1239437931629380474921676514709962624 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((7956583792362746905922786335727337792 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((1073830687411485836240936383937270496 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((3736062338520824929881827517241046976 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (15, 3), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 2), (8, 1), (16, 1)],
  term ((-20996164749914544914082650193068097312 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 2), (12, 1), (16, 1)],
  term ((-15542981417252601422412626095180308528 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((-13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (8, 1), (16, 1)],
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7305198132634997086576448955102385008 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((256574088474513367348883294760040912 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1312348875064891263783804350591645567548 : Rat) / 569631923977343456297904509899377672065) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-58093159402723750830884115895071139784 : Rat) / 2577520017997029214017667465608043765) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1027964078834484836392502596616208160352 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((-935449211353586993718289058131590608528 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((100333626087653375901571204355710482665632 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (15, 3), (16, 1)],
  term ((2994981478800636018280891722852164192408 : Rat) / 78872112550709093948940624447606139209) [(1, 1), (3, 1), (9, 2), (16, 1)],
  term ((-3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((22536726301580925544575932903965171449608 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-11525294033884154843788554738770717184 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1005681749598201389452784407858433536 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((52368512300593947579968002246653127528 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25632767694784266891455741757662952045668 : Rat) / 301569842105652418040067093476141120505) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((273140727580677667434527660582734464 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 1), (11, 2), (14, 1), (16, 1)],
  term ((1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-526872864910013412650296266608229203936 : Rat) / 100523280701884139346689031158713706835) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((66518369830504626156001055746199072232 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (12, 1), (14, 1), (16, 1)],
  term ((10372488789641476944207898175682380837264 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1587966958729303208324259049374501704 : Rat) / 178848327779385700564491211899333649) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (12, 2), (15, 2), (16, 1)],
  term ((-11967869200546800360583010574956575368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((21634427060488543189067583999725971982468 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (13, 1), (15, 3), (16, 1)],
  term ((6408325213851279580063371056220567576 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1596243841115933894403276469146683784 : Rat) / 178848327779385700564491211899333649) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-46266499443292979553437871219016963141328 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6063260541130719330805748175777296254936 : Rat) / 78872112550709093948940624447606139209) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (14, 2), (15, 2), (16, 1)],
  term ((28123129730962063156441285925025177863372 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 1), (14, 2), (16, 1)],
  term ((9445492912545940528816704035776462527032 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (15, 4), (16, 1)],
  term ((16664564050970733064127279386744120164328 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 1), (16, 1)],
  term ((9474741316458170096225691967887191004 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((1402072525492854928890923567909523294 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (6, 1), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-17623747615809039201792401816796368 : Rat) / 368217145428147030573952495086863395) [(1, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((4839619083876609006689454764811287796 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((-2881323508471038710947138684692679296 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1161300354099378842749568073343562288 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((68285181895169416858631915145683616 : Rat) / 1251938294455699903951438483295335543) [(1, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1014529433444810307784545391306152608 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((619718965814690237460838257354981312 : Rat) / 1251938294455699903951438483295335543) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3978291896181373452961393167863668896 : Rat) / 1251938294455699903951438483295335543) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-536915343705742918120468191968635248 : Rat) / 894241638896928502822456059496668245) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1868031169260412464940913758620523488 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 1), (15, 3), (16, 1)],
  term ((-6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 2), (8, 1), (16, 1)],
  term ((10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 2), (12, 1), (16, 1)],
  term ((7771490708626300711206313047590154264 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 2), (16, 1)],
  term ((6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (8, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-128287044237256683674441647380020456 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((656174437532445631891902175295822783774 : Rat) / 569631923977343456297904509899377672065) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((29046579701361875415442057947535569892 : Rat) / 2577520017997029214017667465608043765) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(1, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((513982039417242418196251298308104080176 : Rat) / 43817840305949496638300346915336744005) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((467724605676793496859144529065795304264 : Rat) / 43817840305949496638300346915336744005) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(1, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-50166813043826687950785602177855241332816 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term ((-1497490739400318009140445861426082096204 : Rat) / 78872112550709093948940624447606139209) [(1, 2), (9, 2), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11268363150790462772287966451982585724804 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-502840874799100694726392203929216768 : Rat) / 1251938294455699903951438483295335543) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-26184256150296973789984001123326563764 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((12816383847392133445727870878831476022834 : Rat) / 301569842105652418040067093476141120505) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(1, 2), (11, 2), (14, 1), (16, 1)],
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(1, 2), (11, 2), (16, 1)],
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((263436432455006706325148133304114601968 : Rat) / 100523280701884139346689031158713706835) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-33259184915252313078000527873099536116 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term ((-5186244394820738472103949087841190418632 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((793983479364651604162129524687250852 : Rat) / 178848327779385700564491211899333649) [(1, 2), (12, 1), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (12, 2), (15, 2), (16, 1)],
  term ((5983934600273400180291505287478287684 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10817213530244271594533791999862985991234 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((-3204162606925639790031685528110283788 : Rat) / 894241638896928502822456059496668245) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((798121920557966947201638234573341892 : Rat) / 178848327779385700564491211899333649) [(1, 2), (13, 2), (16, 1)],
  term ((23133249721646489776718935609508481570664 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((3031630270565359665402874087888648127468 : Rat) / 78872112550709093948940624447606139209) [(1, 2), (14, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (14, 2), (15, 2), (16, 1)],
  term ((-14061564865481031578220642962512588931686 : Rat) / 394360562753545469744703122238030696045) [(1, 2), (14, 2), (16, 1)],
  term ((-4722746456272970264408352017888231263516 : Rat) / 394360562753545469744703122238030696045) [(1, 2), (15, 2), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (15, 4), (16, 1)],
  term ((-8332282025485366532063639693372060082164 : Rat) / 394360562753545469744703122238030696045) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 100 through 165. -/
theorem ep_Q2_019_block_09_0100_0165_valid :
    checkProductSumEq ep_Q2_019_partials_09_0100_0165
      ep_Q2_019_block_09_0100_0165 = true := by
  native_decide

end EpQ2019TermShards

end Patterns

end EndpointCertificate

end Problem97
