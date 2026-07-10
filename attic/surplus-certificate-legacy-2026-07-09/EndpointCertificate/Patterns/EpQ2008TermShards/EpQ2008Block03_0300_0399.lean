/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 3:300-399

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 3 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_03_0300_0399 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0300 : Poly :=
[
  term ((21648492159165587981097665592421028550750 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 300 for generator 3. -/
def ep_Q2_008_partial_03_0300 : Poly :=
[
  term ((21648492159165587981097665592421028550750 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((21648492159165587981097665592421028550750 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21648492159165587981097665592421028550750 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21648492159165587981097665592421028550750 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 3. -/
theorem ep_Q2_008_partial_03_0300_valid :
    mulPoly ep_Q2_008_coefficient_03_0300
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0301 : Poly :=
[
  term ((68642200442727884261659190718402009414000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 301 for generator 3. -/
def ep_Q2_008_partial_03_0301 : Poly :=
[
  term ((68642200442727884261659190718402009414000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((68642200442727884261659190718402009414000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-68642200442727884261659190718402009414000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-68642200442727884261659190718402009414000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 3. -/
theorem ep_Q2_008_partial_03_0301_valid :
    mulPoly ep_Q2_008_coefficient_03_0301
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0302 : Poly :=
[
  term ((5965406637117337125 : Rat) / 2771825814456705436) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 302 for generator 3. -/
def ep_Q2_008_partial_03_0302 : Poly :=
[
  term ((5965406637117337125 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((5965406637117337125 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-5965406637117337125 : Rat) / 2771825814456705436) [(4, 1), (8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-5965406637117337125 : Rat) / 2771825814456705436) [(4, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 3. -/
theorem ep_Q2_008_partial_03_0302_valid :
    mulPoly ep_Q2_008_coefficient_03_0302
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0303 : Poly :=
[
  term ((458492599127423703443947836634629734807700 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 303 for generator 3. -/
def ep_Q2_008_partial_03_0303 : Poly :=
[
  term ((458492599127423703443947836634629734807700 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((458492599127423703443947836634629734807700 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-458492599127423703443947836634629734807700 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-458492599127423703443947836634629734807700 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 3. -/
theorem ep_Q2_008_partial_03_0303_valid :
    mulPoly ep_Q2_008_coefficient_03_0303
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0304 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 304 for generator 3. -/
def ep_Q2_008_partial_03_0304 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (8, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (9, 2), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 3. -/
theorem ep_Q2_008_partial_03_0304_valid :
    mulPoly ep_Q2_008_coefficient_03_0304
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0305 : Poly :=
[
  term ((4764553713739224000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 305 for generator 3. -/
def ep_Q2_008_partial_03_0305 : Poly :=
[
  term ((4764553713739224000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (11, 1), (13, 3), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (11, 1), (13, 3), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(4, 1), (8, 2), (11, 1), (13, 3), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(4, 1), (9, 2), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 3. -/
theorem ep_Q2_008_partial_03_0305_valid :
    mulPoly ep_Q2_008_coefficient_03_0305
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0306 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 306 for generator 3. -/
def ep_Q2_008_partial_03_0306 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (8, 2), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (9, 2), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 3. -/
theorem ep_Q2_008_partial_03_0306_valid :
    mulPoly ep_Q2_008_coefficient_03_0306
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0307 : Poly :=
[
  term ((-31021779259134859150361348569296755231175 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 307 for generator 3. -/
def ep_Q2_008_partial_03_0307 : Poly :=
[
  term ((-31021779259134859150361348569296755231175 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-31021779259134859150361348569296755231175 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((31021779259134859150361348569296755231175 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((31021779259134859150361348569296755231175 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 3. -/
theorem ep_Q2_008_partial_03_0307_valid :
    mulPoly ep_Q2_008_coefficient_03_0307
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0308 : Poly :=
[
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 308 for generator 3. -/
def ep_Q2_008_partial_03_0308 : Poly :=
[
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (8, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (9, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 3. -/
theorem ep_Q2_008_partial_03_0308_valid :
    mulPoly ep_Q2_008_coefficient_03_0308
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0309 : Poly :=
[
  term ((420420022166409750 : Rat) / 692956453614176359) [(4, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 309 for generator 3. -/
def ep_Q2_008_partial_03_0309 : Poly :=
[
  term ((420420022166409750 : Rat) / 692956453614176359) [(2, 2), (4, 1), (11, 2), (12, 1), (16, 1)],
  term ((420420022166409750 : Rat) / 692956453614176359) [(3, 2), (4, 1), (11, 2), (12, 1), (16, 1)],
  term ((-420420022166409750 : Rat) / 692956453614176359) [(4, 1), (8, 2), (11, 2), (12, 1), (16, 1)],
  term ((-420420022166409750 : Rat) / 692956453614176359) [(4, 1), (9, 2), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 3. -/
theorem ep_Q2_008_partial_03_0309_valid :
    mulPoly ep_Q2_008_coefficient_03_0309
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0310 : Poly :=
[
  term ((122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 310 for generator 3. -/
def ep_Q2_008_partial_03_0310 : Poly :=
[
  term ((122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 3. -/
theorem ep_Q2_008_partial_03_0310_valid :
    mulPoly ep_Q2_008_coefficient_03_0310
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0311 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 311 for generator 3. -/
def ep_Q2_008_partial_03_0311 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (8, 2), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (9, 2), (11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 3. -/
theorem ep_Q2_008_partial_03_0311_valid :
    mulPoly ep_Q2_008_coefficient_03_0311
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0312 : Poly :=
[
  term ((9439112615664407733 : Rat) / 2771825814456705436) [(4, 1), (11, 2), (16, 1)]
]

/-- Partial product 312 for generator 3. -/
def ep_Q2_008_partial_03_0312 : Poly :=
[
  term ((9439112615664407733 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (11, 2), (16, 1)],
  term ((9439112615664407733 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (11, 2), (16, 1)],
  term ((-9439112615664407733 : Rat) / 2771825814456705436) [(4, 1), (8, 2), (11, 2), (16, 1)],
  term ((-9439112615664407733 : Rat) / 2771825814456705436) [(4, 1), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 3. -/
theorem ep_Q2_008_partial_03_0312_valid :
    mulPoly ep_Q2_008_coefficient_03_0312
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0313 : Poly :=
[
  term ((22948808695647475864287961026389330983800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 313 for generator 3. -/
def ep_Q2_008_partial_03_0313 : Poly :=
[
  term ((22948808695647475864287961026389330983800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((22948808695647475864287961026389330983800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-22948808695647475864287961026389330983800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-22948808695647475864287961026389330983800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 3. -/
theorem ep_Q2_008_partial_03_0313_valid :
    mulPoly ep_Q2_008_coefficient_03_0313
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0314 : Poly :=
[
  term ((-4366060179532158615 : Rat) / 11087303257826821744) [(4, 1), (12, 1), (16, 1)]
]

/-- Partial product 314 for generator 3. -/
def ep_Q2_008_partial_03_0314 : Poly :=
[
  term ((-4366060179532158615 : Rat) / 11087303257826821744) [(2, 2), (4, 1), (12, 1), (16, 1)],
  term ((-4366060179532158615 : Rat) / 11087303257826821744) [(3, 2), (4, 1), (12, 1), (16, 1)],
  term ((4366060179532158615 : Rat) / 11087303257826821744) [(4, 1), (8, 2), (12, 1), (16, 1)],
  term ((4366060179532158615 : Rat) / 11087303257826821744) [(4, 1), (9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 3. -/
theorem ep_Q2_008_partial_03_0314_valid :
    mulPoly ep_Q2_008_coefficient_03_0314
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0315 : Poly :=
[
  term ((-2826440567345852487690585850484076514432761 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 315 for generator 3. -/
def ep_Q2_008_partial_03_0315 : Poly :=
[
  term ((-2826440567345852487690585850484076514432761 : Rat) / 674830407405318061502963313035932218791992) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2826440567345852487690585850484076514432761 : Rat) / 674830407405318061502963313035932218791992) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((2826440567345852487690585850484076514432761 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((2826440567345852487690585850484076514432761 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 3. -/
theorem ep_Q2_008_partial_03_0315_valid :
    mulPoly ep_Q2_008_coefficient_03_0315
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0316 : Poly :=
[
  term ((-64868635690772299486488597327903986396400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 316 for generator 3. -/
def ep_Q2_008_partial_03_0316 : Poly :=
[
  term ((-64868635690772299486488597327903986396400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-64868635690772299486488597327903986396400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((64868635690772299486488597327903986396400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (13, 2), (15, 2), (16, 1)],
  term ((64868635690772299486488597327903986396400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 3. -/
theorem ep_Q2_008_partial_03_0316_valid :
    mulPoly ep_Q2_008_coefficient_03_0316
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0317 : Poly :=
[
  term ((-19896128880655371405 : Rat) / 2771825814456705436) [(4, 1), (13, 2), (16, 1)]
]

/-- Partial product 317 for generator 3. -/
def ep_Q2_008_partial_03_0317 : Poly :=
[
  term ((-19896128880655371405 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (13, 2), (16, 1)],
  term ((-19896128880655371405 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (13, 2), (16, 1)],
  term ((19896128880655371405 : Rat) / 2771825814456705436) [(4, 1), (8, 2), (13, 2), (16, 1)],
  term ((19896128880655371405 : Rat) / 2771825814456705436) [(4, 1), (9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 3. -/
theorem ep_Q2_008_partial_03_0317_valid :
    mulPoly ep_Q2_008_coefficient_03_0317
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0318 : Poly :=
[
  term ((4820771137589793068322443462231768812800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 318 for generator 3. -/
def ep_Q2_008_partial_03_0318 : Poly :=
[
  term ((4820771137589793068322443462231768812800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (13, 3), (15, 1), (16, 1)],
  term ((4820771137589793068322443462231768812800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (13, 3), (15, 1), (16, 1)],
  term ((-4820771137589793068322443462231768812800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (13, 3), (15, 1), (16, 1)],
  term ((-4820771137589793068322443462231768812800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 3. -/
theorem ep_Q2_008_partial_03_0318_valid :
    mulPoly ep_Q2_008_coefficient_03_0318
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0319 : Poly :=
[
  term ((16796426590554923151 : Rat) / 2771825814456705436) [(4, 1), (16, 1)]
]

/-- Partial product 319 for generator 3. -/
def ep_Q2_008_partial_03_0319 : Poly :=
[
  term ((16796426590554923151 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (16, 1)],
  term ((16796426590554923151 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (16, 1)],
  term ((-16796426590554923151 : Rat) / 2771825814456705436) [(4, 1), (8, 2), (16, 1)],
  term ((-16796426590554923151 : Rat) / 2771825814456705436) [(4, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 3. -/
theorem ep_Q2_008_partial_03_0319_valid :
    mulPoly ep_Q2_008_coefficient_03_0319
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0320 : Poly :=
[
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 320 for generator 3. -/
def ep_Q2_008_partial_03_0320 : Poly :=
[
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 3. -/
theorem ep_Q2_008_partial_03_0320_valid :
    mulPoly ep_Q2_008_coefficient_03_0320
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0321 : Poly :=
[
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 321 for generator 3. -/
def ep_Q2_008_partial_03_0321 : Poly :=
[
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 3. -/
theorem ep_Q2_008_partial_03_0321_valid :
    mulPoly ep_Q2_008_coefficient_03_0321
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0322 : Poly :=
[
  term ((-43926043926967546635 : Rat) / 11087303257826821744) [(4, 2), (16, 1)]
]

/-- Partial product 322 for generator 3. -/
def ep_Q2_008_partial_03_0322 : Poly :=
[
  term ((-43926043926967546635 : Rat) / 11087303257826821744) [(2, 2), (4, 2), (16, 1)],
  term ((-43926043926967546635 : Rat) / 11087303257826821744) [(3, 2), (4, 2), (16, 1)],
  term ((43926043926967546635 : Rat) / 11087303257826821744) [(4, 2), (8, 2), (16, 1)],
  term ((43926043926967546635 : Rat) / 11087303257826821744) [(4, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 3. -/
theorem ep_Q2_008_partial_03_0322_valid :
    mulPoly ep_Q2_008_coefficient_03_0322
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0323 : Poly :=
[
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 323 for generator 3. -/
def ep_Q2_008_partial_03_0323 : Poly :=
[
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (8, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 3. -/
theorem ep_Q2_008_partial_03_0323_valid :
    mulPoly ep_Q2_008_coefficient_03_0323
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0324 : Poly :=
[
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 324 for generator 3. -/
def ep_Q2_008_partial_03_0324 : Poly :=
[
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 3. -/
theorem ep_Q2_008_partial_03_0324_valid :
    mulPoly ep_Q2_008_coefficient_03_0324
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0325 : Poly :=
[
  term ((322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 325 for generator 3. -/
def ep_Q2_008_partial_03_0325 : Poly :=
[
  term ((322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 3. -/
theorem ep_Q2_008_partial_03_0325_valid :
    mulPoly ep_Q2_008_coefficient_03_0325
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0326 : Poly :=
[
  term ((-305620264313397076332886748867116800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 326 for generator 3. -/
def ep_Q2_008_partial_03_0326 : Poly :=
[
  term ((-305620264313397076332886748867116800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-305620264313397076332886748867116800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((305620264313397076332886748867116800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((305620264313397076332886748867116800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 3. -/
theorem ep_Q2_008_partial_03_0326_valid :
    mulPoly ep_Q2_008_coefficient_03_0326
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0327 : Poly :=
[
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 327 for generator 3. -/
def ep_Q2_008_partial_03_0327 : Poly :=
[
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (8, 2), (13, 2), (15, 2), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 3. -/
theorem ep_Q2_008_partial_03_0327_valid :
    mulPoly ep_Q2_008_coefficient_03_0327
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0328 : Poly :=
[
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 328 for generator 3. -/
def ep_Q2_008_partial_03_0328 : Poly :=
[
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (8, 2), (13, 3), (15, 1), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (9, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 3. -/
theorem ep_Q2_008_partial_03_0328_valid :
    mulPoly ep_Q2_008_coefficient_03_0328
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0329 : Poly :=
[
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 329 for generator 3. -/
def ep_Q2_008_partial_03_0329 : Poly :=
[
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (8, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 3. -/
theorem ep_Q2_008_partial_03_0329_valid :
    mulPoly ep_Q2_008_coefficient_03_0329
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0330 : Poly :=
[
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 330 for generator 3. -/
def ep_Q2_008_partial_03_0330 : Poly :=
[
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(2, 2), (5, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (6, 1), (8, 2), (11, 1), (13, 2), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (6, 1), (9, 2), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 3. -/
theorem ep_Q2_008_partial_03_0330_valid :
    mulPoly ep_Q2_008_coefficient_03_0330
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0331 : Poly :=
[
  term ((26542157644955337657 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 331 for generator 3. -/
def ep_Q2_008_partial_03_0331 : Poly :=
[
  term ((26542157644955337657 : Rat) / 2771825814456705436) [(2, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((26542157644955337657 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-26542157644955337657 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (8, 2), (11, 1), (16, 1)],
  term ((-26542157644955337657 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 3. -/
theorem ep_Q2_008_partial_03_0331_valid :
    mulPoly ep_Q2_008_coefficient_03_0331
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0332 : Poly :=
[
  term ((53819861292522639870 : Rat) / 692956453614176359) [(5, 1), (6, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 332 for generator 3. -/
def ep_Q2_008_partial_03_0332 : Poly :=
[
  term ((53819861292522639870 : Rat) / 692956453614176359) [(2, 2), (5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((53819861292522639870 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-53819861292522639870 : Rat) / 692956453614176359) [(5, 1), (6, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((-53819861292522639870 : Rat) / 692956453614176359) [(5, 1), (6, 1), (9, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 3. -/
theorem ep_Q2_008_partial_03_0332_valid :
    mulPoly ep_Q2_008_coefficient_03_0332
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0333 : Poly :=
[
  term ((-7263471595026879643283351454565284017400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 333 for generator 3. -/
def ep_Q2_008_partial_03_0333 : Poly :=
[
  term ((-7263471595026879643283351454565284017400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7263471595026879643283351454565284017400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((7263471595026879643283351454565284017400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((7263471595026879643283351454565284017400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 3. -/
theorem ep_Q2_008_partial_03_0333_valid :
    mulPoly ep_Q2_008_coefficient_03_0333
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0334 : Poly :=
[
  term ((-185795103514687363599 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 334 for generator 3. -/
def ep_Q2_008_partial_03_0334 : Poly :=
[
  term ((-185795103514687363599 : Rat) / 2771825814456705436) [(2, 2), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-185795103514687363599 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((185795103514687363599 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (8, 2), (13, 1), (16, 1)],
  term ((185795103514687363599 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 3. -/
theorem ep_Q2_008_partial_03_0334_valid :
    mulPoly ep_Q2_008_coefficient_03_0334
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0335 : Poly :=
[
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 335 for generator 3. -/
def ep_Q2_008_partial_03_0335 : Poly :=
[
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(2, 2), (5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(5, 1), (6, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(5, 1), (6, 1), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 3. -/
theorem ep_Q2_008_partial_03_0335_valid :
    mulPoly ep_Q2_008_coefficient_03_0335
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0336 : Poly :=
[
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 3), (16, 1)]
]

/-- Partial product 336 for generator 3. -/
def ep_Q2_008_partial_03_0336 : Poly :=
[
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(2, 2), (5, 1), (6, 1), (13, 3), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (13, 3), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (6, 1), (8, 2), (13, 3), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (6, 1), (9, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 3. -/
theorem ep_Q2_008_partial_03_0336_valid :
    mulPoly ep_Q2_008_coefficient_03_0336
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0337 : Poly :=
[
  term ((7259938827335024308718947931697609490200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 337 for generator 3. -/
def ep_Q2_008_partial_03_0337 : Poly :=
[
  term ((7259938827335024308718947931697609490200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((7259938827335024308718947931697609490200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-7259938827335024308718947931697609490200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((-7259938827335024308718947931697609490200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 3. -/
theorem ep_Q2_008_partial_03_0337_valid :
    mulPoly ep_Q2_008_coefficient_03_0337
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0338 : Poly :=
[
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 338 for generator 3. -/
def ep_Q2_008_partial_03_0338 : Poly :=
[
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 3. -/
theorem ep_Q2_008_partial_03_0338_valid :
    mulPoly ep_Q2_008_coefficient_03_0338
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0339 : Poly :=
[
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 339 for generator 3. -/
def ep_Q2_008_partial_03_0339 : Poly :=
[
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 3), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 3. -/
theorem ep_Q2_008_partial_03_0339_valid :
    mulPoly ep_Q2_008_coefficient_03_0339
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0340 : Poly :=
[
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 340 for generator 3. -/
def ep_Q2_008_partial_03_0340 : Poly :=
[
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 3), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 3. -/
theorem ep_Q2_008_partial_03_0340_valid :
    mulPoly ep_Q2_008_coefficient_03_0340
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0341 : Poly :=
[
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 341 for generator 3. -/
def ep_Q2_008_partial_03_0341 : Poly :=
[
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 3. -/
theorem ep_Q2_008_partial_03_0341_valid :
    mulPoly ep_Q2_008_coefficient_03_0341
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0342 : Poly :=
[
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 342 for generator 3. -/
def ep_Q2_008_partial_03_0342 : Poly :=
[
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 3. -/
theorem ep_Q2_008_partial_03_0342_valid :
    mulPoly ep_Q2_008_coefficient_03_0342
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0343 : Poly :=
[
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 343 for generator 3. -/
def ep_Q2_008_partial_03_0343 : Poly :=
[
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 3. -/
theorem ep_Q2_008_partial_03_0343_valid :
    mulPoly ep_Q2_008_coefficient_03_0343
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0344 : Poly :=
[
  term ((-1811097258574155252729824956377398400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 344 for generator 3. -/
def ep_Q2_008_partial_03_0344 : Poly :=
[
  term ((-1811097258574155252729824956377398400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1811097258574155252729824956377398400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1811097258574155252729824956377398400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1811097258574155252729824956377398400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 3. -/
theorem ep_Q2_008_partial_03_0344_valid :
    mulPoly ep_Q2_008_coefficient_03_0344
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0345 : Poly :=
[
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 345 for generator 3. -/
def ep_Q2_008_partial_03_0345 : Poly :=
[
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(2, 2), (5, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (8, 2), (10, 1), (12, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 3. -/
theorem ep_Q2_008_partial_03_0345_valid :
    mulPoly ep_Q2_008_coefficient_03_0345
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0346 : Poly :=
[
  term ((-44314686623014006702851226450536982012503 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 346 for generator 3. -/
def ep_Q2_008_partial_03_0346 : Poly :=
[
  term ((-44314686623014006702851226450536982012503 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-44314686623014006702851226450536982012503 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((44314686623014006702851226450536982012503 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((44314686623014006702851226450536982012503 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 3. -/
theorem ep_Q2_008_partial_03_0346_valid :
    mulPoly ep_Q2_008_coefficient_03_0346
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0347 : Poly :=
[
  term ((-3751276367914217345153043073766995200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 347 for generator 3. -/
def ep_Q2_008_partial_03_0347 : Poly :=
[
  term ((-3751276367914217345153043073766995200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3751276367914217345153043073766995200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((3751276367914217345153043073766995200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((3751276367914217345153043073766995200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 3. -/
theorem ep_Q2_008_partial_03_0347_valid :
    mulPoly ep_Q2_008_coefficient_03_0347
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0348 : Poly :=
[
  term ((64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 348 for generator 3. -/
def ep_Q2_008_partial_03_0348 : Poly :=
[
  term ((64583833551027167844 : Rat) / 692956453614176359) [(2, 2), (5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(3, 2), (5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (7, 1), (8, 2), (10, 1), (13, 2), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 3. -/
theorem ep_Q2_008_partial_03_0348_valid :
    mulPoly ep_Q2_008_coefficient_03_0348
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0349 : Poly :=
[
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 349 for generator 3. -/
def ep_Q2_008_partial_03_0349 : Poly :=
[
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 3. -/
theorem ep_Q2_008_partial_03_0349_valid :
    mulPoly ep_Q2_008_coefficient_03_0349
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0350 : Poly :=
[
  term ((-208757092189522899 : Rat) / 23895050124626771) [(5, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 350 for generator 3. -/
def ep_Q2_008_partial_03_0350 : Poly :=
[
  term ((-208757092189522899 : Rat) / 23895050124626771) [(2, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-208757092189522899 : Rat) / 23895050124626771) [(3, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((208757092189522899 : Rat) / 23895050124626771) [(5, 1), (7, 1), (8, 2), (10, 1), (16, 1)],
  term ((208757092189522899 : Rat) / 23895050124626771) [(5, 1), (7, 1), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 3. -/
theorem ep_Q2_008_partial_03_0350_valid :
    mulPoly ep_Q2_008_coefficient_03_0350
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0351 : Poly :=
[
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 351 for generator 3. -/
def ep_Q2_008_partial_03_0351 : Poly :=
[
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 3. -/
theorem ep_Q2_008_partial_03_0351_valid :
    mulPoly ep_Q2_008_coefficient_03_0351
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0352 : Poly :=
[
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 352 for generator 3. -/
def ep_Q2_008_partial_03_0352 : Poly :=
[
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 3. -/
theorem ep_Q2_008_partial_03_0352_valid :
    mulPoly ep_Q2_008_coefficient_03_0352
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0353 : Poly :=
[
  term ((20880887623896694656284187810796800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 353 for generator 3. -/
def ep_Q2_008_partial_03_0353 : Poly :=
[
  term ((20880887623896694656284187810796800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((20880887623896694656284187810796800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-20880887623896694656284187810796800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-20880887623896694656284187810796800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 3. -/
theorem ep_Q2_008_partial_03_0353_valid :
    mulPoly ep_Q2_008_coefficient_03_0353
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0354 : Poly :=
[
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 354 for generator 3. -/
def ep_Q2_008_partial_03_0354 : Poly :=
[
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 3. -/
theorem ep_Q2_008_partial_03_0354_valid :
    mulPoly ep_Q2_008_coefficient_03_0354
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0355 : Poly :=
[
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 355 for generator 3. -/
def ep_Q2_008_partial_03_0355 : Poly :=
[
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 3. -/
theorem ep_Q2_008_partial_03_0355_valid :
    mulPoly ep_Q2_008_coefficient_03_0355
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0356 : Poly :=
[
  term ((10437784102539881206543095959061427045198809 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 356 for generator 3. -/
def ep_Q2_008_partial_03_0356 : Poly :=
[
  term ((10437784102539881206543095959061427045198809 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((10437784102539881206543095959061427045198809 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10437784102539881206543095959061427045198809 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10437784102539881206543095959061427045198809 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 3. -/
theorem ep_Q2_008_partial_03_0356_valid :
    mulPoly ep_Q2_008_coefficient_03_0356
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0357 : Poly :=
[
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 357 for generator 3. -/
def ep_Q2_008_partial_03_0357 : Poly :=
[
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 3. -/
theorem ep_Q2_008_partial_03_0357_valid :
    mulPoly ep_Q2_008_coefficient_03_0357
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0358 : Poly :=
[
  term ((21163005531744674325 : Rat) / 692956453614176359) [(5, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 358 for generator 3. -/
def ep_Q2_008_partial_03_0358 : Poly :=
[
  term ((21163005531744674325 : Rat) / 692956453614176359) [(2, 2), (5, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((21163005531744674325 : Rat) / 692956453614176359) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-21163005531744674325 : Rat) / 692956453614176359) [(5, 1), (7, 1), (8, 2), (12, 1), (13, 2), (16, 1)],
  term ((-21163005531744674325 : Rat) / 692956453614176359) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 3. -/
theorem ep_Q2_008_partial_03_0358_valid :
    mulPoly ep_Q2_008_coefficient_03_0358
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0359 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 359 for generator 3. -/
def ep_Q2_008_partial_03_0359 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 3. -/
theorem ep_Q2_008_partial_03_0359_valid :
    mulPoly ep_Q2_008_coefficient_03_0359
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0360 : Poly :=
[
  term ((-231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 360 for generator 3. -/
def ep_Q2_008_partial_03_0360 : Poly :=
[
  term ((-231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (12, 1), (15, 2), (16, 1)],
  term ((231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 3. -/
theorem ep_Q2_008_partial_03_0360_valid :
    mulPoly ep_Q2_008_coefficient_03_0360
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0361 : Poly :=
[
  term ((49731331554505286757 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 361 for generator 3. -/
def ep_Q2_008_partial_03_0361 : Poly :=
[
  term ((49731331554505286757 : Rat) / 2771825814456705436) [(2, 2), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((49731331554505286757 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-49731331554505286757 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (8, 2), (12, 1), (16, 1)],
  term ((-49731331554505286757 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 3. -/
theorem ep_Q2_008_partial_03_0361_valid :
    mulPoly ep_Q2_008_coefficient_03_0361
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0362 : Poly :=
[
  term ((1585204019733818283266386924606051200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 362 for generator 3. -/
def ep_Q2_008_partial_03_0362 : Poly :=
[
  term ((1585204019733818283266386924606051200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1585204019733818283266386924606051200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1585204019733818283266386924606051200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1585204019733818283266386924606051200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 3. -/
theorem ep_Q2_008_partial_03_0362_valid :
    mulPoly ep_Q2_008_coefficient_03_0362
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0363 : Poly :=
[
  term ((-42690950048753730273 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (12, 2), (16, 1)]
]

/-- Partial product 363 for generator 3. -/
def ep_Q2_008_partial_03_0363 : Poly :=
[
  term ((-42690950048753730273 : Rat) / 2771825814456705436) [(2, 2), (5, 1), (7, 1), (12, 2), (16, 1)],
  term ((-42690950048753730273 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (7, 1), (12, 2), (16, 1)],
  term ((42690950048753730273 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (8, 2), (12, 2), (16, 1)],
  term ((42690950048753730273 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (9, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 3. -/
theorem ep_Q2_008_partial_03_0363_valid :
    mulPoly ep_Q2_008_coefficient_03_0363
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0364 : Poly :=
[
  term ((-5196726780814186564229496489690145223644353 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 364 for generator 3. -/
def ep_Q2_008_partial_03_0364 : Poly :=
[
  term ((-5196726780814186564229496489690145223644353 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5196726780814186564229496489690145223644353 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((5196726780814186564229496489690145223644353 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((5196726780814186564229496489690145223644353 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 3. -/
theorem ep_Q2_008_partial_03_0364_valid :
    mulPoly ep_Q2_008_coefficient_03_0364
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0365 : Poly :=
[
  term ((7760716437360248369692872469558387200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 365 for generator 3. -/
def ep_Q2_008_partial_03_0365 : Poly :=
[
  term ((7760716437360248369692872469558387200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((7760716437360248369692872469558387200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-7760716437360248369692872469558387200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (13, 2), (15, 2), (16, 1)],
  term ((-7760716437360248369692872469558387200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 3. -/
theorem ep_Q2_008_partial_03_0365_valid :
    mulPoly ep_Q2_008_coefficient_03_0365
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0366 : Poly :=
[
  term ((-21163005531744674325 : Rat) / 692956453614176359) [(5, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 366 for generator 3. -/
def ep_Q2_008_partial_03_0366 : Poly :=
[
  term ((-21163005531744674325 : Rat) / 692956453614176359) [(2, 2), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-21163005531744674325 : Rat) / 692956453614176359) [(3, 2), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((21163005531744674325 : Rat) / 692956453614176359) [(5, 1), (7, 1), (8, 2), (13, 2), (16, 1)],
  term ((21163005531744674325 : Rat) / 692956453614176359) [(5, 1), (7, 1), (9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 3. -/
theorem ep_Q2_008_partial_03_0366_valid :
    mulPoly ep_Q2_008_coefficient_03_0366
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0367 : Poly :=
[
  term ((6857143481998900491839120342472998400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 367 for generator 3. -/
def ep_Q2_008_partial_03_0367 : Poly :=
[
  term ((6857143481998900491839120342472998400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((6857143481998900491839120342472998400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-6857143481998900491839120342472998400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (13, 3), (15, 1), (16, 1)],
  term ((-6857143481998900491839120342472998400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 3. -/
theorem ep_Q2_008_partial_03_0367_valid :
    mulPoly ep_Q2_008_coefficient_03_0367
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0368 : Poly :=
[
  term ((231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 368 for generator 3. -/
def ep_Q2_008_partial_03_0368 : Poly :=
[
  term ((231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (15, 2), (16, 1)],
  term ((-231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 3. -/
theorem ep_Q2_008_partial_03_0368_valid :
    mulPoly ep_Q2_008_coefficient_03_0368
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0369 : Poly :=
[
  term ((-4500888735728928117 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 369 for generator 3. -/
def ep_Q2_008_partial_03_0369 : Poly :=
[
  term ((-4500888735728928117 : Rat) / 1385912907228352718) [(2, 2), (5, 1), (7, 1), (16, 1)],
  term ((-4500888735728928117 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((4500888735728928117 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (8, 2), (16, 1)],
  term ((4500888735728928117 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 3. -/
theorem ep_Q2_008_partial_03_0369_valid :
    mulPoly ep_Q2_008_coefficient_03_0369
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0370 : Poly :=
[
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 370 for generator 3. -/
def ep_Q2_008_partial_03_0370 : Poly :=
[
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (8, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 3. -/
theorem ep_Q2_008_partial_03_0370_valid :
    mulPoly ep_Q2_008_coefficient_03_0370
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0371 : Poly :=
[
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 371 for generator 3. -/
def ep_Q2_008_partial_03_0371 : Poly :=
[
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (8, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 3. -/
theorem ep_Q2_008_partial_03_0371_valid :
    mulPoly ep_Q2_008_coefficient_03_0371
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0372 : Poly :=
[
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 372 for generator 3. -/
def ep_Q2_008_partial_03_0372 : Poly :=
[
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (8, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 3. -/
theorem ep_Q2_008_partial_03_0372_valid :
    mulPoly ep_Q2_008_coefficient_03_0372
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0373 : Poly :=
[
  term ((7108387276220151372352063935590400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 373 for generator 3. -/
def ep_Q2_008_partial_03_0373 : Poly :=
[
  term ((7108387276220151372352063935590400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((7108387276220151372352063935590400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-7108387276220151372352063935590400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-7108387276220151372352063935590400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 3. -/
theorem ep_Q2_008_partial_03_0373_valid :
    mulPoly ep_Q2_008_coefficient_03_0373
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0374 : Poly :=
[
  term ((156626851461259926261257408762611200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 374 for generator 3. -/
def ep_Q2_008_partial_03_0374 : Poly :=
[
  term ((156626851461259926261257408762611200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((156626851461259926261257408762611200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-156626851461259926261257408762611200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (8, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-156626851461259926261257408762611200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 3. -/
theorem ep_Q2_008_partial_03_0374_valid :
    mulPoly ep_Q2_008_coefficient_03_0374
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0375 : Poly :=
[
  term ((-73991849375200666557664665511372800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 375 for generator 3. -/
def ep_Q2_008_partial_03_0375 : Poly :=
[
  term ((-73991849375200666557664665511372800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-73991849375200666557664665511372800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((73991849375200666557664665511372800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (8, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((73991849375200666557664665511372800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 3. -/
theorem ep_Q2_008_partial_03_0375_valid :
    mulPoly ep_Q2_008_coefficient_03_0375
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0376 : Poly :=
[
  term ((-3985004988184024254197369176012800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 376 for generator 3. -/
def ep_Q2_008_partial_03_0376 : Poly :=
[
  term ((-3985004988184024254197369176012800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-3985004988184024254197369176012800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((3985004988184024254197369176012800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((3985004988184024254197369176012800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 3. -/
theorem ep_Q2_008_partial_03_0376_valid :
    mulPoly ep_Q2_008_coefficient_03_0376
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0377 : Poly :=
[
  term ((-13772500347676543283932123875206400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 377 for generator 3. -/
def ep_Q2_008_partial_03_0377 : Poly :=
[
  term ((-13772500347676543283932123875206400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((-13772500347676543283932123875206400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((13772500347676543283932123875206400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (8, 2), (12, 2), (15, 1), (16, 1)],
  term ((13772500347676543283932123875206400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 3. -/
theorem ep_Q2_008_partial_03_0377_valid :
    mulPoly ep_Q2_008_coefficient_03_0377
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0378 : Poly :=
[
  term ((-55090001390706173135728495500825600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 378 for generator 3. -/
def ep_Q2_008_partial_03_0378 : Poly :=
[
  term ((-55090001390706173135728495500825600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-55090001390706173135728495500825600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((55090001390706173135728495500825600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((55090001390706173135728495500825600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 3. -/
theorem ep_Q2_008_partial_03_0378_valid :
    mulPoly ep_Q2_008_coefficient_03_0378
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0379 : Poly :=
[
  term ((73991849375200666557664665511372800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 379 for generator 3. -/
def ep_Q2_008_partial_03_0379 : Poly :=
[
  term ((73991849375200666557664665511372800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((73991849375200666557664665511372800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-73991849375200666557664665511372800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((-73991849375200666557664665511372800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 3. -/
theorem ep_Q2_008_partial_03_0379_valid :
    mulPoly ep_Q2_008_coefficient_03_0379
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0380 : Poly :=
[
  term ((17757505335860567538129493051219200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 380 for generator 3. -/
def ep_Q2_008_partial_03_0380 : Poly :=
[
  term ((17757505335860567538129493051219200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((17757505335860567538129493051219200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-17757505335860567538129493051219200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (8, 2), (15, 1), (16, 1)],
  term ((-17757505335860567538129493051219200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 3. -/
theorem ep_Q2_008_partial_03_0380_valid :
    mulPoly ep_Q2_008_coefficient_03_0380
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0381 : Poly :=
[
  term ((-376426615813486875 : Rat) / 692956453614176359) [(5, 1), (8, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 381 for generator 3. -/
def ep_Q2_008_partial_03_0381 : Poly :=
[
  term ((-376426615813486875 : Rat) / 692956453614176359) [(2, 2), (5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-376426615813486875 : Rat) / 692956453614176359) [(3, 2), (5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((376426615813486875 : Rat) / 692956453614176359) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((376426615813486875 : Rat) / 692956453614176359) [(5, 1), (8, 3), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 3. -/
theorem ep_Q2_008_partial_03_0381_valid :
    mulPoly ep_Q2_008_coefficient_03_0381
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0382 : Poly :=
[
  term ((161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 382 for generator 3. -/
def ep_Q2_008_partial_03_0382 : Poly :=
[
  term ((161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 3. -/
theorem ep_Q2_008_partial_03_0382_valid :
    mulPoly ep_Q2_008_coefficient_03_0382
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0383 : Poly :=
[
  term ((9869659753932509733 : Rat) / 2771825814456705436) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 383 for generator 3. -/
def ep_Q2_008_partial_03_0383 : Poly :=
[
  term ((9869659753932509733 : Rat) / 2771825814456705436) [(2, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((9869659753932509733 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-9869659753932509733 : Rat) / 2771825814456705436) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-9869659753932509733 : Rat) / 2771825814456705436) [(5, 1), (8, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 3. -/
theorem ep_Q2_008_partial_03_0383_valid :
    mulPoly ep_Q2_008_coefficient_03_0383
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0384 : Poly :=
[
  term ((-8396142738912805133533960094414614199100 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 384 for generator 3. -/
def ep_Q2_008_partial_03_0384 : Poly :=
[
  term ((-8396142738912805133533960094414614199100 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8396142738912805133533960094414614199100 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((8396142738912805133533960094414614199100 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((8396142738912805133533960094414614199100 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 3. -/
theorem ep_Q2_008_partial_03_0384_valid :
    mulPoly ep_Q2_008_coefficient_03_0384
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0385 : Poly :=
[
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 385 for generator 3. -/
def ep_Q2_008_partial_03_0385 : Poly :=
[
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 3. -/
theorem ep_Q2_008_partial_03_0385_valid :
    mulPoly ep_Q2_008_coefficient_03_0385
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0386 : Poly :=
[
  term ((-3771082783353798885 : Rat) / 5543651628913410872) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 386 for generator 3. -/
def ep_Q2_008_partial_03_0386 : Poly :=
[
  term ((-3771082783353798885 : Rat) / 5543651628913410872) [(2, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-3771082783353798885 : Rat) / 5543651628913410872) [(3, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((3771082783353798885 : Rat) / 5543651628913410872) [(5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((3771082783353798885 : Rat) / 5543651628913410872) [(5, 1), (8, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 3. -/
theorem ep_Q2_008_partial_03_0386_valid :
    mulPoly ep_Q2_008_coefficient_03_0386
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0387 : Poly :=
[
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 387 for generator 3. -/
def ep_Q2_008_partial_03_0387 : Poly :=
[
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 3. -/
theorem ep_Q2_008_partial_03_0387_valid :
    mulPoly ep_Q2_008_coefficient_03_0387
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0388 : Poly :=
[
  term ((86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (8, 1), (13, 3), (16, 1)]
]

/-- Partial product 388 for generator 3. -/
def ep_Q2_008_partial_03_0388 : Poly :=
[
  term ((86111778068036223792 : Rat) / 692956453614176359) [(2, 2), (5, 1), (8, 1), (13, 3), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(3, 2), (5, 1), (8, 1), (13, 3), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (8, 1), (9, 2), (13, 3), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (8, 3), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 3. -/
theorem ep_Q2_008_partial_03_0388_valid :
    mulPoly ep_Q2_008_coefficient_03_0388
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0389 : Poly :=
[
  term ((16955286506190009870532333049856487635000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 389 for generator 3. -/
def ep_Q2_008_partial_03_0389 : Poly :=
[
  term ((16955286506190009870532333049856487635000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((16955286506190009870532333049856487635000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-16955286506190009870532333049856487635000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-16955286506190009870532333049856487635000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 3. -/
theorem ep_Q2_008_partial_03_0389_valid :
    mulPoly ep_Q2_008_coefficient_03_0389
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0390 : Poly :=
[
  term ((-91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 390 for generator 3. -/
def ep_Q2_008_partial_03_0390 : Poly :=
[
  term ((-91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 2), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 3. -/
theorem ep_Q2_008_partial_03_0390_valid :
    mulPoly ep_Q2_008_coefficient_03_0390
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0391 : Poly :=
[
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (9, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 391 for generator 3. -/
def ep_Q2_008_partial_03_0391 : Poly :=
[
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(2, 2), (5, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(3, 2), (5, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (8, 2), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (9, 3), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 3. -/
theorem ep_Q2_008_partial_03_0391_valid :
    mulPoly ep_Q2_008_coefficient_03_0391
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0392 : Poly :=
[
  term ((-4928658474989860215 : Rat) / 5543651628913410872) [(5, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 392 for generator 3. -/
def ep_Q2_008_partial_03_0392 : Poly :=
[
  term ((-4928658474989860215 : Rat) / 5543651628913410872) [(2, 2), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-4928658474989860215 : Rat) / 5543651628913410872) [(3, 2), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((4928658474989860215 : Rat) / 5543651628913410872) [(5, 1), (8, 2), (9, 1), (12, 1), (16, 1)],
  term ((4928658474989860215 : Rat) / 5543651628913410872) [(5, 1), (9, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 3. -/
theorem ep_Q2_008_partial_03_0392_valid :
    mulPoly ep_Q2_008_coefficient_03_0392
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0393 : Poly :=
[
  term ((91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 393 for generator 3. -/
def ep_Q2_008_partial_03_0393 : Poly :=
[
  term ((91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 3. -/
theorem ep_Q2_008_partial_03_0393_valid :
    mulPoly ep_Q2_008_coefficient_03_0393
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0394 : Poly :=
[
  term ((86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (9, 1), (13, 2), (16, 1)]
]

/-- Partial product 394 for generator 3. -/
def ep_Q2_008_partial_03_0394 : Poly :=
[
  term ((86111778068036223792 : Rat) / 692956453614176359) [(2, 2), (5, 1), (9, 1), (13, 2), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(3, 2), (5, 1), (9, 1), (13, 2), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (8, 2), (9, 1), (13, 2), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (9, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 3. -/
theorem ep_Q2_008_partial_03_0394_valid :
    mulPoly ep_Q2_008_coefficient_03_0394
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0395 : Poly :=
[
  term ((-1090062011677969317 : Rat) / 95580200498507084) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 395 for generator 3. -/
def ep_Q2_008_partial_03_0395 : Poly :=
[
  term ((-1090062011677969317 : Rat) / 95580200498507084) [(2, 2), (5, 1), (9, 1), (16, 1)],
  term ((-1090062011677969317 : Rat) / 95580200498507084) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((1090062011677969317 : Rat) / 95580200498507084) [(5, 1), (8, 2), (9, 1), (16, 1)],
  term ((1090062011677969317 : Rat) / 95580200498507084) [(5, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 3. -/
theorem ep_Q2_008_partial_03_0395_valid :
    mulPoly ep_Q2_008_coefficient_03_0395
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0396 : Poly :=
[
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 396 for generator 3. -/
def ep_Q2_008_partial_03_0396 : Poly :=
[
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (8, 2), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 3. -/
theorem ep_Q2_008_partial_03_0396_valid :
    mulPoly ep_Q2_008_coefficient_03_0396
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0397 : Poly :=
[
  term ((-468060487876869750 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 397 for generator 3. -/
def ep_Q2_008_partial_03_0397 : Poly :=
[
  term ((-468060487876869750 : Rat) / 692956453614176359) [(2, 2), (5, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-468060487876869750 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((468060487876869750 : Rat) / 692956453614176359) [(5, 1), (8, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((468060487876869750 : Rat) / 692956453614176359) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 3. -/
theorem ep_Q2_008_partial_03_0397_valid :
    mulPoly ep_Q2_008_coefficient_03_0397
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0398 : Poly :=
[
  term ((-122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 398 for generator 3. -/
def ep_Q2_008_partial_03_0398 : Poly :=
[
  term ((-122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 3. -/
theorem ep_Q2_008_partial_03_0398_valid :
    mulPoly ep_Q2_008_coefficient_03_0398
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0399 : Poly :=
[
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 399 for generator 3. -/
def ep_Q2_008_partial_03_0399 : Poly :=
[
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (8, 2), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 3. -/
theorem ep_Q2_008_partial_03_0399_valid :
    mulPoly ep_Q2_008_coefficient_03_0399
        ep_Q2_008_generator_03_0300_0399 =
      ep_Q2_008_partial_03_0399 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_03_0300_0399 : List Poly :=
[
  ep_Q2_008_partial_03_0300,
  ep_Q2_008_partial_03_0301,
  ep_Q2_008_partial_03_0302,
  ep_Q2_008_partial_03_0303,
  ep_Q2_008_partial_03_0304,
  ep_Q2_008_partial_03_0305,
  ep_Q2_008_partial_03_0306,
  ep_Q2_008_partial_03_0307,
  ep_Q2_008_partial_03_0308,
  ep_Q2_008_partial_03_0309,
  ep_Q2_008_partial_03_0310,
  ep_Q2_008_partial_03_0311,
  ep_Q2_008_partial_03_0312,
  ep_Q2_008_partial_03_0313,
  ep_Q2_008_partial_03_0314,
  ep_Q2_008_partial_03_0315,
  ep_Q2_008_partial_03_0316,
  ep_Q2_008_partial_03_0317,
  ep_Q2_008_partial_03_0318,
  ep_Q2_008_partial_03_0319,
  ep_Q2_008_partial_03_0320,
  ep_Q2_008_partial_03_0321,
  ep_Q2_008_partial_03_0322,
  ep_Q2_008_partial_03_0323,
  ep_Q2_008_partial_03_0324,
  ep_Q2_008_partial_03_0325,
  ep_Q2_008_partial_03_0326,
  ep_Q2_008_partial_03_0327,
  ep_Q2_008_partial_03_0328,
  ep_Q2_008_partial_03_0329,
  ep_Q2_008_partial_03_0330,
  ep_Q2_008_partial_03_0331,
  ep_Q2_008_partial_03_0332,
  ep_Q2_008_partial_03_0333,
  ep_Q2_008_partial_03_0334,
  ep_Q2_008_partial_03_0335,
  ep_Q2_008_partial_03_0336,
  ep_Q2_008_partial_03_0337,
  ep_Q2_008_partial_03_0338,
  ep_Q2_008_partial_03_0339,
  ep_Q2_008_partial_03_0340,
  ep_Q2_008_partial_03_0341,
  ep_Q2_008_partial_03_0342,
  ep_Q2_008_partial_03_0343,
  ep_Q2_008_partial_03_0344,
  ep_Q2_008_partial_03_0345,
  ep_Q2_008_partial_03_0346,
  ep_Q2_008_partial_03_0347,
  ep_Q2_008_partial_03_0348,
  ep_Q2_008_partial_03_0349,
  ep_Q2_008_partial_03_0350,
  ep_Q2_008_partial_03_0351,
  ep_Q2_008_partial_03_0352,
  ep_Q2_008_partial_03_0353,
  ep_Q2_008_partial_03_0354,
  ep_Q2_008_partial_03_0355,
  ep_Q2_008_partial_03_0356,
  ep_Q2_008_partial_03_0357,
  ep_Q2_008_partial_03_0358,
  ep_Q2_008_partial_03_0359,
  ep_Q2_008_partial_03_0360,
  ep_Q2_008_partial_03_0361,
  ep_Q2_008_partial_03_0362,
  ep_Q2_008_partial_03_0363,
  ep_Q2_008_partial_03_0364,
  ep_Q2_008_partial_03_0365,
  ep_Q2_008_partial_03_0366,
  ep_Q2_008_partial_03_0367,
  ep_Q2_008_partial_03_0368,
  ep_Q2_008_partial_03_0369,
  ep_Q2_008_partial_03_0370,
  ep_Q2_008_partial_03_0371,
  ep_Q2_008_partial_03_0372,
  ep_Q2_008_partial_03_0373,
  ep_Q2_008_partial_03_0374,
  ep_Q2_008_partial_03_0375,
  ep_Q2_008_partial_03_0376,
  ep_Q2_008_partial_03_0377,
  ep_Q2_008_partial_03_0378,
  ep_Q2_008_partial_03_0379,
  ep_Q2_008_partial_03_0380,
  ep_Q2_008_partial_03_0381,
  ep_Q2_008_partial_03_0382,
  ep_Q2_008_partial_03_0383,
  ep_Q2_008_partial_03_0384,
  ep_Q2_008_partial_03_0385,
  ep_Q2_008_partial_03_0386,
  ep_Q2_008_partial_03_0387,
  ep_Q2_008_partial_03_0388,
  ep_Q2_008_partial_03_0389,
  ep_Q2_008_partial_03_0390,
  ep_Q2_008_partial_03_0391,
  ep_Q2_008_partial_03_0392,
  ep_Q2_008_partial_03_0393,
  ep_Q2_008_partial_03_0394,
  ep_Q2_008_partial_03_0395,
  ep_Q2_008_partial_03_0396,
  ep_Q2_008_partial_03_0397,
  ep_Q2_008_partial_03_0398,
  ep_Q2_008_partial_03_0399
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_03_0300_0399 : Poly :=
[
  term ((21648492159165587981097665592421028550750 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((68642200442727884261659190718402009414000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((5965406637117337125 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((458492599127423703443947836634629734807700 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (11, 1), (13, 3), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-31021779259134859150361348569296755231175 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((420420022166409750 : Rat) / 692956453614176359) [(2, 2), (4, 1), (11, 2), (12, 1), (16, 1)],
  term ((122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((9439112615664407733 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (11, 2), (16, 1)],
  term ((22948808695647475864287961026389330983800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4366060179532158615 : Rat) / 11087303257826821744) [(2, 2), (4, 1), (12, 1), (16, 1)],
  term ((-2826440567345852487690585850484076514432761 : Rat) / 674830407405318061502963313035932218791992) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-64868635690772299486488597327903986396400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-19896128880655371405 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (13, 2), (16, 1)],
  term ((4820771137589793068322443462231768812800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (13, 3), (15, 1), (16, 1)],
  term ((16796426590554923151 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (16, 1)],
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-43926043926967546635 : Rat) / 11087303257826821744) [(2, 2), (4, 2), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-305620264313397076332886748867116800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(2, 2), (5, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((26542157644955337657 : Rat) / 2771825814456705436) [(2, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((53819861292522639870 : Rat) / 692956453614176359) [(2, 2), (5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7263471595026879643283351454565284017400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-185795103514687363599 : Rat) / 2771825814456705436) [(2, 2), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(2, 2), (5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(2, 2), (5, 1), (6, 1), (13, 3), (16, 1)],
  term ((7259938827335024308718947931697609490200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1811097258574155252729824956377398400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(2, 2), (5, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-44314686623014006702851226450536982012503 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3751276367914217345153043073766995200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(2, 2), (5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-208757092189522899 : Rat) / 23895050124626771) [(2, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((20880887623896694656284187810796800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((10437784102539881206543095959061427045198809 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((21163005531744674325 : Rat) / 692956453614176359) [(2, 2), (5, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((49731331554505286757 : Rat) / 2771825814456705436) [(2, 2), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((1585204019733818283266386924606051200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-42690950048753730273 : Rat) / 2771825814456705436) [(2, 2), (5, 1), (7, 1), (12, 2), (16, 1)],
  term ((-5196726780814186564229496489690145223644353 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((7760716437360248369692872469558387200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-21163005531744674325 : Rat) / 692956453614176359) [(2, 2), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((6857143481998900491839120342472998400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-4500888735728928117 : Rat) / 1385912907228352718) [(2, 2), (5, 1), (7, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((7108387276220151372352063935590400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((156626851461259926261257408762611200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-73991849375200666557664665511372800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3985004988184024254197369176012800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-13772500347676543283932123875206400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((-55090001390706173135728495500825600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((73991849375200666557664665511372800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((17757505335860567538129493051219200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-376426615813486875 : Rat) / 692956453614176359) [(2, 2), (5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((9869659753932509733 : Rat) / 2771825814456705436) [(2, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-8396142738912805133533960094414614199100 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3771082783353798885 : Rat) / 5543651628913410872) [(2, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(2, 2), (5, 1), (8, 1), (13, 3), (16, 1)],
  term ((16955286506190009870532333049856487635000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(2, 2), (5, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((-4928658474989860215 : Rat) / 5543651628913410872) [(2, 2), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(2, 2), (5, 1), (9, 1), (13, 2), (16, 1)],
  term ((-1090062011677969317 : Rat) / 95580200498507084) [(2, 2), (5, 1), (9, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-468060487876869750 : Rat) / 692956453614176359) [(2, 2), (5, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 1), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((21648492159165587981097665592421028550750 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((68642200442727884261659190718402009414000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((5965406637117337125 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((458492599127423703443947836634629734807700 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (11, 1), (13, 3), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-31021779259134859150361348569296755231175 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((420420022166409750 : Rat) / 692956453614176359) [(3, 2), (4, 1), (11, 2), (12, 1), (16, 1)],
  term ((122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((9439112615664407733 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (11, 2), (16, 1)],
  term ((22948808695647475864287961026389330983800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4366060179532158615 : Rat) / 11087303257826821744) [(3, 2), (4, 1), (12, 1), (16, 1)],
  term ((-2826440567345852487690585850484076514432761 : Rat) / 674830407405318061502963313035932218791992) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-64868635690772299486488597327903986396400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-19896128880655371405 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (13, 2), (16, 1)],
  term ((4820771137589793068322443462231768812800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (13, 3), (15, 1), (16, 1)],
  term ((16796426590554923151 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (16, 1)],
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-43926043926967546635 : Rat) / 11087303257826821744) [(3, 2), (4, 2), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-305620264313397076332886748867116800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((26542157644955337657 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((53819861292522639870 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7263471595026879643283351454565284017400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-185795103514687363599 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (13, 3), (16, 1)],
  term ((7259938827335024308718947931697609490200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1811097258574155252729824956377398400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-44314686623014006702851226450536982012503 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3751276367914217345153043073766995200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(3, 2), (5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-208757092189522899 : Rat) / 23895050124626771) [(3, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((20880887623896694656284187810796800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((10437784102539881206543095959061427045198809 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((21163005531744674325 : Rat) / 692956453614176359) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((49731331554505286757 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((1585204019733818283266386924606051200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-42690950048753730273 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (7, 1), (12, 2), (16, 1)],
  term ((-5196726780814186564229496489690145223644353 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((7760716437360248369692872469558387200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-21163005531744674325 : Rat) / 692956453614176359) [(3, 2), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((6857143481998900491839120342472998400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-4500888735728928117 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((7108387276220151372352063935590400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((156626851461259926261257408762611200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-73991849375200666557664665511372800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3985004988184024254197369176012800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-13772500347676543283932123875206400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((-55090001390706173135728495500825600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((73991849375200666557664665511372800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((17757505335860567538129493051219200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-376426615813486875 : Rat) / 692956453614176359) [(3, 2), (5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((9869659753932509733 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-8396142738912805133533960094414614199100 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3771082783353798885 : Rat) / 5543651628913410872) [(3, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(3, 2), (5, 1), (8, 1), (13, 3), (16, 1)],
  term ((16955286506190009870532333049856487635000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(3, 2), (5, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((-4928658474989860215 : Rat) / 5543651628913410872) [(3, 2), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(3, 2), (5, 1), (9, 1), (13, 2), (16, 1)],
  term ((-1090062011677969317 : Rat) / 95580200498507084) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-468060487876869750 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-21648492159165587981097665592421028550750 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-68642200442727884261659190718402009414000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5965406637117337125 : Rat) / 2771825814456705436) [(4, 1), (8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-458492599127423703443947836634629734807700 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (8, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(4, 1), (8, 2), (11, 1), (13, 3), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (8, 2), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((31021779259134859150361348569296755231175 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (8, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-420420022166409750 : Rat) / 692956453614176359) [(4, 1), (8, 2), (11, 2), (12, 1), (16, 1)],
  term ((-122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (8, 2), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-9439112615664407733 : Rat) / 2771825814456705436) [(4, 1), (8, 2), (11, 2), (16, 1)],
  term ((-22948808695647475864287961026389330983800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4366060179532158615 : Rat) / 11087303257826821744) [(4, 1), (8, 2), (12, 1), (16, 1)],
  term ((2826440567345852487690585850484076514432761 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((64868635690772299486488597327903986396400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (13, 2), (15, 2), (16, 1)],
  term ((19896128880655371405 : Rat) / 2771825814456705436) [(4, 1), (8, 2), (13, 2), (16, 1)],
  term ((-4820771137589793068322443462231768812800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (13, 3), (15, 1), (16, 1)],
  term ((-16796426590554923151 : Rat) / 2771825814456705436) [(4, 1), (8, 2), (16, 1)],
  term ((-21648492159165587981097665592421028550750 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-68642200442727884261659190718402009414000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5965406637117337125 : Rat) / 2771825814456705436) [(4, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-458492599127423703443947836634629734807700 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (9, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(4, 1), (9, 2), (11, 1), (13, 3), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (9, 2), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((31021779259134859150361348569296755231175 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (9, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-420420022166409750 : Rat) / 692956453614176359) [(4, 1), (9, 2), (11, 2), (12, 1), (16, 1)],
  term ((-122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (9, 2), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-9439112615664407733 : Rat) / 2771825814456705436) [(4, 1), (9, 2), (11, 2), (16, 1)],
  term ((-22948808695647475864287961026389330983800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4366060179532158615 : Rat) / 11087303257826821744) [(4, 1), (9, 2), (12, 1), (16, 1)],
  term ((2826440567345852487690585850484076514432761 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((64868635690772299486488597327903986396400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((19896128880655371405 : Rat) / 2771825814456705436) [(4, 1), (9, 2), (13, 2), (16, 1)],
  term ((-4820771137589793068322443462231768812800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((-16796426590554923151 : Rat) / 2771825814456705436) [(4, 1), (9, 2), (16, 1)],
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((43926043926967546635 : Rat) / 11087303257826821744) [(4, 2), (8, 2), (16, 1)],
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((43926043926967546635 : Rat) / 11087303257826821744) [(4, 2), (9, 2), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (8, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((305620264313397076332886748867116800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (8, 2), (13, 2), (15, 2), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (8, 2), (13, 3), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((305620264313397076332886748867116800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (6, 1), (8, 2), (11, 1), (13, 2), (16, 1)],
  term ((-26542157644955337657 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (8, 2), (11, 1), (16, 1)],
  term ((-53819861292522639870 : Rat) / 692956453614176359) [(5, 1), (6, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((7263471595026879643283351454565284017400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((185795103514687363599 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (8, 2), (13, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(5, 1), (6, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (6, 1), (8, 2), (13, 3), (16, 1)],
  term ((-7259938827335024308718947931697609490200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (8, 3), (15, 1), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (6, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-26542157644955337657 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-53819861292522639870 : Rat) / 692956453614176359) [(5, 1), (6, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((7263471595026879643283351454565284017400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((185795103514687363599 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(5, 1), (6, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (6, 1), (9, 2), (13, 3), (16, 1)],
  term ((-7259938827335024308718947931697609490200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 1), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((1811097258574155252729824956377398400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (8, 2), (10, 1), (12, 1), (16, 1)],
  term ((44314686623014006702851226450536982012503 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3751276367914217345153043073766995200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (7, 1), (8, 2), (10, 1), (13, 2), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((208757092189522899 : Rat) / 23895050124626771) [(5, 1), (7, 1), (8, 2), (10, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-20880887623896694656284187810796800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-10437784102539881206543095959061427045198809 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-21163005531744674325 : Rat) / 692956453614176359) [(5, 1), (7, 1), (8, 2), (12, 1), (13, 2), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (12, 1), (15, 2), (16, 1)],
  term ((-49731331554505286757 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (8, 2), (12, 1), (16, 1)],
  term ((-1585204019733818283266386924606051200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((42690950048753730273 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (8, 2), (12, 2), (16, 1)],
  term ((5196726780814186564229496489690145223644353 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7760716437360248369692872469558387200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (13, 2), (15, 2), (16, 1)],
  term ((21163005531744674325 : Rat) / 692956453614176359) [(5, 1), (7, 1), (8, 2), (13, 2), (16, 1)],
  term ((-6857143481998900491839120342472998400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (13, 3), (15, 1), (16, 1)],
  term ((-231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 2), (15, 2), (16, 1)],
  term ((4500888735728928117 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (8, 2), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 3), (13, 1), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (8, 3), (13, 3), (15, 1), (16, 1)],
  term ((1811097258574155252729824956377398400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((44314686623014006702851226450536982012503 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3751276367914217345153043073766995200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 2), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((208757092189522899 : Rat) / 23895050124626771) [(5, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-20880887623896694656284187810796800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-10437784102539881206543095959061427045198809 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-21163005531744674325 : Rat) / 692956453614176359) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 2), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-49731331554505286757 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (9, 2), (12, 1), (16, 1)],
  term ((-1585204019733818283266386924606051200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((42690950048753730273 : Rat) / 2771825814456705436) [(5, 1), (7, 1), (9, 2), (12, 2), (16, 1)],
  term ((5196726780814186564229496489690145223644353 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7760716437360248369692872469558387200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((21163005531744674325 : Rat) / 692956453614176359) [(5, 1), (7, 1), (9, 2), (13, 2), (16, 1)],
  term ((-6857143481998900491839120342472998400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((-231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((4500888735728928117 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (9, 2), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 3), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (8, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (8, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (8, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7108387276220151372352063935590400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-156626851461259926261257408762611200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (8, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((73991849375200666557664665511372800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (8, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((3985004988184024254197369176012800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((13772500347676543283932123875206400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (8, 2), (12, 2), (15, 1), (16, 1)],
  term ((55090001390706173135728495500825600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-73991849375200666557664665511372800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((-17757505335860567538129493051219200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (8, 2), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7108387276220151372352063935590400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-156626851461259926261257408762611200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((73991849375200666557664665511372800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((3985004988184024254197369176012800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((13772500347676543283932123875206400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((55090001390706173135728495500825600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-73991849375200666557664665511372800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-17757505335860567538129493051219200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((376426615813486875 : Rat) / 692956453614176359) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9869659753932509733 : Rat) / 2771825814456705436) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((8396142738912805133533960094414614199100 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((3771082783353798885 : Rat) / 5543651628913410872) [(5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (8, 1), (9, 2), (13, 3), (16, 1)],
  term ((-16955286506190009870532333049856487635000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 2), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (8, 2), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((4928658474989860215 : Rat) / 5543651628913410872) [(5, 1), (8, 2), (9, 1), (12, 1), (16, 1)],
  term ((-91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (8, 2), (9, 1), (13, 2), (16, 1)],
  term ((1090062011677969317 : Rat) / 95580200498507084) [(5, 1), (8, 2), (9, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (8, 2), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((468060487876869750 : Rat) / 692956453614176359) [(5, 1), (8, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (8, 2), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((376426615813486875 : Rat) / 692956453614176359) [(5, 1), (8, 3), (11, 1), (12, 1), (16, 1)],
  term ((-161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9869659753932509733 : Rat) / 2771825814456705436) [(5, 1), (8, 3), (11, 1), (16, 1)],
  term ((8396142738912805133533960094414614199100 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 3), (12, 1), (15, 1), (16, 1)],
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 3), (13, 1), (15, 2), (16, 1)],
  term ((3771082783353798885 : Rat) / 5543651628913410872) [(5, 1), (8, 3), (13, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 3), (13, 2), (15, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (8, 3), (13, 3), (16, 1)],
  term ((-16955286506190009870532333049856487635000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (8, 3), (15, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((468060487876869750 : Rat) / 692956453614176359) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((122693232504687549548847122017260765024300 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (9, 3), (12, 1), (13, 2), (16, 1)],
  term ((4928658474989860215 : Rat) / 5543651628913410872) [(5, 1), (9, 3), (12, 1), (16, 1)],
  term ((-91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (9, 3), (13, 2), (16, 1)],
  term ((1090062011677969317 : Rat) / 95580200498507084) [(5, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 300 through 399. -/
theorem ep_Q2_008_block_03_0300_0399_valid :
    checkProductSumEq ep_Q2_008_partials_03_0300_0399
      ep_Q2_008_block_03_0300_0399 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
