/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 22:300-399

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 22 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_22_0300_0399 : Poly :=
[
  term (2 : Rat) [(8, 1), (10, 1)],
  term (-1 : Rat) [(8, 2)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0300 : Poly :=
[
  term ((234156504057103443860076633253006959696947416259810814361 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 1), (15, 1)]
]

/-- Partial product 300 for generator 22. -/
def ep_Q2_024_partial_22_0300 : Poly :=
[
  term ((234156504057103443860076633253006959696947416259810814361 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 1), (8, 1), (10, 1), (15, 1)],
  term ((-234156504057103443860076633253006959696947416259810814361 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 1), (8, 2), (15, 1)],
  term ((234156504057103443860076633253006959696947416259810814361 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-234156504057103443860076633253006959696947416259810814361 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 22. -/
theorem ep_Q2_024_partial_22_0300_valid :
    mulPoly ep_Q2_024_coefficient_22_0300
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0301 : Poly :=
[
  term ((-29761634202336697 : Rat) / 6976681326919158) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 301 for generator 22. -/
def ep_Q2_024_partial_22_0301 : Poly :=
[
  term ((-29761634202336697 : Rat) / 3488340663459579) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((29761634202336697 : Rat) / 6976681326919158) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-29761634202336697 : Rat) / 3488340663459579) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((29761634202336697 : Rat) / 6976681326919158) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 22. -/
theorem ep_Q2_024_partial_22_0301_valid :
    mulPoly ep_Q2_024_coefficient_22_0301
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0302 : Poly :=
[
  term ((4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (15, 3)]
]

/-- Partial product 302 for generator 22. -/
def ep_Q2_024_partial_22_0302 : Poly :=
[
  term ((9332237164528159758625041614371109858011888728985178274 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (8, 1), (10, 1), (15, 3)],
  term ((-4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (8, 2), (15, 3)],
  term ((9332237164528159758625041614371109858011888728985178274 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (11, 1), (15, 3)],
  term ((-4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 22. -/
theorem ep_Q2_024_partial_22_0302_valid :
    mulPoly ep_Q2_024_coefficient_22_0302
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0303 : Poly :=
[
  term ((-7791585621739076 : Rat) / 1162780221153193) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 303 for generator 22. -/
def ep_Q2_024_partial_22_0303 : Poly :=
[
  term ((-15583171243478152 : Rat) / 1162780221153193) [(3, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((7791585621739076 : Rat) / 1162780221153193) [(3, 1), (8, 2), (15, 3), (16, 1)],
  term ((-15583171243478152 : Rat) / 1162780221153193) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((7791585621739076 : Rat) / 1162780221153193) [(3, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 22. -/
theorem ep_Q2_024_partial_22_0303_valid :
    mulPoly ep_Q2_024_coefficient_22_0303
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0304 : Poly :=
[
  term ((10914088454272291175538852046163768941136 : Rat) / 5398692558311147834550120876132926705955) [(3, 2)]
]

/-- Partial product 304 for generator 22. -/
def ep_Q2_024_partial_22_0304 : Poly :=
[
  term ((21828176908544582351077704092327537882272 : Rat) / 5398692558311147834550120876132926705955) [(3, 2), (8, 1), (10, 1)],
  term ((-10914088454272291175538852046163768941136 : Rat) / 5398692558311147834550120876132926705955) [(3, 2), (8, 2)],
  term ((21828176908544582351077704092327537882272 : Rat) / 5398692558311147834550120876132926705955) [(3, 2), (9, 1), (11, 1)],
  term ((-10914088454272291175538852046163768941136 : Rat) / 5398692558311147834550120876132926705955) [(3, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 22. -/
theorem ep_Q2_024_partial_22_0304_valid :
    mulPoly ep_Q2_024_coefficient_22_0304
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0305 : Poly :=
[
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (4, 1)]
]

/-- Partial product 305 for generator 22. -/
def ep_Q2_024_partial_22_0305 : Poly :=
[
  term ((5860298469427302226261358975602624182032 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (4, 1), (8, 1), (10, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (4, 1), (8, 2)],
  term ((5860298469427302226261358975602624182032 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (4, 1), (9, 1), (11, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (4, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 22. -/
theorem ep_Q2_024_partial_22_0305_valid :
    mulPoly ep_Q2_024_coefficient_22_0305
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0306 : Poly :=
[
  term ((-16890983628896808743407603036576568848 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 1)]
]

/-- Partial product 306 for generator 22. -/
def ep_Q2_024_partial_22_0306 : Poly :=
[
  term ((-33781967257793617486815206073153137696 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (8, 1), (9, 1), (10, 1)],
  term ((16890983628896808743407603036576568848 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (8, 2), (9, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 2), (11, 1)],
  term ((16890983628896808743407603036576568848 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 22. -/
theorem ep_Q2_024_partial_22_0306_valid :
    mulPoly ep_Q2_024_coefficient_22_0306
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0307 : Poly :=
[
  term ((3082928476586153890712559966648414688 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (13, 1)]
]

/-- Partial product 307 for generator 22. -/
def ep_Q2_024_partial_22_0307 : Poly :=
[
  term ((6165856953172307781425119933296829376 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((-3082928476586153890712559966648414688 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (8, 2), (13, 1)],
  term ((6165856953172307781425119933296829376 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-3082928476586153890712559966648414688 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 22. -/
theorem ep_Q2_024_partial_22_0307_valid :
    mulPoly ep_Q2_024_coefficient_22_0307
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0308 : Poly :=
[
  term ((3319869963774812909052232810846149293107172472347692792 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (15, 1)]
]

/-- Partial product 308 for generator 22. -/
def ep_Q2_024_partial_22_0308 : Poly :=
[
  term ((6639739927549625818104465621692298586214344944695385584 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-3319869963774812909052232810846149293107172472347692792 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (8, 2), (15, 1)],
  term ((6639739927549625818104465621692298586214344944695385584 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-3319869963774812909052232810846149293107172472347692792 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 22. -/
theorem ep_Q2_024_partial_22_0308_valid :
    mulPoly ep_Q2_024_coefficient_22_0308
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0309 : Poly :=
[
  term ((-1243911894777184 : Rat) / 3488340663459579) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 309 for generator 22. -/
def ep_Q2_024_partial_22_0309 : Poly :=
[
  term ((-2487823789554368 : Rat) / 3488340663459579) [(3, 2), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((1243911894777184 : Rat) / 3488340663459579) [(3, 2), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-2487823789554368 : Rat) / 3488340663459579) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1243911894777184 : Rat) / 3488340663459579) [(3, 2), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 22. -/
theorem ep_Q2_024_partial_22_0309_valid :
    mulPoly ep_Q2_024_coefficient_22_0309
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0310 : Poly :=
[
  term ((-1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (8, 1)]
]

/-- Partial product 310 for generator 22. -/
def ep_Q2_024_partial_22_0310 : Poly :=
[
  term ((-3305390256600957304750147809747473899456 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (8, 1), (9, 1), (11, 1)],
  term ((1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (8, 1), (9, 2)],
  term ((-3305390256600957304750147809747473899456 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (8, 2), (10, 1)],
  term ((1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (8, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 22. -/
theorem ep_Q2_024_partial_22_0310_valid :
    mulPoly ep_Q2_024_coefficient_22_0310
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0311 : Poly :=
[
  term ((36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (13, 1)]
]

/-- Partial product 311 for generator 22. -/
def ep_Q2_024_partial_22_0311 : Poly :=
[
  term ((73424885016391334592524874103881802976 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 2), (9, 1), (13, 1)],
  term ((73424885016391334592524874103881802976 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 2), (11, 1), (13, 1)],
  term ((-36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 22. -/
theorem ep_Q2_024_partial_22_0311_valid :
    mulPoly ep_Q2_024_coefficient_22_0311
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0312 : Poly :=
[
  term ((225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(3, 2), (9, 1), (15, 1)]
]

/-- Partial product 312 for generator 22. -/
def ep_Q2_024_partial_22_0312 : Poly :=
[
  term ((451584493334593143508692345332818085290440040420989034 : Rat) / 418499528459408918327148043876319653860305890461357621) [(3, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(3, 2), (8, 2), (9, 1), (15, 1)],
  term ((451584493334593143508692345332818085290440040420989034 : Rat) / 418499528459408918327148043876319653860305890461357621) [(3, 2), (9, 2), (11, 1), (15, 1)],
  term ((-225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(3, 2), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 22. -/
theorem ep_Q2_024_partial_22_0312_valid :
    mulPoly ep_Q2_024_coefficient_22_0312
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0313 : Poly :=
[
  term ((747574224772468 : Rat) / 3488340663459579) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 313 for generator 22. -/
def ep_Q2_024_partial_22_0313 : Poly :=
[
  term ((1495148449544936 : Rat) / 3488340663459579) [(3, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-747574224772468 : Rat) / 3488340663459579) [(3, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((1495148449544936 : Rat) / 3488340663459579) [(3, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-747574224772468 : Rat) / 3488340663459579) [(3, 2), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 22. -/
theorem ep_Q2_024_partial_22_0313_valid :
    mulPoly ep_Q2_024_coefficient_22_0313
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0314 : Poly :=
[
  term ((63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 2)]
]

/-- Partial product 314 for generator 22. -/
def ep_Q2_024_partial_22_0314 : Poly :=
[
  term ((126225064372939892662610287863400842112 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (9, 2), (10, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 2), (9, 2)],
  term ((126225064372939892662610287863400842112 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 3), (11, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 22. -/
theorem ep_Q2_024_partial_22_0314_valid :
    mulPoly ep_Q2_024_coefficient_22_0314
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0315 : Poly :=
[
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (12, 1)]
]

/-- Partial product 315 for generator 22. -/
def ep_Q2_024_partial_22_0315 : Poly :=
[
  term ((-359800988817789934888267636369853231432 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (10, 1), (12, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 2), (12, 1)],
  term ((-359800988817789934888267636369853231432 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (11, 1), (12, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 22. -/
theorem ep_Q2_024_partial_22_0315_valid :
    mulPoly ep_Q2_024_coefficient_22_0315
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0316 : Poly :=
[
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 316 for generator 22. -/
def ep_Q2_024_partial_22_0316 : Poly :=
[
  term ((44365241360347559907548253348032480896 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (8, 2), (12, 1), (13, 1), (15, 1)],
  term ((44365241360347559907548253348032480896 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 22. -/
theorem ep_Q2_024_partial_22_0316_valid :
    mulPoly ep_Q2_024_coefficient_22_0316
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0317 : Poly :=
[
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (12, 1), (15, 2)]
]

/-- Partial product 317 for generator 22. -/
def ep_Q2_024_partial_22_0317 : Poly :=
[
  term ((-794982465900475775992368411131078542254382208882138752 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (8, 2), (12, 1), (15, 2)],
  term ((-794982465900475775992368411131078542254382208882138752 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 22. -/
theorem ep_Q2_024_partial_22_0317_valid :
    mulPoly ep_Q2_024_coefficient_22_0317
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0318 : Poly :=
[
  term ((1054421534548864 : Rat) / 1162780221153193) [(3, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 318 for generator 22. -/
def ep_Q2_024_partial_22_0318 : Poly :=
[
  term ((2108843069097728 : Rat) / 1162780221153193) [(3, 2), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1054421534548864 : Rat) / 1162780221153193) [(3, 2), (8, 2), (12, 1), (15, 2), (16, 1)],
  term ((2108843069097728 : Rat) / 1162780221153193) [(3, 2), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1054421534548864 : Rat) / 1162780221153193) [(3, 2), (9, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 22. -/
theorem ep_Q2_024_partial_22_0318_valid :
    mulPoly ep_Q2_024_coefficient_22_0318
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0319 : Poly :=
[
  term ((-36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (13, 1), (15, 1)]
]

/-- Partial product 319 for generator 22. -/
def ep_Q2_024_partial_22_0319 : Poly :=
[
  term ((-36326709823775404890386910227678820329661108457314367451 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(3, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (8, 2), (13, 1), (15, 1)],
  term ((-36326709823775404890386910227678820329661108457314367451 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 22. -/
theorem ep_Q2_024_partial_22_0319_valid :
    mulPoly ep_Q2_024_coefficient_22_0319
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0320 : Poly :=
[
  term ((5187528714443170 : Rat) / 3488340663459579) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 320 for generator 22. -/
def ep_Q2_024_partial_22_0320 : Poly :=
[
  term ((10375057428886340 : Rat) / 3488340663459579) [(3, 2), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5187528714443170 : Rat) / 3488340663459579) [(3, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((10375057428886340 : Rat) / 3488340663459579) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5187528714443170 : Rat) / 3488340663459579) [(3, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 22. -/
theorem ep_Q2_024_partial_22_0320_valid :
    mulPoly ep_Q2_024_coefficient_22_0320
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0321 : Poly :=
[
  term ((-197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (13, 2)]
]

/-- Partial product 321 for generator 22. -/
def ep_Q2_024_partial_22_0321 : Poly :=
[
  term ((-394147835050448810694877824632526207856 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (8, 1), (10, 1), (13, 2)],
  term ((197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (8, 2), (13, 2)],
  term ((-394147835050448810694877824632526207856 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (9, 1), (11, 1), (13, 2)],
  term ((197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 22. -/
theorem ep_Q2_024_partial_22_0321_valid :
    mulPoly ep_Q2_024_coefficient_22_0321
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0322 : Poly :=
[
  term ((-254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (14, 1)]
]

/-- Partial product 322 for generator 22. -/
def ep_Q2_024_partial_22_0322 : Poly :=
[
  term ((-508470349154038865005416199007327333444 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (8, 1), (10, 1), (14, 1)],
  term ((254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (8, 2), (14, 1)],
  term ((-508470349154038865005416199007327333444 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (9, 1), (11, 1), (14, 1)],
  term ((254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 22. -/
theorem ep_Q2_024_partial_22_0322_valid :
    mulPoly ep_Q2_024_coefficient_22_0322
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0323 : Poly :=
[
  term ((-408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (15, 2)]
]

/-- Partial product 323 for generator 22. -/
def ep_Q2_024_partial_22_0323 : Poly :=
[
  term ((-408424516433622249313695112340266633602697230933700476949 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(3, 2), (8, 1), (10, 1), (15, 2)],
  term ((408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (8, 2), (15, 2)],
  term ((-408424516433622249313695112340266633602697230933700476949 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(3, 2), (9, 1), (11, 1), (15, 2)],
  term ((408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 22. -/
theorem ep_Q2_024_partial_22_0323_valid :
    mulPoly ep_Q2_024_coefficient_22_0323
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0324 : Poly :=
[
  term ((44155261447042286 : Rat) / 3488340663459579) [(3, 2), (15, 2), (16, 1)]
]

/-- Partial product 324 for generator 22. -/
def ep_Q2_024_partial_22_0324 : Poly :=
[
  term ((88310522894084572 : Rat) / 3488340663459579) [(3, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-44155261447042286 : Rat) / 3488340663459579) [(3, 2), (8, 2), (15, 2), (16, 1)],
  term ((88310522894084572 : Rat) / 3488340663459579) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-44155261447042286 : Rat) / 3488340663459579) [(3, 2), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 22. -/
theorem ep_Q2_024_partial_22_0324_valid :
    mulPoly ep_Q2_024_coefficient_22_0324
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0325 : Poly :=
[
  term ((3835115182457325678732377184857873892259 : Rat) / 3599128372207431889700080584088617803970) [(4, 1)]
]

/-- Partial product 325 for generator 22. -/
def ep_Q2_024_partial_22_0325 : Poly :=
[
  term ((3835115182457325678732377184857873892259 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (8, 1), (10, 1)],
  term ((-3835115182457325678732377184857873892259 : Rat) / 3599128372207431889700080584088617803970) [(4, 1), (8, 2)],
  term ((3835115182457325678732377184857873892259 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (9, 1), (11, 1)],
  term ((-3835115182457325678732377184857873892259 : Rat) / 3599128372207431889700080584088617803970) [(4, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 22. -/
theorem ep_Q2_024_partial_22_0325_valid :
    mulPoly ep_Q2_024_coefficient_22_0325
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0326 : Poly :=
[
  term ((29825028787604780568533645441663554308 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (9, 1)]
]

/-- Partial product 326 for generator 22. -/
def ep_Q2_024_partial_22_0326 : Poly :=
[
  term ((59650057575209561137067290883327108616 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (8, 1), (9, 1), (10, 1)],
  term ((-29825028787604780568533645441663554308 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (8, 2), (9, 1)],
  term ((59650057575209561137067290883327108616 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (9, 2), (11, 1)],
  term ((-29825028787604780568533645441663554308 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 22. -/
theorem ep_Q2_024_partial_22_0326_valid :
    mulPoly ep_Q2_024_coefficient_22_0326
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0327 : Poly :=
[
  term ((334428801730601467320849559155644728264 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (13, 1)]
]

/-- Partial product 327 for generator 22. -/
def ep_Q2_024_partial_22_0327 : Poly :=
[
  term ((668857603461202934641699118311289456528 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-334428801730601467320849559155644728264 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (8, 2), (13, 1)],
  term ((668857603461202934641699118311289456528 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-334428801730601467320849559155644728264 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 22. -/
theorem ep_Q2_024_partial_22_0327_valid :
    mulPoly ep_Q2_024_coefficient_22_0327
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0328 : Poly :=
[
  term ((-6834924834200042351550340926163124734946948840364915124 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 328 for generator 22. -/
def ep_Q2_024_partial_22_0328 : Poly :=
[
  term ((-13669849668400084703100681852326249469893897680729830248 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((6834924834200042351550340926163124734946948840364915124 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (8, 2), (15, 1)],
  term ((-13669849668400084703100681852326249469893897680729830248 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((6834924834200042351550340926163124734946948840364915124 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 22. -/
theorem ep_Q2_024_partial_22_0328_valid :
    mulPoly ep_Q2_024_coefficient_22_0328
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0329 : Poly :=
[
  term ((623441341618240 : Rat) / 1162780221153193) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 329 for generator 22. -/
def ep_Q2_024_partial_22_0329 : Poly :=
[
  term ((1246882683236480 : Rat) / 1162780221153193) [(4, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-623441341618240 : Rat) / 1162780221153193) [(4, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((1246882683236480 : Rat) / 1162780221153193) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-623441341618240 : Rat) / 1162780221153193) [(4, 1), (7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 22. -/
theorem ep_Q2_024_partial_22_0329_valid :
    mulPoly ep_Q2_024_coefficient_22_0329
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0330 : Poly :=
[
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1)]
]

/-- Partial product 330 for generator 22. -/
def ep_Q2_024_partial_22_0330 : Poly :=
[
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (9, 1), (11, 1)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (9, 2)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 2), (10, 1)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 22. -/
theorem ep_Q2_024_partial_22_0330_valid :
    mulPoly ep_Q2_024_coefficient_22_0330
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0331 : Poly :=
[
  term ((-78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (9, 1), (11, 1)]
]

/-- Partial product 331 for generator 22. -/
def ep_Q2_024_partial_22_0331 : Poly :=
[
  term ((-157425345043273170788251404812382566120 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (8, 2), (9, 1), (11, 1)],
  term ((-157425345043273170788251404812382566120 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (9, 2), (11, 2)],
  term ((78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 22. -/
theorem ep_Q2_024_partial_22_0331_valid :
    mulPoly ep_Q2_024_coefficient_22_0331
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0332 : Poly :=
[
  term ((-2594239234770050127244603015455966432 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 332 for generator 22. -/
def ep_Q2_024_partial_22_0332 : Poly :=
[
  term ((-5188478469540100254489206030911932864 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((2594239234770050127244603015455966432 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (8, 2), (9, 1), (13, 1)],
  term ((-5188478469540100254489206030911932864 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (9, 2), (11, 1), (13, 1)],
  term ((2594239234770050127244603015455966432 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 22. -/
theorem ep_Q2_024_partial_22_0332_valid :
    mulPoly ep_Q2_024_coefficient_22_0332
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0333 : Poly :=
[
  term ((687486151953707274420104443598728192816 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 333 for generator 22. -/
def ep_Q2_024_partial_22_0333 : Poly :=
[
  term ((1374972303907414548840208887197456385632 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-687486151953707274420104443598728192816 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (8, 2), (9, 1), (15, 1)],
  term ((1374972303907414548840208887197456385632 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 2), (11, 1), (15, 1)],
  term ((-687486151953707274420104443598728192816 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 22. -/
theorem ep_Q2_024_partial_22_0333_valid :
    mulPoly ep_Q2_024_coefficient_22_0333
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0334 : Poly :=
[
  term ((189971572478631474751921372771244313536 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 334 for generator 22. -/
def ep_Q2_024_partial_22_0334 : Poly :=
[
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-189971572478631474751921372771244313536 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 2), (11, 1), (12, 1), (13, 1)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-189971572478631474751921372771244313536 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 22. -/
theorem ep_Q2_024_partial_22_0334_valid :
    mulPoly ep_Q2_024_coefficient_22_0334
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0335 : Poly :=
[
  term ((-5336256518543225275254510220537931407670344894878866818 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 335 for generator 22. -/
def ep_Q2_024_partial_22_0335 : Poly :=
[
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((5336256518543225275254510220537931407670344894878866818 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (8, 2), (11, 1), (12, 1), (15, 1)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((5336256518543225275254510220537931407670344894878866818 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 22. -/
theorem ep_Q2_024_partial_22_0335_valid :
    mulPoly ep_Q2_024_coefficient_22_0335
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0336 : Poly :=
[
  term ((1932327998838360 : Rat) / 1162780221153193) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 336 for generator 22. -/
def ep_Q2_024_partial_22_0336 : Poly :=
[
  term ((3864655997676720 : Rat) / 1162780221153193) [(4, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1932327998838360 : Rat) / 1162780221153193) [(4, 1), (8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(4, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1932327998838360 : Rat) / 1162780221153193) [(4, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 22. -/
theorem ep_Q2_024_partial_22_0336_valid :
    mulPoly ep_Q2_024_coefficient_22_0336
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0337 : Poly :=
[
  term ((-284322162513310881287596382688583324136 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 337 for generator 22. -/
def ep_Q2_024_partial_22_0337 : Poly :=
[
  term ((-568644325026621762575192765377166648272 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((284322162513310881287596382688583324136 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 2), (11, 1), (13, 1)],
  term ((-568644325026621762575192765377166648272 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (11, 2), (13, 1)],
  term ((284322162513310881287596382688583324136 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 22. -/
theorem ep_Q2_024_partial_22_0337_valid :
    mulPoly ep_Q2_024_coefficient_22_0337
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0338 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 338 for generator 22. -/
def ep_Q2_024_partial_22_0338 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 2), (11, 1), (13, 1), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 22. -/
theorem ep_Q2_024_partial_22_0338_valid :
    mulPoly ep_Q2_024_coefficient_22_0338
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0339 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 339 for generator 22. -/
def ep_Q2_024_partial_22_0339 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (8, 2), (11, 1), (14, 1), (15, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (9, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 22. -/
theorem ep_Q2_024_partial_22_0339_valid :
    mulPoly ep_Q2_024_coefficient_22_0339
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0340 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 340 for generator 22. -/
def ep_Q2_024_partial_22_0340 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 1), (8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 22. -/
theorem ep_Q2_024_partial_22_0340_valid :
    mulPoly ep_Q2_024_coefficient_22_0340
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0341 : Poly :=
[
  term ((54805693310089908493956012483267081475473687630831750659 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 341 for generator 22. -/
def ep_Q2_024_partial_22_0341 : Poly :=
[
  term ((54805693310089908493956012483267081475473687630831750659 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-54805693310089908493956012483267081475473687630831750659 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(4, 1), (8, 2), (11, 1), (15, 1)],
  term ((54805693310089908493956012483267081475473687630831750659 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (9, 1), (11, 2), (15, 1)],
  term ((-54805693310089908493956012483267081475473687630831750659 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(4, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 22. -/
theorem ep_Q2_024_partial_22_0341_valid :
    mulPoly ep_Q2_024_coefficient_22_0341
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0342 : Poly :=
[
  term ((-1731612278146422 : Rat) / 1162780221153193) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 342 for generator 22. -/
def ep_Q2_024_partial_22_0342 : Poly :=
[
  term ((-3463224556292844 : Rat) / 1162780221153193) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1731612278146422 : Rat) / 1162780221153193) [(4, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3463224556292844 : Rat) / 1162780221153193) [(4, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1731612278146422 : Rat) / 1162780221153193) [(4, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 22. -/
theorem ep_Q2_024_partial_22_0342_valid :
    mulPoly ep_Q2_024_coefficient_22_0342
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0343 : Poly :=
[
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 343 for generator 22. -/
def ep_Q2_024_partial_22_0343 : Poly :=
[
  term ((-759886289914525899007685491084977254144 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 2), (12, 1), (13, 1), (15, 1)],
  term ((-759886289914525899007685491084977254144 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 22. -/
theorem ep_Q2_024_partial_22_0343_valid :
    mulPoly ep_Q2_024_coefficient_22_0343
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0344 : Poly :=
[
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (12, 1), (15, 2)]
]

/-- Partial product 344 for generator 22. -/
def ep_Q2_024_partial_22_0344 : Poly :=
[
  term ((21345026074172901101018040882151725630681379579515467272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (8, 2), (12, 1), (15, 2)],
  term ((21345026074172901101018040882151725630681379579515467272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 22. -/
theorem ep_Q2_024_partial_22_0344_valid :
    mulPoly ep_Q2_024_coefficient_22_0344
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0345 : Poly :=
[
  term ((-3864655997676720 : Rat) / 1162780221153193) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 345 for generator 22. -/
def ep_Q2_024_partial_22_0345 : Poly :=
[
  term ((-7729311995353440 : Rat) / 1162780221153193) [(4, 1), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(4, 1), (8, 2), (12, 1), (15, 2), (16, 1)],
  term ((-7729311995353440 : Rat) / 1162780221153193) [(4, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(4, 1), (9, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 22. -/
theorem ep_Q2_024_partial_22_0345_valid :
    mulPoly ep_Q2_024_coefficient_22_0345
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0346 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 346 for generator 22. -/
def ep_Q2_024_partial_22_0346 : Poly :=
[
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 2), (13, 1), (14, 1), (15, 1)],
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 22. -/
theorem ep_Q2_024_partial_22_0346_valid :
    mulPoly ep_Q2_024_coefficient_22_0346
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0347 : Poly :=
[
  term ((1919551062951749724380209252264900189320627172279098301 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 347 for generator 22. -/
def ep_Q2_024_partial_22_0347 : Poly :=
[
  term ((3839102125903499448760418504529800378641254344558196602 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1919551062951749724380209252264900189320627172279098301 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (8, 2), (13, 1), (15, 1)],
  term ((3839102125903499448760418504529800378641254344558196602 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1919551062951749724380209252264900189320627172279098301 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 22. -/
theorem ep_Q2_024_partial_22_0347_valid :
    mulPoly ep_Q2_024_coefficient_22_0347
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0348 : Poly :=
[
  term ((-1548261550151252 : Rat) / 1162780221153193) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 348 for generator 22. -/
def ep_Q2_024_partial_22_0348 : Poly :=
[
  term ((-3096523100302504 : Rat) / 1162780221153193) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1548261550151252 : Rat) / 1162780221153193) [(4, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3096523100302504 : Rat) / 1162780221153193) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1548261550151252 : Rat) / 1162780221153193) [(4, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 22. -/
theorem ep_Q2_024_partial_22_0348_valid :
    mulPoly ep_Q2_024_coefficient_22_0348
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0349 : Poly :=
[
  term ((-363989321440086289217973633499271335808 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (13, 2)]
]

/-- Partial product 349 for generator 22. -/
def ep_Q2_024_partial_22_0349 : Poly :=
[
  term ((-727978642880172578435947266998542671616 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (10, 1), (13, 2)],
  term ((363989321440086289217973633499271335808 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 2), (13, 2)],
  term ((-727978642880172578435947266998542671616 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (11, 1), (13, 2)],
  term ((363989321440086289217973633499271335808 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 22. -/
theorem ep_Q2_024_partial_22_0349_valid :
    mulPoly ep_Q2_024_coefficient_22_0349
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0350 : Poly :=
[
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (14, 1)]
]

/-- Partial product 350 for generator 22. -/
def ep_Q2_024_partial_22_0350 : Poly :=
[
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (10, 1), (14, 1)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 2), (14, 1)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (11, 1), (14, 1)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 22. -/
theorem ep_Q2_024_partial_22_0350_valid :
    mulPoly ep_Q2_024_coefficient_22_0350
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0351 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (14, 1), (15, 2)]
]

/-- Partial product 351 for generator 22. -/
def ep_Q2_024_partial_22_0351 : Poly :=
[
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (8, 2), (14, 1), (15, 2)],
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (9, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 22. -/
theorem ep_Q2_024_partial_22_0351_valid :
    mulPoly ep_Q2_024_coefficient_22_0351
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0352 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(4, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 352 for generator 22. -/
def ep_Q2_024_partial_22_0352 : Poly :=
[
  term ((-1667935482081904 : Rat) / 1162780221153193) [(4, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (8, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(4, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 22. -/
theorem ep_Q2_024_partial_22_0352_valid :
    mulPoly ep_Q2_024_coefficient_22_0352
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0353 : Poly :=
[
  term ((-69918679577492248026430828734293382217854215807982362809 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(4, 1), (15, 2)]
]

/-- Partial product 353 for generator 22. -/
def ep_Q2_024_partial_22_0353 : Poly :=
[
  term ((-69918679577492248026430828734293382217854215807982362809 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (8, 1), (10, 1), (15, 2)],
  term ((69918679577492248026430828734293382217854215807982362809 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(4, 1), (8, 2), (15, 2)],
  term ((-69918679577492248026430828734293382217854215807982362809 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (9, 1), (11, 1), (15, 2)],
  term ((69918679577492248026430828734293382217854215807982362809 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(4, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 22. -/
theorem ep_Q2_024_partial_22_0353_valid :
    mulPoly ep_Q2_024_coefficient_22_0353
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0354 : Poly :=
[
  term ((3865663224954194 : Rat) / 1162780221153193) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 354 for generator 22. -/
def ep_Q2_024_partial_22_0354 : Poly :=
[
  term ((7731326449908388 : Rat) / 1162780221153193) [(4, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3865663224954194 : Rat) / 1162780221153193) [(4, 1), (8, 2), (15, 2), (16, 1)],
  term ((7731326449908388 : Rat) / 1162780221153193) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3865663224954194 : Rat) / 1162780221153193) [(4, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 22. -/
theorem ep_Q2_024_partial_22_0354_valid :
    mulPoly ep_Q2_024_coefficient_22_0354
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0355 : Poly :=
[
  term ((-108527865897635204440923906776011627033 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1)]
]

/-- Partial product 355 for generator 22. -/
def ep_Q2_024_partial_22_0355 : Poly :=
[
  term ((-217055731795270408881847813552023254066 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (8, 1), (10, 1)],
  term ((108527865897635204440923906776011627033 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (8, 2)],
  term ((-217055731795270408881847813552023254066 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 1), (11, 1)],
  term ((108527865897635204440923906776011627033 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 22. -/
theorem ep_Q2_024_partial_22_0355_valid :
    mulPoly ep_Q2_024_coefficient_22_0355
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0356 : Poly :=
[
  term ((89512237377956620516697908997183509624 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 356 for generator 22. -/
def ep_Q2_024_partial_22_0356 : Poly :=
[
  term ((179024474755913241033395817994367019248 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-89512237377956620516697908997183509624 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (8, 2), (9, 1), (15, 1)],
  term ((179024474755913241033395817994367019248 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1)],
  term ((-89512237377956620516697908997183509624 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 22. -/
theorem ep_Q2_024_partial_22_0356_valid :
    mulPoly ep_Q2_024_coefficient_22_0356
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0357 : Poly :=
[
  term ((117376268339488112344745730665839707824 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 357 for generator 22. -/
def ep_Q2_024_partial_22_0357 : Poly :=
[
  term ((234752536678976224689491461331679415648 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-117376268339488112344745730665839707824 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (8, 2), (13, 1), (15, 1)],
  term ((234752536678976224689491461331679415648 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-117376268339488112344745730665839707824 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 22. -/
theorem ep_Q2_024_partial_22_0357_valid :
    mulPoly ep_Q2_024_coefficient_22_0357
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0358 : Poly :=
[
  term ((1992624090823633213099754699689325595416268704700630544 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (15, 2)]
]

/-- Partial product 358 for generator 22. -/
def ep_Q2_024_partial_22_0358 : Poly :=
[
  term ((3985248181647266426199509399378651190832537409401261088 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (8, 1), (10, 1), (15, 2)],
  term ((-1992624090823633213099754699689325595416268704700630544 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (8, 2), (15, 2)],
  term ((3985248181647266426199509399378651190832537409401261088 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2)],
  term ((-1992624090823633213099754699689325595416268704700630544 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 22. -/
theorem ep_Q2_024_partial_22_0358_valid :
    mulPoly ep_Q2_024_coefficient_22_0358
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0359 : Poly :=
[
  term ((-3056913016368256 : Rat) / 1162780221153193) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 359 for generator 22. -/
def ep_Q2_024_partial_22_0359 : Poly :=
[
  term ((-6113826032736512 : Rat) / 1162780221153193) [(5, 1), (7, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((3056913016368256 : Rat) / 1162780221153193) [(5, 1), (7, 1), (8, 2), (15, 2), (16, 1)],
  term ((-6113826032736512 : Rat) / 1162780221153193) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((3056913016368256 : Rat) / 1162780221153193) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 22. -/
theorem ep_Q2_024_partial_22_0359_valid :
    mulPoly ep_Q2_024_coefficient_22_0359
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0360 : Poly :=
[
  term ((41374181017500273825906538730024326566 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1)]
]

/-- Partial product 360 for generator 22. -/
def ep_Q2_024_partial_22_0360 : Poly :=
[
  term ((82748362035000547651813077460048653132 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 2), (11, 1)],
  term ((-41374181017500273825906538730024326566 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 3)],
  term ((82748362035000547651813077460048653132 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 2), (9, 1), (10, 1)],
  term ((-41374181017500273825906538730024326566 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 22. -/
theorem ep_Q2_024_partial_22_0360_valid :
    mulPoly ep_Q2_024_coefficient_22_0360
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0361 : Poly :=
[
  term ((27668454211936165436187528524997233780 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (8, 1), (13, 1)]
]

/-- Partial product 361 for generator 22. -/
def ep_Q2_024_partial_22_0361 : Poly :=
[
  term ((55336908423872330872375057049994467560 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-27668454211936165436187528524997233780 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (8, 1), (9, 2), (13, 1)],
  term ((55336908423872330872375057049994467560 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (8, 2), (10, 1), (13, 1)],
  term ((-27668454211936165436187528524997233780 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (8, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 22. -/
theorem ep_Q2_024_partial_22_0361_valid :
    mulPoly ep_Q2_024_coefficient_22_0361
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0362 : Poly :=
[
  term ((4683094308629915841475702479788777076009203016201305779 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 362 for generator 22. -/
def ep_Q2_024_partial_22_0362 : Poly :=
[
  term ((9366188617259831682951404959577554152018406032402611558 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-4683094308629915841475702479788777076009203016201305779 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (9, 2), (15, 1)],
  term ((9366188617259831682951404959577554152018406032402611558 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 2), (10, 1), (15, 1)],
  term ((-4683094308629915841475702479788777076009203016201305779 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 22. -/
theorem ep_Q2_024_partial_22_0362_valid :
    mulPoly ep_Q2_024_coefficient_22_0362
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0363 : Poly :=
[
  term ((-2191749122079140 : Rat) / 1162780221153193) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 363 for generator 22. -/
def ep_Q2_024_partial_22_0363 : Poly :=
[
  term ((-4383498244158280 : Rat) / 1162780221153193) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2191749122079140 : Rat) / 1162780221153193) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-4383498244158280 : Rat) / 1162780221153193) [(5, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((2191749122079140 : Rat) / 1162780221153193) [(5, 1), (8, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 22. -/
theorem ep_Q2_024_partial_22_0363_valid :
    mulPoly ep_Q2_024_coefficient_22_0363
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0364 : Poly :=
[
  term ((209196452186802053041246612565932308018 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1)]
]

/-- Partial product 364 for generator 22. -/
def ep_Q2_024_partial_22_0364 : Poly :=
[
  term ((418392904373604106082493225131864616036 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (10, 1)],
  term ((-209196452186802053041246612565932308018 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 2), (9, 1)],
  term ((418392904373604106082493225131864616036 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (11, 1)],
  term ((-209196452186802053041246612565932308018 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 22. -/
theorem ep_Q2_024_partial_22_0364_valid :
    mulPoly ep_Q2_024_coefficient_22_0364
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0365 : Poly :=
[
  term ((-87523393721084015496294258649550623636 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 365 for generator 22. -/
def ep_Q2_024_partial_22_0365 : Poly :=
[
  term ((-175046787442168030992588517299101247272 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((87523393721084015496294258649550623636 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 2), (9, 1), (11, 1), (13, 1)],
  term ((-175046787442168030992588517299101247272 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (11, 2), (13, 1)],
  term ((87523393721084015496294258649550623636 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 22. -/
theorem ep_Q2_024_partial_22_0365_valid :
    mulPoly ep_Q2_024_coefficient_22_0365
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0366 : Poly :=
[
  term ((5615162933473648375120314597520139357719412890664605124 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 366 for generator 22. -/
def ep_Q2_024_partial_22_0366 : Poly :=
[
  term ((11230325866947296750240629195040278715438825781329210248 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-5615162933473648375120314597520139357719412890664605124 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 2), (9, 1), (11, 1), (15, 1)],
  term ((11230325866947296750240629195040278715438825781329210248 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 2), (11, 2), (15, 1)],
  term ((-5615162933473648375120314597520139357719412890664605124 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 22. -/
theorem ep_Q2_024_partial_22_0366_valid :
    mulPoly ep_Q2_024_coefficient_22_0366
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0367 : Poly :=
[
  term ((958235945051344 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 367 for generator 22. -/
def ep_Q2_024_partial_22_0367 : Poly :=
[
  term ((1916471890102688 : Rat) / 1162780221153193) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-958235945051344 : Rat) / 1162780221153193) [(5, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1916471890102688 : Rat) / 1162780221153193) [(5, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-958235945051344 : Rat) / 1162780221153193) [(5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 22. -/
theorem ep_Q2_024_partial_22_0367_valid :
    mulPoly ep_Q2_024_coefficient_22_0367
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0368 : Poly :=
[
  term ((2026668639087705403624852686972380630 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 1), (12, 1)]
]

/-- Partial product 368 for generator 22. -/
def ep_Q2_024_partial_22_0368 : Poly :=
[
  term ((4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((-2026668639087705403624852686972380630 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 2), (9, 1), (12, 1)],
  term ((4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 2), (11, 1), (12, 1)],
  term ((-2026668639087705403624852686972380630 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 22. -/
theorem ep_Q2_024_partial_22_0368_valid :
    mulPoly ep_Q2_024_coefficient_22_0368
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0369 : Poly :=
[
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 369 for generator 22. -/
def ep_Q2_024_partial_22_0369 : Poly :=
[
  term ((-103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 2), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 3), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 22. -/
theorem ep_Q2_024_partial_22_0369_valid :
    mulPoly ep_Q2_024_coefficient_22_0369
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0370 : Poly :=
[
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 370 for generator 22. -/
def ep_Q2_024_partial_22_0370 : Poly :=
[
  term ((1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (8, 2), (9, 1), (12, 1), (15, 2)],
  term ((1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 2), (11, 1), (12, 1), (15, 2)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 3), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 22. -/
theorem ep_Q2_024_partial_22_0370_valid :
    mulPoly ep_Q2_024_coefficient_22_0370
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0371 : Poly :=
[
  term ((-850957154578940 : Rat) / 1162780221153193) [(5, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 371 for generator 22. -/
def ep_Q2_024_partial_22_0371 : Poly :=
[
  term ((-1701914309157880 : Rat) / 1162780221153193) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(5, 1), (8, 2), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1701914309157880 : Rat) / 1162780221153193) [(5, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(5, 1), (9, 3), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 22. -/
theorem ep_Q2_024_partial_22_0371_valid :
    mulPoly ep_Q2_024_coefficient_22_0371
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0372 : Poly :=
[
  term ((1723527582385063883590680985223473124536 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 372 for generator 22. -/
def ep_Q2_024_partial_22_0372 : Poly :=
[
  term ((3447055164770127767181361970446946249072 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1723527582385063883590680985223473124536 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 2), (9, 1), (13, 1), (15, 1)],
  term ((3447055164770127767181361970446946249072 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((-1723527582385063883590680985223473124536 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 22. -/
theorem ep_Q2_024_partial_22_0372_valid :
    mulPoly ep_Q2_024_coefficient_22_0372
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0373 : Poly :=
[
  term ((31253307641057329086985259166002805004 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (14, 1)]
]

/-- Partial product 373 for generator 22. -/
def ep_Q2_024_partial_22_0373 : Poly :=
[
  term ((62506615282114658173970518332005610008 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((-31253307641057329086985259166002805004 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 2), (9, 1), (14, 1)],
  term ((62506615282114658173970518332005610008 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (11, 1), (14, 1)],
  term ((-31253307641057329086985259166002805004 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 22. -/
theorem ep_Q2_024_partial_22_0373_valid :
    mulPoly ep_Q2_024_coefficient_22_0373
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0374 : Poly :=
[
  term ((3837692621981570704068833845432150086140131802040740909 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (9, 1), (15, 2)]
]

/-- Partial product 374 for generator 22. -/
def ep_Q2_024_partial_22_0374 : Poly :=
[
  term ((7675385243963141408137667690864300172280263604081481818 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (8, 1), (9, 1), (10, 1), (15, 2)],
  term ((-3837692621981570704068833845432150086140131802040740909 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (8, 2), (9, 1), (15, 2)],
  term ((7675385243963141408137667690864300172280263604081481818 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (9, 2), (11, 1), (15, 2)],
  term ((-3837692621981570704068833845432150086140131802040740909 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (9, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 22. -/
theorem ep_Q2_024_partial_22_0374_valid :
    mulPoly ep_Q2_024_coefficient_22_0374
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0375 : Poly :=
[
  term ((-11761952876044204 : Rat) / 1162780221153193) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 375 for generator 22. -/
def ep_Q2_024_partial_22_0375 : Poly :=
[
  term ((-23523905752088408 : Rat) / 1162780221153193) [(5, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((11761952876044204 : Rat) / 1162780221153193) [(5, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((-23523905752088408 : Rat) / 1162780221153193) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((11761952876044204 : Rat) / 1162780221153193) [(5, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 22. -/
theorem ep_Q2_024_partial_22_0375_valid :
    mulPoly ep_Q2_024_coefficient_22_0375
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0376 : Poly :=
[
  term ((-54048653648670671523063732942876943996 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (11, 1)]
]

/-- Partial product 376 for generator 22. -/
def ep_Q2_024_partial_22_0376 : Poly :=
[
  term ((-108097307297341343046127465885753887992 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 2), (10, 1), (11, 1)],
  term ((54048653648670671523063732942876943996 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 2), (9, 2), (11, 1)],
  term ((-108097307297341343046127465885753887992 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 3), (11, 2)],
  term ((54048653648670671523063732942876943996 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 4), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 22. -/
theorem ep_Q2_024_partial_22_0376_valid :
    mulPoly ep_Q2_024_coefficient_22_0376
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0377 : Poly :=
[
  term ((-51644304559123503875495656333637980088 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (9, 2), (15, 1)]
]

/-- Partial product 377 for generator 22. -/
def ep_Q2_024_partial_22_0377 : Poly :=
[
  term ((-103288609118247007750991312667275960176 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (8, 1), (9, 2), (10, 1), (15, 1)],
  term ((51644304559123503875495656333637980088 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (8, 2), (9, 2), (15, 1)],
  term ((-103288609118247007750991312667275960176 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (9, 3), (11, 1), (15, 1)],
  term ((51644304559123503875495656333637980088 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (9, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 22. -/
theorem ep_Q2_024_partial_22_0377_valid :
    mulPoly ep_Q2_024_coefficient_22_0377
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0378 : Poly :=
[
  term ((-181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 378 for generator 22. -/
def ep_Q2_024_partial_22_0378 : Poly :=
[
  term ((-362284247913818166067182223900731779716919672252456728 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((-362284247913818166067182223900731779716919672252456728 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 22. -/
theorem ep_Q2_024_partial_22_0378_valid :
    mulPoly ep_Q2_024_coefficient_22_0378
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0379 : Poly :=
[
  term ((751294408028112 : Rat) / 1162780221153193) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 379 for generator 22. -/
def ep_Q2_024_partial_22_0379 : Poly :=
[
  term ((1502588816056224 : Rat) / 1162780221153193) [(5, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-751294408028112 : Rat) / 1162780221153193) [(5, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1502588816056224 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-751294408028112 : Rat) / 1162780221153193) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 22. -/
theorem ep_Q2_024_partial_22_0379_valid :
    mulPoly ep_Q2_024_coefficient_22_0379
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0380 : Poly :=
[
  term ((-26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 1), (13, 2)]
]

/-- Partial product 380 for generator 22. -/
def ep_Q2_024_partial_22_0380 : Poly :=
[
  term ((-53633115470366065055858292117804268528 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (10, 1), (11, 1), (13, 2)],
  term ((26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 2), (11, 1), (13, 2)],
  term ((-53633115470366065055858292117804268528 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (11, 2), (13, 2)],
  term ((26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 22. -/
theorem ep_Q2_024_partial_22_0380_valid :
    mulPoly ep_Q2_024_coefficient_22_0380
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0381 : Poly :=
[
  term ((13408278867591516263964573029451067132 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 381 for generator 22. -/
def ep_Q2_024_partial_22_0381 : Poly :=
[
  term ((26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-13408278867591516263964573029451067132 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 2), (12, 1), (13, 1)],
  term ((26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-13408278867591516263964573029451067132 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 22. -/
theorem ep_Q2_024_partial_22_0381_valid :
    mulPoly ep_Q2_024_coefficient_22_0381
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0382 : Poly :=
[
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 382 for generator 22. -/
def ep_Q2_024_partial_22_0382 : Poly :=
[
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (8, 2), (12, 1), (13, 1), (15, 2)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (9, 2), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 22. -/
theorem ep_Q2_024_partial_22_0382_valid :
    mulPoly ep_Q2_024_coefficient_22_0382
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0383 : Poly :=
[
  term ((-4569079916135479 : Rat) / 1162780221153193) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 383 for generator 22. -/
def ep_Q2_024_partial_22_0383 : Poly :=
[
  term ((-9138159832270958 : Rat) / 1162780221153193) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(5, 1), (8, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9138159832270958 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(5, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 22. -/
theorem ep_Q2_024_partial_22_0383_valid :
    mulPoly ep_Q2_024_coefficient_22_0383
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0384 : Poly :=
[
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 384 for generator 22. -/
def ep_Q2_024_partial_22_0384 : Poly :=
[
  term ((-1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 2), (12, 1), (13, 2), (15, 1)],
  term ((-1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 22. -/
theorem ep_Q2_024_partial_22_0384_valid :
    mulPoly ep_Q2_024_coefficient_22_0384
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0385 : Poly :=
[
  term ((517345026498555078533059736541527536485782739623064626 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 385 for generator 22. -/
def ep_Q2_024_partial_22_0385 : Poly :=
[
  term ((1034690052997110157066119473083055072971565479246129252 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-517345026498555078533059736541527536485782739623064626 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 2), (12, 1), (15, 1)],
  term ((1034690052997110157066119473083055072971565479246129252 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-517345026498555078533059736541527536485782739623064626 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 22. -/
theorem ep_Q2_024_partial_22_0385_valid :
    mulPoly ep_Q2_024_coefficient_22_0385
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0386 : Poly :=
[
  term ((-375647204014056 : Rat) / 1162780221153193) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 386 for generator 22. -/
def ep_Q2_024_partial_22_0386 : Poly :=
[
  term ((-751294408028112 : Rat) / 1162780221153193) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((375647204014056 : Rat) / 1162780221153193) [(5, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-751294408028112 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((375647204014056 : Rat) / 1162780221153193) [(5, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 22. -/
theorem ep_Q2_024_partial_22_0386_valid :
    mulPoly ep_Q2_024_coefficient_22_0386
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0387 : Poly :=
[
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (12, 1), (15, 3)]
]

/-- Partial product 387 for generator 22. -/
def ep_Q2_024_partial_22_0387 : Poly :=
[
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 3)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (8, 2), (12, 1), (15, 3)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 3)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (9, 2), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 22. -/
theorem ep_Q2_024_partial_22_0387_valid :
    mulPoly ep_Q2_024_coefficient_22_0387
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0388 : Poly :=
[
  term ((13204414907240807 : Rat) / 1162780221153193) [(5, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 388 for generator 22. -/
def ep_Q2_024_partial_22_0388 : Poly :=
[
  term ((26408829814481614 : Rat) / 1162780221153193) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(5, 1), (8, 2), (12, 1), (15, 3), (16, 1)],
  term ((26408829814481614 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(5, 1), (9, 2), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 22. -/
theorem ep_Q2_024_partial_22_0388_valid :
    mulPoly ep_Q2_024_coefficient_22_0388
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0389 : Poly :=
[
  term ((742477114831003889902652494192571890898 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (13, 1)]
]

/-- Partial product 389 for generator 22. -/
def ep_Q2_024_partial_22_0389 : Poly :=
[
  term ((1484954229662007779805304988385143781796 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (10, 1), (13, 1)],
  term ((-742477114831003889902652494192571890898 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 2), (13, 1)],
  term ((1484954229662007779805304988385143781796 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-742477114831003889902652494192571890898 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 22. -/
theorem ep_Q2_024_partial_22_0389_valid :
    mulPoly ep_Q2_024_coefficient_22_0389
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0390 : Poly :=
[
  term ((25314934643249108054501486630154249128 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 390 for generator 22. -/
def ep_Q2_024_partial_22_0390 : Poly :=
[
  term ((50629869286498216109002973260308498256 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-25314934643249108054501486630154249128 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (8, 2), (13, 1), (14, 1)],
  term ((50629869286498216109002973260308498256 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-25314934643249108054501486630154249128 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (9, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 22. -/
theorem ep_Q2_024_partial_22_0390_valid :
    mulPoly ep_Q2_024_coefficient_22_0390
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0391 : Poly :=
[
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 391 for generator 22. -/
def ep_Q2_024_partial_22_0391 : Poly :=
[
  term ((3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 2), (13, 1), (14, 1), (15, 2)],
  term ((3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 2), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 22. -/
theorem ep_Q2_024_partial_22_0391_valid :
    mulPoly ep_Q2_024_coefficient_22_0391
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0392 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 392 for generator 22. -/
def ep_Q2_024_partial_22_0392 : Poly :=
[
  term ((1667935482081904 : Rat) / 1162780221153193) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (8, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 22. -/
theorem ep_Q2_024_partial_22_0392_valid :
    mulPoly ep_Q2_024_coefficient_22_0392
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0393 : Poly :=
[
  term ((-2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (13, 1), (15, 2)]
]

/-- Partial product 393 for generator 22. -/
def ep_Q2_024_partial_22_0393 : Poly :=
[
  term ((-2578326853107933456558538464757287301318301626202703904507 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(5, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (8, 2), (13, 1), (15, 2)],
  term ((-2578326853107933456558538464757287301318301626202703904507 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (9, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 22. -/
theorem ep_Q2_024_partial_22_0393_valid :
    mulPoly ep_Q2_024_coefficient_22_0393
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0394 : Poly :=
[
  term ((-50068166157171823 : Rat) / 6976681326919158) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 394 for generator 22. -/
def ep_Q2_024_partial_22_0394 : Poly :=
[
  term ((-50068166157171823 : Rat) / 3488340663459579) [(5, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((50068166157171823 : Rat) / 6976681326919158) [(5, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-50068166157171823 : Rat) / 3488340663459579) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((50068166157171823 : Rat) / 6976681326919158) [(5, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 22. -/
theorem ep_Q2_024_partial_22_0394_valid :
    mulPoly ep_Q2_024_coefficient_22_0394
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0395 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 395 for generator 22. -/
def ep_Q2_024_partial_22_0395 : Poly :=
[
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 2), (13, 2), (14, 1), (15, 1)],
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 22. -/
theorem ep_Q2_024_partial_22_0395_valid :
    mulPoly ep_Q2_024_coefficient_22_0395
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0396 : Poly :=
[
  term ((147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (13, 2), (15, 1)]
]

/-- Partial product 396 for generator 22. -/
def ep_Q2_024_partial_22_0396 : Poly :=
[
  term ((295694093352879208402661767357612912640 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (8, 1), (10, 1), (13, 2), (15, 1)],
  term ((-147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (8, 2), (13, 2), (15, 1)],
  term ((295694093352879208402661767357612912640 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (9, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 22. -/
theorem ep_Q2_024_partial_22_0396_valid :
    mulPoly ep_Q2_024_coefficient_22_0396
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0397 : Poly :=
[
  term ((-3604215933772667644964548832554545785372173888357363757 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 397 for generator 22. -/
def ep_Q2_024_partial_22_0397 : Poly :=
[
  term ((-7208431867545335289929097665109091570744347776714727514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((3604215933772667644964548832554545785372173888357363757 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (8, 2), (14, 1), (15, 1)],
  term ((-7208431867545335289929097665109091570744347776714727514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((3604215933772667644964548832554545785372173888357363757 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 22. -/
theorem ep_Q2_024_partial_22_0397_valid :
    mulPoly ep_Q2_024_coefficient_22_0397
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0398 : Poly :=
[
  term ((1864662107013684 : Rat) / 1162780221153193) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 398 for generator 22. -/
def ep_Q2_024_partial_22_0398 : Poly :=
[
  term ((3729324214027368 : Rat) / 1162780221153193) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1864662107013684 : Rat) / 1162780221153193) [(5, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((3729324214027368 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1864662107013684 : Rat) / 1162780221153193) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 22. -/
theorem ep_Q2_024_partial_22_0398_valid :
    mulPoly ep_Q2_024_coefficient_22_0398
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0399 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (14, 1), (15, 3)]
]

/-- Partial product 399 for generator 22. -/
def ep_Q2_024_partial_22_0399 : Poly :=
[
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 3)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (8, 2), (14, 1), (15, 3)],
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 3)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 2), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 22. -/
theorem ep_Q2_024_partial_22_0399_valid :
    mulPoly ep_Q2_024_coefficient_22_0399
        ep_Q2_024_generator_22_0300_0399 =
      ep_Q2_024_partial_22_0399 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_22_0300_0399 : List Poly :=
[
  ep_Q2_024_partial_22_0300,
  ep_Q2_024_partial_22_0301,
  ep_Q2_024_partial_22_0302,
  ep_Q2_024_partial_22_0303,
  ep_Q2_024_partial_22_0304,
  ep_Q2_024_partial_22_0305,
  ep_Q2_024_partial_22_0306,
  ep_Q2_024_partial_22_0307,
  ep_Q2_024_partial_22_0308,
  ep_Q2_024_partial_22_0309,
  ep_Q2_024_partial_22_0310,
  ep_Q2_024_partial_22_0311,
  ep_Q2_024_partial_22_0312,
  ep_Q2_024_partial_22_0313,
  ep_Q2_024_partial_22_0314,
  ep_Q2_024_partial_22_0315,
  ep_Q2_024_partial_22_0316,
  ep_Q2_024_partial_22_0317,
  ep_Q2_024_partial_22_0318,
  ep_Q2_024_partial_22_0319,
  ep_Q2_024_partial_22_0320,
  ep_Q2_024_partial_22_0321,
  ep_Q2_024_partial_22_0322,
  ep_Q2_024_partial_22_0323,
  ep_Q2_024_partial_22_0324,
  ep_Q2_024_partial_22_0325,
  ep_Q2_024_partial_22_0326,
  ep_Q2_024_partial_22_0327,
  ep_Q2_024_partial_22_0328,
  ep_Q2_024_partial_22_0329,
  ep_Q2_024_partial_22_0330,
  ep_Q2_024_partial_22_0331,
  ep_Q2_024_partial_22_0332,
  ep_Q2_024_partial_22_0333,
  ep_Q2_024_partial_22_0334,
  ep_Q2_024_partial_22_0335,
  ep_Q2_024_partial_22_0336,
  ep_Q2_024_partial_22_0337,
  ep_Q2_024_partial_22_0338,
  ep_Q2_024_partial_22_0339,
  ep_Q2_024_partial_22_0340,
  ep_Q2_024_partial_22_0341,
  ep_Q2_024_partial_22_0342,
  ep_Q2_024_partial_22_0343,
  ep_Q2_024_partial_22_0344,
  ep_Q2_024_partial_22_0345,
  ep_Q2_024_partial_22_0346,
  ep_Q2_024_partial_22_0347,
  ep_Q2_024_partial_22_0348,
  ep_Q2_024_partial_22_0349,
  ep_Q2_024_partial_22_0350,
  ep_Q2_024_partial_22_0351,
  ep_Q2_024_partial_22_0352,
  ep_Q2_024_partial_22_0353,
  ep_Q2_024_partial_22_0354,
  ep_Q2_024_partial_22_0355,
  ep_Q2_024_partial_22_0356,
  ep_Q2_024_partial_22_0357,
  ep_Q2_024_partial_22_0358,
  ep_Q2_024_partial_22_0359,
  ep_Q2_024_partial_22_0360,
  ep_Q2_024_partial_22_0361,
  ep_Q2_024_partial_22_0362,
  ep_Q2_024_partial_22_0363,
  ep_Q2_024_partial_22_0364,
  ep_Q2_024_partial_22_0365,
  ep_Q2_024_partial_22_0366,
  ep_Q2_024_partial_22_0367,
  ep_Q2_024_partial_22_0368,
  ep_Q2_024_partial_22_0369,
  ep_Q2_024_partial_22_0370,
  ep_Q2_024_partial_22_0371,
  ep_Q2_024_partial_22_0372,
  ep_Q2_024_partial_22_0373,
  ep_Q2_024_partial_22_0374,
  ep_Q2_024_partial_22_0375,
  ep_Q2_024_partial_22_0376,
  ep_Q2_024_partial_22_0377,
  ep_Q2_024_partial_22_0378,
  ep_Q2_024_partial_22_0379,
  ep_Q2_024_partial_22_0380,
  ep_Q2_024_partial_22_0381,
  ep_Q2_024_partial_22_0382,
  ep_Q2_024_partial_22_0383,
  ep_Q2_024_partial_22_0384,
  ep_Q2_024_partial_22_0385,
  ep_Q2_024_partial_22_0386,
  ep_Q2_024_partial_22_0387,
  ep_Q2_024_partial_22_0388,
  ep_Q2_024_partial_22_0389,
  ep_Q2_024_partial_22_0390,
  ep_Q2_024_partial_22_0391,
  ep_Q2_024_partial_22_0392,
  ep_Q2_024_partial_22_0393,
  ep_Q2_024_partial_22_0394,
  ep_Q2_024_partial_22_0395,
  ep_Q2_024_partial_22_0396,
  ep_Q2_024_partial_22_0397,
  ep_Q2_024_partial_22_0398,
  ep_Q2_024_partial_22_0399
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_22_0300_0399 : Poly :=
[
  term ((234156504057103443860076633253006959696947416259810814361 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 1), (8, 1), (10, 1), (15, 1)],
  term ((-29761634202336697 : Rat) / 3488340663459579) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((9332237164528159758625041614371109858011888728985178274 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (8, 1), (10, 1), (15, 3)],
  term ((-15583171243478152 : Rat) / 1162780221153193) [(3, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-234156504057103443860076633253006959696947416259810814361 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 1), (8, 2), (15, 1)],
  term ((29761634202336697 : Rat) / 6976681326919158) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (8, 2), (15, 3)],
  term ((7791585621739076 : Rat) / 1162780221153193) [(3, 1), (8, 2), (15, 3), (16, 1)],
  term ((234156504057103443860076633253006959696947416259810814361 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-29761634202336697 : Rat) / 3488340663459579) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((9332237164528159758625041614371109858011888728985178274 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (11, 1), (15, 3)],
  term ((-15583171243478152 : Rat) / 1162780221153193) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-234156504057103443860076633253006959696947416259810814361 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 1), (9, 2), (15, 1)],
  term ((29761634202336697 : Rat) / 6976681326919158) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((-4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 2), (15, 3)],
  term ((7791585621739076 : Rat) / 1162780221153193) [(3, 1), (9, 2), (15, 3), (16, 1)],
  term ((5860298469427302226261358975602624182032 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (4, 1), (8, 1), (10, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (4, 1), (8, 2)],
  term ((5860298469427302226261358975602624182032 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (4, 1), (9, 1), (11, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (4, 1), (9, 2)],
  term ((-33781967257793617486815206073153137696 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (8, 1), (9, 1), (10, 1)],
  term ((6165856953172307781425119933296829376 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((6639739927549625818104465621692298586214344944695385584 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-2487823789554368 : Rat) / 3488340663459579) [(3, 2), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((16890983628896808743407603036576568848 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (8, 2), (9, 1)],
  term ((-3082928476586153890712559966648414688 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (8, 2), (13, 1)],
  term ((-3319869963774812909052232810846149293107172472347692792 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (8, 2), (15, 1)],
  term ((1243911894777184 : Rat) / 3488340663459579) [(3, 2), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((6165856953172307781425119933296829376 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((6639739927549625818104465621692298586214344944695385584 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-2487823789554368 : Rat) / 3488340663459579) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 2), (11, 1)],
  term ((-3082928476586153890712559966648414688 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 2), (13, 1)],
  term ((-3319869963774812909052232810846149293107172472347692792 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (9, 2), (15, 1)],
  term ((1243911894777184 : Rat) / 3488340663459579) [(3, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((16890983628896808743407603036576568848 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 3)],
  term ((73424885016391334592524874103881802976 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((451584493334593143508692345332818085290440040420989034 : Rat) / 418499528459408918327148043876319653860305890461357621) [(3, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((1495148449544936 : Rat) / 3488340663459579) [(3, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3305390256600957304750147809747473899456 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (8, 1), (9, 1), (11, 1)],
  term ((1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (8, 1), (9, 2)],
  term ((126225064372939892662610287863400842112 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (9, 2), (10, 1)],
  term ((21828176908544582351077704092327537882272 : Rat) / 5398692558311147834550120876132926705955) [(3, 2), (8, 1), (10, 1)],
  term ((-359800988817789934888267636369853231432 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (10, 1), (12, 1)],
  term ((44365241360347559907548253348032480896 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-794982465900475775992368411131078542254382208882138752 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((2108843069097728 : Rat) / 1162780221153193) [(3, 2), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-36326709823775404890386910227678820329661108457314367451 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(3, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((10375057428886340 : Rat) / 3488340663459579) [(3, 2), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-394147835050448810694877824632526207856 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (8, 1), (10, 1), (13, 2)],
  term ((-508470349154038865005416199007327333444 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (8, 1), (10, 1), (14, 1)],
  term ((-408424516433622249313695112340266633602697230933700476949 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(3, 2), (8, 1), (10, 1), (15, 2)],
  term ((88310522894084572 : Rat) / 3488340663459579) [(3, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-10914088454272291175538852046163768941136 : Rat) / 5398692558311147834550120876132926705955) [(3, 2), (8, 2)],
  term ((-36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 2), (9, 1), (13, 1)],
  term ((-225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(3, 2), (8, 2), (9, 1), (15, 1)],
  term ((-747574224772468 : Rat) / 3488340663459579) [(3, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 2), (9, 2)],
  term ((-3305390256600957304750147809747473899456 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (8, 2), (10, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 2), (12, 1)],
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (8, 2), (12, 1), (13, 1), (15, 1)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (8, 2), (12, 1), (15, 2)],
  term ((-1054421534548864 : Rat) / 1162780221153193) [(3, 2), (8, 2), (12, 1), (15, 2), (16, 1)],
  term ((36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (8, 2), (13, 1), (15, 1)],
  term ((-5187528714443170 : Rat) / 3488340663459579) [(3, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (8, 2), (13, 2)],
  term ((254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (8, 2), (14, 1)],
  term ((408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (8, 2), (15, 2)],
  term ((-44155261447042286 : Rat) / 3488340663459579) [(3, 2), (8, 2), (15, 2), (16, 1)],
  term ((1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (8, 3)],
  term ((21828176908544582351077704092327537882272 : Rat) / 5398692558311147834550120876132926705955) [(3, 2), (9, 1), (11, 1)],
  term ((-359800988817789934888267636369853231432 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (11, 1), (12, 1)],
  term ((44365241360347559907548253348032480896 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-794982465900475775992368411131078542254382208882138752 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((2108843069097728 : Rat) / 1162780221153193) [(3, 2), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-36326709823775404890386910227678820329661108457314367451 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((10375057428886340 : Rat) / 3488340663459579) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-394147835050448810694877824632526207856 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (9, 1), (11, 1), (13, 2)],
  term ((-508470349154038865005416199007327333444 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (9, 1), (11, 1), (14, 1)],
  term ((-408424516433622249313695112340266633602697230933700476949 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(3, 2), (9, 1), (11, 1), (15, 2)],
  term ((88310522894084572 : Rat) / 3488340663459579) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-10914088454272291175538852046163768941136 : Rat) / 5398692558311147834550120876132926705955) [(3, 2), (9, 2)],
  term ((73424885016391334592524874103881802976 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 2), (11, 1), (13, 1)],
  term ((451584493334593143508692345332818085290440040420989034 : Rat) / 418499528459408918327148043876319653860305890461357621) [(3, 2), (9, 2), (11, 1), (15, 1)],
  term ((1495148449544936 : Rat) / 3488340663459579) [(3, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 2), (12, 1)],
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (9, 2), (12, 1), (15, 2)],
  term ((-1054421534548864 : Rat) / 1162780221153193) [(3, 2), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (9, 2), (13, 1), (15, 1)],
  term ((-5187528714443170 : Rat) / 3488340663459579) [(3, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (9, 2), (13, 2)],
  term ((254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (9, 2), (14, 1)],
  term ((408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (9, 2), (15, 2)],
  term ((-44155261447042286 : Rat) / 3488340663459579) [(3, 2), (9, 2), (15, 2), (16, 1)],
  term ((126225064372939892662610287863400842112 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 3), (11, 1)],
  term ((-36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 3), (13, 1)],
  term ((-225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(3, 2), (9, 3), (15, 1)],
  term ((-747574224772468 : Rat) / 3488340663459579) [(3, 2), (9, 3), (15, 1), (16, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 4)],
  term ((59650057575209561137067290883327108616 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (8, 1), (9, 1), (10, 1)],
  term ((668857603461202934641699118311289456528 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-13669849668400084703100681852326249469893897680729830248 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((1246882683236480 : Rat) / 1162780221153193) [(4, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-29825028787604780568533645441663554308 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (8, 2), (9, 1)],
  term ((-334428801730601467320849559155644728264 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (8, 2), (13, 1)],
  term ((6834924834200042351550340926163124734946948840364915124 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (8, 2), (15, 1)],
  term ((-623441341618240 : Rat) / 1162780221153193) [(4, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((668857603461202934641699118311289456528 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-13669849668400084703100681852326249469893897680729830248 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((1246882683236480 : Rat) / 1162780221153193) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((59650057575209561137067290883327108616 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (9, 2), (11, 1)],
  term ((-334428801730601467320849559155644728264 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (9, 2), (13, 1)],
  term ((6834924834200042351550340926163124734946948840364915124 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (9, 2), (15, 1)],
  term ((-623441341618240 : Rat) / 1162780221153193) [(4, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-29825028787604780568533645441663554308 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (9, 3)],
  term ((-157425345043273170788251404812382566120 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-5188478469540100254489206030911932864 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((1374972303907414548840208887197456385632 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (9, 1), (11, 1)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (9, 2)],
  term ((3835115182457325678732377184857873892259 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (8, 1), (10, 1)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(4, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-568644325026621762575192765377166648272 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((54805693310089908493956012483267081475473687630831750659 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-3463224556292844 : Rat) / 1162780221153193) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-759886289914525899007685491084977254144 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((21345026074172901101018040882151725630681379579515467272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-7729311995353440 : Rat) / 1162780221153193) [(4, 1), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((3839102125903499448760418504529800378641254344558196602 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-3096523100302504 : Rat) / 1162780221153193) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-727978642880172578435947266998542671616 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (10, 1), (13, 2)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (10, 1), (14, 1)],
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(4, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-69918679577492248026430828734293382217854215807982362809 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (8, 1), (10, 1), (15, 2)],
  term ((7731326449908388 : Rat) / 1162780221153193) [(4, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3835115182457325678732377184857873892259 : Rat) / 3599128372207431889700080584088617803970) [(4, 1), (8, 2)],
  term ((78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (8, 2), (9, 1), (11, 1)],
  term ((2594239234770050127244603015455966432 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (8, 2), (9, 1), (13, 1)],
  term ((-687486151953707274420104443598728192816 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (8, 2), (9, 1), (15, 1)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 2), (10, 1)],
  term ((-189971572478631474751921372771244313536 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 2), (11, 1), (12, 1), (13, 1)],
  term ((5336256518543225275254510220537931407670344894878866818 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (8, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1932327998838360 : Rat) / 1162780221153193) [(4, 1), (8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((284322162513310881287596382688583324136 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 2), (11, 1), (13, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 2), (11, 1), (13, 1), (14, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (8, 2), (11, 1), (14, 1), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 1), (8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-54805693310089908493956012483267081475473687630831750659 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(4, 1), (8, 2), (11, 1), (15, 1)],
  term ((1731612278146422 : Rat) / 1162780221153193) [(4, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 2), (12, 1), (13, 1), (15, 1)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (8, 2), (12, 1), (15, 2)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(4, 1), (8, 2), (12, 1), (15, 2), (16, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1919551062951749724380209252264900189320627172279098301 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (8, 2), (13, 1), (15, 1)],
  term ((1548261550151252 : Rat) / 1162780221153193) [(4, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((363989321440086289217973633499271335808 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 2), (13, 2)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 2), (14, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (8, 2), (14, 1), (15, 2)],
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (8, 2), (14, 1), (15, 2), (16, 1)],
  term ((69918679577492248026430828734293382217854215807982362809 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(4, 1), (8, 2), (15, 2)],
  term ((-3865663224954194 : Rat) / 1162780221153193) [(4, 1), (8, 2), (15, 2), (16, 1)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 3)],
  term ((3835115182457325678732377184857873892259 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (9, 1), (11, 1)],
  term ((-759886289914525899007685491084977254144 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((21345026074172901101018040882151725630681379579515467272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-7729311995353440 : Rat) / 1162780221153193) [(4, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((3839102125903499448760418504529800378641254344558196602 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3096523100302504 : Rat) / 1162780221153193) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-727978642880172578435947266998542671616 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (11, 1), (13, 2)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (11, 1), (14, 1)],
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(4, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-69918679577492248026430828734293382217854215807982362809 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (9, 1), (11, 1), (15, 2)],
  term ((7731326449908388 : Rat) / 1162780221153193) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(4, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-568644325026621762575192765377166648272 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (11, 2), (13, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (9, 1), (11, 2), (14, 1), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((54805693310089908493956012483267081475473687630831750659 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (9, 1), (11, 2), (15, 1)],
  term ((-3463224556292844 : Rat) / 1162780221153193) [(4, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3835115182457325678732377184857873892259 : Rat) / 3599128372207431889700080584088617803970) [(4, 1), (9, 2)],
  term ((-189971572478631474751921372771244313536 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((5336256518543225275254510220537931407670344894878866818 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1932327998838360 : Rat) / 1162780221153193) [(4, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((206494985470209377470258292224904331176 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 2), (11, 1), (13, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (9, 2), (11, 1), (14, 1), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26027462516984290367708617553869271993443081457221537091 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(4, 1), (9, 2), (11, 1), (15, 1)],
  term ((1731612278146422 : Rat) / 1162780221153193) [(4, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-157425345043273170788251404812382566120 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (9, 2), (11, 2)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 2), (12, 1), (15, 2)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(4, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1919551062951749724380209252264900189320627172279098301 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (9, 2), (13, 1), (15, 1)],
  term ((1548261550151252 : Rat) / 1162780221153193) [(4, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((363989321440086289217973633499271335808 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 2), (13, 2)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 2), (14, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (9, 2), (14, 1), (15, 2)],
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((69918679577492248026430828734293382217854215807982362809 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(4, 1), (9, 2), (15, 2)],
  term ((-3865663224954194 : Rat) / 1162780221153193) [(4, 1), (9, 2), (15, 2), (16, 1)],
  term ((78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (9, 3), (11, 1)],
  term ((2594239234770050127244603015455966432 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (9, 3), (13, 1)],
  term ((-687486151953707274420104443598728192816 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 3), (15, 1)],
  term ((179024474755913241033395817994367019248 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-217055731795270408881847813552023254066 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (8, 1), (10, 1)],
  term ((234752536678976224689491461331679415648 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((3985248181647266426199509399378651190832537409401261088 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (8, 1), (10, 1), (15, 2)],
  term ((-6113826032736512 : Rat) / 1162780221153193) [(5, 1), (7, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((108527865897635204440923906776011627033 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (8, 2)],
  term ((-89512237377956620516697908997183509624 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (8, 2), (9, 1), (15, 1)],
  term ((-117376268339488112344745730665839707824 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (8, 2), (13, 1), (15, 1)],
  term ((-1992624090823633213099754699689325595416268704700630544 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (8, 2), (15, 2)],
  term ((3056913016368256 : Rat) / 1162780221153193) [(5, 1), (7, 1), (8, 2), (15, 2), (16, 1)],
  term ((-217055731795270408881847813552023254066 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 1), (11, 1)],
  term ((234752536678976224689491461331679415648 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((3985248181647266426199509399378651190832537409401261088 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2)],
  term ((-6113826032736512 : Rat) / 1162780221153193) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((108527865897635204440923906776011627033 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 2)],
  term ((179024474755913241033395817994367019248 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1)],
  term ((-117376268339488112344745730665839707824 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1)],
  term ((-1992624090823633213099754699689325595416268704700630544 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (9, 2), (15, 2)],
  term ((3056913016368256 : Rat) / 1162780221153193) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-89512237377956620516697908997183509624 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 3), (15, 1)],
  term ((418392904373604106082493225131864616036 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (10, 1)],
  term ((-175046787442168030992588517299101247272 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((11230325866947296750240629195040278715438825781329210248 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((1916471890102688 : Rat) / 1162780221153193) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((-103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((-1701914309157880 : Rat) / 1162780221153193) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((3447055164770127767181361970446946249072 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((62506615282114658173970518332005610008 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((7675385243963141408137667690864300172280263604081481818 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (8, 1), (9, 1), (10, 1), (15, 2)],
  term ((-23523905752088408 : Rat) / 1162780221153193) [(5, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((55336908423872330872375057049994467560 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((9366188617259831682951404959577554152018406032402611558 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-4383498244158280 : Rat) / 1162780221153193) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-108097307297341343046127465885753887992 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 2), (10, 1), (11, 1)],
  term ((-103288609118247007750991312667275960176 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (8, 1), (9, 2), (10, 1), (15, 1)],
  term ((82748362035000547651813077460048653132 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 2), (11, 1)],
  term ((-27668454211936165436187528524997233780 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (8, 1), (9, 2), (13, 1)],
  term ((-4683094308629915841475702479788777076009203016201305779 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (9, 2), (15, 1)],
  term ((2191749122079140 : Rat) / 1162780221153193) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-41374181017500273825906538730024326566 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 3)],
  term ((-362284247913818166067182223900731779716919672252456728 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((1502588816056224 : Rat) / 1162780221153193) [(5, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-53633115470366065055858292117804268528 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (10, 1), (11, 1), (13, 2)],
  term ((26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-9138159832270958 : Rat) / 1162780221153193) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((1034690052997110157066119473083055072971565479246129252 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-751294408028112 : Rat) / 1162780221153193) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 3)],
  term ((26408829814481614 : Rat) / 1162780221153193) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((1484954229662007779805304988385143781796 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (10, 1), (13, 1)],
  term ((50629869286498216109002973260308498256 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2578326853107933456558538464757287301318301626202703904507 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(5, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-50068166157171823 : Rat) / 3488340663459579) [(5, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((295694093352879208402661767357612912640 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (8, 1), (10, 1), (13, 2), (15, 1)],
  term ((-7208431867545335289929097665109091570744347776714727514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((3729324214027368 : Rat) / 1162780221153193) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 3)],
  term ((-209196452186802053041246612565932308018 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 2), (9, 1)],
  term ((82748362035000547651813077460048653132 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 2), (9, 1), (10, 1)],
  term ((87523393721084015496294258649550623636 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 2), (9, 1), (11, 1), (13, 1)],
  term ((-5615162933473648375120314597520139357719412890664605124 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 2), (9, 1), (11, 1), (15, 1)],
  term ((-958235945051344 : Rat) / 1162780221153193) [(5, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2026668639087705403624852686972380630 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 2), (9, 1), (12, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 2), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (8, 2), (9, 1), (12, 1), (15, 2)],
  term ((850957154578940 : Rat) / 1162780221153193) [(5, 1), (8, 2), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1723527582385063883590680985223473124536 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 2), (9, 1), (13, 1), (15, 1)],
  term ((-31253307641057329086985259166002805004 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 2), (9, 1), (14, 1)],
  term ((-3837692621981570704068833845432150086140131802040740909 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (8, 2), (9, 1), (15, 2)],
  term ((11761952876044204 : Rat) / 1162780221153193) [(5, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((54048653648670671523063732942876943996 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 2), (9, 2), (11, 1)],
  term ((51644304559123503875495656333637980088 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (8, 2), (9, 2), (15, 1)],
  term ((55336908423872330872375057049994467560 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (8, 2), (10, 1), (13, 1)],
  term ((9366188617259831682951404959577554152018406032402611558 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 2), (10, 1), (15, 1)],
  term ((-4383498244158280 : Rat) / 1162780221153193) [(5, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((-751294408028112 : Rat) / 1162780221153193) [(5, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 2), (11, 1), (13, 2)],
  term ((-13408278867591516263964573029451067132 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 2), (12, 1), (13, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (8, 2), (12, 1), (13, 1), (15, 2)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(5, 1), (8, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 2), (12, 1), (13, 2), (15, 1)],
  term ((-517345026498555078533059736541527536485782739623064626 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 2), (12, 1), (15, 1)],
  term ((375647204014056 : Rat) / 1162780221153193) [(5, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (8, 2), (12, 1), (15, 3)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(5, 1), (8, 2), (12, 1), (15, 3), (16, 1)],
  term ((-742477114831003889902652494192571890898 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 2), (13, 1)],
  term ((-25314934643249108054501486630154249128 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (8, 2), (13, 1), (14, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 2), (13, 1), (14, 1), (15, 2)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (8, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (8, 2), (13, 1), (15, 2)],
  term ((50068166157171823 : Rat) / 6976681326919158) [(5, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 2), (13, 2), (14, 1), (15, 1)],
  term ((-147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (8, 2), (13, 2), (15, 1)],
  term ((3604215933772667644964548832554545785372173888357363757 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (8, 2), (14, 1), (15, 1)],
  term ((-1864662107013684 : Rat) / 1162780221153193) [(5, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (8, 2), (14, 1), (15, 3)],
  term ((-41374181017500273825906538730024326566 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 3), (9, 1)],
  term ((-27668454211936165436187528524997233780 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (8, 3), (13, 1)],
  term ((-4683094308629915841475702479788777076009203016201305779 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 3), (15, 1)],
  term ((2191749122079140 : Rat) / 1162780221153193) [(5, 1), (8, 3), (15, 1), (16, 1)],
  term ((26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-9138159832270958 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((1034690052997110157066119473083055072971565479246129252 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-751294408028112 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 3)],
  term ((26408829814481614 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((1484954229662007779805304988385143781796 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (11, 1), (13, 1)],
  term ((50629869286498216109002973260308498256 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2578326853107933456558538464757287301318301626202703904507 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-50068166157171823 : Rat) / 3488340663459579) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((295694093352879208402661767357612912640 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-7208431867545335289929097665109091570744347776714727514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((3729324214027368 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 3)],
  term ((-362284247913818166067182223900731779716919672252456728 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((1502588816056224 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-53633115470366065055858292117804268528 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (11, 2), (13, 2)],
  term ((418392904373604106082493225131864616036 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (11, 1)],
  term ((4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 2), (11, 1), (12, 1)],
  term ((-103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 2), (11, 1), (12, 1), (15, 2)],
  term ((-1701914309157880 : Rat) / 1162780221153193) [(5, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((12930213320240541318701987966097159487121519905569402508 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((-751294408028112 : Rat) / 1162780221153193) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (11, 1), (13, 2)],
  term ((62506615282114658173970518332005610008 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (11, 1), (14, 1)],
  term ((7675385243963141408137667690864300172280263604081481818 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (9, 2), (11, 1), (15, 2)],
  term ((-23523905752088408 : Rat) / 1162780221153193) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-175046787442168030992588517299101247272 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (11, 2), (13, 1)],
  term ((11230325866947296750240629195040278715438825781329210248 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 2), (11, 2), (15, 1)],
  term ((1916471890102688 : Rat) / 1162780221153193) [(5, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-13408278867591516263964573029451067132 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (12, 1), (13, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (9, 2), (12, 1), (13, 1), (15, 2)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(5, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (12, 1), (13, 2), (15, 1)],
  term ((-517345026498555078533059736541527536485782739623064626 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 2), (12, 1), (15, 1)],
  term ((375647204014056 : Rat) / 1162780221153193) [(5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (9, 2), (12, 1), (15, 3)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(5, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((-742477114831003889902652494192571890898 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (13, 1)],
  term ((-25314934643249108054501486630154249128 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (9, 2), (13, 1), (14, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 2), (13, 1), (14, 1), (15, 2)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (9, 2), (13, 1), (15, 2)],
  term ((50068166157171823 : Rat) / 6976681326919158) [(5, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (13, 2), (14, 1), (15, 1)],
  term ((-147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (9, 2), (13, 2), (15, 1)],
  term ((3604215933772667644964548832554545785372173888357363757 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 2), (14, 1), (15, 1)],
  term ((-1864662107013684 : Rat) / 1162780221153193) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 2), (14, 1), (15, 3)],
  term ((-209196452186802053041246612565932308018 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 3)],
  term ((87523393721084015496294258649550623636 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 3), (11, 1), (13, 1)],
  term ((-6215672692239253188630004624373803620733785315980814964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 3), (11, 1), (15, 1)],
  term ((-958235945051344 : Rat) / 1162780221153193) [(5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-108097307297341343046127465885753887992 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 3), (11, 2)],
  term ((-2026668639087705403624852686972380630 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 3), (12, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 3), (12, 1), (13, 1), (15, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 3), (12, 1), (15, 2)],
  term ((850957154578940 : Rat) / 1162780221153193) [(5, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((-1723527582385063883590680985223473124536 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 3), (13, 1), (15, 1)],
  term ((-31253307641057329086985259166002805004 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 3), (14, 1)],
  term ((-3837692621981570704068833845432150086140131802040740909 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (9, 3), (15, 2)],
  term ((11761952876044204 : Rat) / 1162780221153193) [(5, 1), (9, 3), (15, 2), (16, 1)],
  term ((54048653648670671523063732942876943996 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 4), (11, 1)],
  term ((51644304559123503875495656333637980088 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (9, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 22, terms 300 through 399. -/
theorem ep_Q2_024_block_22_0300_0399_valid :
    checkProductSumEq ep_Q2_024_partials_22_0300_0399
      ep_Q2_024_block_22_0300_0399 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
