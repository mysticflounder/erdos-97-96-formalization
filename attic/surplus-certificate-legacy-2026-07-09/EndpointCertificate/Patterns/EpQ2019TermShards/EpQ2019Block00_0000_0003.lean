/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_019, term block 0:0-3

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_019`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2019TermShards

/-- Generator polynomial 0 for endpoint certificate `ep_Q2_019`. -/
def ep_Q2_019_generator_00_0000_0003 : Poly :=
[
  term (2 : Rat) [(0, 1), (4, 1)],
  term (2 : Rat) [(1, 1), (5, 1)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 0. -/
def ep_Q2_019_coefficient_00_0000 : Poly :=
[
  term ((-1108216808966966127082965518088470688 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (16, 1)]
]

/-- Partial product 0 for generator 0. -/
def ep_Q2_019_partial_00_0000 : Poly :=
[
  term ((-2216433617933932254165931036176941376 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((-2216433617933932254165931036176941376 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (5, 1), (16, 1)],
  term ((1108216808966966127082965518088470688 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 2), (16, 1)],
  term ((1108216808966966127082965518088470688 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 0. -/
theorem ep_Q2_019_partial_00_0000_valid :
    mulPoly ep_Q2_019_coefficient_00_0000
        ep_Q2_019_generator_00_0000_0003 =
      ep_Q2_019_partial_00_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 0. -/
def ep_Q2_019_coefficient_00_0001 : Poly :=
[
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(12, 1), (16, 1)]
]

/-- Partial product 1 for generator 0. -/
def ep_Q2_019_partial_00_0001 : Poly :=
[
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (5, 1), (12, 1), (16, 1)],
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(4, 2), (12, 1), (16, 1)],
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(5, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 0. -/
theorem ep_Q2_019_partial_00_0001_valid :
    mulPoly ep_Q2_019_coefficient_00_0001
        ep_Q2_019_generator_00_0000_0003 =
      ep_Q2_019_partial_00_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 0. -/
def ep_Q2_019_coefficient_00_0002 : Poly :=
[
  term ((-3262458420543529067880708624233530768 : Rat) / 6259691472278499519757192416476677715) [(14, 1), (16, 1)]
]

/-- Partial product 2 for generator 0. -/
def ep_Q2_019_partial_00_0002 : Poly :=
[
  term ((-6524916841087058135761417248467061536 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((-6524916841087058135761417248467061536 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term ((3262458420543529067880708624233530768 : Rat) / 6259691472278499519757192416476677715) [(4, 2), (14, 1), (16, 1)],
  term ((3262458420543529067880708624233530768 : Rat) / 6259691472278499519757192416476677715) [(5, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 0. -/
theorem ep_Q2_019_partial_00_0002_valid :
    mulPoly ep_Q2_019_coefficient_00_0002
        ep_Q2_019_generator_00_0000_0003 =
      ep_Q2_019_partial_00_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 0. -/
def ep_Q2_019_coefficient_00_0003 : Poly :=
[
  term ((470346132259201012424861548871492976 : Rat) / 1251938294455699903951438483295335543) [(16, 1)]
]

/-- Partial product 3 for generator 0. -/
def ep_Q2_019_partial_00_0003 : Poly :=
[
  term ((940692264518402024849723097742985952 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (4, 1), (16, 1)],
  term ((940692264518402024849723097742985952 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (5, 1), (16, 1)],
  term ((-470346132259201012424861548871492976 : Rat) / 1251938294455699903951438483295335543) [(4, 2), (16, 1)],
  term ((-470346132259201012424861548871492976 : Rat) / 1251938294455699903951438483295335543) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 0. -/
theorem ep_Q2_019_partial_00_0003_valid :
    mulPoly ep_Q2_019_coefficient_00_0003
        ep_Q2_019_generator_00_0000_0003 =
      ep_Q2_019_partial_00_0003 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_019_partials_00_0000_0003 : List Poly :=
[
  ep_Q2_019_partial_00_0000,
  ep_Q2_019_partial_00_0001,
  ep_Q2_019_partial_00_0002,
  ep_Q2_019_partial_00_0003
]

/-- Sum of partial products in this block. -/
def ep_Q2_019_block_00_0000_0003 : Poly :=
[
  term ((-2216433617933932254165931036176941376 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((-6524916841087058135761417248467061536 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((940692264518402024849723097742985952 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (4, 1), (16, 1)],
  term ((-2216433617933932254165931036176941376 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (5, 1), (16, 1)],
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (5, 1), (12, 1), (16, 1)],
  term ((-6524916841087058135761417248467061536 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term ((940692264518402024849723097742985952 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (5, 1), (16, 1)],
  term ((1108216808966966127082965518088470688 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 2), (16, 1)],
  term ((1108216808966966127082965518088470688 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 2), (16, 1)],
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(4, 2), (12, 1), (16, 1)],
  term ((3262458420543529067880708624233530768 : Rat) / 6259691472278499519757192416476677715) [(4, 2), (14, 1), (16, 1)],
  term ((-470346132259201012424861548871492976 : Rat) / 1251938294455699903951438483295335543) [(4, 2), (16, 1)],
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(5, 2), (12, 1), (16, 1)],
  term ((3262458420543529067880708624233530768 : Rat) / 6259691472278499519757192416476677715) [(5, 2), (14, 1), (16, 1)],
  term ((-470346132259201012424861548871492976 : Rat) / 1251938294455699903951438483295335543) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 0, terms 0 through 3. -/
theorem ep_Q2_019_block_00_0000_0003_valid :
    checkProductSumEq ep_Q2_019_partials_00_0000_0003
      ep_Q2_019_block_00_0000_0003 = true := by
  native_decide

end EpQ2019TermShards

end Patterns

end EndpointCertificate

end Problem97
