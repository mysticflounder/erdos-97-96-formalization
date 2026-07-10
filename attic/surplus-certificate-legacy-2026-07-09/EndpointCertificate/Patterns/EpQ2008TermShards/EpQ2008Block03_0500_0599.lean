/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 3:500-599

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 3 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_03_0500_0599 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 500 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0500 : Poly :=
[
  term ((4764553713739224000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 500 for generator 3. -/
def ep_Q2_008_partial_03_0500 : Poly :=
[
  term ((4764553713739224000 : Rat) / 692956453614176359) [(2, 2), (6, 1), (11, 1), (13, 3), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(3, 2), (6, 1), (11, 1), (13, 3), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(6, 1), (8, 2), (11, 1), (13, 3), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(6, 1), (9, 2), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 3. -/
theorem ep_Q2_008_partial_03_0500_valid :
    mulPoly ep_Q2_008_coefficient_03_0500
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0501 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 501 for generator 3. -/
def ep_Q2_008_partial_03_0501 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (8, 2), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (9, 2), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 3. -/
theorem ep_Q2_008_partial_03_0501_valid :
    mulPoly ep_Q2_008_coefficient_03_0501
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0502 : Poly :=
[
  term ((-1088968709398203386248109642870116751020221 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 502 for generator 3. -/
def ep_Q2_008_partial_03_0502 : Poly :=
[
  term ((-1088968709398203386248109642870116751020221 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1088968709398203386248109642870116751020221 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((1088968709398203386248109642870116751020221 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((1088968709398203386248109642870116751020221 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 3. -/
theorem ep_Q2_008_partial_03_0502_valid :
    mulPoly ep_Q2_008_coefficient_03_0502
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0503 : Poly :=
[
  term ((4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 503 for generator 3. -/
def ep_Q2_008_partial_03_0503 : Poly :=
[
  term ((4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (8, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 3. -/
theorem ep_Q2_008_partial_03_0503_valid :
    mulPoly ep_Q2_008_coefficient_03_0503
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0504 : Poly :=
[
  term ((14293661141217672000 : Rat) / 692956453614176359) [(6, 1), (11, 2), (13, 2), (16, 1)]
]

/-- Partial product 504 for generator 3. -/
def ep_Q2_008_partial_03_0504 : Poly :=
[
  term ((14293661141217672000 : Rat) / 692956453614176359) [(2, 2), (6, 1), (11, 2), (13, 2), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(3, 2), (6, 1), (11, 2), (13, 2), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(6, 1), (8, 2), (11, 2), (13, 2), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(6, 1), (9, 2), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 3. -/
theorem ep_Q2_008_partial_03_0504_valid :
    mulPoly ep_Q2_008_coefficient_03_0504
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0505 : Poly :=
[
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 505 for generator 3. -/
def ep_Q2_008_partial_03_0505 : Poly :=
[
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (11, 2), (13, 3), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (11, 2), (13, 3), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (8, 2), (11, 2), (13, 3), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (9, 2), (11, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 3. -/
theorem ep_Q2_008_partial_03_0505_valid :
    mulPoly ep_Q2_008_coefficient_03_0505
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0506 : Poly :=
[
  term ((3638115049031983125 : Rat) / 1385912907228352718) [(6, 1), (11, 2), (16, 1)]
]

/-- Partial product 506 for generator 3. -/
def ep_Q2_008_partial_03_0506 : Poly :=
[
  term ((3638115049031983125 : Rat) / 1385912907228352718) [(2, 2), (6, 1), (11, 2), (16, 1)],
  term ((3638115049031983125 : Rat) / 1385912907228352718) [(3, 2), (6, 1), (11, 2), (16, 1)],
  term ((-3638115049031983125 : Rat) / 1385912907228352718) [(6, 1), (8, 2), (11, 2), (16, 1)],
  term ((-3638115049031983125 : Rat) / 1385912907228352718) [(6, 1), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 3. -/
theorem ep_Q2_008_partial_03_0506_valid :
    mulPoly ep_Q2_008_coefficient_03_0506
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0507 : Poly :=
[
  term ((-19706991015227723649546306900483062707200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 507 for generator 3. -/
def ep_Q2_008_partial_03_0507 : Poly :=
[
  term ((-19706991015227723649546306900483062707200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19706991015227723649546306900483062707200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((19706991015227723649546306900483062707200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((19706991015227723649546306900483062707200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 3. -/
theorem ep_Q2_008_partial_03_0507_valid :
    mulPoly ep_Q2_008_coefficient_03_0507
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0508 : Poly :=
[
  term ((41889972037375162185 : Rat) / 5543651628913410872) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 508 for generator 3. -/
def ep_Q2_008_partial_03_0508 : Poly :=
[
  term ((41889972037375162185 : Rat) / 5543651628913410872) [(2, 2), (6, 1), (12, 1), (16, 1)],
  term ((41889972037375162185 : Rat) / 5543651628913410872) [(3, 2), (6, 1), (12, 1), (16, 1)],
  term ((-41889972037375162185 : Rat) / 5543651628913410872) [(6, 1), (8, 2), (12, 1), (16, 1)],
  term ((-41889972037375162185 : Rat) / 5543651628913410872) [(6, 1), (9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 3. -/
theorem ep_Q2_008_partial_03_0508_valid :
    mulPoly ep_Q2_008_coefficient_03_0508
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0509 : Poly :=
[
  term ((-596486690485271348333721591205328428996731 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 509 for generator 3. -/
def ep_Q2_008_partial_03_0509 : Poly :=
[
  term ((-596486690485271348333721591205328428996731 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-596486690485271348333721591205328428996731 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((596486690485271348333721591205328428996731 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((596486690485271348333721591205328428996731 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 3. -/
theorem ep_Q2_008_partial_03_0509_valid :
    mulPoly ep_Q2_008_coefficient_03_0509
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0510 : Poly :=
[
  term ((6000707788236662107557563328123082425600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 510 for generator 3. -/
def ep_Q2_008_partial_03_0510 : Poly :=
[
  term ((6000707788236662107557563328123082425600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((6000707788236662107557563328123082425600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-6000707788236662107557563328123082425600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (8, 2), (13, 2), (15, 2), (16, 1)],
  term ((-6000707788236662107557563328123082425600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 3. -/
theorem ep_Q2_008_partial_03_0510_valid :
    mulPoly ep_Q2_008_coefficient_03_0510
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0511 : Poly :=
[
  term ((-4821165600984702195 : Rat) / 692956453614176359) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 511 for generator 3. -/
def ep_Q2_008_partial_03_0511 : Poly :=
[
  term ((-4821165600984702195 : Rat) / 692956453614176359) [(2, 2), (6, 1), (13, 2), (16, 1)],
  term ((-4821165600984702195 : Rat) / 692956453614176359) [(3, 2), (6, 1), (13, 2), (16, 1)],
  term ((4821165600984702195 : Rat) / 692956453614176359) [(6, 1), (8, 2), (13, 2), (16, 1)],
  term ((4821165600984702195 : Rat) / 692956453614176359) [(6, 1), (9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 3. -/
theorem ep_Q2_008_partial_03_0511_valid :
    mulPoly ep_Q2_008_coefficient_03_0511
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0512 : Poly :=
[
  term ((4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 512 for generator 3. -/
def ep_Q2_008_partial_03_0512 : Poly :=
[
  term ((4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((-4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (8, 2), (13, 3), (15, 1), (16, 1)],
  term ((-4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 3. -/
theorem ep_Q2_008_partial_03_0512_valid :
    mulPoly ep_Q2_008_coefficient_03_0512
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0513 : Poly :=
[
  term ((-3605795437533926822915581815010008351300 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 513 for generator 3. -/
def ep_Q2_008_partial_03_0513 : Poly :=
[
  term ((-3605795437533926822915581815010008351300 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((-3605795437533926822915581815010008351300 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((3605795437533926822915581815010008351300 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (8, 2), (15, 2), (16, 1)],
  term ((3605795437533926822915581815010008351300 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 3. -/
theorem ep_Q2_008_partial_03_0513_valid :
    mulPoly ep_Q2_008_coefficient_03_0513
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0514 : Poly :=
[
  term ((-6779251535932084221 : Rat) / 2771825814456705436) [(6, 1), (16, 1)]
]

/-- Partial product 514 for generator 3. -/
def ep_Q2_008_partial_03_0514 : Poly :=
[
  term ((-6779251535932084221 : Rat) / 2771825814456705436) [(2, 2), (6, 1), (16, 1)],
  term ((-6779251535932084221 : Rat) / 2771825814456705436) [(3, 2), (6, 1), (16, 1)],
  term ((6779251535932084221 : Rat) / 2771825814456705436) [(6, 1), (8, 2), (16, 1)],
  term ((6779251535932084221 : Rat) / 2771825814456705436) [(6, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 3. -/
theorem ep_Q2_008_partial_03_0514_valid :
    mulPoly ep_Q2_008_coefficient_03_0514
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0515 : Poly :=
[
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 515 for generator 3. -/
def ep_Q2_008_partial_03_0515 : Poly :=
[
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 3. -/
theorem ep_Q2_008_partial_03_0515_valid :
    mulPoly ep_Q2_008_coefficient_03_0515
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0516 : Poly :=
[
  term ((7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 516 for generator 3. -/
def ep_Q2_008_partial_03_0516 : Poly :=
[
  term ((7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 3. -/
theorem ep_Q2_008_partial_03_0516_valid :
    mulPoly ep_Q2_008_coefficient_03_0516
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0517 : Poly :=
[
  term ((41685407496652500 : Rat) / 692956453614176359) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 517 for generator 3. -/
def ep_Q2_008_partial_03_0517 : Poly :=
[
  term ((41685407496652500 : Rat) / 692956453614176359) [(2, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((41685407496652500 : Rat) / 692956453614176359) [(3, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-41685407496652500 : Rat) / 692956453614176359) [(7, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-41685407496652500 : Rat) / 692956453614176359) [(7, 1), (8, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 3. -/
theorem ep_Q2_008_partial_03_0517_valid :
    mulPoly ep_Q2_008_coefficient_03_0517
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0518 : Poly :=
[
  term ((-32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 518 for generator 3. -/
def ep_Q2_008_partial_03_0518 : Poly :=
[
  term ((-32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 3. -/
theorem ep_Q2_008_partial_03_0518_valid :
    mulPoly ep_Q2_008_coefficient_03_0518
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0519 : Poly :=
[
  term ((-2503117653602907375 : Rat) / 2771825814456705436) [(7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 519 for generator 3. -/
def ep_Q2_008_partial_03_0519 : Poly :=
[
  term ((-2503117653602907375 : Rat) / 2771825814456705436) [(2, 2), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-2503117653602907375 : Rat) / 2771825814456705436) [(3, 2), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((2503117653602907375 : Rat) / 2771825814456705436) [(7, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((2503117653602907375 : Rat) / 2771825814456705436) [(7, 1), (8, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 3. -/
theorem ep_Q2_008_partial_03_0519_valid :
    mulPoly ep_Q2_008_coefficient_03_0519
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0520 : Poly :=
[
  term ((-100679917130573283002078523224804649600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 520 for generator 3. -/
def ep_Q2_008_partial_03_0520 : Poly :=
[
  term ((-100679917130573283002078523224804649600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-100679917130573283002078523224804649600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((100679917130573283002078523224804649600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((100679917130573283002078523224804649600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 3. -/
theorem ep_Q2_008_partial_03_0520_valid :
    mulPoly ep_Q2_008_coefficient_03_0520
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0521 : Poly :=
[
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (8, 1), (13, 3), (16, 1)]
]

/-- Partial product 521 for generator 3. -/
def ep_Q2_008_partial_03_0521 : Poly :=
[
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(2, 2), (7, 1), (8, 1), (13, 3), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(3, 2), (7, 1), (8, 1), (13, 3), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (8, 1), (9, 2), (13, 3), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (8, 3), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 3. -/
theorem ep_Q2_008_partial_03_0521_valid :
    mulPoly ep_Q2_008_coefficient_03_0521
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0522 : Poly :=
[
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 522 for generator 3. -/
def ep_Q2_008_partial_03_0522 : Poly :=
[
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (8, 1), (13, 4), (15, 1), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (8, 1), (13, 4), (15, 1), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 1), (9, 2), (13, 4), (15, 1), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 3), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 3. -/
theorem ep_Q2_008_partial_03_0522_valid :
    mulPoly ep_Q2_008_coefficient_03_0522
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0523 : Poly :=
[
  term ((7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 523 for generator 3. -/
def ep_Q2_008_partial_03_0523 : Poly :=
[
  term ((7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 3. -/
theorem ep_Q2_008_partial_03_0523_valid :
    mulPoly ep_Q2_008_coefficient_03_0523
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0524 : Poly :=
[
  term ((-23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 524 for generator 3. -/
def ep_Q2_008_partial_03_0524 : Poly :=
[
  term ((-23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 2), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 3. -/
theorem ep_Q2_008_partial_03_0524_valid :
    mulPoly ep_Q2_008_coefficient_03_0524
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0525 : Poly :=
[
  term ((1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 525 for generator 3. -/
def ep_Q2_008_partial_03_0525 : Poly :=
[
  term ((1459755941057526492 : Rat) / 692956453614176359) [(2, 2), (7, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(3, 2), (7, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (8, 2), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (9, 3), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 3. -/
theorem ep_Q2_008_partial_03_0525_valid :
    mulPoly ep_Q2_008_coefficient_03_0525
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0526 : Poly :=
[
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 526 for generator 3. -/
def ep_Q2_008_partial_03_0526 : Poly :=
[
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 3), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 3. -/
theorem ep_Q2_008_partial_03_0526_valid :
    mulPoly ep_Q2_008_coefficient_03_0526
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0527 : Poly :=
[
  term ((46883191288141800 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 527 for generator 3. -/
def ep_Q2_008_partial_03_0527 : Poly :=
[
  term ((46883191288141800 : Rat) / 692956453614176359) [(2, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(3, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(7, 1), (8, 2), (9, 1), (12, 1), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(7, 1), (9, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 3. -/
theorem ep_Q2_008_partial_03_0527_valid :
    mulPoly ep_Q2_008_coefficient_03_0527
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0528 : Poly :=
[
  term ((23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 528 for generator 3. -/
def ep_Q2_008_partial_03_0528 : Poly :=
[
  term ((23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 3. -/
theorem ep_Q2_008_partial_03_0528_valid :
    mulPoly ep_Q2_008_coefficient_03_0528
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0529 : Poly :=
[
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (9, 1), (13, 2), (16, 1)]
]

/-- Partial product 529 for generator 3. -/
def ep_Q2_008_partial_03_0529 : Poly :=
[
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(2, 2), (7, 1), (9, 1), (13, 2), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(3, 2), (7, 1), (9, 1), (13, 2), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (8, 2), (9, 1), (13, 2), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (9, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 3. -/
theorem ep_Q2_008_partial_03_0529_valid :
    mulPoly ep_Q2_008_coefficient_03_0529
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0530 : Poly :=
[
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 530 for generator 3. -/
def ep_Q2_008_partial_03_0530 : Poly :=
[
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 3), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 3. -/
theorem ep_Q2_008_partial_03_0530_valid :
    mulPoly ep_Q2_008_coefficient_03_0530
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0531 : Poly :=
[
  term ((-46883191288141800 : Rat) / 692956453614176359) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 531 for generator 3. -/
def ep_Q2_008_partial_03_0531 : Poly :=
[
  term ((-46883191288141800 : Rat) / 692956453614176359) [(2, 2), (7, 1), (9, 1), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(3, 2), (7, 1), (9, 1), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(7, 1), (8, 2), (9, 1), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(7, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 3. -/
theorem ep_Q2_008_partial_03_0531_valid :
    mulPoly ep_Q2_008_coefficient_03_0531
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0532 : Poly :=
[
  term ((-4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 532 for generator 3. -/
def ep_Q2_008_partial_03_0532 : Poly :=
[
  term ((-4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 3. -/
theorem ep_Q2_008_partial_03_0532_valid :
    mulPoly ep_Q2_008_coefficient_03_0532
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0533 : Poly :=
[
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 533 for generator 3. -/
def ep_Q2_008_partial_03_0533 : Poly :=
[
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(2, 2), (7, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(3, 2), (7, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (8, 2), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (9, 2), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 3. -/
theorem ep_Q2_008_partial_03_0533_valid :
    mulPoly ep_Q2_008_coefficient_03_0533
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0534 : Poly :=
[
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 534 for generator 3. -/
def ep_Q2_008_partial_03_0534 : Poly :=
[
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 3. -/
theorem ep_Q2_008_partial_03_0534_valid :
    mulPoly ep_Q2_008_coefficient_03_0534
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0535 : Poly :=
[
  term ((-3638115049031983125 : Rat) / 1385912907228352718) [(7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 535 for generator 3. -/
def ep_Q2_008_partial_03_0535 : Poly :=
[
  term ((-3638115049031983125 : Rat) / 1385912907228352718) [(2, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-3638115049031983125 : Rat) / 1385912907228352718) [(3, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((3638115049031983125 : Rat) / 1385912907228352718) [(7, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((3638115049031983125 : Rat) / 1385912907228352718) [(7, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 3. -/
theorem ep_Q2_008_partial_03_0535_valid :
    mulPoly ep_Q2_008_coefficient_03_0535
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0536 : Poly :=
[
  term ((-9626245519377805623 : Rat) / 2771825814456705436) [(7, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 536 for generator 3. -/
def ep_Q2_008_partial_03_0536 : Poly :=
[
  term ((-9626245519377805623 : Rat) / 2771825814456705436) [(2, 2), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-9626245519377805623 : Rat) / 2771825814456705436) [(3, 2), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((9626245519377805623 : Rat) / 2771825814456705436) [(7, 1), (8, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((9626245519377805623 : Rat) / 2771825814456705436) [(7, 1), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 3. -/
theorem ep_Q2_008_partial_03_0536_valid :
    mulPoly ep_Q2_008_coefficient_03_0536
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0537 : Poly :=
[
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 537 for generator 3. -/
def ep_Q2_008_partial_03_0537 : Poly :=
[
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 3. -/
theorem ep_Q2_008_partial_03_0537_valid :
    mulPoly ep_Q2_008_coefficient_03_0537
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0538 : Poly :=
[
  term ((-5402428811566164000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 538 for generator 3. -/
def ep_Q2_008_partial_03_0538 : Poly :=
[
  term ((-5402428811566164000 : Rat) / 692956453614176359) [(2, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5402428811566164000 : Rat) / 692956453614176359) [(3, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((5402428811566164000 : Rat) / 692956453614176359) [(7, 1), (8, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((5402428811566164000 : Rat) / 692956453614176359) [(7, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 3. -/
theorem ep_Q2_008_partial_03_0538_valid :
    mulPoly ep_Q2_008_coefficient_03_0538
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0539 : Poly :=
[
  term ((-532965479303834382580460385427004227200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 539 for generator 3. -/
def ep_Q2_008_partial_03_0539 : Poly :=
[
  term ((-532965479303834382580460385427004227200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-532965479303834382580460385427004227200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((532965479303834382580460385427004227200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((532965479303834382580460385427004227200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 3. -/
theorem ep_Q2_008_partial_03_0539_valid :
    mulPoly ep_Q2_008_coefficient_03_0539
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0540 : Poly :=
[
  term ((20755230665582595654 : Rat) / 692956453614176359) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 540 for generator 3. -/
def ep_Q2_008_partial_03_0540 : Poly :=
[
  term ((20755230665582595654 : Rat) / 692956453614176359) [(2, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((20755230665582595654 : Rat) / 692956453614176359) [(3, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-20755230665582595654 : Rat) / 692956453614176359) [(7, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((-20755230665582595654 : Rat) / 692956453614176359) [(7, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 3. -/
theorem ep_Q2_008_partial_03_0540_valid :
    mulPoly ep_Q2_008_coefficient_03_0540
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0541 : Poly :=
[
  term ((23338800344261701938229781055441761692503 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 541 for generator 3. -/
def ep_Q2_008_partial_03_0541 : Poly :=
[
  term ((23338800344261701938229781055441761692503 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((23338800344261701938229781055441761692503 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-23338800344261701938229781055441761692503 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (8, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-23338800344261701938229781055441761692503 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 3. -/
theorem ep_Q2_008_partial_03_0541_valid :
    mulPoly ep_Q2_008_coefficient_03_0541
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0542 : Poly :=
[
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 542 for generator 3. -/
def ep_Q2_008_partial_03_0542 : Poly :=
[
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (10, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 3. -/
theorem ep_Q2_008_partial_03_0542_valid :
    mulPoly ep_Q2_008_coefficient_03_0542
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0543 : Poly :=
[
  term ((1094816955793144869 : Rat) / 692956453614176359) [(7, 1), (10, 1), (13, 3), (16, 1)]
]

/-- Partial product 543 for generator 3. -/
def ep_Q2_008_partial_03_0543 : Poly :=
[
  term ((1094816955793144869 : Rat) / 692956453614176359) [(2, 2), (7, 1), (10, 1), (13, 3), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(3, 2), (7, 1), (10, 1), (13, 3), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(7, 1), (8, 2), (10, 1), (13, 3), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(7, 1), (9, 2), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 3. -/
theorem ep_Q2_008_partial_03_0543_valid :
    mulPoly ep_Q2_008_coefficient_03_0543
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0544 : Poly :=
[
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 544 for generator 3. -/
def ep_Q2_008_partial_03_0544 : Poly :=
[
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (10, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 3. -/
theorem ep_Q2_008_partial_03_0544_valid :
    mulPoly ep_Q2_008_coefficient_03_0544
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0545 : Poly :=
[
  term ((128471103739445421700596560401165010361249 : Rat) / 11635007024229621750051091604067796875724) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 545 for generator 3. -/
def ep_Q2_008_partial_03_0545 : Poly :=
[
  term ((128471103739445421700596560401165010361249 : Rat) / 11635007024229621750051091604067796875724) [(2, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((128471103739445421700596560401165010361249 : Rat) / 11635007024229621750051091604067796875724) [(3, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-128471103739445421700596560401165010361249 : Rat) / 11635007024229621750051091604067796875724) [(7, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-128471103739445421700596560401165010361249 : Rat) / 11635007024229621750051091604067796875724) [(7, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 3. -/
theorem ep_Q2_008_partial_03_0545_valid :
    mulPoly ep_Q2_008_coefficient_03_0545
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0546 : Poly :=
[
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(7, 1), (10, 2), (13, 1), (16, 1)]
]

/-- Partial product 546 for generator 3. -/
def ep_Q2_008_partial_03_0546 : Poly :=
[
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(2, 2), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(3, 2), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(7, 1), (8, 2), (10, 2), (13, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(7, 1), (9, 2), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 3. -/
theorem ep_Q2_008_partial_03_0546_valid :
    mulPoly ep_Q2_008_coefficient_03_0546
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0547 : Poly :=
[
  term ((-2389695598448356091306544968061476129788503 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 547 for generator 3. -/
def ep_Q2_008_partial_03_0547 : Poly :=
[
  term ((-2389695598448356091306544968061476129788503 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2389695598448356091306544968061476129788503 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2389695598448356091306544968061476129788503 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (8, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2389695598448356091306544968061476129788503 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 3. -/
theorem ep_Q2_008_partial_03_0547_valid :
    mulPoly ep_Q2_008_coefficient_03_0547
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0548 : Poly :=
[
  term ((-792552098474969535197294721248288966400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 548 for generator 3. -/
def ep_Q2_008_partial_03_0548 : Poly :=
[
  term ((-792552098474969535197294721248288966400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-792552098474969535197294721248288966400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((792552098474969535197294721248288966400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((792552098474969535197294721248288966400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 3. -/
theorem ep_Q2_008_partial_03_0548_valid :
    mulPoly ep_Q2_008_coefficient_03_0548
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0549 : Poly :=
[
  term ((-5859370669532368869 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 549 for generator 3. -/
def ep_Q2_008_partial_03_0549 : Poly :=
[
  term ((-5859370669532368869 : Rat) / 692956453614176359) [(2, 2), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-5859370669532368869 : Rat) / 692956453614176359) [(3, 2), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((5859370669532368869 : Rat) / 692956453614176359) [(7, 1), (8, 2), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((5859370669532368869 : Rat) / 692956453614176359) [(7, 1), (9, 2), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 3. -/
theorem ep_Q2_008_partial_03_0549_valid :
    mulPoly ep_Q2_008_coefficient_03_0549
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0550 : Poly :=
[
  term ((-416553094171406719187832266337079411200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 550 for generator 3. -/
def ep_Q2_008_partial_03_0550 : Poly :=
[
  term ((-416553094171406719187832266337079411200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-416553094171406719187832266337079411200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((416553094171406719187832266337079411200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((416553094171406719187832266337079411200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 3. -/
theorem ep_Q2_008_partial_03_0550_valid :
    mulPoly ep_Q2_008_coefficient_03_0550
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0551 : Poly :=
[
  term ((-1231691952427017417874009601032497148800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 551 for generator 3. -/
def ep_Q2_008_partial_03_0551 : Poly :=
[
  term ((-1231691952427017417874009601032497148800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1231691952427017417874009601032497148800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((1231691952427017417874009601032497148800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((1231691952427017417874009601032497148800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 3. -/
theorem ep_Q2_008_partial_03_0551_valid :
    mulPoly ep_Q2_008_coefficient_03_0551
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0552 : Poly :=
[
  term ((-10196158884397439805 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 552 for generator 3. -/
def ep_Q2_008_partial_03_0552 : Poly :=
[
  term ((-10196158884397439805 : Rat) / 692956453614176359) [(2, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-10196158884397439805 : Rat) / 692956453614176359) [(3, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((10196158884397439805 : Rat) / 692956453614176359) [(7, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((10196158884397439805 : Rat) / 692956453614176359) [(7, 1), (9, 2), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 3. -/
theorem ep_Q2_008_partial_03_0552_valid :
    mulPoly ep_Q2_008_coefficient_03_0552
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0553 : Poly :=
[
  term ((199059708479375199780650266935387465600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 553 for generator 3. -/
def ep_Q2_008_partial_03_0553 : Poly :=
[
  term ((199059708479375199780650266935387465600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((199059708479375199780650266935387465600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-199059708479375199780650266935387465600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-199059708479375199780650266935387465600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 3. -/
theorem ep_Q2_008_partial_03_0553_valid :
    mulPoly ep_Q2_008_coefficient_03_0553
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0554 : Poly :=
[
  term ((9894046412742829623 : Rat) / 2771825814456705436) [(7, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 554 for generator 3. -/
def ep_Q2_008_partial_03_0554 : Poly :=
[
  term ((9894046412742829623 : Rat) / 2771825814456705436) [(2, 2), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((9894046412742829623 : Rat) / 2771825814456705436) [(3, 2), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-9894046412742829623 : Rat) / 2771825814456705436) [(7, 1), (8, 2), (11, 1), (12, 2), (16, 1)],
  term ((-9894046412742829623 : Rat) / 2771825814456705436) [(7, 1), (9, 2), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 3. -/
theorem ep_Q2_008_partial_03_0554_valid :
    mulPoly ep_Q2_008_coefficient_03_0554
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0555 : Poly :=
[
  term ((1167704522925499778129999203861693067040000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 555 for generator 3. -/
def ep_Q2_008_partial_03_0555 : Poly :=
[
  term ((1167704522925499778129999203861693067040000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1167704522925499778129999203861693067040000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1167704522925499778129999203861693067040000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1167704522925499778129999203861693067040000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 3. -/
theorem ep_Q2_008_partial_03_0555_valid :
    mulPoly ep_Q2_008_coefficient_03_0555
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0556 : Poly :=
[
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 556 for generator 3. -/
def ep_Q2_008_partial_03_0556 : Poly :=
[
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 3. -/
theorem ep_Q2_008_partial_03_0556_valid :
    mulPoly ep_Q2_008_coefficient_03_0556
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0557 : Poly :=
[
  term ((4764553713739224000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 557 for generator 3. -/
def ep_Q2_008_partial_03_0557 : Poly :=
[
  term ((4764553713739224000 : Rat) / 692956453614176359) [(2, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(3, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(7, 1), (8, 2), (11, 1), (13, 2), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(7, 1), (9, 2), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 3. -/
theorem ep_Q2_008_partial_03_0557_valid :
    mulPoly ep_Q2_008_coefficient_03_0557
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0558 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 558 for generator 3. -/
def ep_Q2_008_partial_03_0558 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 3. -/
theorem ep_Q2_008_partial_03_0558_valid :
    mulPoly ep_Q2_008_coefficient_03_0558
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0559 : Poly :=
[
  term ((1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 559 for generator 3. -/
def ep_Q2_008_partial_03_0559 : Poly :=
[
  term ((1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((-1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 3. -/
theorem ep_Q2_008_partial_03_0559_valid :
    mulPoly ep_Q2_008_coefficient_03_0559
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0560 : Poly :=
[
  term ((12065970142779276123 : Rat) / 2771825814456705436) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 560 for generator 3. -/
def ep_Q2_008_partial_03_0560 : Poly :=
[
  term ((12065970142779276123 : Rat) / 2771825814456705436) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((12065970142779276123 : Rat) / 2771825814456705436) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term ((-12065970142779276123 : Rat) / 2771825814456705436) [(7, 1), (8, 2), (11, 1), (16, 1)],
  term ((-12065970142779276123 : Rat) / 2771825814456705436) [(7, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 3. -/
theorem ep_Q2_008_partial_03_0560_valid :
    mulPoly ep_Q2_008_coefficient_03_0560
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0561 : Poly :=
[
  term ((-6000707788236662107557563328123082425600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 561 for generator 3. -/
def ep_Q2_008_partial_03_0561 : Poly :=
[
  term ((-6000707788236662107557563328123082425600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6000707788236662107557563328123082425600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((6000707788236662107557563328123082425600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((6000707788236662107557563328123082425600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 3. -/
theorem ep_Q2_008_partial_03_0561_valid :
    mulPoly ep_Q2_008_coefficient_03_0561
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0562 : Poly :=
[
  term ((4456226615720320572 : Rat) / 692956453614176359) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 562 for generator 3. -/
def ep_Q2_008_partial_03_0562 : Poly :=
[
  term ((4456226615720320572 : Rat) / 692956453614176359) [(2, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((4456226615720320572 : Rat) / 692956453614176359) [(3, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4456226615720320572 : Rat) / 692956453614176359) [(7, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((-4456226615720320572 : Rat) / 692956453614176359) [(7, 1), (9, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 3. -/
theorem ep_Q2_008_partial_03_0562_valid :
    mulPoly ep_Q2_008_coefficient_03_0562
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0563 : Poly :=
[
  term ((-4415295986492901976386780982650591091200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 563 for generator 3. -/
def ep_Q2_008_partial_03_0563 : Poly :=
[
  term ((-4415295986492901976386780982650591091200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4415295986492901976386780982650591091200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((4415295986492901976386780982650591091200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((4415295986492901976386780982650591091200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 3. -/
theorem ep_Q2_008_partial_03_0563_valid :
    mulPoly ep_Q2_008_coefficient_03_0563
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0564 : Poly :=
[
  term ((687522785368103968371187815814027509473931 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 564 for generator 3. -/
def ep_Q2_008_partial_03_0564 : Poly :=
[
  term ((687522785368103968371187815814027509473931 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((687522785368103968371187815814027509473931 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-687522785368103968371187815814027509473931 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-687522785368103968371187815814027509473931 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 3. -/
theorem ep_Q2_008_partial_03_0564_valid :
    mulPoly ep_Q2_008_coefficient_03_0564
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0565 : Poly :=
[
  term ((729877970528763246 : Rat) / 692956453614176359) [(7, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 565 for generator 3. -/
def ep_Q2_008_partial_03_0565 : Poly :=
[
  term ((729877970528763246 : Rat) / 692956453614176359) [(2, 2), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(3, 2), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(7, 1), (8, 2), (12, 2), (13, 1), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(7, 1), (9, 2), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 3. -/
theorem ep_Q2_008_partial_03_0565_valid :
    mulPoly ep_Q2_008_coefficient_03_0565
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0566 : Poly :=
[
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 566 for generator 3. -/
def ep_Q2_008_partial_03_0566 : Poly :=
[
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (12, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 3. -/
theorem ep_Q2_008_partial_03_0566_valid :
    mulPoly ep_Q2_008_coefficient_03_0566
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0567 : Poly :=
[
  term ((7194964204658538452783945413965062289600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 567 for generator 3. -/
def ep_Q2_008_partial_03_0567 : Poly :=
[
  term ((7194964204658538452783945413965062289600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((7194964204658538452783945413965062289600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-7194964204658538452783945413965062289600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 2), (12, 2), (15, 1), (16, 1)],
  term ((-7194964204658538452783945413965062289600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 3. -/
theorem ep_Q2_008_partial_03_0567_valid :
    mulPoly ep_Q2_008_coefficient_03_0567
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0568 : Poly :=
[
  term ((6034008865854931767179371276621237051200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 568 for generator 3. -/
def ep_Q2_008_partial_03_0568 : Poly :=
[
  term ((6034008865854931767179371276621237051200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((6034008865854931767179371276621237051200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6034008865854931767179371276621237051200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-6034008865854931767179371276621237051200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 3. -/
theorem ep_Q2_008_partial_03_0568_valid :
    mulPoly ep_Q2_008_coefficient_03_0568
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0569 : Poly :=
[
  term ((-35546378581218994155 : Rat) / 5543651628913410872) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 569 for generator 3. -/
def ep_Q2_008_partial_03_0569 : Poly :=
[
  term ((-35546378581218994155 : Rat) / 5543651628913410872) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((-35546378581218994155 : Rat) / 5543651628913410872) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((35546378581218994155 : Rat) / 5543651628913410872) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((35546378581218994155 : Rat) / 5543651628913410872) [(7, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 3. -/
theorem ep_Q2_008_partial_03_0569_valid :
    mulPoly ep_Q2_008_coefficient_03_0569
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0570 : Poly :=
[
  term ((-130283572646791922258961743728671780003909 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 570 for generator 3. -/
def ep_Q2_008_partial_03_0570 : Poly :=
[
  term ((-130283572646791922258961743728671780003909 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-130283572646791922258961743728671780003909 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((130283572646791922258961743728671780003909 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((130283572646791922258961743728671780003909 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 3. -/
theorem ep_Q2_008_partial_03_0570_valid :
    mulPoly ep_Q2_008_coefficient_03_0570
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0570 := by
  native_decide

/-- Coefficient term 571 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0571 : Poly :=
[
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 571 for generator 3. -/
def ep_Q2_008_partial_03_0571 : Poly :=
[
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (13, 3), (15, 2), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 571 for generator 3. -/
theorem ep_Q2_008_partial_03_0571_valid :
    mulPoly ep_Q2_008_coefficient_03_0571
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0571 := by
  native_decide

/-- Coefficient term 572 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0572 : Poly :=
[
  term ((1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (13, 3), (16, 1)]
]

/-- Partial product 572 for generator 3. -/
def ep_Q2_008_partial_03_0572 : Poly :=
[
  term ((1459755941057526492 : Rat) / 692956453614176359) [(2, 2), (7, 1), (13, 3), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(3, 2), (7, 1), (13, 3), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (8, 2), (13, 3), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (9, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 572 for generator 3. -/
theorem ep_Q2_008_partial_03_0572_valid :
    mulPoly ep_Q2_008_coefficient_03_0572
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0572 := by
  native_decide

/-- Coefficient term 573 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0573 : Poly :=
[
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 573 for generator 3. -/
def ep_Q2_008_partial_03_0573 : Poly :=
[
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (13, 4), (15, 1), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 573 for generator 3. -/
theorem ep_Q2_008_partial_03_0573_valid :
    mulPoly ep_Q2_008_coefficient_03_0573
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0573 := by
  native_decide

/-- Coefficient term 574 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0574 : Poly :=
[
  term ((-479503877324492546463249105913943015819388 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 574 for generator 3. -/
def ep_Q2_008_partial_03_0574 : Poly :=
[
  term ((-479503877324492546463249105913943015819388 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-479503877324492546463249105913943015819388 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((479503877324492546463249105913943015819388 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((479503877324492546463249105913943015819388 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 574 for generator 3. -/
theorem ep_Q2_008_partial_03_0574_valid :
    mulPoly ep_Q2_008_coefficient_03_0574
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0574 := by
  native_decide

/-- Coefficient term 575 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0575 : Poly :=
[
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 575 for generator 3. -/
def ep_Q2_008_partial_03_0575 : Poly :=
[
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 1), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 3), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 575 for generator 3. -/
theorem ep_Q2_008_partial_03_0575_valid :
    mulPoly ep_Q2_008_coefficient_03_0575
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0575 := by
  native_decide

/-- Coefficient term 576 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0576 : Poly :=
[
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 576 for generator 3. -/
def ep_Q2_008_partial_03_0576 : Poly :=
[
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 3), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 576 for generator 3. -/
theorem ep_Q2_008_partial_03_0576_valid :
    mulPoly ep_Q2_008_coefficient_03_0576
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0576 := by
  native_decide

/-- Coefficient term 577 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0577 : Poly :=
[
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 577 for generator 3. -/
def ep_Q2_008_partial_03_0577 : Poly :=
[
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 577 for generator 3. -/
theorem ep_Q2_008_partial_03_0577_valid :
    mulPoly ep_Q2_008_coefficient_03_0577
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0577 := by
  native_decide

/-- Coefficient term 578 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0578 : Poly :=
[
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 578 for generator 3. -/
def ep_Q2_008_partial_03_0578 : Poly :=
[
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 578 for generator 3. -/
theorem ep_Q2_008_partial_03_0578_valid :
    mulPoly ep_Q2_008_coefficient_03_0578
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0578 := by
  native_decide

/-- Coefficient term 579 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0579 : Poly :=
[
  term ((133807312762030463048877203514835200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 579 for generator 3. -/
def ep_Q2_008_partial_03_0579 : Poly :=
[
  term ((133807312762030463048877203514835200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((133807312762030463048877203514835200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-133807312762030463048877203514835200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-133807312762030463048877203514835200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 579 for generator 3. -/
theorem ep_Q2_008_partial_03_0579_valid :
    mulPoly ep_Q2_008_coefficient_03_0579
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0579 := by
  native_decide

/-- Coefficient term 580 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0580 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 580 for generator 3. -/
def ep_Q2_008_partial_03_0580 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 580 for generator 3. -/
theorem ep_Q2_008_partial_03_0580_valid :
    mulPoly ep_Q2_008_coefficient_03_0580
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0580 := by
  native_decide

/-- Coefficient term 581 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0581 : Poly :=
[
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(7, 2), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 581 for generator 3. -/
def ep_Q2_008_partial_03_0581 : Poly :=
[
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(2, 2), (7, 2), (10, 1), (13, 2), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(3, 2), (7, 2), (10, 1), (13, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(7, 2), (8, 2), (10, 1), (13, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(7, 2), (9, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 581 for generator 3. -/
theorem ep_Q2_008_partial_03_0581_valid :
    mulPoly ep_Q2_008_coefficient_03_0581
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0581 := by
  native_decide

/-- Coefficient term 582 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0582 : Poly :=
[
  term ((-21511191554764261033084905479994662400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 582 for generator 3. -/
def ep_Q2_008_partial_03_0582 : Poly :=
[
  term ((-21511191554764261033084905479994662400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-21511191554764261033084905479994662400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((21511191554764261033084905479994662400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((21511191554764261033084905479994662400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 582 for generator 3. -/
theorem ep_Q2_008_partial_03_0582_valid :
    mulPoly ep_Q2_008_coefficient_03_0582
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0582 := by
  native_decide

/-- Coefficient term 583 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0583 : Poly :=
[
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 583 for generator 3. -/
def ep_Q2_008_partial_03_0583 : Poly :=
[
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (10, 1), (15, 2), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (10, 1), (15, 2), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 583 for generator 3. -/
theorem ep_Q2_008_partial_03_0583_valid :
    mulPoly ep_Q2_008_coefficient_03_0583
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0583 := by
  native_decide

/-- Coefficient term 584 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0584 : Poly :=
[
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(7, 2), (10, 1), (16, 1)]
]

/-- Partial product 584 for generator 3. -/
def ep_Q2_008_partial_03_0584 : Poly :=
[
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(2, 2), (7, 2), (10, 1), (16, 1)],
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(3, 2), (7, 2), (10, 1), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(7, 2), (8, 2), (10, 1), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(7, 2), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 584 for generator 3. -/
theorem ep_Q2_008_partial_03_0584_valid :
    mulPoly ep_Q2_008_coefficient_03_0584
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0584 := by
  native_decide

/-- Coefficient term 585 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0585 : Poly :=
[
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 585 for generator 3. -/
def ep_Q2_008_partial_03_0585 : Poly :=
[
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 585 for generator 3. -/
theorem ep_Q2_008_partial_03_0585_valid :
    mulPoly ep_Q2_008_coefficient_03_0585
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0585 := by
  native_decide

/-- Coefficient term 586 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0586 : Poly :=
[
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 586 for generator 3. -/
def ep_Q2_008_partial_03_0586 : Poly :=
[
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 586 for generator 3. -/
theorem ep_Q2_008_partial_03_0586_valid :
    mulPoly ep_Q2_008_coefficient_03_0586
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0586 := by
  native_decide

/-- Coefficient term 587 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0587 : Poly :=
[
  term ((-144873779317055016889925303050924800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 587 for generator 3. -/
def ep_Q2_008_partial_03_0587 : Poly :=
[
  term ((-144873779317055016889925303050924800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-144873779317055016889925303050924800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((144873779317055016889925303050924800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((144873779317055016889925303050924800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 587 for generator 3. -/
theorem ep_Q2_008_partial_03_0587_valid :
    mulPoly ep_Q2_008_coefficient_03_0587
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0587 := by
  native_decide

/-- Coefficient term 588 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0588 : Poly :=
[
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 588 for generator 3. -/
def ep_Q2_008_partial_03_0588 : Poly :=
[
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 588 for generator 3. -/
theorem ep_Q2_008_partial_03_0588_valid :
    mulPoly ep_Q2_008_coefficient_03_0588
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0588 := by
  native_decide

/-- Coefficient term 589 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0589 : Poly :=
[
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 589 for generator 3. -/
def ep_Q2_008_partial_03_0589 : Poly :=
[
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 589 for generator 3. -/
theorem ep_Q2_008_partial_03_0589_valid :
    mulPoly ep_Q2_008_coefficient_03_0589
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0589 := by
  native_decide

/-- Coefficient term 590 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0590 : Poly :=
[
  term ((-89067231619686505967046984634008558930606 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 590 for generator 3. -/
def ep_Q2_008_partial_03_0590 : Poly :=
[
  term ((-89067231619686505967046984634008558930606 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-89067231619686505967046984634008558930606 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((89067231619686505967046984634008558930606 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((89067231619686505967046984634008558930606 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 590 for generator 3. -/
theorem ep_Q2_008_partial_03_0590_valid :
    mulPoly ep_Q2_008_coefficient_03_0590
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0590 := by
  native_decide

/-- Coefficient term 591 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0591 : Poly :=
[
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 591 for generator 3. -/
def ep_Q2_008_partial_03_0591 : Poly :=
[
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 591 for generator 3. -/
theorem ep_Q2_008_partial_03_0591_valid :
    mulPoly ep_Q2_008_coefficient_03_0591
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0591 := by
  native_decide

/-- Coefficient term 592 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0592 : Poly :=
[
  term ((-364938985264381623 : Rat) / 692956453614176359) [(7, 2), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 592 for generator 3. -/
def ep_Q2_008_partial_03_0592 : Poly :=
[
  term ((-364938985264381623 : Rat) / 692956453614176359) [(2, 2), (7, 2), (12, 1), (13, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(3, 2), (7, 2), (12, 1), (13, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(7, 2), (8, 2), (12, 1), (13, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(7, 2), (9, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 592 for generator 3. -/
theorem ep_Q2_008_partial_03_0592_valid :
    mulPoly ep_Q2_008_coefficient_03_0592
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0592 := by
  native_decide

/-- Coefficient term 593 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0593 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 593 for generator 3. -/
def ep_Q2_008_partial_03_0593 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 593 for generator 3. -/
theorem ep_Q2_008_partial_03_0593_valid :
    mulPoly ep_Q2_008_coefficient_03_0593
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0593 := by
  native_decide

/-- Coefficient term 594 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0594 : Poly :=
[
  term ((-150961233445964508895351802248291200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 594 for generator 3. -/
def ep_Q2_008_partial_03_0594 : Poly :=
[
  term ((-150961233445964508895351802248291200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-150961233445964508895351802248291200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((150961233445964508895351802248291200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (12, 1), (15, 2), (16, 1)],
  term ((150961233445964508895351802248291200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 594 for generator 3. -/
theorem ep_Q2_008_partial_03_0594_valid :
    mulPoly ep_Q2_008_coefficient_03_0594
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0594 := by
  native_decide

/-- Coefficient term 595 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0595 : Poly :=
[
  term ((-1906495707164126100 : Rat) / 692956453614176359) [(7, 2), (12, 1), (16, 1)]
]

/-- Partial product 595 for generator 3. -/
def ep_Q2_008_partial_03_0595 : Poly :=
[
  term ((-1906495707164126100 : Rat) / 692956453614176359) [(2, 2), (7, 2), (12, 1), (16, 1)],
  term ((-1906495707164126100 : Rat) / 692956453614176359) [(3, 2), (7, 2), (12, 1), (16, 1)],
  term ((1906495707164126100 : Rat) / 692956453614176359) [(7, 2), (8, 2), (12, 1), (16, 1)],
  term ((1906495707164126100 : Rat) / 692956453614176359) [(7, 2), (9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 595 for generator 3. -/
theorem ep_Q2_008_partial_03_0595_valid :
    mulPoly ep_Q2_008_coefficient_03_0595
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0595 := by
  native_decide

/-- Coefficient term 596 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0596 : Poly :=
[
  term ((4092882842813478937808462146308038400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 596 for generator 3. -/
def ep_Q2_008_partial_03_0596 : Poly :=
[
  term ((4092882842813478937808462146308038400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((4092882842813478937808462146308038400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4092882842813478937808462146308038400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4092882842813478937808462146308038400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 596 for generator 3. -/
theorem ep_Q2_008_partial_03_0596_valid :
    mulPoly ep_Q2_008_coefficient_03_0596
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0596 := by
  native_decide

/-- Coefficient term 597 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0597 : Poly :=
[
  term ((364938985264381623 : Rat) / 1385912907228352718) [(7, 2), (12, 2), (16, 1)]
]

/-- Partial product 597 for generator 3. -/
def ep_Q2_008_partial_03_0597 : Poly :=
[
  term ((364938985264381623 : Rat) / 1385912907228352718) [(2, 2), (7, 2), (12, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(3, 2), (7, 2), (12, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(7, 2), (8, 2), (12, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(7, 2), (9, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 597 for generator 3. -/
theorem ep_Q2_008_partial_03_0597_valid :
    mulPoly ep_Q2_008_coefficient_03_0597
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0597 := by
  native_decide

/-- Coefficient term 598 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0598 : Poly :=
[
  term ((88947346446902029295354963215714846962606 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 598 for generator 3. -/
def ep_Q2_008_partial_03_0598 : Poly :=
[
  term ((88947346446902029295354963215714846962606 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((88947346446902029295354963215714846962606 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-88947346446902029295354963215714846962606 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-88947346446902029295354963215714846962606 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 598 for generator 3. -/
theorem ep_Q2_008_partial_03_0598_valid :
    mulPoly ep_Q2_008_coefficient_03_0598
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0598 := by
  native_decide

/-- Coefficient term 599 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0599 : Poly :=
[
  term ((14137720669701733182472212493472870400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 599 for generator 3. -/
def ep_Q2_008_partial_03_0599 : Poly :=
[
  term ((14137720669701733182472212493472870400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((14137720669701733182472212493472870400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-14137720669701733182472212493472870400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (13, 2), (15, 2), (16, 1)],
  term ((-14137720669701733182472212493472870400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 599 for generator 3. -/
theorem ep_Q2_008_partial_03_0599_valid :
    mulPoly ep_Q2_008_coefficient_03_0599
        ep_Q2_008_generator_03_0500_0599 =
      ep_Q2_008_partial_03_0599 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_03_0500_0599 : List Poly :=
[
  ep_Q2_008_partial_03_0500,
  ep_Q2_008_partial_03_0501,
  ep_Q2_008_partial_03_0502,
  ep_Q2_008_partial_03_0503,
  ep_Q2_008_partial_03_0504,
  ep_Q2_008_partial_03_0505,
  ep_Q2_008_partial_03_0506,
  ep_Q2_008_partial_03_0507,
  ep_Q2_008_partial_03_0508,
  ep_Q2_008_partial_03_0509,
  ep_Q2_008_partial_03_0510,
  ep_Q2_008_partial_03_0511,
  ep_Q2_008_partial_03_0512,
  ep_Q2_008_partial_03_0513,
  ep_Q2_008_partial_03_0514,
  ep_Q2_008_partial_03_0515,
  ep_Q2_008_partial_03_0516,
  ep_Q2_008_partial_03_0517,
  ep_Q2_008_partial_03_0518,
  ep_Q2_008_partial_03_0519,
  ep_Q2_008_partial_03_0520,
  ep_Q2_008_partial_03_0521,
  ep_Q2_008_partial_03_0522,
  ep_Q2_008_partial_03_0523,
  ep_Q2_008_partial_03_0524,
  ep_Q2_008_partial_03_0525,
  ep_Q2_008_partial_03_0526,
  ep_Q2_008_partial_03_0527,
  ep_Q2_008_partial_03_0528,
  ep_Q2_008_partial_03_0529,
  ep_Q2_008_partial_03_0530,
  ep_Q2_008_partial_03_0531,
  ep_Q2_008_partial_03_0532,
  ep_Q2_008_partial_03_0533,
  ep_Q2_008_partial_03_0534,
  ep_Q2_008_partial_03_0535,
  ep_Q2_008_partial_03_0536,
  ep_Q2_008_partial_03_0537,
  ep_Q2_008_partial_03_0538,
  ep_Q2_008_partial_03_0539,
  ep_Q2_008_partial_03_0540,
  ep_Q2_008_partial_03_0541,
  ep_Q2_008_partial_03_0542,
  ep_Q2_008_partial_03_0543,
  ep_Q2_008_partial_03_0544,
  ep_Q2_008_partial_03_0545,
  ep_Q2_008_partial_03_0546,
  ep_Q2_008_partial_03_0547,
  ep_Q2_008_partial_03_0548,
  ep_Q2_008_partial_03_0549,
  ep_Q2_008_partial_03_0550,
  ep_Q2_008_partial_03_0551,
  ep_Q2_008_partial_03_0552,
  ep_Q2_008_partial_03_0553,
  ep_Q2_008_partial_03_0554,
  ep_Q2_008_partial_03_0555,
  ep_Q2_008_partial_03_0556,
  ep_Q2_008_partial_03_0557,
  ep_Q2_008_partial_03_0558,
  ep_Q2_008_partial_03_0559,
  ep_Q2_008_partial_03_0560,
  ep_Q2_008_partial_03_0561,
  ep_Q2_008_partial_03_0562,
  ep_Q2_008_partial_03_0563,
  ep_Q2_008_partial_03_0564,
  ep_Q2_008_partial_03_0565,
  ep_Q2_008_partial_03_0566,
  ep_Q2_008_partial_03_0567,
  ep_Q2_008_partial_03_0568,
  ep_Q2_008_partial_03_0569,
  ep_Q2_008_partial_03_0570,
  ep_Q2_008_partial_03_0571,
  ep_Q2_008_partial_03_0572,
  ep_Q2_008_partial_03_0573,
  ep_Q2_008_partial_03_0574,
  ep_Q2_008_partial_03_0575,
  ep_Q2_008_partial_03_0576,
  ep_Q2_008_partial_03_0577,
  ep_Q2_008_partial_03_0578,
  ep_Q2_008_partial_03_0579,
  ep_Q2_008_partial_03_0580,
  ep_Q2_008_partial_03_0581,
  ep_Q2_008_partial_03_0582,
  ep_Q2_008_partial_03_0583,
  ep_Q2_008_partial_03_0584,
  ep_Q2_008_partial_03_0585,
  ep_Q2_008_partial_03_0586,
  ep_Q2_008_partial_03_0587,
  ep_Q2_008_partial_03_0588,
  ep_Q2_008_partial_03_0589,
  ep_Q2_008_partial_03_0590,
  ep_Q2_008_partial_03_0591,
  ep_Q2_008_partial_03_0592,
  ep_Q2_008_partial_03_0593,
  ep_Q2_008_partial_03_0594,
  ep_Q2_008_partial_03_0595,
  ep_Q2_008_partial_03_0596,
  ep_Q2_008_partial_03_0597,
  ep_Q2_008_partial_03_0598,
  ep_Q2_008_partial_03_0599
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_03_0500_0599 : Poly :=
[
  term ((4764553713739224000 : Rat) / 692956453614176359) [(2, 2), (6, 1), (11, 1), (13, 3), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-1088968709398203386248109642870116751020221 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(2, 2), (6, 1), (11, 2), (13, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (11, 2), (13, 3), (15, 1), (16, 1)],
  term ((3638115049031983125 : Rat) / 1385912907228352718) [(2, 2), (6, 1), (11, 2), (16, 1)],
  term ((-19706991015227723649546306900483062707200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((41889972037375162185 : Rat) / 5543651628913410872) [(2, 2), (6, 1), (12, 1), (16, 1)],
  term ((-596486690485271348333721591205328428996731 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((6000707788236662107557563328123082425600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-4821165600984702195 : Rat) / 692956453614176359) [(2, 2), (6, 1), (13, 2), (16, 1)],
  term ((4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3605795437533926822915581815010008351300 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((-6779251535932084221 : Rat) / 2771825814456705436) [(2, 2), (6, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((41685407496652500 : Rat) / 692956453614176359) [(2, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 2771825814456705436) [(2, 2), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-100679917130573283002078523224804649600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(2, 2), (7, 1), (8, 1), (13, 3), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (8, 1), (13, 4), (15, 1), (16, 1)],
  term ((7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(2, 2), (7, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(2, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(2, 2), (7, 1), (9, 1), (13, 2), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(2, 2), (7, 1), (9, 1), (16, 1)],
  term ((-4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(2, 2), (7, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3638115049031983125 : Rat) / 1385912907228352718) [(2, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-9626245519377805623 : Rat) / 2771825814456705436) [(2, 2), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5402428811566164000 : Rat) / 692956453614176359) [(2, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-532965479303834382580460385427004227200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((20755230665582595654 : Rat) / 692956453614176359) [(2, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((23338800344261701938229781055441761692503 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(2, 2), (7, 1), (10, 1), (13, 3), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((128471103739445421700596560401165010361249 : Rat) / 11635007024229621750051091604067796875724) [(2, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(2, 2), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-2389695598448356091306544968061476129788503 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-792552098474969535197294721248288966400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-5859370669532368869 : Rat) / 692956453614176359) [(2, 2), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-416553094171406719187832266337079411200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1231691952427017417874009601032497148800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-10196158884397439805 : Rat) / 692956453614176359) [(2, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((199059708479375199780650266935387465600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((9894046412742829623 : Rat) / 2771825814456705436) [(2, 2), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((1167704522925499778129999203861693067040000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(2, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((12065970142779276123 : Rat) / 2771825814456705436) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((-6000707788236662107557563328123082425600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4456226615720320572 : Rat) / 692956453614176359) [(2, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4415295986492901976386780982650591091200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((687522785368103968371187815814027509473931 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(2, 2), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((7194964204658538452783945413965062289600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((6034008865854931767179371276621237051200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-35546378581218994155 : Rat) / 5543651628913410872) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((-130283572646791922258961743728671780003909 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(2, 2), (7, 1), (13, 3), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-479503877324492546463249105913943015819388 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((133807312762030463048877203514835200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(2, 2), (7, 2), (10, 1), (13, 2), (16, 1)],
  term ((-21511191554764261033084905479994662400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(2, 2), (7, 2), (10, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-144873779317055016889925303050924800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-89067231619686505967046984634008558930606 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(2, 2), (7, 2), (12, 1), (13, 2), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-150961233445964508895351802248291200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1906495707164126100 : Rat) / 692956453614176359) [(2, 2), (7, 2), (12, 1), (16, 1)],
  term ((4092882842813478937808462146308038400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(2, 2), (7, 2), (12, 2), (16, 1)],
  term ((88947346446902029295354963215714846962606 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((14137720669701733182472212493472870400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(3, 2), (6, 1), (11, 1), (13, 3), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-1088968709398203386248109642870116751020221 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(3, 2), (6, 1), (11, 2), (13, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (11, 2), (13, 3), (15, 1), (16, 1)],
  term ((3638115049031983125 : Rat) / 1385912907228352718) [(3, 2), (6, 1), (11, 2), (16, 1)],
  term ((-19706991015227723649546306900483062707200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((41889972037375162185 : Rat) / 5543651628913410872) [(3, 2), (6, 1), (12, 1), (16, 1)],
  term ((-596486690485271348333721591205328428996731 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((6000707788236662107557563328123082425600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-4821165600984702195 : Rat) / 692956453614176359) [(3, 2), (6, 1), (13, 2), (16, 1)],
  term ((4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3605795437533926822915581815010008351300 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((-6779251535932084221 : Rat) / 2771825814456705436) [(3, 2), (6, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((41685407496652500 : Rat) / 692956453614176359) [(3, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 2771825814456705436) [(3, 2), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-100679917130573283002078523224804649600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(3, 2), (7, 1), (8, 1), (13, 3), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (8, 1), (13, 4), (15, 1), (16, 1)],
  term ((7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(3, 2), (7, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(3, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(3, 2), (7, 1), (9, 1), (13, 2), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(3, 2), (7, 1), (9, 1), (16, 1)],
  term ((-4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(3, 2), (7, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3638115049031983125 : Rat) / 1385912907228352718) [(3, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-9626245519377805623 : Rat) / 2771825814456705436) [(3, 2), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5402428811566164000 : Rat) / 692956453614176359) [(3, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-532965479303834382580460385427004227200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((20755230665582595654 : Rat) / 692956453614176359) [(3, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((23338800344261701938229781055441761692503 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(3, 2), (7, 1), (10, 1), (13, 3), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((128471103739445421700596560401165010361249 : Rat) / 11635007024229621750051091604067796875724) [(3, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(3, 2), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-2389695598448356091306544968061476129788503 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-792552098474969535197294721248288966400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-5859370669532368869 : Rat) / 692956453614176359) [(3, 2), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-416553094171406719187832266337079411200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1231691952427017417874009601032497148800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-10196158884397439805 : Rat) / 692956453614176359) [(3, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((199059708479375199780650266935387465600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((9894046412742829623 : Rat) / 2771825814456705436) [(3, 2), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((1167704522925499778129999203861693067040000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(3, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((12065970142779276123 : Rat) / 2771825814456705436) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term ((-6000707788236662107557563328123082425600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4456226615720320572 : Rat) / 692956453614176359) [(3, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4415295986492901976386780982650591091200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((687522785368103968371187815814027509473931 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(3, 2), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((7194964204658538452783945413965062289600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((6034008865854931767179371276621237051200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-35546378581218994155 : Rat) / 5543651628913410872) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((-130283572646791922258961743728671780003909 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(3, 2), (7, 1), (13, 3), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-479503877324492546463249105913943015819388 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((133807312762030463048877203514835200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(3, 2), (7, 2), (10, 1), (13, 2), (16, 1)],
  term ((-21511191554764261033084905479994662400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(3, 2), (7, 2), (10, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-144873779317055016889925303050924800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-89067231619686505967046984634008558930606 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(3, 2), (7, 2), (12, 1), (13, 2), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-150961233445964508895351802248291200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1906495707164126100 : Rat) / 692956453614176359) [(3, 2), (7, 2), (12, 1), (16, 1)],
  term ((4092882842813478937808462146308038400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(3, 2), (7, 2), (12, 2), (16, 1)],
  term ((88947346446902029295354963215714846962606 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((14137720669701733182472212493472870400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(6, 1), (8, 2), (11, 1), (13, 3), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (8, 2), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((1088968709398203386248109642870116751020221 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (8, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(6, 1), (8, 2), (11, 2), (13, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (8, 2), (11, 2), (13, 3), (15, 1), (16, 1)],
  term ((-3638115049031983125 : Rat) / 1385912907228352718) [(6, 1), (8, 2), (11, 2), (16, 1)],
  term ((19706991015227723649546306900483062707200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-41889972037375162185 : Rat) / 5543651628913410872) [(6, 1), (8, 2), (12, 1), (16, 1)],
  term ((596486690485271348333721591205328428996731 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6000707788236662107557563328123082425600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (8, 2), (13, 2), (15, 2), (16, 1)],
  term ((4821165600984702195 : Rat) / 692956453614176359) [(6, 1), (8, 2), (13, 2), (16, 1)],
  term ((-4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (8, 2), (13, 3), (15, 1), (16, 1)],
  term ((3605795437533926822915581815010008351300 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (8, 2), (15, 2), (16, 1)],
  term ((6779251535932084221 : Rat) / 2771825814456705436) [(6, 1), (8, 2), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(6, 1), (9, 2), (11, 1), (13, 3), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (9, 2), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((1088968709398203386248109642870116751020221 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(6, 1), (9, 2), (11, 2), (13, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (9, 2), (11, 2), (13, 3), (15, 1), (16, 1)],
  term ((-3638115049031983125 : Rat) / 1385912907228352718) [(6, 1), (9, 2), (11, 2), (16, 1)],
  term ((19706991015227723649546306900483062707200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-41889972037375162185 : Rat) / 5543651628913410872) [(6, 1), (9, 2), (12, 1), (16, 1)],
  term ((596486690485271348333721591205328428996731 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6000707788236662107557563328123082425600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((4821165600984702195 : Rat) / 692956453614176359) [(6, 1), (9, 2), (13, 2), (16, 1)],
  term ((-4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((3605795437533926822915581815010008351300 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 2), (15, 2), (16, 1)],
  term ((6779251535932084221 : Rat) / 2771825814456705436) [(6, 1), (9, 2), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-41685407496652500 : Rat) / 692956453614176359) [(7, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 2771825814456705436) [(7, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((100679917130573283002078523224804649600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (8, 1), (9, 2), (13, 3), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 1), (9, 2), (13, 4), (15, 1), (16, 1)],
  term ((-7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 2), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (8, 2), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(7, 1), (8, 2), (9, 1), (12, 1), (16, 1)],
  term ((-23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (8, 2), (9, 1), (13, 2), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(7, 1), (8, 2), (9, 1), (16, 1)],
  term ((4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (8, 2), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((3638115049031983125 : Rat) / 1385912907228352718) [(7, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((9626245519377805623 : Rat) / 2771825814456705436) [(7, 1), (8, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((5402428811566164000 : Rat) / 692956453614176359) [(7, 1), (8, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((532965479303834382580460385427004227200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-20755230665582595654 : Rat) / 692956453614176359) [(7, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((-23338800344261701938229781055441761692503 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (8, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(7, 1), (8, 2), (10, 1), (13, 3), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((-128471103739445421700596560401165010361249 : Rat) / 11635007024229621750051091604067796875724) [(7, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(7, 1), (8, 2), (10, 2), (13, 1), (16, 1)],
  term ((2389695598448356091306544968061476129788503 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (8, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((792552098474969535197294721248288966400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((5859370669532368869 : Rat) / 692956453614176359) [(7, 1), (8, 2), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((416553094171406719187832266337079411200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((1231691952427017417874009601032497148800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((10196158884397439805 : Rat) / 692956453614176359) [(7, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((-199059708479375199780650266935387465600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9894046412742829623 : Rat) / 2771825814456705436) [(7, 1), (8, 2), (11, 1), (12, 2), (16, 1)],
  term ((-1167704522925499778129999203861693067040000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(7, 1), (8, 2), (11, 1), (13, 2), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((-12065970142779276123 : Rat) / 2771825814456705436) [(7, 1), (8, 2), (11, 1), (16, 1)],
  term ((6000707788236662107557563328123082425600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4456226615720320572 : Rat) / 692956453614176359) [(7, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((4415295986492901976386780982650591091200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-687522785368103968371187815814027509473931 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(7, 1), (8, 2), (12, 2), (13, 1), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-7194964204658538452783945413965062289600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 2), (12, 2), (15, 1), (16, 1)],
  term ((-6034008865854931767179371276621237051200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((35546378581218994155 : Rat) / 5543651628913410872) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((130283572646791922258961743728671780003909 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (13, 3), (15, 2), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (8, 2), (13, 3), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 2), (13, 4), (15, 1), (16, 1)],
  term ((479503877324492546463249105913943015819388 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-41685407496652500 : Rat) / 692956453614176359) [(7, 1), (8, 3), (11, 1), (16, 1)],
  term ((32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 3), (13, 1), (15, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 2771825814456705436) [(7, 1), (8, 3), (13, 1), (16, 1)],
  term ((100679917130573283002078523224804649600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 3), (13, 2), (15, 1), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (8, 3), (13, 3), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 3), (13, 4), (15, 1), (16, 1)],
  term ((-7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 3), (15, 1), (16, 1)],
  term ((4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (9, 2), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((3638115049031983125 : Rat) / 1385912907228352718) [(7, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((9626245519377805623 : Rat) / 2771825814456705436) [(7, 1), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((5402428811566164000 : Rat) / 692956453614176359) [(7, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((532965479303834382580460385427004227200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-20755230665582595654 : Rat) / 692956453614176359) [(7, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-23338800344261701938229781055441761692503 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(7, 1), (9, 2), (10, 1), (13, 3), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((-128471103739445421700596560401165010361249 : Rat) / 11635007024229621750051091604067796875724) [(7, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(7, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((2389695598448356091306544968061476129788503 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((792552098474969535197294721248288966400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((5859370669532368869 : Rat) / 692956453614176359) [(7, 1), (9, 2), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((416553094171406719187832266337079411200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((1231691952427017417874009601032497148800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((10196158884397439805 : Rat) / 692956453614176359) [(7, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-199059708479375199780650266935387465600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9894046412742829623 : Rat) / 2771825814456705436) [(7, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((-1167704522925499778129999203861693067040000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(7, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-12065970142779276123 : Rat) / 2771825814456705436) [(7, 1), (9, 2), (11, 1), (16, 1)],
  term ((6000707788236662107557563328123082425600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4456226615720320572 : Rat) / 692956453614176359) [(7, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((4415295986492901976386780982650591091200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-687522785368103968371187815814027509473931 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(7, 1), (9, 2), (12, 2), (13, 1), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-7194964204658538452783945413965062289600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-6034008865854931767179371276621237051200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((35546378581218994155 : Rat) / 5543651628913410872) [(7, 1), (9, 2), (13, 1), (16, 1)],
  term ((130283572646791922258961743728671780003909 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (13, 3), (15, 2), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (9, 2), (13, 3), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 2), (13, 4), (15, 1), (16, 1)],
  term ((479503877324492546463249105913943015819388 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (9, 3), (12, 1), (13, 2), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 3), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(7, 1), (9, 3), (12, 1), (16, 1)],
  term ((-23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (9, 3), (13, 2), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 3), (13, 3), (15, 1), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(7, 1), (9, 3), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 1), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-133807312762030463048877203514835200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(7, 2), (8, 2), (10, 1), (13, 2), (16, 1)],
  term ((21511191554764261033084905479994662400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (10, 1), (15, 2), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(7, 2), (8, 2), (10, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((144873779317055016889925303050924800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((89067231619686505967046984634008558930606 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(7, 2), (8, 2), (12, 1), (13, 2), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((150961233445964508895351802248291200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (12, 1), (15, 2), (16, 1)],
  term ((1906495707164126100 : Rat) / 692956453614176359) [(7, 2), (8, 2), (12, 1), (16, 1)],
  term ((-4092882842813478937808462146308038400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(7, 2), (8, 2), (12, 2), (16, 1)],
  term ((-88947346446902029295354963215714846962606 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14137720669701733182472212493472870400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (13, 2), (15, 2), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 3), (13, 3), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-133807312762030463048877203514835200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(7, 2), (9, 2), (10, 1), (13, 2), (16, 1)],
  term ((21511191554764261033084905479994662400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(7, 2), (9, 2), (10, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((144873779317055016889925303050924800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((89067231619686505967046984634008558930606 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(7, 2), (9, 2), (12, 1), (13, 2), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((150961233445964508895351802248291200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((1906495707164126100 : Rat) / 692956453614176359) [(7, 2), (9, 2), (12, 1), (16, 1)],
  term ((-4092882842813478937808462146308038400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(7, 2), (9, 2), (12, 2), (16, 1)],
  term ((-88947346446902029295354963215714846962606 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14137720669701733182472212493472870400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 3), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 500 through 599. -/
theorem ep_Q2_008_block_03_0500_0599_valid :
    checkProductSumEq ep_Q2_008_partials_03_0500_0599
      ep_Q2_008_block_03_0500_0599 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
