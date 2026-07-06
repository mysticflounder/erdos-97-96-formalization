/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 4:300-399

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 4 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_04_0300_0399 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0300 : Poly :=
[
  term ((63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 2)]
]

/-- Partial product 300 for generator 4. -/
def ep_Q2_024_partial_04_0300 : Poly :=
[
  term ((63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 2), (9, 2)],
  term ((-63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 2), (10, 2)],
  term ((-63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 2), (11, 2)],
  term ((63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(3, 4), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 4. -/
theorem ep_Q2_024_partial_04_0300_valid :
    mulPoly ep_Q2_024_coefficient_04_0300
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0301 : Poly :=
[
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (12, 1)]
]

/-- Partial product 301 for generator 4. -/
def ep_Q2_024_partial_04_0301 : Poly :=
[
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 2), (12, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (10, 2), (12, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (11, 2), (12, 1)],
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(3, 4), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 4. -/
theorem ep_Q2_024_partial_04_0301_valid :
    mulPoly ep_Q2_024_coefficient_04_0301
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0302 : Poly :=
[
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 302 for generator 4. -/
def ep_Q2_024_partial_04_0302 : Poly :=
[
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 2), (12, 1), (13, 1), (15, 1)],
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(3, 4), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 4. -/
theorem ep_Q2_024_partial_04_0302_valid :
    mulPoly ep_Q2_024_coefficient_04_0302
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0303 : Poly :=
[
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (12, 1), (15, 2)]
]

/-- Partial product 303 for generator 4. -/
def ep_Q2_024_partial_04_0303 : Poly :=
[
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (3, 2), (12, 1), (15, 2)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (10, 2), (12, 1), (15, 2)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (11, 2), (12, 1), (15, 2)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 4), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 4. -/
theorem ep_Q2_024_partial_04_0303_valid :
    mulPoly ep_Q2_024_coefficient_04_0303
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0304 : Poly :=
[
  term ((1054421534548864 : Rat) / 1162780221153193) [(3, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 304 for generator 4. -/
def ep_Q2_024_partial_04_0304 : Poly :=
[
  term ((1054421534548864 : Rat) / 1162780221153193) [(2, 2), (3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1054421534548864 : Rat) / 1162780221153193) [(3, 2), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1054421534548864 : Rat) / 1162780221153193) [(3, 2), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(3, 4), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 4. -/
theorem ep_Q2_024_partial_04_0304_valid :
    mulPoly ep_Q2_024_coefficient_04_0304
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0305 : Poly :=
[
  term ((-36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (13, 1), (15, 1)]
]

/-- Partial product 305 for generator 4. -/
def ep_Q2_024_partial_04_0305 : Poly :=
[
  term ((-36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(2, 2), (3, 2), (13, 1), (15, 1)],
  term ((36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (10, 2), (13, 1), (15, 1)],
  term ((36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (11, 2), (13, 1), (15, 1)],
  term ((-36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 4), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 4. -/
theorem ep_Q2_024_partial_04_0305_valid :
    mulPoly ep_Q2_024_coefficient_04_0305
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0306 : Poly :=
[
  term ((5187528714443170 : Rat) / 3488340663459579) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 306 for generator 4. -/
def ep_Q2_024_partial_04_0306 : Poly :=
[
  term ((5187528714443170 : Rat) / 3488340663459579) [(2, 2), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5187528714443170 : Rat) / 3488340663459579) [(3, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5187528714443170 : Rat) / 3488340663459579) [(3, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((5187528714443170 : Rat) / 3488340663459579) [(3, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 4. -/
theorem ep_Q2_024_partial_04_0306_valid :
    mulPoly ep_Q2_024_coefficient_04_0306
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0307 : Poly :=
[
  term ((-197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (13, 2)]
]

/-- Partial product 307 for generator 4. -/
def ep_Q2_024_partial_04_0307 : Poly :=
[
  term ((-197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (3, 2), (13, 2)],
  term ((197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (10, 2), (13, 2)],
  term ((197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (11, 2), (13, 2)],
  term ((-197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(3, 4), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 4. -/
theorem ep_Q2_024_partial_04_0307_valid :
    mulPoly ep_Q2_024_coefficient_04_0307
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0308 : Poly :=
[
  term ((-254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (14, 1)]
]

/-- Partial product 308 for generator 4. -/
def ep_Q2_024_partial_04_0308 : Poly :=
[
  term ((-254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (3, 2), (14, 1)],
  term ((254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (10, 2), (14, 1)],
  term ((254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (11, 2), (14, 1)],
  term ((-254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(3, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 4. -/
theorem ep_Q2_024_partial_04_0308_valid :
    mulPoly ep_Q2_024_coefficient_04_0308
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0309 : Poly :=
[
  term ((-408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (15, 2)]
]

/-- Partial product 309 for generator 4. -/
def ep_Q2_024_partial_04_0309 : Poly :=
[
  term ((-408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(2, 2), (3, 2), (15, 2)],
  term ((408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (10, 2), (15, 2)],
  term ((408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (11, 2), (15, 2)],
  term ((-408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 4. -/
theorem ep_Q2_024_partial_04_0309_valid :
    mulPoly ep_Q2_024_coefficient_04_0309
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0310 : Poly :=
[
  term ((44155261447042286 : Rat) / 3488340663459579) [(3, 2), (15, 2), (16, 1)]
]

/-- Partial product 310 for generator 4. -/
def ep_Q2_024_partial_04_0310 : Poly :=
[
  term ((44155261447042286 : Rat) / 3488340663459579) [(2, 2), (3, 2), (15, 2), (16, 1)],
  term ((-44155261447042286 : Rat) / 3488340663459579) [(3, 2), (10, 2), (15, 2), (16, 1)],
  term ((-44155261447042286 : Rat) / 3488340663459579) [(3, 2), (11, 2), (15, 2), (16, 1)],
  term ((44155261447042286 : Rat) / 3488340663459579) [(3, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 4. -/
theorem ep_Q2_024_partial_04_0310_valid :
    mulPoly ep_Q2_024_coefficient_04_0310
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0311 : Poly :=
[
  term ((6693479571835934517496439208731643141221 : Rat) / 3599128372207431889700080584088617803970) [(4, 1)]
]

/-- Partial product 311 for generator 4. -/
def ep_Q2_024_partial_04_0311 : Poly :=
[
  term ((6693479571835934517496439208731643141221 : Rat) / 3599128372207431889700080584088617803970) [(2, 2), (4, 1)],
  term ((6693479571835934517496439208731643141221 : Rat) / 3599128372207431889700080584088617803970) [(3, 2), (4, 1)],
  term ((-6693479571835934517496439208731643141221 : Rat) / 3599128372207431889700080584088617803970) [(4, 1), (10, 2)],
  term ((-6693479571835934517496439208731643141221 : Rat) / 3599128372207431889700080584088617803970) [(4, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 4. -/
theorem ep_Q2_024_partial_04_0311_valid :
    mulPoly ep_Q2_024_coefficient_04_0311
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0312 : Poly :=
[
  term ((29825028787604780568533645441663554308 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (9, 1)]
]

/-- Partial product 312 for generator 4. -/
def ep_Q2_024_partial_04_0312 : Poly :=
[
  term ((29825028787604780568533645441663554308 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (4, 1), (7, 1), (9, 1)],
  term ((29825028787604780568533645441663554308 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (4, 1), (7, 1), (9, 1)],
  term ((-29825028787604780568533645441663554308 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (9, 1), (10, 2)],
  term ((-29825028787604780568533645441663554308 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 4. -/
theorem ep_Q2_024_partial_04_0312_valid :
    mulPoly ep_Q2_024_coefficient_04_0312
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0313 : Poly :=
[
  term ((-362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 313 for generator 4. -/
def ep_Q2_024_partial_04_0313 : Poly :=
[
  term ((-362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (7, 1), (12, 1), (13, 1)],
  term ((-362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (7, 1), (12, 1), (13, 1)],
  term ((362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (10, 2), (12, 1), (13, 1)],
  term ((362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 4. -/
theorem ep_Q2_024_partial_04_0313_valid :
    mulPoly ep_Q2_024_coefficient_04_0313
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0314 : Poly :=
[
  term ((3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 314 for generator 4. -/
def ep_Q2_024_partial_04_0314 : Poly :=
[
  term ((3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (10, 2), (12, 1), (15, 1)],
  term ((-3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 4. -/
theorem ep_Q2_024_partial_04_0314_valid :
    mulPoly ep_Q2_024_coefficient_04_0314
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0315 : Poly :=
[
  term ((-2393155378199320 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 315 for generator 4. -/
def ep_Q2_024_partial_04_0315 : Poly :=
[
  term ((-2393155378199320 : Rat) / 1162780221153193) [(2, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2393155378199320 : Rat) / 1162780221153193) [(3, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((2393155378199320 : Rat) / 1162780221153193) [(4, 1), (7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((2393155378199320 : Rat) / 1162780221153193) [(4, 1), (7, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 4. -/
theorem ep_Q2_024_partial_04_0315_valid :
    mulPoly ep_Q2_024_coefficient_04_0315
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0316 : Poly :=
[
  term ((231518366891497076390294429922018140216 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (13, 1)]
]

/-- Partial product 316 for generator 4. -/
def ep_Q2_024_partial_04_0316 : Poly :=
[
  term ((231518366891497076390294429922018140216 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (4, 1), (7, 1), (13, 1)],
  term ((231518366891497076390294429922018140216 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (4, 1), (7, 1), (13, 1)],
  term ((-231518366891497076390294429922018140216 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (10, 2), (13, 1)],
  term ((-231518366891497076390294429922018140216 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 4. -/
theorem ep_Q2_024_partial_04_0316_valid :
    mulPoly ep_Q2_024_coefficient_04_0316
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0317 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 317 for generator 4. -/
def ep_Q2_024_partial_04_0317 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (7, 1), (13, 1), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (7, 1), (13, 1), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (10, 2), (13, 1), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 4. -/
theorem ep_Q2_024_partial_04_0317_valid :
    mulPoly ep_Q2_024_coefficient_04_0317
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0318 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 318 for generator 4. -/
def ep_Q2_024_partial_04_0318 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (10, 2), (14, 1), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 4. -/
theorem ep_Q2_024_partial_04_0318_valid :
    mulPoly ep_Q2_024_coefficient_04_0318
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0319 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 319 for generator 4. -/
def ep_Q2_024_partial_04_0319 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(2, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(3, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 1), (7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 1), (7, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 4. -/
theorem ep_Q2_024_partial_04_0319_valid :
    mulPoly ep_Q2_024_coefficient_04_0319
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0320 : Poly :=
[
  term ((-18300701104668210892020572581297611620999517782762837141 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 320 for generator 4. -/
def ep_Q2_024_partial_04_0320 : Poly :=
[
  term ((-18300701104668210892020572581297611620999517782762837141 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (4, 1), (7, 1), (15, 1)],
  term ((-18300701104668210892020572581297611620999517782762837141 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (4, 1), (7, 1), (15, 1)],
  term ((18300701104668210892020572581297611620999517782762837141 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (10, 2), (15, 1)],
  term ((18300701104668210892020572581297611620999517782762837141 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 4. -/
theorem ep_Q2_024_partial_04_0320_valid :
    mulPoly ep_Q2_024_coefficient_04_0320
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0321 : Poly :=
[
  term ((2599612849297084 : Rat) / 1162780221153193) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 321 for generator 4. -/
def ep_Q2_024_partial_04_0321 : Poly :=
[
  term ((2599612849297084 : Rat) / 1162780221153193) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((2599612849297084 : Rat) / 1162780221153193) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2599612849297084 : Rat) / 1162780221153193) [(4, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-2599612849297084 : Rat) / 1162780221153193) [(4, 1), (7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 4. -/
theorem ep_Q2_024_partial_04_0321_valid :
    mulPoly ep_Q2_024_coefficient_04_0321
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0322 : Poly :=
[
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1)]
]

/-- Partial product 322 for generator 4. -/
def ep_Q2_024_partial_04_0322 : Poly :=
[
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (8, 1)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (8, 1)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (10, 2)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 4. -/
theorem ep_Q2_024_partial_04_0322_valid :
    mulPoly ep_Q2_024_coefficient_04_0322
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0323 : Poly :=
[
  term ((-78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (9, 1), (11, 1)]
]

/-- Partial product 323 for generator 4. -/
def ep_Q2_024_partial_04_0323 : Poly :=
[
  term ((-78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (4, 1), (9, 1), (11, 1)],
  term ((-78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (4, 1), (9, 1), (11, 1)],
  term ((78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (9, 1), (10, 2), (11, 1)],
  term ((78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 4. -/
theorem ep_Q2_024_partial_04_0323_valid :
    mulPoly ep_Q2_024_coefficient_04_0323
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0324 : Poly :=
[
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 324 for generator 4. -/
def ep_Q2_024_partial_04_0324 : Poly :=
[
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (9, 1), (12, 1), (13, 1)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (9, 1), (12, 1), (13, 1)],
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (10, 2), (12, 1), (13, 1)],
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 4. -/
theorem ep_Q2_024_partial_04_0324_valid :
    mulPoly ep_Q2_024_coefficient_04_0324
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0325 : Poly :=
[
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 325 for generator 4. -/
def ep_Q2_024_partial_04_0325 : Poly :=
[
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 4. -/
theorem ep_Q2_024_partial_04_0325_valid :
    mulPoly ep_Q2_024_coefficient_04_0325
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0326 : Poly :=
[
  term ((3864655997676720 : Rat) / 1162780221153193) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 326 for generator 4. -/
def ep_Q2_024_partial_04_0326 : Poly :=
[
  term ((3864655997676720 : Rat) / 1162780221153193) [(2, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(3, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3864655997676720 : Rat) / 1162780221153193) [(4, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-3864655997676720 : Rat) / 1162780221153193) [(4, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 4. -/
theorem ep_Q2_024_partial_04_0326_valid :
    mulPoly ep_Q2_024_coefficient_04_0326
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0327 : Poly :=
[
  term ((-260180511621487903538724291374951437816 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 327 for generator 4. -/
def ep_Q2_024_partial_04_0327 : Poly :=
[
  term ((-260180511621487903538724291374951437816 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (9, 1), (13, 1)],
  term ((-260180511621487903538724291374951437816 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (9, 1), (13, 1)],
  term ((260180511621487903538724291374951437816 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (10, 2), (13, 1)],
  term ((260180511621487903538724291374951437816 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 4. -/
theorem ep_Q2_024_partial_04_0327_valid :
    mulPoly ep_Q2_024_coefficient_04_0327
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0328 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 328 for generator 4. -/
def ep_Q2_024_partial_04_0328 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (9, 1), (13, 1), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (9, 1), (13, 1), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (10, 2), (13, 1), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 4. -/
theorem ep_Q2_024_partial_04_0328_valid :
    mulPoly ep_Q2_024_coefficient_04_0328
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0329 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 329 for generator 4. -/
def ep_Q2_024_partial_04_0329 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (9, 1), (10, 2), (14, 1), (15, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (9, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 4. -/
theorem ep_Q2_024_partial_04_0329_valid :
    mulPoly ep_Q2_024_coefficient_04_0329
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0330 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 330 for generator 4. -/
def ep_Q2_024_partial_04_0330 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(2, 2), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(3, 2), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(4, 1), (9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(4, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 4. -/
theorem ep_Q2_024_partial_04_0330_valid :
    mulPoly ep_Q2_024_coefficient_04_0330
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0331 : Poly :=
[
  term ((56021116588060305458288304628496712352617198659830157684 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 331 for generator 4. -/
def ep_Q2_024_partial_04_0331 : Poly :=
[
  term ((56021116588060305458288304628496712352617198659830157684 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(2, 2), (4, 1), (9, 1), (15, 1)],
  term ((56021116588060305458288304628496712352617198659830157684 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(3, 2), (4, 1), (9, 1), (15, 1)],
  term ((-56021116588060305458288304628496712352617198659830157684 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (9, 1), (10, 2), (15, 1)],
  term ((-56021116588060305458288304628496712352617198659830157684 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 4. -/
theorem ep_Q2_024_partial_04_0331_valid :
    mulPoly ep_Q2_024_coefficient_04_0331
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0332 : Poly :=
[
  term ((-5208468627123472 : Rat) / 1162780221153193) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 332 for generator 4. -/
def ep_Q2_024_partial_04_0332 : Poly :=
[
  term ((-5208468627123472 : Rat) / 1162780221153193) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5208468627123472 : Rat) / 1162780221153193) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((5208468627123472 : Rat) / 1162780221153193) [(4, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((5208468627123472 : Rat) / 1162780221153193) [(4, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 4. -/
theorem ep_Q2_024_partial_04_0332_valid :
    mulPoly ep_Q2_024_coefficient_04_0332
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0333 : Poly :=
[
  term ((-5006205965083545439327033641042020892532 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (9, 2)]
]

/-- Partial product 333 for generator 4. -/
def ep_Q2_024_partial_04_0333 : Poly :=
[
  term ((-5006205965083545439327033641042020892532 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (4, 1), (9, 2)],
  term ((-5006205965083545439327033641042020892532 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (4, 1), (9, 2)],
  term ((5006205965083545439327033641042020892532 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (9, 2), (10, 2)],
  term ((5006205965083545439327033641042020892532 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 4. -/
theorem ep_Q2_024_partial_04_0333_valid :
    mulPoly ep_Q2_024_coefficient_04_0333
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0334 : Poly :=
[
  term ((189971572478631474751921372771244313536 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 334 for generator 4. -/
def ep_Q2_024_partial_04_0334 : Poly :=
[
  term ((189971572478631474751921372771244313536 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((189971572478631474751921372771244313536 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((-189971572478631474751921372771244313536 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (10, 2), (11, 1), (12, 1), (13, 1)],
  term ((-189971572478631474751921372771244313536 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 4. -/
theorem ep_Q2_024_partial_04_0334_valid :
    mulPoly ep_Q2_024_coefficient_04_0334
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0335 : Poly :=
[
  term ((-5336256518543225275254510220537931407670344894878866818 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 335 for generator 4. -/
def ep_Q2_024_partial_04_0335 : Poly :=
[
  term ((-5336256518543225275254510220537931407670344894878866818 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-5336256518543225275254510220537931407670344894878866818 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((5336256518543225275254510220537931407670344894878866818 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((5336256518543225275254510220537931407670344894878866818 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 4. -/
theorem ep_Q2_024_partial_04_0335_valid :
    mulPoly ep_Q2_024_coefficient_04_0335
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0336 : Poly :=
[
  term ((1932327998838360 : Rat) / 1162780221153193) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 336 for generator 4. -/
def ep_Q2_024_partial_04_0336 : Poly :=
[
  term ((1932327998838360 : Rat) / 1162780221153193) [(2, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1932327998838360 : Rat) / 1162780221153193) [(3, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1932327998838360 : Rat) / 1162780221153193) [(4, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1932327998838360 : Rat) / 1162780221153193) [(4, 1), (11, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 4. -/
theorem ep_Q2_024_partial_04_0336_valid :
    mulPoly ep_Q2_024_coefficient_04_0336
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0337 : Poly :=
[
  term ((-95127668764712964325924806602093243624 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 337 for generator 4. -/
def ep_Q2_024_partial_04_0337 : Poly :=
[
  term ((-95127668764712964325924806602093243624 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (4, 1), (11, 1), (13, 1)],
  term ((-95127668764712964325924806602093243624 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (4, 1), (11, 1), (13, 1)],
  term ((95127668764712964325924806602093243624 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (10, 2), (11, 1), (13, 1)],
  term ((95127668764712964325924806602093243624 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 4. -/
theorem ep_Q2_024_partial_04_0337_valid :
    mulPoly ep_Q2_024_coefficient_04_0337
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0338 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 338 for generator 4. -/
def ep_Q2_024_partial_04_0338 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (11, 1), (13, 1), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (11, 1), (13, 1), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (10, 2), (11, 1), (13, 1), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 4. -/
theorem ep_Q2_024_partial_04_0338_valid :
    mulPoly ep_Q2_024_coefficient_04_0338
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0339 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 339 for generator 4. -/
def ep_Q2_024_partial_04_0339 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (10, 2), (11, 1), (14, 1), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (11, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 4. -/
theorem ep_Q2_024_partial_04_0339_valid :
    mulPoly ep_Q2_024_coefficient_04_0339
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0340 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 340 for generator 4. -/
def ep_Q2_024_partial_04_0340 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(2, 2), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(3, 2), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 1), (10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 1), (11, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 4. -/
theorem ep_Q2_024_partial_04_0340_valid :
    mulPoly ep_Q2_024_coefficient_04_0340
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0341 : Poly :=
[
  term ((26138240661491091603815861206626990290624951583875075257 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 341 for generator 4. -/
def ep_Q2_024_partial_04_0341 : Poly :=
[
  term ((26138240661491091603815861206626990290624951583875075257 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(2, 2), (4, 1), (11, 1), (15, 1)],
  term ((26138240661491091603815861206626990290624951583875075257 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(3, 2), (4, 1), (11, 1), (15, 1)],
  term ((-26138240661491091603815861206626990290624951583875075257 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (10, 2), (11, 1), (15, 1)],
  term ((-26138240661491091603815861206626990290624951583875075257 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 4. -/
theorem ep_Q2_024_partial_04_0341_valid :
    mulPoly ep_Q2_024_coefficient_04_0341
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0342 : Poly :=
[
  term ((-1940104213406660 : Rat) / 1162780221153193) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 342 for generator 4. -/
def ep_Q2_024_partial_04_0342 : Poly :=
[
  term ((-1940104213406660 : Rat) / 1162780221153193) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1940104213406660 : Rat) / 1162780221153193) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((1940104213406660 : Rat) / 1162780221153193) [(4, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((1940104213406660 : Rat) / 1162780221153193) [(4, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 4. -/
theorem ep_Q2_024_partial_04_0342_valid :
    mulPoly ep_Q2_024_coefficient_04_0342
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0343 : Poly :=
[
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 343 for generator 4. -/
def ep_Q2_024_partial_04_0343 : Poly :=
[
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 4. -/
theorem ep_Q2_024_partial_04_0343_valid :
    mulPoly ep_Q2_024_coefficient_04_0343
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0344 : Poly :=
[
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (12, 1), (15, 2)]
]

/-- Partial product 344 for generator 4. -/
def ep_Q2_024_partial_04_0344 : Poly :=
[
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (4, 1), (12, 1), (15, 2)],
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (4, 1), (12, 1), (15, 2)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (10, 2), (12, 1), (15, 2)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 4. -/
theorem ep_Q2_024_partial_04_0344_valid :
    mulPoly ep_Q2_024_coefficient_04_0344
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0345 : Poly :=
[
  term ((-3864655997676720 : Rat) / 1162780221153193) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 345 for generator 4. -/
def ep_Q2_024_partial_04_0345 : Poly :=
[
  term ((-3864655997676720 : Rat) / 1162780221153193) [(2, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3864655997676720 : Rat) / 1162780221153193) [(3, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(4, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(4, 1), (11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 4. -/
theorem ep_Q2_024_partial_04_0345_valid :
    mulPoly ep_Q2_024_coefficient_04_0345
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0346 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 346 for generator 4. -/
def ep_Q2_024_partial_04_0346 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (10, 2), (13, 1), (14, 1), (15, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 4. -/
theorem ep_Q2_024_partial_04_0346_valid :
    mulPoly ep_Q2_024_coefficient_04_0346
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0347 : Poly :=
[
  term ((2239959554401533773629257787639876717735868667370925423 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 347 for generator 4. -/
def ep_Q2_024_partial_04_0347 : Poly :=
[
  term ((2239959554401533773629257787639876717735868667370925423 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (4, 1), (13, 1), (15, 1)],
  term ((2239959554401533773629257787639876717735868667370925423 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (4, 1), (13, 1), (15, 1)],
  term ((-2239959554401533773629257787639876717735868667370925423 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (10, 2), (13, 1), (15, 1)],
  term ((-2239959554401533773629257787639876717735868667370925423 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 4. -/
theorem ep_Q2_024_partial_04_0347_valid :
    mulPoly ep_Q2_024_coefficient_04_0347
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0348 : Poly :=
[
  term ((-3411054761874308 : Rat) / 1162780221153193) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 348 for generator 4. -/
def ep_Q2_024_partial_04_0348 : Poly :=
[
  term ((-3411054761874308 : Rat) / 1162780221153193) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3411054761874308 : Rat) / 1162780221153193) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((3411054761874308 : Rat) / 1162780221153193) [(4, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((3411054761874308 : Rat) / 1162780221153193) [(4, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 4. -/
theorem ep_Q2_024_partial_04_0348_valid :
    mulPoly ep_Q2_024_coefficient_04_0348
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0349 : Poly :=
[
  term ((-85380732109718715181452610388146230064 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (13, 2)]
]

/-- Partial product 349 for generator 4. -/
def ep_Q2_024_partial_04_0349 : Poly :=
[
  term ((-85380732109718715181452610388146230064 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (4, 1), (13, 2)],
  term ((-85380732109718715181452610388146230064 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (4, 1), (13, 2)],
  term ((85380732109718715181452610388146230064 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (10, 2), (13, 2)],
  term ((85380732109718715181452610388146230064 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 4. -/
theorem ep_Q2_024_partial_04_0349_valid :
    mulPoly ep_Q2_024_coefficient_04_0349
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0350 : Poly :=
[
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (14, 1)]
]

/-- Partial product 350 for generator 4. -/
def ep_Q2_024_partial_04_0350 : Poly :=
[
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (14, 1)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (14, 1)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (10, 2), (14, 1)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 4. -/
theorem ep_Q2_024_partial_04_0350_valid :
    mulPoly ep_Q2_024_coefficient_04_0350
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0351 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (14, 1), (15, 2)]
]

/-- Partial product 351 for generator 4. -/
def ep_Q2_024_partial_04_0351 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (4, 1), (14, 1), (15, 2)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (4, 1), (14, 1), (15, 2)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (10, 2), (14, 1), (15, 2)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 4. -/
theorem ep_Q2_024_partial_04_0351_valid :
    mulPoly ep_Q2_024_coefficient_04_0351
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0352 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(4, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 352 for generator 4. -/
def ep_Q2_024_partial_04_0352 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(2, 2), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(3, 2), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 4. -/
theorem ep_Q2_024_partial_04_0352_valid :
    mulPoly ep_Q2_024_coefficient_04_0352
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0353 : Poly :=
[
  term ((-69918679577492248026430828734293382217854215807982362809 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(4, 1), (15, 2)]
]

/-- Partial product 353 for generator 4. -/
def ep_Q2_024_partial_04_0353 : Poly :=
[
  term ((-69918679577492248026430828734293382217854215807982362809 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(2, 2), (4, 1), (15, 2)],
  term ((-69918679577492248026430828734293382217854215807982362809 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (4, 1), (15, 2)],
  term ((69918679577492248026430828734293382217854215807982362809 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(4, 1), (10, 2), (15, 2)],
  term ((69918679577492248026430828734293382217854215807982362809 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(4, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 4. -/
theorem ep_Q2_024_partial_04_0353_valid :
    mulPoly ep_Q2_024_coefficient_04_0353
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0354 : Poly :=
[
  term ((3865663224954194 : Rat) / 1162780221153193) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 354 for generator 4. -/
def ep_Q2_024_partial_04_0354 : Poly :=
[
  term ((3865663224954194 : Rat) / 1162780221153193) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((3865663224954194 : Rat) / 1162780221153193) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((-3865663224954194 : Rat) / 1162780221153193) [(4, 1), (10, 2), (15, 2), (16, 1)],
  term ((-3865663224954194 : Rat) / 1162780221153193) [(4, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 4. -/
theorem ep_Q2_024_partial_04_0354_valid :
    mulPoly ep_Q2_024_coefficient_04_0354
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0355 : Poly :=
[
  term ((-3835115182457325678732377184857873892259 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1)]
]

/-- Partial product 355 for generator 4. -/
def ep_Q2_024_partial_04_0355 : Poly :=
[
  term ((-3835115182457325678732377184857873892259 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (5, 1), (7, 1)],
  term ((-3835115182457325678732377184857873892259 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (5, 1), (7, 1)],
  term ((3835115182457325678732377184857873892259 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (10, 2)],
  term ((3835115182457325678732377184857873892259 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 4. -/
theorem ep_Q2_024_partial_04_0355_valid :
    mulPoly ep_Q2_024_coefficient_04_0355
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0356 : Poly :=
[
  term ((89512237377956620516697908997183509624 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 356 for generator 4. -/
def ep_Q2_024_partial_04_0356 : Poly :=
[
  term ((89512237377956620516697908997183509624 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((89512237377956620516697908997183509624 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-89512237377956620516697908997183509624 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 1), (10, 2), (15, 1)],
  term ((-89512237377956620516697908997183509624 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 4. -/
theorem ep_Q2_024_partial_04_0356_valid :
    mulPoly ep_Q2_024_coefficient_04_0356
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0357 : Poly :=
[
  term ((117376268339488112344745730665839707824 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 357 for generator 4. -/
def ep_Q2_024_partial_04_0357 : Poly :=
[
  term ((117376268339488112344745730665839707824 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((117376268339488112344745730665839707824 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-117376268339488112344745730665839707824 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((-117376268339488112344745730665839707824 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 4. -/
theorem ep_Q2_024_partial_04_0357_valid :
    mulPoly ep_Q2_024_coefficient_04_0357
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0358 : Poly :=
[
  term ((1992624090823633213099754699689325595416268704700630544 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (15, 2)]
]

/-- Partial product 358 for generator 4. -/
def ep_Q2_024_partial_04_0358 : Poly :=
[
  term ((1992624090823633213099754699689325595416268704700630544 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (5, 1), (7, 1), (15, 2)],
  term ((1992624090823633213099754699689325595416268704700630544 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (7, 1), (15, 2)],
  term ((-1992624090823633213099754699689325595416268704700630544 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (10, 2), (15, 2)],
  term ((-1992624090823633213099754699689325595416268704700630544 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 4. -/
theorem ep_Q2_024_partial_04_0358_valid :
    mulPoly ep_Q2_024_coefficient_04_0358
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0359 : Poly :=
[
  term ((-3056913016368256 : Rat) / 1162780221153193) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 359 for generator 4. -/
def ep_Q2_024_partial_04_0359 : Poly :=
[
  term ((-3056913016368256 : Rat) / 1162780221153193) [(2, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-3056913016368256 : Rat) / 1162780221153193) [(3, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((3056913016368256 : Rat) / 1162780221153193) [(5, 1), (7, 1), (10, 2), (15, 2), (16, 1)],
  term ((3056913016368256 : Rat) / 1162780221153193) [(5, 1), (7, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 4. -/
theorem ep_Q2_024_partial_04_0359_valid :
    mulPoly ep_Q2_024_coefficient_04_0359
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0360 : Poly :=
[
  term ((14349854193164938064374672258585854568 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1)]
]

/-- Partial product 360 for generator 4. -/
def ep_Q2_024_partial_04_0360 : Poly :=
[
  term ((14349854193164938064374672258585854568 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (8, 1), (9, 1)],
  term ((14349854193164938064374672258585854568 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (8, 1), (9, 1)],
  term ((-14349854193164938064374672258585854568 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (10, 2)],
  term ((-14349854193164938064374672258585854568 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 4. -/
theorem ep_Q2_024_partial_04_0360_valid :
    mulPoly ep_Q2_024_coefficient_04_0360
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0361 : Poly :=
[
  term ((37457210064370384990869044955245942896 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (13, 1)]
]

/-- Partial product 361 for generator 4. -/
def ep_Q2_024_partial_04_0361 : Poly :=
[
  term ((37457210064370384990869044955245942896 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (8, 1), (13, 1)],
  term ((37457210064370384990869044955245942896 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (8, 1), (13, 1)],
  term ((-37457210064370384990869044955245942896 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (10, 2), (13, 1)],
  term ((-37457210064370384990869044955245942896 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 4. -/
theorem ep_Q2_024_partial_04_0361_valid :
    mulPoly ep_Q2_024_coefficient_04_0361
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0362 : Poly :=
[
  term ((7490675775366740029035859778548846754868909461533608341 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 362 for generator 4. -/
def ep_Q2_024_partial_04_0362 : Poly :=
[
  term ((7490675775366740029035859778548846754868909461533608341 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (5, 1), (8, 1), (15, 1)],
  term ((7490675775366740029035859778548846754868909461533608341 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (8, 1), (15, 1)],
  term ((-7490675775366740029035859778548846754868909461533608341 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (10, 2), (15, 1)],
  term ((-7490675775366740029035859778548846754868909461533608341 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 4. -/
theorem ep_Q2_024_partial_04_0362_valid :
    mulPoly ep_Q2_024_coefficient_04_0362
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0363 : Poly :=
[
  term ((-1712631149553468 : Rat) / 1162780221153193) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 363 for generator 4. -/
def ep_Q2_024_partial_04_0363 : Poly :=
[
  term ((-1712631149553468 : Rat) / 1162780221153193) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1712631149553468 : Rat) / 1162780221153193) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((1712631149553468 : Rat) / 1162780221153193) [(5, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((1712631149553468 : Rat) / 1162780221153193) [(5, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 4. -/
theorem ep_Q2_024_partial_04_0363_valid :
    mulPoly ep_Q2_024_coefficient_04_0363
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0364 : Poly :=
[
  term ((-92330534445805177857214717474193773253 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1)]
]

/-- Partial product 364 for generator 4. -/
def ep_Q2_024_partial_04_0364 : Poly :=
[
  term ((-92330534445805177857214717474193773253 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (5, 1), (9, 1)],
  term ((-92330534445805177857214717474193773253 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (5, 1), (9, 1)],
  term ((92330534445805177857214717474193773253 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (10, 2)],
  term ((92330534445805177857214717474193773253 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 4. -/
theorem ep_Q2_024_partial_04_0364_valid :
    mulPoly ep_Q2_024_coefficient_04_0364
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0365 : Poly :=
[
  term ((-60706835985900982968365112590648489372 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 365 for generator 4. -/
def ep_Q2_024_partial_04_0365 : Poly :=
[
  term ((-60706835985900982968365112590648489372 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-60706835985900982968365112590648489372 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((60706835985900982968365112590648489372 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (10, 2), (11, 1), (13, 1)],
  term ((60706835985900982968365112590648489372 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 4. -/
theorem ep_Q2_024_partial_04_0365_valid :
    mulPoly ep_Q2_024_coefficient_04_0365
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0366 : Poly :=
[
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 366 for generator 4. -/
def ep_Q2_024_partial_04_0366 : Poly :=
[
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 4. -/
theorem ep_Q2_024_partial_04_0366_valid :
    mulPoly ep_Q2_024_coefficient_04_0366
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0367 : Poly :=
[
  term ((206941537023232 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 367 for generator 4. -/
def ep_Q2_024_partial_04_0367 : Poly :=
[
  term ((206941537023232 : Rat) / 1162780221153193) [(2, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((206941537023232 : Rat) / 1162780221153193) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(5, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 4. -/
theorem ep_Q2_024_partial_04_0367_valid :
    mulPoly ep_Q2_024_coefficient_04_0367
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0368 : Poly :=
[
  term ((18323269958141488713583785326786994 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 1), (12, 1)]
]

/-- Partial product 368 for generator 4. -/
def ep_Q2_024_partial_04_0368 : Poly :=
[
  term ((18323269958141488713583785326786994 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (5, 1), (9, 1), (12, 1)],
  term ((18323269958141488713583785326786994 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (5, 1), (9, 1), (12, 1)],
  term ((-18323269958141488713583785326786994 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 1), (10, 2), (12, 1)],
  term ((-18323269958141488713583785326786994 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 4. -/
theorem ep_Q2_024_partial_04_0368_valid :
    mulPoly ep_Q2_024_coefficient_04_0368
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0369 : Poly :=
[
  term ((-82880159691963191721220131217699149244046279209273226701 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 369 for generator 4. -/
def ep_Q2_024_partial_04_0369 : Poly :=
[
  term ((-82880159691963191721220131217699149244046279209273226701 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 2), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-82880159691963191721220131217699149244046279209273226701 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 2), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((82880159691963191721220131217699149244046279209273226701 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(5, 1), (9, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((82880159691963191721220131217699149244046279209273226701 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 4. -/
theorem ep_Q2_024_partial_04_0369_valid :
    mulPoly ep_Q2_024_coefficient_04_0369
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0370 : Poly :=
[
  term ((4569079916135479 : Rat) / 1162780221153193) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 370 for generator 4. -/
def ep_Q2_024_partial_04_0370 : Poly :=
[
  term ((4569079916135479 : Rat) / 1162780221153193) [(2, 2), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(3, 2), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(5, 1), (9, 1), (10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 4. -/
theorem ep_Q2_024_partial_04_0370_valid :
    mulPoly ep_Q2_024_coefficient_04_0370
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0371 : Poly :=
[
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (12, 1), (13, 2)]
]

/-- Partial product 371 for generator 4. -/
def ep_Q2_024_partial_04_0371 : Poly :=
[
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (9, 1), (12, 1), (13, 2)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 1), (12, 1), (13, 2)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (10, 2), (12, 1), (13, 2)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (11, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 4. -/
theorem ep_Q2_024_partial_04_0371_valid :
    mulPoly ep_Q2_024_coefficient_04_0371
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0372 : Poly :=
[
  term ((59144323728544569663950617251380340511696398315795173931 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 372 for generator 4. -/
def ep_Q2_024_partial_04_0372 : Poly :=
[
  term ((59144323728544569663950617251380340511696398315795173931 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (5, 1), (9, 1), (12, 1), (15, 2)],
  term ((59144323728544569663950617251380340511696398315795173931 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 2), (5, 1), (9, 1), (12, 1), (15, 2)],
  term ((-59144323728544569663950617251380340511696398315795173931 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (9, 1), (10, 2), (12, 1), (15, 2)],
  term ((-59144323728544569663950617251380340511696398315795173931 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (9, 1), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 4. -/
theorem ep_Q2_024_partial_04_0372_valid :
    mulPoly ep_Q2_024_coefficient_04_0372
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0373 : Poly :=
[
  term ((-14055372061819747 : Rat) / 1162780221153193) [(5, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 373 for generator 4. -/
def ep_Q2_024_partial_04_0373 : Poly :=
[
  term ((-14055372061819747 : Rat) / 1162780221153193) [(2, 2), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-14055372061819747 : Rat) / 1162780221153193) [(3, 2), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((14055372061819747 : Rat) / 1162780221153193) [(5, 1), (9, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((14055372061819747 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 4. -/
theorem ep_Q2_024_partial_04_0373_valid :
    mulPoly ep_Q2_024_coefficient_04_0373
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0374 : Poly :=
[
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 374 for generator 4. -/
def ep_Q2_024_partial_04_0374 : Poly :=
[
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 1), (10, 2), (13, 1), (14, 1), (15, 1)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 4. -/
theorem ep_Q2_024_partial_04_0374_valid :
    mulPoly ep_Q2_024_coefficient_04_0374
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0375 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 375 for generator 4. -/
def ep_Q2_024_partial_04_0375 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(2, 2), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(3, 2), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 4. -/
theorem ep_Q2_024_partial_04_0375_valid :
    mulPoly ep_Q2_024_coefficient_04_0375
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0376 : Poly :=
[
  term ((2443287352284661239804894474642139007200075315438964941147 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 376 for generator 4. -/
def ep_Q2_024_partial_04_0376 : Poly :=
[
  term ((2443287352284661239804894474642139007200075315438964941147 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(2, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((2443287352284661239804894474642139007200075315438964941147 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-2443287352284661239804894474642139007200075315438964941147 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-2443287352284661239804894474642139007200075315438964941147 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 4. -/
theorem ep_Q2_024_partial_04_0376_valid :
    mulPoly ep_Q2_024_coefficient_04_0376
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0377 : Poly :=
[
  term ((50972133270704143 : Rat) / 6976681326919158) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 377 for generator 4. -/
def ep_Q2_024_partial_04_0377 : Poly :=
[
  term ((50972133270704143 : Rat) / 6976681326919158) [(2, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((50972133270704143 : Rat) / 6976681326919158) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-50972133270704143 : Rat) / 6976681326919158) [(5, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-50972133270704143 : Rat) / 6976681326919158) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 4. -/
theorem ep_Q2_024_partial_04_0377_valid :
    mulPoly ep_Q2_024_coefficient_04_0377
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0378 : Poly :=
[
  term ((-8413519746542290140853554206891491552 : Rat) / 30501087900062982116102377831259472915) [(5, 1), (9, 1), (13, 2)]
]

/-- Partial product 378 for generator 4. -/
def ep_Q2_024_partial_04_0378 : Poly :=
[
  term ((-8413519746542290140853554206891491552 : Rat) / 30501087900062982116102377831259472915) [(2, 2), (5, 1), (9, 1), (13, 2)],
  term ((-8413519746542290140853554206891491552 : Rat) / 30501087900062982116102377831259472915) [(3, 2), (5, 1), (9, 1), (13, 2)],
  term ((8413519746542290140853554206891491552 : Rat) / 30501087900062982116102377831259472915) [(5, 1), (9, 1), (10, 2), (13, 2)],
  term ((8413519746542290140853554206891491552 : Rat) / 30501087900062982116102377831259472915) [(5, 1), (9, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 4. -/
theorem ep_Q2_024_partial_04_0378_valid :
    mulPoly ep_Q2_024_coefficient_04_0378
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0379 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (13, 2), (14, 1)]
]

/-- Partial product 379 for generator 4. -/
def ep_Q2_024_partial_04_0379 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (9, 1), (13, 2), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 1), (13, 2), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (10, 2), (13, 2), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 4. -/
theorem ep_Q2_024_partial_04_0379_valid :
    mulPoly ep_Q2_024_coefficient_04_0379
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0380 : Poly :=
[
  term ((1088234496859695692403660104699568916 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 1), (14, 1)]
]

/-- Partial product 380 for generator 4. -/
def ep_Q2_024_partial_04_0380 : Poly :=
[
  term ((1088234496859695692403660104699568916 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (5, 1), (9, 1), (14, 1)],
  term ((1088234496859695692403660104699568916 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (5, 1), (9, 1), (14, 1)],
  term ((-1088234496859695692403660104699568916 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 1), (10, 2), (14, 1)],
  term ((-1088234496859695692403660104699568916 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 4. -/
theorem ep_Q2_024_partial_04_0380_valid :
    mulPoly ep_Q2_024_coefficient_04_0380
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0381 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (14, 1), (15, 2)]
]

/-- Partial product 381 for generator 4. -/
def ep_Q2_024_partial_04_0381 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (5, 1), (9, 1), (14, 1), (15, 2)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (5, 1), (9, 1), (14, 1), (15, 2)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (10, 2), (14, 1), (15, 2)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 4. -/
theorem ep_Q2_024_partial_04_0381_valid :
    mulPoly ep_Q2_024_coefficient_04_0381
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0382 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 382 for generator 4. -/
def ep_Q2_024_partial_04_0382 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(2, 2), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(3, 2), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 4. -/
theorem ep_Q2_024_partial_04_0382_valid :
    mulPoly ep_Q2_024_coefficient_04_0382
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0383 : Poly :=
[
  term ((-86353266237025408527984191198243109898558782738502362689 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (9, 1), (15, 2)]
]

/-- Partial product 383 for generator 4. -/
def ep_Q2_024_partial_04_0383 : Poly :=
[
  term ((-86353266237025408527984191198243109898558782738502362689 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (5, 1), (9, 1), (15, 2)],
  term ((-86353266237025408527984191198243109898558782738502362689 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 2), (5, 1), (9, 1), (15, 2)],
  term ((86353266237025408527984191198243109898558782738502362689 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (9, 1), (10, 2), (15, 2)],
  term ((86353266237025408527984191198243109898558782738502362689 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (9, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 4. -/
theorem ep_Q2_024_partial_04_0383_valid :
    mulPoly ep_Q2_024_coefficient_04_0383
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0384 : Poly :=
[
  term ((-83751611881079719 : Rat) / 6976681326919158) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 384 for generator 4. -/
def ep_Q2_024_partial_04_0384 : Poly :=
[
  term ((-83751611881079719 : Rat) / 6976681326919158) [(2, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-83751611881079719 : Rat) / 6976681326919158) [(3, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((83751611881079719 : Rat) / 6976681326919158) [(5, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((83751611881079719 : Rat) / 6976681326919158) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 4. -/
theorem ep_Q2_024_partial_04_0384_valid :
    mulPoly ep_Q2_024_coefficient_04_0384
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0385 : Poly :=
[
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (11, 1)]
]

/-- Partial product 385 for generator 4. -/
def ep_Q2_024_partial_04_0385 : Poly :=
[
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (9, 2), (11, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (9, 2), (11, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (10, 2), (11, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 4. -/
theorem ep_Q2_024_partial_04_0385_valid :
    mulPoly ep_Q2_024_coefficient_04_0385
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0386 : Poly :=
[
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (12, 1), (13, 1)]
]

/-- Partial product 386 for generator 4. -/
def ep_Q2_024_partial_04_0386 : Poly :=
[
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (9, 2), (12, 1), (13, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 2), (12, 1), (13, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (10, 2), (12, 1), (13, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 4. -/
theorem ep_Q2_024_partial_04_0386_valid :
    mulPoly ep_Q2_024_coefficient_04_0386
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0387 : Poly :=
[
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 2), (12, 1), (15, 1)]
]

/-- Partial product 387 for generator 4. -/
def ep_Q2_024_partial_04_0387 : Poly :=
[
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 1), (9, 2), (12, 1), (15, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 1), (9, 2), (12, 1), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 2), (10, 2), (12, 1), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 2), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 4. -/
theorem ep_Q2_024_partial_04_0387_valid :
    mulPoly ep_Q2_024_coefficient_04_0387
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0388 : Poly :=
[
  term ((850957154578940 : Rat) / 1162780221153193) [(5, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 388 for generator 4. -/
def ep_Q2_024_partial_04_0388 : Poly :=
[
  term ((850957154578940 : Rat) / 1162780221153193) [(2, 2), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(3, 2), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(5, 1), (9, 2), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(5, 1), (9, 2), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 4. -/
theorem ep_Q2_024_partial_04_0388_valid :
    mulPoly ep_Q2_024_coefficient_04_0388
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0389 : Poly :=
[
  term ((-4734346978865850413804621104676717765176 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (13, 1)]
]

/-- Partial product 389 for generator 4. -/
def ep_Q2_024_partial_04_0389 : Poly :=
[
  term ((-4734346978865850413804621104676717765176 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (9, 2), (13, 1)],
  term ((-4734346978865850413804621104676717765176 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 2), (13, 1)],
  term ((4734346978865850413804621104676717765176 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (10, 2), (13, 1)],
  term ((4734346978865850413804621104676717765176 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 4. -/
theorem ep_Q2_024_partial_04_0389_valid :
    mulPoly ep_Q2_024_coefficient_04_0389
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0390 : Poly :=
[
  term ((-20668105331471010267993197546776929644090380130936505931 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 2), (15, 1)]
]

/-- Partial product 390 for generator 4. -/
def ep_Q2_024_partial_04_0390 : Poly :=
[
  term ((-20668105331471010267993197546776929644090380130936505931 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 1), (9, 2), (15, 1)],
  term ((-20668105331471010267993197546776929644090380130936505931 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 1), (9, 2), (15, 1)],
  term ((20668105331471010267993197546776929644090380130936505931 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 2), (10, 2), (15, 1)],
  term ((20668105331471010267993197546776929644090380130936505931 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 4. -/
theorem ep_Q2_024_partial_04_0390_valid :
    mulPoly ep_Q2_024_coefficient_04_0390
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0391 : Poly :=
[
  term ((41170422024312028 : Rat) / 3488340663459579) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 391 for generator 4. -/
def ep_Q2_024_partial_04_0391 : Poly :=
[
  term ((41170422024312028 : Rat) / 3488340663459579) [(2, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((41170422024312028 : Rat) / 3488340663459579) [(3, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-41170422024312028 : Rat) / 3488340663459579) [(5, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-41170422024312028 : Rat) / 3488340663459579) [(5, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 4. -/
theorem ep_Q2_024_partial_04_0391_valid :
    mulPoly ep_Q2_024_coefficient_04_0391
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0392 : Poly :=
[
  term ((628451224099988792993605343740104142352 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 3)]
]

/-- Partial product 392 for generator 4. -/
def ep_Q2_024_partial_04_0392 : Poly :=
[
  term ((628451224099988792993605343740104142352 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (9, 3)],
  term ((628451224099988792993605343740104142352 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 3)],
  term ((-628451224099988792993605343740104142352 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 3), (10, 2)],
  term ((-628451224099988792993605343740104142352 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 4. -/
theorem ep_Q2_024_partial_04_0392_valid :
    mulPoly ep_Q2_024_coefficient_04_0392
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0393 : Poly :=
[
  term ((244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 1)]
]

/-- Partial product 393 for generator 4. -/
def ep_Q2_024_partial_04_0393 : Poly :=
[
  term ((244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (11, 1)],
  term ((244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (11, 1)],
  term ((-244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (10, 2), (11, 1)],
  term ((-244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 4. -/
theorem ep_Q2_024_partial_04_0393_valid :
    mulPoly ep_Q2_024_coefficient_04_0393
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0394 : Poly :=
[
  term ((-181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 394 for generator 4. -/
def ep_Q2_024_partial_04_0394 : Poly :=
[
  term ((-181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 4. -/
theorem ep_Q2_024_partial_04_0394_valid :
    mulPoly ep_Q2_024_coefficient_04_0394
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0395 : Poly :=
[
  term ((751294408028112 : Rat) / 1162780221153193) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 395 for generator 4. -/
def ep_Q2_024_partial_04_0395 : Poly :=
[
  term ((751294408028112 : Rat) / 1162780221153193) [(2, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((751294408028112 : Rat) / 1162780221153193) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-751294408028112 : Rat) / 1162780221153193) [(5, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-751294408028112 : Rat) / 1162780221153193) [(5, 1), (11, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 4. -/
theorem ep_Q2_024_partial_04_0395_valid :
    mulPoly ep_Q2_024_coefficient_04_0395
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0396 : Poly :=
[
  term ((-26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 1), (13, 2)]
]

/-- Partial product 396 for generator 4. -/
def ep_Q2_024_partial_04_0396 : Poly :=
[
  term ((-26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (11, 1), (13, 2)],
  term ((-26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (11, 1), (13, 2)],
  term ((26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (10, 2), (11, 1), (13, 2)],
  term ((26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 4. -/
theorem ep_Q2_024_partial_04_0396_valid :
    mulPoly ep_Q2_024_coefficient_04_0396
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0397 : Poly :=
[
  term ((251678942051815388106176060801947966628 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 397 for generator 4. -/
def ep_Q2_024_partial_04_0397 : Poly :=
[
  term ((251678942051815388106176060801947966628 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (12, 1), (13, 1)],
  term ((251678942051815388106176060801947966628 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (12, 1), (13, 1)],
  term ((-251678942051815388106176060801947966628 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (10, 2), (12, 1), (13, 1)],
  term ((-251678942051815388106176060801947966628 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 4. -/
theorem ep_Q2_024_partial_04_0397_valid :
    mulPoly ep_Q2_024_coefficient_04_0397
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0398 : Poly :=
[
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 398 for generator 4. -/
def ep_Q2_024_partial_04_0398 : Poly :=
[
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(2, 2), (5, 1), (12, 1), (13, 1), (15, 2)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(3, 2), (5, 1), (12, 1), (13, 1), (15, 2)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (10, 2), (12, 1), (13, 1), (15, 2)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (11, 2), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 4. -/
theorem ep_Q2_024_partial_04_0398_valid :
    mulPoly ep_Q2_024_coefficient_04_0398
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0399 : Poly :=
[
  term ((-4569079916135479 : Rat) / 1162780221153193) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 399 for generator 4. -/
def ep_Q2_024_partial_04_0399 : Poly :=
[
  term ((-4569079916135479 : Rat) / 1162780221153193) [(2, 2), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(3, 2), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(5, 1), (10, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(5, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 4. -/
theorem ep_Q2_024_partial_04_0399_valid :
    mulPoly ep_Q2_024_coefficient_04_0399
        ep_Q2_024_generator_04_0300_0399 =
      ep_Q2_024_partial_04_0399 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_04_0300_0399 : List Poly :=
[
  ep_Q2_024_partial_04_0300,
  ep_Q2_024_partial_04_0301,
  ep_Q2_024_partial_04_0302,
  ep_Q2_024_partial_04_0303,
  ep_Q2_024_partial_04_0304,
  ep_Q2_024_partial_04_0305,
  ep_Q2_024_partial_04_0306,
  ep_Q2_024_partial_04_0307,
  ep_Q2_024_partial_04_0308,
  ep_Q2_024_partial_04_0309,
  ep_Q2_024_partial_04_0310,
  ep_Q2_024_partial_04_0311,
  ep_Q2_024_partial_04_0312,
  ep_Q2_024_partial_04_0313,
  ep_Q2_024_partial_04_0314,
  ep_Q2_024_partial_04_0315,
  ep_Q2_024_partial_04_0316,
  ep_Q2_024_partial_04_0317,
  ep_Q2_024_partial_04_0318,
  ep_Q2_024_partial_04_0319,
  ep_Q2_024_partial_04_0320,
  ep_Q2_024_partial_04_0321,
  ep_Q2_024_partial_04_0322,
  ep_Q2_024_partial_04_0323,
  ep_Q2_024_partial_04_0324,
  ep_Q2_024_partial_04_0325,
  ep_Q2_024_partial_04_0326,
  ep_Q2_024_partial_04_0327,
  ep_Q2_024_partial_04_0328,
  ep_Q2_024_partial_04_0329,
  ep_Q2_024_partial_04_0330,
  ep_Q2_024_partial_04_0331,
  ep_Q2_024_partial_04_0332,
  ep_Q2_024_partial_04_0333,
  ep_Q2_024_partial_04_0334,
  ep_Q2_024_partial_04_0335,
  ep_Q2_024_partial_04_0336,
  ep_Q2_024_partial_04_0337,
  ep_Q2_024_partial_04_0338,
  ep_Q2_024_partial_04_0339,
  ep_Q2_024_partial_04_0340,
  ep_Q2_024_partial_04_0341,
  ep_Q2_024_partial_04_0342,
  ep_Q2_024_partial_04_0343,
  ep_Q2_024_partial_04_0344,
  ep_Q2_024_partial_04_0345,
  ep_Q2_024_partial_04_0346,
  ep_Q2_024_partial_04_0347,
  ep_Q2_024_partial_04_0348,
  ep_Q2_024_partial_04_0349,
  ep_Q2_024_partial_04_0350,
  ep_Q2_024_partial_04_0351,
  ep_Q2_024_partial_04_0352,
  ep_Q2_024_partial_04_0353,
  ep_Q2_024_partial_04_0354,
  ep_Q2_024_partial_04_0355,
  ep_Q2_024_partial_04_0356,
  ep_Q2_024_partial_04_0357,
  ep_Q2_024_partial_04_0358,
  ep_Q2_024_partial_04_0359,
  ep_Q2_024_partial_04_0360,
  ep_Q2_024_partial_04_0361,
  ep_Q2_024_partial_04_0362,
  ep_Q2_024_partial_04_0363,
  ep_Q2_024_partial_04_0364,
  ep_Q2_024_partial_04_0365,
  ep_Q2_024_partial_04_0366,
  ep_Q2_024_partial_04_0367,
  ep_Q2_024_partial_04_0368,
  ep_Q2_024_partial_04_0369,
  ep_Q2_024_partial_04_0370,
  ep_Q2_024_partial_04_0371,
  ep_Q2_024_partial_04_0372,
  ep_Q2_024_partial_04_0373,
  ep_Q2_024_partial_04_0374,
  ep_Q2_024_partial_04_0375,
  ep_Q2_024_partial_04_0376,
  ep_Q2_024_partial_04_0377,
  ep_Q2_024_partial_04_0378,
  ep_Q2_024_partial_04_0379,
  ep_Q2_024_partial_04_0380,
  ep_Q2_024_partial_04_0381,
  ep_Q2_024_partial_04_0382,
  ep_Q2_024_partial_04_0383,
  ep_Q2_024_partial_04_0384,
  ep_Q2_024_partial_04_0385,
  ep_Q2_024_partial_04_0386,
  ep_Q2_024_partial_04_0387,
  ep_Q2_024_partial_04_0388,
  ep_Q2_024_partial_04_0389,
  ep_Q2_024_partial_04_0390,
  ep_Q2_024_partial_04_0391,
  ep_Q2_024_partial_04_0392,
  ep_Q2_024_partial_04_0393,
  ep_Q2_024_partial_04_0394,
  ep_Q2_024_partial_04_0395,
  ep_Q2_024_partial_04_0396,
  ep_Q2_024_partial_04_0397,
  ep_Q2_024_partial_04_0398,
  ep_Q2_024_partial_04_0399
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_04_0300_0399 : Poly :=
[
  term ((63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 2), (9, 2)],
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 2), (12, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 2), (12, 1), (13, 1), (15, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (3, 2), (12, 1), (15, 2)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(2, 2), (3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(2, 2), (3, 2), (13, 1), (15, 1)],
  term ((5187528714443170 : Rat) / 3488340663459579) [(2, 2), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (3, 2), (13, 2)],
  term ((-254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (3, 2), (14, 1)],
  term ((-408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(2, 2), (3, 2), (15, 2)],
  term ((44155261447042286 : Rat) / 3488340663459579) [(2, 2), (3, 2), (15, 2), (16, 1)],
  term ((6693479571835934517496439208731643141221 : Rat) / 3599128372207431889700080584088617803970) [(2, 2), (4, 1)],
  term ((29825028787604780568533645441663554308 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (4, 1), (7, 1), (9, 1)],
  term ((-362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (7, 1), (12, 1), (13, 1)],
  term ((3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-2393155378199320 : Rat) / 1162780221153193) [(2, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((231518366891497076390294429922018140216 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (4, 1), (7, 1), (13, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (7, 1), (13, 1), (14, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(2, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18300701104668210892020572581297611620999517782762837141 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (4, 1), (7, 1), (15, 1)],
  term ((2599612849297084 : Rat) / 1162780221153193) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (8, 1)],
  term ((-78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (4, 1), (9, 1), (11, 1)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (9, 1), (12, 1), (13, 1)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(2, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-260180511621487903538724291374951437816 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (9, 1), (13, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (9, 1), (13, 1), (14, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(2, 2), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((56021116588060305458288304628496712352617198659830157684 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(2, 2), (4, 1), (9, 1), (15, 1)],
  term ((-5208468627123472 : Rat) / 1162780221153193) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5006205965083545439327033641042020892532 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (4, 1), (9, 2)],
  term ((189971572478631474751921372771244313536 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((-5336256518543225275254510220537931407670344894878866818 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((1932327998838360 : Rat) / 1162780221153193) [(2, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-95127668764712964325924806602093243624 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (4, 1), (11, 1), (13, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (11, 1), (13, 1), (14, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(2, 2), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((26138240661491091603815861206626990290624951583875075257 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(2, 2), (4, 1), (11, 1), (15, 1)],
  term ((-1940104213406660 : Rat) / 1162780221153193) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (4, 1), (12, 1), (15, 2)],
  term ((-3864655997676720 : Rat) / 1162780221153193) [(2, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((2239959554401533773629257787639876717735868667370925423 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (4, 1), (13, 1), (15, 1)],
  term ((-3411054761874308 : Rat) / 1162780221153193) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-85380732109718715181452610388146230064 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (4, 1), (13, 2)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (14, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (4, 1), (14, 1), (15, 2)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(2, 2), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-69918679577492248026430828734293382217854215807982362809 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(2, 2), (4, 1), (15, 2)],
  term ((3865663224954194 : Rat) / 1162780221153193) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((-3835115182457325678732377184857873892259 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (5, 1), (7, 1)],
  term ((89512237377956620516697908997183509624 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((117376268339488112344745730665839707824 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((1992624090823633213099754699689325595416268704700630544 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (5, 1), (7, 1), (15, 2)],
  term ((-3056913016368256 : Rat) / 1162780221153193) [(2, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((14349854193164938064374672258585854568 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (8, 1), (9, 1)],
  term ((37457210064370384990869044955245942896 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (8, 1), (13, 1)],
  term ((7490675775366740029035859778548846754868909461533608341 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (5, 1), (8, 1), (15, 1)],
  term ((-1712631149553468 : Rat) / 1162780221153193) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-92330534445805177857214717474193773253 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (5, 1), (9, 1)],
  term ((-60706835985900982968365112590648489372 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((206941537023232 : Rat) / 1162780221153193) [(2, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((18323269958141488713583785326786994 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (5, 1), (9, 1), (12, 1)],
  term ((-82880159691963191721220131217699149244046279209273226701 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 2), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(2, 2), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (9, 1), (12, 1), (13, 2)],
  term ((59144323728544569663950617251380340511696398315795173931 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (5, 1), (9, 1), (12, 1), (15, 2)],
  term ((-14055372061819747 : Rat) / 1162780221153193) [(2, 2), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(2, 2), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2443287352284661239804894474642139007200075315438964941147 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(2, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((50972133270704143 : Rat) / 6976681326919158) [(2, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8413519746542290140853554206891491552 : Rat) / 30501087900062982116102377831259472915) [(2, 2), (5, 1), (9, 1), (13, 2)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (9, 1), (13, 2), (14, 1)],
  term ((1088234496859695692403660104699568916 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (5, 1), (9, 1), (14, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (5, 1), (9, 1), (14, 1), (15, 2)],
  term ((833967741040952 : Rat) / 1162780221153193) [(2, 2), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-86353266237025408527984191198243109898558782738502362689 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (5, 1), (9, 1), (15, 2)],
  term ((-83751611881079719 : Rat) / 6976681326919158) [(2, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (9, 2), (11, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (9, 2), (12, 1), (13, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 1), (9, 2), (12, 1), (15, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(2, 2), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-4734346978865850413804621104676717765176 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (9, 2), (13, 1)],
  term ((-20668105331471010267993197546776929644090380130936505931 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 1), (9, 2), (15, 1)],
  term ((41170422024312028 : Rat) / 3488340663459579) [(2, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((628451224099988792993605343740104142352 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (9, 3)],
  term ((244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (11, 1)],
  term ((-181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((751294408028112 : Rat) / 1162780221153193) [(2, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (11, 1), (13, 2)],
  term ((251678942051815388106176060801947966628 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (12, 1), (13, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(2, 2), (5, 1), (12, 1), (13, 1), (15, 2)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(2, 2), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((6693479571835934517496439208731643141221 : Rat) / 3599128372207431889700080584088617803970) [(3, 2), (4, 1)],
  term ((29825028787604780568533645441663554308 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (4, 1), (7, 1), (9, 1)],
  term ((-362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (7, 1), (12, 1), (13, 1)],
  term ((3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-2393155378199320 : Rat) / 1162780221153193) [(3, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((231518366891497076390294429922018140216 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (4, 1), (7, 1), (13, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (7, 1), (13, 1), (14, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(3, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18300701104668210892020572581297611620999517782762837141 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (4, 1), (7, 1), (15, 1)],
  term ((2599612849297084 : Rat) / 1162780221153193) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (8, 1)],
  term ((-78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (4, 1), (9, 1), (11, 1)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (9, 1), (12, 1), (13, 1)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(3, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-260180511621487903538724291374951437816 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (9, 1), (13, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (9, 1), (13, 1), (14, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(3, 2), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((56021116588060305458288304628496712352617198659830157684 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(3, 2), (4, 1), (9, 1), (15, 1)],
  term ((-5208468627123472 : Rat) / 1162780221153193) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5006205965083545439327033641042020892532 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (4, 1), (9, 2)],
  term ((189971572478631474751921372771244313536 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((-5336256518543225275254510220537931407670344894878866818 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((1932327998838360 : Rat) / 1162780221153193) [(3, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-95127668764712964325924806602093243624 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (4, 1), (11, 1), (13, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (11, 1), (13, 1), (14, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(3, 2), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((26138240661491091603815861206626990290624951583875075257 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(3, 2), (4, 1), (11, 1), (15, 1)],
  term ((-1940104213406660 : Rat) / 1162780221153193) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (4, 1), (12, 1), (15, 2)],
  term ((-3864655997676720 : Rat) / 1162780221153193) [(3, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((2239959554401533773629257787639876717735868667370925423 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (4, 1), (13, 1), (15, 1)],
  term ((-3411054761874308 : Rat) / 1162780221153193) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-85380732109718715181452610388146230064 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (4, 1), (13, 2)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (14, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (4, 1), (14, 1), (15, 2)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(3, 2), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-69918679577492248026430828734293382217854215807982362809 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (4, 1), (15, 2)],
  term ((3865663224954194 : Rat) / 1162780221153193) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((-3835115182457325678732377184857873892259 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (5, 1), (7, 1)],
  term ((89512237377956620516697908997183509624 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((117376268339488112344745730665839707824 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((1992624090823633213099754699689325595416268704700630544 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (7, 1), (15, 2)],
  term ((-3056913016368256 : Rat) / 1162780221153193) [(3, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((14349854193164938064374672258585854568 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (8, 1), (9, 1)],
  term ((37457210064370384990869044955245942896 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (8, 1), (13, 1)],
  term ((7490675775366740029035859778548846754868909461533608341 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (8, 1), (15, 1)],
  term ((-1712631149553468 : Rat) / 1162780221153193) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-92330534445805177857214717474193773253 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (5, 1), (9, 1)],
  term ((-60706835985900982968365112590648489372 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((206941537023232 : Rat) / 1162780221153193) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((18323269958141488713583785326786994 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (5, 1), (9, 1), (12, 1)],
  term ((-82880159691963191721220131217699149244046279209273226701 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 2), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(3, 2), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 1), (12, 1), (13, 2)],
  term ((59144323728544569663950617251380340511696398315795173931 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 2), (5, 1), (9, 1), (12, 1), (15, 2)],
  term ((-14055372061819747 : Rat) / 1162780221153193) [(3, 2), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(3, 2), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2443287352284661239804894474642139007200075315438964941147 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((50972133270704143 : Rat) / 6976681326919158) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8413519746542290140853554206891491552 : Rat) / 30501087900062982116102377831259472915) [(3, 2), (5, 1), (9, 1), (13, 2)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 1), (13, 2), (14, 1)],
  term ((1088234496859695692403660104699568916 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (5, 1), (9, 1), (14, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (5, 1), (9, 1), (14, 1), (15, 2)],
  term ((833967741040952 : Rat) / 1162780221153193) [(3, 2), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-86353266237025408527984191198243109898558782738502362689 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 2), (5, 1), (9, 1), (15, 2)],
  term ((-83751611881079719 : Rat) / 6976681326919158) [(3, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (9, 2), (11, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 2), (12, 1), (13, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 1), (9, 2), (12, 1), (15, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(3, 2), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-4734346978865850413804621104676717765176 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 2), (13, 1)],
  term ((-20668105331471010267993197546776929644090380130936505931 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 1), (9, 2), (15, 1)],
  term ((41170422024312028 : Rat) / 3488340663459579) [(3, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((628451224099988792993605343740104142352 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 3)],
  term ((244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (11, 1)],
  term ((-181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((751294408028112 : Rat) / 1162780221153193) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (11, 1), (13, 2)],
  term ((251678942051815388106176060801947966628 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (12, 1), (13, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(3, 2), (5, 1), (12, 1), (13, 1), (15, 2)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(3, 2), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 2), (10, 2)],
  term ((-63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 2), (11, 2)],
  term ((179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (10, 2), (12, 1)],
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (10, 2), (12, 1), (15, 2)],
  term ((-1054421534548864 : Rat) / 1162780221153193) [(3, 2), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (10, 2), (13, 1), (15, 1)],
  term ((-5187528714443170 : Rat) / 3488340663459579) [(3, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (10, 2), (13, 2)],
  term ((254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (10, 2), (14, 1)],
  term ((408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (10, 2), (15, 2)],
  term ((-44155261447042286 : Rat) / 3488340663459579) [(3, 2), (10, 2), (15, 2), (16, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (11, 2), (12, 1)],
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (11, 2), (12, 1), (15, 2)],
  term ((-1054421534548864 : Rat) / 1162780221153193) [(3, 2), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (11, 2), (13, 1), (15, 1)],
  term ((-5187528714443170 : Rat) / 3488340663459579) [(3, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (11, 2), (13, 2)],
  term ((254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (11, 2), (14, 1)],
  term ((408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (11, 2), (15, 2)],
  term ((-44155261447042286 : Rat) / 3488340663459579) [(3, 2), (11, 2), (15, 2), (16, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(3, 4), (9, 2)],
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(3, 4), (12, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(3, 4), (12, 1), (13, 1), (15, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 4), (12, 1), (15, 2)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(3, 4), (12, 1), (15, 2), (16, 1)],
  term ((-36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 4), (13, 1), (15, 1)],
  term ((5187528714443170 : Rat) / 3488340663459579) [(3, 4), (13, 1), (15, 1), (16, 1)],
  term ((-197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(3, 4), (13, 2)],
  term ((-254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(3, 4), (14, 1)],
  term ((-408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 4), (15, 2)],
  term ((44155261447042286 : Rat) / 3488340663459579) [(3, 4), (15, 2), (16, 1)],
  term ((-29825028787604780568533645441663554308 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (9, 1), (10, 2)],
  term ((-29825028787604780568533645441663554308 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (9, 1), (11, 2)],
  term ((362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (10, 2), (12, 1), (13, 1)],
  term ((-3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (10, 2), (12, 1), (15, 1)],
  term ((2393155378199320 : Rat) / 1162780221153193) [(4, 1), (7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-231518366891497076390294429922018140216 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (10, 2), (13, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (10, 2), (13, 1), (14, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (10, 2), (14, 1), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 1), (7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((18300701104668210892020572581297611620999517782762837141 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (10, 2), (15, 1)],
  term ((-2599612849297084 : Rat) / 1162780221153193) [(4, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (11, 2), (12, 1), (13, 1)],
  term ((-3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((2393155378199320 : Rat) / 1162780221153193) [(4, 1), (7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-231518366891497076390294429922018140216 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (11, 2), (13, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (11, 2), (13, 1), (14, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 1), (7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((18300701104668210892020572581297611620999517782762837141 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-2599612849297084 : Rat) / 1162780221153193) [(4, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (10, 2)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (11, 2)],
  term ((78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (9, 1), (10, 2), (11, 1)],
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (10, 2), (12, 1), (13, 1)],
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-3864655997676720 : Rat) / 1162780221153193) [(4, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((260180511621487903538724291374951437816 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (10, 2), (13, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (10, 2), (13, 1), (14, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (9, 1), (10, 2), (14, 1), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(4, 1), (9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-56021116588060305458288304628496712352617198659830157684 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (9, 1), (10, 2), (15, 1)],
  term ((5208468627123472 : Rat) / 1162780221153193) [(4, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3864655997676720 : Rat) / 1162780221153193) [(4, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((260180511621487903538724291374951437816 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (11, 2), (13, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(4, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-56021116588060305458288304628496712352617198659830157684 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (9, 1), (11, 2), (15, 1)],
  term ((5208468627123472 : Rat) / 1162780221153193) [(4, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (9, 1), (11, 3)],
  term ((5006205965083545439327033641042020892532 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (9, 2), (10, 2)],
  term ((5006205965083545439327033641042020892532 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (9, 2), (11, 2)],
  term ((-6693479571835934517496439208731643141221 : Rat) / 3599128372207431889700080584088617803970) [(4, 1), (10, 2)],
  term ((-189971572478631474751921372771244313536 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (10, 2), (11, 1), (12, 1), (13, 1)],
  term ((5336256518543225275254510220537931407670344894878866818 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1932327998838360 : Rat) / 1162780221153193) [(4, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((95127668764712964325924806602093243624 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (10, 2), (11, 1), (13, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (10, 2), (11, 1), (13, 1), (14, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (10, 2), (11, 1), (14, 1), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 1), (10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26138240661491091603815861206626990290624951583875075257 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (10, 2), (11, 1), (15, 1)],
  term ((1940104213406660 : Rat) / 1162780221153193) [(4, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (10, 2), (12, 1), (15, 2)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(4, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (10, 2), (13, 1), (14, 1), (15, 1)],
  term ((-2239959554401533773629257787639876717735868667370925423 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (10, 2), (13, 1), (15, 1)],
  term ((3411054761874308 : Rat) / 1162780221153193) [(4, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((85380732109718715181452610388146230064 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (10, 2), (13, 2)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (10, 2), (14, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (10, 2), (14, 1), (15, 2)],
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((69918679577492248026430828734293382217854215807982362809 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(4, 1), (10, 2), (15, 2)],
  term ((-3865663224954194 : Rat) / 1162780221153193) [(4, 1), (10, 2), (15, 2), (16, 1)],
  term ((-6693479571835934517496439208731643141221 : Rat) / 3599128372207431889700080584088617803970) [(4, 1), (11, 2)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (11, 2), (12, 1), (15, 2)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(4, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-2239959554401533773629257787639876717735868667370925423 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (11, 2), (13, 1), (15, 1)],
  term ((3411054761874308 : Rat) / 1162780221153193) [(4, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((85380732109718715181452610388146230064 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (11, 2), (13, 2)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 2), (14, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (11, 2), (14, 1), (15, 2)],
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((69918679577492248026430828734293382217854215807982362809 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(4, 1), (11, 2), (15, 2)],
  term ((-3865663224954194 : Rat) / 1162780221153193) [(4, 1), (11, 2), (15, 2), (16, 1)],
  term ((-189971572478631474751921372771244313536 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 3), (12, 1), (13, 1)],
  term ((5336256518543225275254510220537931407670344894878866818 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (11, 3), (12, 1), (15, 1)],
  term ((-1932327998838360 : Rat) / 1162780221153193) [(4, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((95127668764712964325924806602093243624 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (11, 3), (13, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 3), (13, 1), (14, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (11, 3), (14, 1), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 1), (11, 3), (14, 1), (15, 1), (16, 1)],
  term ((-26138240661491091603815861206626990290624951583875075257 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (11, 3), (15, 1)],
  term ((1940104213406660 : Rat) / 1162780221153193) [(4, 1), (11, 3), (15, 1), (16, 1)],
  term ((-89512237377956620516697908997183509624 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 1), (10, 2), (15, 1)],
  term ((-89512237377956620516697908997183509624 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 1), (11, 2), (15, 1)],
  term ((3835115182457325678732377184857873892259 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (10, 2)],
  term ((-117376268339488112344745730665839707824 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((-1992624090823633213099754699689325595416268704700630544 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (10, 2), (15, 2)],
  term ((3056913016368256 : Rat) / 1162780221153193) [(5, 1), (7, 1), (10, 2), (15, 2), (16, 1)],
  term ((3835115182457325678732377184857873892259 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (11, 2)],
  term ((-117376268339488112344745730665839707824 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1992624090823633213099754699689325595416268704700630544 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (11, 2), (15, 2)],
  term ((3056913016368256 : Rat) / 1162780221153193) [(5, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((-14349854193164938064374672258585854568 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (10, 2)],
  term ((-14349854193164938064374672258585854568 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (11, 2)],
  term ((-37457210064370384990869044955245942896 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (10, 2), (13, 1)],
  term ((-7490675775366740029035859778548846754868909461533608341 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (10, 2), (15, 1)],
  term ((1712631149553468 : Rat) / 1162780221153193) [(5, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-37457210064370384990869044955245942896 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (11, 2), (13, 1)],
  term ((-7490675775366740029035859778548846754868909461533608341 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (11, 2), (15, 1)],
  term ((1712631149553468 : Rat) / 1162780221153193) [(5, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((92330534445805177857214717474193773253 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (10, 2)],
  term ((60706835985900982968365112590648489372 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (10, 2), (11, 1), (13, 1)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(5, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-18323269958141488713583785326786994 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 1), (10, 2), (12, 1)],
  term ((82880159691963191721220131217699149244046279209273226701 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(5, 1), (9, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(5, 1), (9, 1), (10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (10, 2), (12, 1), (13, 2)],
  term ((-59144323728544569663950617251380340511696398315795173931 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (9, 1), (10, 2), (12, 1), (15, 2)],
  term ((14055372061819747 : Rat) / 1162780221153193) [(5, 1), (9, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 1), (10, 2), (13, 1), (14, 1), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2443287352284661239804894474642139007200075315438964941147 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-50972133270704143 : Rat) / 6976681326919158) [(5, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((8413519746542290140853554206891491552 : Rat) / 30501087900062982116102377831259472915) [(5, 1), (9, 1), (10, 2), (13, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (10, 2), (13, 2), (14, 1)],
  term ((-1088234496859695692403660104699568916 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 1), (10, 2), (14, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (10, 2), (14, 1), (15, 2)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((86353266237025408527984191198243109898558782738502362689 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (9, 1), (10, 2), (15, 2)],
  term ((83751611881079719 : Rat) / 6976681326919158) [(5, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((92330534445805177857214717474193773253 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (11, 2)],
  term ((-18323269958141488713583785326786994 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 1), (11, 2), (12, 1)],
  term ((82880159691963191721220131217699149244046279209273226701 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (11, 2), (12, 1), (13, 2)],
  term ((-59144323728544569663950617251380340511696398315795173931 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (9, 1), (11, 2), (12, 1), (15, 2)],
  term ((14055372061819747 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2443287352284661239804894474642139007200075315438964941147 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-50972133270704143 : Rat) / 6976681326919158) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((8413519746542290140853554206891491552 : Rat) / 30501087900062982116102377831259472915) [(5, 1), (9, 1), (11, 2), (13, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (11, 2), (13, 2), (14, 1)],
  term ((-1088234496859695692403660104699568916 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 1), (11, 2), (14, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (11, 2), (14, 1), (15, 2)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((86353266237025408527984191198243109898558782738502362689 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (9, 1), (11, 2), (15, 2)],
  term ((83751611881079719 : Rat) / 6976681326919158) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((60706835985900982968365112590648489372 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (11, 3), (13, 1)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 1), (11, 3), (15, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (10, 2), (11, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (10, 2), (12, 1), (13, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 2), (10, 2), (12, 1), (15, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(5, 1), (9, 2), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((4734346978865850413804621104676717765176 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (10, 2), (13, 1)],
  term ((20668105331471010267993197546776929644090380130936505931 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 2), (10, 2), (15, 1)],
  term ((-41170422024312028 : Rat) / 3488340663459579) [(5, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (11, 2), (12, 1), (13, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 2), (11, 2), (12, 1), (15, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(5, 1), (9, 2), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((4734346978865850413804621104676717765176 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (11, 2), (13, 1)],
  term ((20668105331471010267993197546776929644090380130936505931 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 2), (11, 2), (15, 1)],
  term ((-41170422024312028 : Rat) / 3488340663459579) [(5, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (11, 3)],
  term ((-628451224099988792993605343740104142352 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 3), (10, 2)],
  term ((-628451224099988792993605343740104142352 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 3), (11, 2)],
  term ((-244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (10, 2), (11, 1)],
  term ((181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-751294408028112 : Rat) / 1162780221153193) [(5, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (10, 2), (11, 1), (13, 2)],
  term ((-251678942051815388106176060801947966628 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (10, 2), (12, 1), (13, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (10, 2), (12, 1), (13, 1), (15, 2)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(5, 1), (10, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-251678942051815388106176060801947966628 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (11, 2), (12, 1), (13, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(5, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 3)],
  term ((181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (11, 3), (13, 1), (15, 1)],
  term ((-751294408028112 : Rat) / 1162780221153193) [(5, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 300 through 399. -/
theorem ep_Q2_024_block_04_0300_0399_valid :
    checkProductSumEq ep_Q2_024_partials_04_0300_0399
      ep_Q2_024_block_04_0300_0399 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
