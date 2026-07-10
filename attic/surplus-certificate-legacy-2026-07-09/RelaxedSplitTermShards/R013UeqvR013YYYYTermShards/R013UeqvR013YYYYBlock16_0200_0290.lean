/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YYYY, term block 16:200-290

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YYYYTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R013:u=v:R013YYYY`. -/
def rs_R013_ueqv_R013YYYY_generator_16_0200_0290 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0200 : Poly :=
[
  term ((40749942173366762604128636081695601104805203178744967984 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(4, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 200 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0200 : Poly :=
[
  term ((81499884346733525208257272163391202209610406357489935968 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-40749942173366762604128636081695601104805203178744967984 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(4, 1), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0200_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0200
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0201 : Poly :=
[
  term ((-40749942173366762604128636081695601104805203178744967984 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 201 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0201 : Poly :=
[
  term ((-81499884346733525208257272163391202209610406357489935968 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((40749942173366762604128636081695601104805203178744967984 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0201_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0201
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0202 : Poly :=
[
  term ((9452845307300657005463482541197951479737875237980079566993408 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 202 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0202 : Poly :=
[
  term ((18905690614601314010926965082395902959475750475960159133986816 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(4, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-9452845307300657005463482541197951479737875237980079566993408 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0202_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0202
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0203 : Poly :=
[
  term ((592049963068764780765657832565401891655779068239633285820440168 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 203 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0203 : Poly :=
[
  term ((1184099926137529561531315665130803783311558136479266571640880336 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-592049963068764780765657832565401891655779068239633285820440168 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0203_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0203
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0204 : Poly :=
[
  term ((158343383446566711773915709401358339832962466750308882634086068 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 204 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0204 : Poly :=
[
  term ((316686766893133423547831418802716679665924933500617765268172136 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-158343383446566711773915709401358339832962466750308882634086068 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0204_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0204
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0205 : Poly :=
[
  term ((10347001379508398874255800130378212042044073491327588319390720 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(4, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 205 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0205 : Poly :=
[
  term ((20694002759016797748511600260756424084088146982655176638781440 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(4, 1), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-10347001379508398874255800130378212042044073491327588319390720 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(4, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0205_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0205
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0206 : Poly :=
[
  term ((18545723522858358340274983218689824564105794912169520874476245312 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 206 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0206 : Poly :=
[
  term ((37091447045716716680549966437379649128211589824339041748952490624 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-18545723522858358340274983218689824564105794912169520874476245312 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0206_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0206
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0207 : Poly :=
[
  term ((-986313070593425563549437893607042925774840592421249345696069728 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 207 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0207 : Poly :=
[
  term ((-1972626141186851127098875787214085851549681184842498691392139456 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(4, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((986313070593425563549437893607042925774840592421249345696069728 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0207_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0207
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0208 : Poly :=
[
  term ((5173500689754199437127900065189106021022036745663794159695360 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(4, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 208 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0208 : Poly :=
[
  term ((10347001379508398874255800130378212042044073491327588319390720 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(4, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-5173500689754199437127900065189106021022036745663794159695360 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(4, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0208_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0208
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0209 : Poly :=
[
  term ((9272861761429179170137491609344912282052897456084760437238122656 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 209 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0209 : Poly :=
[
  term ((18545723522858358340274983218689824564105794912169520874476245312 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-9272861761429179170137491609344912282052897456084760437238122656 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0209_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0209
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0210 : Poly :=
[
  term ((-493156535296712781774718946803521462887420296210624672848034864 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 210 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0210 : Poly :=
[
  term ((-986313070593425563549437893607042925774840592421249345696069728 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((493156535296712781774718946803521462887420296210624672848034864 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0210_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0210
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0211 : Poly :=
[
  term ((-37091447045716716680549966437379649128211589824339041748952490624 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 211 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0211 : Poly :=
[
  term ((-74182894091433433361099932874759298256423179648678083497904981248 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((37091447045716716680549966437379649128211589824339041748952490624 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0211_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0211
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0212 : Poly :=
[
  term ((1972626141186851127098875787214085851549681184842498691392139456 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 212 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0212 : Poly :=
[
  term ((3945252282373702254197751574428171703099362369684997382784278912 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(4, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1972626141186851127098875787214085851549681184842498691392139456 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0212_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0212
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0213 : Poly :=
[
  term ((-20694002759016797748511600260756424084088146982655176638781440 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(4, 1), (10, 1), (11, 2), (16, 1)]
]

/-- Partial product 213 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0213 : Poly :=
[
  term ((-41388005518033595497023200521512848168176293965310353277562880 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(4, 1), (6, 1), (10, 1), (11, 2), (16, 1)],
  term ((20694002759016797748511600260756424084088146982655176638781440 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(4, 1), (10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0213_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0213
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0214 : Poly :=
[
  term ((9272861761429179170137491609344912282052897456084760437238122656 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 214 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0214 : Poly :=
[
  term ((18545723522858358340274983218689824564105794912169520874476245312 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9272861761429179170137491609344912282052897456084760437238122656 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0214_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0214
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0215 : Poly :=
[
  term ((34341450016253194054007335187891983726618194967164000293054565653060528 : Rat) / 7025276262832103560790910416704145207029740273648215209581771702782613) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 215 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0215 : Poly :=
[
  term ((68682900032506388108014670375783967453236389934328000586109131306121056 : Rat) / 7025276262832103560790910416704145207029740273648215209581771702782613) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-34341450016253194054007335187891983726618194967164000293054565653060528 : Rat) / 7025276262832103560790910416704145207029740273648215209581771702782613) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0215_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0215
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0216 : Poly :=
[
  term ((19607979182870176636143528287715985382322034267536540896205174447780856 : Rat) / 11708793771386839267984850694506908678382900456080358682636286171304355) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 216 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0216 : Poly :=
[
  term ((39215958365740353272287056575431970764644068535073081792410348895561712 : Rat) / 11708793771386839267984850694506908678382900456080358682636286171304355) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-19607979182870176636143528287715985382322034267536540896205174447780856 : Rat) / 11708793771386839267984850694506908678382900456080358682636286171304355) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0216_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0216
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0217 : Poly :=
[
  term ((-493156535296712781774718946803521462887420296210624672848034864 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(4, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 217 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0217 : Poly :=
[
  term ((-986313070593425563549437893607042925774840592421249345696069728 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(4, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((493156535296712781774718946803521462887420296210624672848034864 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(4, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0217_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0217
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0218 : Poly :=
[
  term ((5173500689754199437127900065189106021022036745663794159695360 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(4, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 218 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0218 : Poly :=
[
  term ((10347001379508398874255800130378212042044073491327588319390720 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(4, 1), (6, 1), (11, 2), (15, 2), (16, 1)],
  term ((-5173500689754199437127900065189106021022036745663794159695360 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(4, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0218_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0218
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0219 : Poly :=
[
  term ((16813877241701148170665675211864594568321619423407331019009920 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(4, 1), (11, 2), (16, 1)]
]

/-- Partial product 219 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0219 : Poly :=
[
  term ((33627754483402296341331350423729189136643238846814662038019840 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(4, 1), (6, 1), (11, 2), (16, 1)],
  term ((-16813877241701148170665675211864594568321619423407331019009920 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(4, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0219_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0219
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0220 : Poly :=
[
  term ((-1100401388609462743875121855831263384261227696959745384192 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(4, 1), (12, 1), (16, 1)]
]

/-- Partial product 220 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0220 : Poly :=
[
  term ((-2200802777218925487750243711662526768522455393919490768384 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term ((1100401388609462743875121855831263384261227696959745384192 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(4, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0220_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0220
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0221 : Poly :=
[
  term ((-7167446187856490987150270491388740001880566014449921411945921640 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 221 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0221 : Poly :=
[
  term ((-14334892375712981974300540982777480003761132028899842823891843280 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((7167446187856490987150270491388740001880566014449921411945921640 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0221_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0221
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0222 : Poly :=
[
  term ((-4701322717205138712231634745718732230189165349262868701307878432 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (13, 2), (16, 1)]
]

/-- Partial product 222 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0222 : Poly :=
[
  term ((-9402645434410277424463269491437464460378330698525737402615756864 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term ((4701322717205138712231634745718732230189165349262868701307878432 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0222_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0222
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0223 : Poly :=
[
  term ((4982703059098948124681855794590256628729279159338998546616145036 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 223 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0223 : Poly :=
[
  term ((9965406118197896249363711589180513257458558318677997093232290072 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-4982703059098948124681855794590256628729279159338998546616145036 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0223_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0223
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0224 : Poly :=
[
  term ((3440244433568087032529351808653965356998756569987193099648 : Rat) / 1330594368984584826892526750061637032128466165966392281263) [(4, 1), (16, 1)]
]

/-- Partial product 224 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0224 : Poly :=
[
  term ((6880488867136174065058703617307930713997513139974386199296 : Rat) / 1330594368984584826892526750061637032128466165966392281263) [(4, 1), (6, 1), (16, 1)],
  term ((-3440244433568087032529351808653965356998756569987193099648 : Rat) / 1330594368984584826892526750061637032128466165966392281263) [(4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0224_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0224
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0225 : Poly :=
[
  term ((-15050045143752703007051082988624279388879438319910824236063168 : Rat) / 72243734201105376786245144876763208234726984837034624649653743) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 225 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0225 : Poly :=
[
  term ((-30100090287505406014102165977248558777758876639821648472126336 : Rat) / 72243734201105376786245144876763208234726984837034624649653743) [(5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((15050045143752703007051082988624279388879438319910824236063168 : Rat) / 72243734201105376786245144876763208234726984837034624649653743) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0225_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0225
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0226 : Poly :=
[
  term ((-49760521978133325130492955714049273093060802010285564752537961936 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 226 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0226 : Poly :=
[
  term ((-99521043956266650260985911428098546186121604020571129505075923872 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((49760521978133325130492955714049273093060802010285564752537961936 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0226_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0226
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0227 : Poly :=
[
  term ((2289001072698578401969369105761053585927720558072768374635756952 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 227 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0227 : Poly :=
[
  term ((4578002145397156803938738211522107171855441116145536749271513904 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2289001072698578401969369105761053585927720558072768374635756952 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0227_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0227
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0228 : Poly :=
[
  term ((2586750344877099718563950032594553010511018372831897079847680 : Rat) / 72243734201105376786245144876763208234726984837034624649653743) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 228 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0228 : Poly :=
[
  term ((5173500689754199437127900065189106021022036745663794159695360 : Rat) / 72243734201105376786245144876763208234726984837034624649653743) [(5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-2586750344877099718563950032594553010511018372831897079847680 : Rat) / 72243734201105376786245144876763208234726984837034624649653743) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0228_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0228
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0229 : Poly :=
[
  term ((5007475752375264096478967055258940439367480124058361327544741840 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 229 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0229 : Poly :=
[
  term ((10014951504750528192957934110517880878734960248116722655089483680 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(5, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-5007475752375264096478967055258940439367480124058361327544741840 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0229_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0229
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0230 : Poly :=
[
  term ((-2011943644826489025235169489774386553467886641183763222338816232 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 230 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0230 : Poly :=
[
  term ((-4023887289652978050470338979548773106935773282367526444677632464 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((2011943644826489025235169489774386553467886641183763222338816232 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0230_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0230
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0231 : Poly :=
[
  term ((-89923423457186736672629648631536073156756967464982438688193704 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 231 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0231 : Poly :=
[
  term ((-179846846914373473345259297263072146313513934929964877376387408 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((89923423457186736672629648631536073156756967464982438688193704 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0231_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0231
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0232 : Poly :=
[
  term ((-7525022571876351503525541494312139694439719159955412118031584 : Rat) / 72243734201105376786245144876763208234726984837034624649653743) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 232 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0232 : Poly :=
[
  term ((-15050045143752703007051082988624279388879438319910824236063168 : Rat) / 72243734201105376786245144876763208234726984837034624649653743) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((7525022571876351503525541494312139694439719159955412118031584 : Rat) / 72243734201105376786245144876763208234726984837034624649653743) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0232_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0232
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0233 : Poly :=
[
  term ((-3161516145899763810700479835523379655856497293120736601005046 : Rat) / 72243734201105376786245144876763208234726984837034624649653743) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 233 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0233 : Poly :=
[
  term ((-6323032291799527621400959671046759311712994586241473202010092 : Rat) / 72243734201105376786245144876763208234726984837034624649653743) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((3161516145899763810700479835523379655856497293120736601005046 : Rat) / 72243734201105376786245144876763208234726984837034624649653743) [(5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0233_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0233
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0234 : Poly :=
[
  term ((4701322717205138712231634745718732230189165349262868701307878432 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 234 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0234 : Poly :=
[
  term ((9402645434410277424463269491437464460378330698525737402615756864 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4701322717205138712231634745718732230189165349262868701307878432 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(5, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0234_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0234
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0235 : Poly :=
[
  term ((9479872757391869392786382068314783295597598413603870335813304876 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 235 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0235 : Poly :=
[
  term ((18959745514783738785572764136629566591195196827207740671626609752 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9479872757391869392786382068314783295597598413603870335813304876 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0235_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0235
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0236 : Poly :=
[
  term ((-24880260989066662565246477857024636546530401005142782376268980968 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 236 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0236 : Poly :=
[
  term ((-49760521978133325130492955714049273093060802010285564752537961936 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((24880260989066662565246477857024636546530401005142782376268980968 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0236_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0236
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0237 : Poly :=
[
  term ((-10773026359546303909286763733482087388426750534850064138488030684 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 237 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0237 : Poly :=
[
  term ((-21546052719092607818573527466964174776853501069700128276976061368 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((10773026359546303909286763733482087388426750534850064138488030684 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0237_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0237
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0238 : Poly :=
[
  term ((-228359354851985458602108657866605126812291361496188195721973497 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 238 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0238 : Poly :=
[
  term ((-456718709703970917204217315733210253624582722992376391443946994 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((228359354851985458602108657866605126812291361496188195721973497 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0238_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0238
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0239 : Poly :=
[
  term ((1144500536349289200984684552880526792963860279036384187317878476 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(5, 1), (15, 3), (16, 1)]
]

/-- Partial product 239 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0239 : Poly :=
[
  term ((2289001072698578401969369105761053585927720558072768374635756952 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(5, 1), (6, 1), (15, 3), (16, 1)],
  term ((-1144500536349289200984684552880526792963860279036384187317878476 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0239_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0239
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0240 : Poly :=
[
  term ((-2806355567875873100011422832550008672376816026472399750192384 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 240 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0240 : Poly :=
[
  term ((2806355567875873100011422832550008672376816026472399750192384 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-5612711135751746200022845665100017344753632052944799500384768 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(6, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0240_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0240
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0241 : Poly :=
[
  term ((-111449425509402659746467105496609022023490678577359620549116196 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 241 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0241 : Poly :=
[
  term ((111449425509402659746467105496609022023490678577359620549116196 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-222898851018805319492934210993218044046981357154719241098232392 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(6, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0241_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0241
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0242 : Poly :=
[
  term ((109792666374230072816971244605724788003051802384059104797969252 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 242 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0242 : Poly :=
[
  term ((-109792666374230072816971244605724788003051802384059104797969252 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((219585332748460145633942489211449576006103604768118209595938504 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(6, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0242_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0242
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0243 : Poly :=
[
  term ((24138756365548409433319686935598293681928556069539495344236544 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 243 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0243 : Poly :=
[
  term ((48277512731096818866639373871196587363857112139078990688473088 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(6, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-24138756365548409433319686935598293681928556069539495344236544 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0243_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0243
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0244 : Poly :=
[
  term ((40749942173366762604128636081695601104805203178744967984 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 244 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0244 : Poly :=
[
  term ((81499884346733525208257272163391202209610406357489935968 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(6, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-40749942173366762604128636081695601104805203178744967984 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(7, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0244_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0244
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0245 : Poly :=
[
  term ((-40749942173366762604128636081695601104805203178744967984 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 245 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0245 : Poly :=
[
  term ((-81499884346733525208257272163391202209610406357489935968 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((40749942173366762604128636081695601104805203178744967984 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0245_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0245
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0246 : Poly :=
[
  term ((-133652254849371800985380992328682701090145680698979213639003872 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 246 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0246 : Poly :=
[
  term ((-267304509698743601970761984657365402180291361397958427278007744 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(6, 1), (7, 1), (11, 1), (16, 1)],
  term ((133652254849371800985380992328682701090145680698979213639003872 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0246_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0246
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0247 : Poly :=
[
  term ((-64080240818718454576596813547969985733745734460715601301844800816 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 247 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0247 : Poly :=
[
  term ((-128160481637436909153193627095939971467491468921431202603689601632 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term ((64080240818718454576596813547969985733745734460715601301844800816 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0247_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0247
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0248 : Poly :=
[
  term ((108073101638828677766114783215726339029252551151122771397114560 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 248 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0248 : Poly :=
[
  term ((216146203277657355532229566431452678058505102302245542794229120 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-108073101638828677766114783215726339029252551151122771397114560 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0248_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0248
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0249 : Poly :=
[
  term ((-59348594863617765363989387488523325279451497194509812491253064 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 249 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0249 : Poly :=
[
  term ((-118697189727235530727978774977046650558902994389019624982506128 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((59348594863617765363989387488523325279451497194509812491253064 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0249_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0249
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0250 : Poly :=
[
  term ((-77250149964483780208355849876452428840098736431562519090321068 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 250 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0250 : Poly :=
[
  term ((-154500299928967560416711699752904857680197472863125038180642136 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((77250149964483780208355849876452428840098736431562519090321068 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0250_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0250
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0251 : Poly :=
[
  term ((-46892807882934592832030259481370971048521997381085058251490164 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 251 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0251 : Poly :=
[
  term ((-93785615765869185664060518962741942097043994762170116502980328 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((46892807882934592832030259481370971048521997381085058251490164 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0251_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0251
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0252 : Poly :=
[
  term ((-924314908275207011009629288154022641189672145704270595648 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(8, 1), (10, 1), (16, 1)]
]

/-- Partial product 252 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0252 : Poly :=
[
  term ((-1848629816550414022019258576308045282379344291408541191296 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(6, 1), (8, 1), (10, 1), (16, 1)],
  term ((924314908275207011009629288154022641189672145704270595648 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(8, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0252_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0252
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0253 : Poly :=
[
  term ((-35911092598525241127031330962211712868835390110283233161358303160 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 253 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0253 : Poly :=
[
  term ((-71822185197050482254062661924423425737670780220566466322716606320 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((35911092598525241127031330962211712868835390110283233161358303160 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0253_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0253
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0254 : Poly :=
[
  term ((-44943752491690371126725931494512751050079766552853070620587440068 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 254 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0254 : Poly :=
[
  term ((-89887504983380742253451862989025502100159533105706141241174880136 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((44943752491690371126725931494512751050079766552853070620587440068 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0254_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0254
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0255 : Poly :=
[
  term ((-749476513177483438523840901293847302814268753899716608007742864 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 255 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0255 : Poly :=
[
  term ((-1498953026354966877047681802587694605628537507799433216015485728 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term ((749476513177483438523840901293847302814268753899716608007742864 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0255_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0255
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0256 : Poly :=
[
  term ((62132076681264210542360577640995127003856491930699525104 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 256 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0256 : Poly :=
[
  term ((124264153362528421084721155281990254007712983861399050208 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-62132076681264210542360577640995127003856491930699525104 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0256_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0256
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0257 : Poly :=
[
  term ((-36558745089760975900310886682675687205108522376600449983430 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(8, 1), (16, 1)]
]

/-- Partial product 257 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0257 : Poly :=
[
  term ((-73117490179521951800621773365351374410217044753200899966860 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(6, 1), (8, 1), (16, 1)],
  term ((36558745089760975900310886682675687205108522376600449983430 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0257_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0257
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0258 : Poly :=
[
  term ((683067188511606021623354207855622713346506668330606447468551184 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 258 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0258 : Poly :=
[
  term ((1366134377023212043246708415711245426693013336661212894937102368 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-683067188511606021623354207855622713346506668330606447468551184 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0258_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0258
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0259 : Poly :=
[
  term ((-57254759893454839762856842892807666914235831816963773015542397552 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 259 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0259 : Poly :=
[
  term ((-114509519786909679525713685785615333828471663633927546031084795104 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((57254759893454839762856842892807666914235831816963773015542397552 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0259_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0259
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0260 : Poly :=
[
  term ((13476030077506782009129043690585861886646918267000330636096745784 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 260 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0260 : Poly :=
[
  term ((26952060155013564018258087381171723773293836534000661272193491568 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-13476030077506782009129043690585861886646918267000330636096745784 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0260_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0260
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0261 : Poly :=
[
  term ((-77078372143158049711740249856436380552838684786741420480 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 261 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0261 : Poly :=
[
  term ((-154156744286316099423480499712872761105677369573482840960 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((77078372143158049711740249856436380552838684786741420480 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0261_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0261
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0262 : Poly :=
[
  term ((-2879169555093955633987166056130566109498230032911869016 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 262 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0262 : Poly :=
[
  term ((-5758339110187911267974332112261132218996460065823738032 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((2879169555093955633987166056130566109498230032911869016 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0262_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0262
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0263 : Poly :=
[
  term ((-121312637033089506722509138096072253772458068173433347196165724554 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 263 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0263 : Poly :=
[
  term ((-242625274066179013445018276192144507544916136346866694392331449108 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((121312637033089506722509138096072253772458068173433347196165724554 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0263_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0263
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0264 : Poly :=
[
  term ((40749942173366762604128636081695601104805203178744967984 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 264 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0264 : Poly :=
[
  term ((81499884346733525208257272163391202209610406357489935968 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-40749942173366762604128636081695601104805203178744967984 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0264_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0264
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0265 : Poly :=
[
  term ((-45064346846163928582736663429363382188744758424672610643094519888 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 265 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0265 : Poly :=
[
  term ((-90128693692327857165473326858726764377489516849345221286189039776 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(6, 1), (9, 1), (13, 1), (16, 1)],
  term ((45064346846163928582736663429363382188744758424672610643094519888 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0265_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0265
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0266 : Poly :=
[
  term ((-1048154978067354557633937076391003251116809272806359169873634316 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 266 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0266 : Poly :=
[
  term ((-2096309956134709115267874152782006502233618545612718339747268632 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((1048154978067354557633937076391003251116809272806359169873634316 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0266_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0266
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0267 : Poly :=
[
  term ((2879169555093955633987166056130566109498230032911869016 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(9, 2), (10, 1), (16, 1)]
]

/-- Partial product 267 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0267 : Poly :=
[
  term ((5758339110187911267974332112261132218996460065823738032 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(6, 1), (9, 2), (10, 1), (16, 1)],
  term ((-2879169555093955633987166056130566109498230032911869016 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0267_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0267
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0268 : Poly :=
[
  term ((-127143322917622376718708321338120820117211213894310919224 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(9, 2), (16, 1)]
]

/-- Partial product 268 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0268 : Poly :=
[
  term ((-254286645835244753437416642676241640234422427788621838448 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(6, 1), (9, 2), (16, 1)],
  term ((127143322917622376718708321338120820117211213894310919224 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0268_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0268
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0269 : Poly :=
[
  term ((186331704983960161779776347710038759566142443854494012353801401424 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 269 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0269 : Poly :=
[
  term ((372663409967920323559552695420077519132284887708988024707602802848 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-186331704983960161779776347710038759566142443854494012353801401424 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0269_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0269
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0270 : Poly :=
[
  term ((62935444828367178235193775607853778326865696571705479968981388568 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 270 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0270 : Poly :=
[
  term ((125870889656734356470387551215707556653731393143410959937962777136 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-62935444828367178235193775607853778326865696571705479968981388568 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0270_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0270
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0271 : Poly :=
[
  term ((3524657632741278359342151509777238989867855356795745280293182336 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(10, 1), (11, 2), (16, 1)]
]

/-- Partial product 271 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0271 : Poly :=
[
  term ((7049315265482556718684303019554477979735710713591490560586364672 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(6, 1), (10, 1), (11, 2), (16, 1)],
  term ((-3524657632741278359342151509777238989867855356795745280293182336 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0271_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0271
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0272 : Poly :=
[
  term ((-3348143163277854339034348894264410323843303759073655150632 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 272 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0272 : Poly :=
[
  term ((-6696286326555708678068697788528820647686607518147310301264 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(6, 1), (10, 1), (12, 1), (16, 1)],
  term ((3348143163277854339034348894264410323843303759073655150632 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0272_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0272
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0273 : Poly :=
[
  term ((-462157454137603505504814644077011320594836072852135297824 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 273 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0273 : Poly :=
[
  term ((-924314908275207011009629288154022641189672145704270595648 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((462157454137603505504814644077011320594836072852135297824 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0273_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0273
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0274 : Poly :=
[
  term ((-57262735541634266034955658702832707764390047661772515434999586517 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(10, 1), (16, 1)]
]

/-- Partial product 274 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0274 : Poly :=
[
  term ((-114525471083268532069911317405665415528780095323545030869999173034 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(6, 1), (10, 1), (16, 1)],
  term ((57262735541634266034955658702832707764390047661772515434999586517 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0274_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0274
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0275 : Poly :=
[
  term ((236875098566535893499412288165162274558697500449590878328831340 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 275 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0275 : Poly :=
[
  term ((473750197133071786998824576330324549117395000899181756657662680 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-236875098566535893499412288165162274558697500449590878328831340 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0275_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0275
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0276 : Poly :=
[
  term ((-46582926245990040444944086927509689891535610963623503088450350356 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 276 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0276 : Poly :=
[
  term ((-93165852491980080889888173855019379783071221927247006176900700712 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((46582926245990040444944086927509689891535610963623503088450350356 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0276_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0276
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0277 : Poly :=
[
  term ((-80176137134939805215042626867571315953091253296828695874410991929092619 : Rat) / 7025276262832103560790910416704145207029740273648215209581771702782613) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 277 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0277 : Poly :=
[
  term ((-160352274269879610430085253735142631906182506593657391748821983858185238 : Rat) / 7025276262832103560790910416704145207029740273648215209581771702782613) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((80176137134939805215042626867571315953091253296828695874410991929092619 : Rat) / 7025276262832103560790910416704145207029740273648215209581771702782613) [(11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0277_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0277
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0278 : Poly :=
[
  term ((104456495543615935046403639705119525965557425203597137290246073776516453 : Rat) / 23417587542773678535969701389013817356765800912160717365272572342608710) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 278 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0278 : Poly :=
[
  term ((104456495543615935046403639705119525965557425203597137290246073776516453 : Rat) / 11708793771386839267984850694506908678382900456080358682636286171304355) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-104456495543615935046403639705119525965557425203597137290246073776516453 : Rat) / 23417587542773678535969701389013817356765800912160717365272572342608710) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0278_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0278
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0279 : Poly :=
[
  term ((-12255890619218342197572641257932298083172080833788272522789816048356066 : Rat) / 1672684824483834181140692956358129811197557208011479811805183738757765) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 279 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0279 : Poly :=
[
  term ((-24511781238436684395145282515864596166344161667576545045579632096712132 : Rat) / 1672684824483834181140692956358129811197557208011479811805183738757765) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((12255890619218342197572641257932298083172080833788272522789816048356066 : Rat) / 1672684824483834181140692956358129811197557208011479811805183738757765) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0279_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0279
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0280 : Poly :=
[
  term ((-881164408185319589835537877444309747466963839198936320073295584 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 280 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0280 : Poly :=
[
  term ((-1762328816370639179671075754888619494933927678397872640146591168 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((881164408185319589835537877444309747466963839198936320073295584 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0280_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0280
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0281 : Poly :=
[
  term ((2068305603803691531877738750661985829325011198608441609522585316 : Rat) / 1083656013016580651793677173151448123520904772555519369744806145) [(11, 2), (16, 1)]
]

/-- Partial product 281 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0281 : Poly :=
[
  term ((4136611207607383063755477501323971658650022397216883219045170632 : Rat) / 1083656013016580651793677173151448123520904772555519369744806145) [(6, 1), (11, 2), (16, 1)],
  term ((-2068305603803691531877738750661985829325011198608441609522585316 : Rat) / 1083656013016580651793677173151448123520904772555519369744806145) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0281_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0281
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0282 : Poly :=
[
  term ((-4671667086651854012487869268504271040522683469605519402106981396 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 282 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0282 : Poly :=
[
  term ((-9343334173303708024975738537008542081045366939211038804213962792 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4671667086651854012487869268504271040522683469605519402106981396 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0282_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0282
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0283 : Poly :=
[
  term ((-1865506986909796190835439182111684454989536099892358703665069433 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 283 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0283 : Poly :=
[
  term ((-3731013973819592381670878364223368909979072199784717407330138866 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((1865506986909796190835439182111684454989536099892358703665069433 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0283_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0283
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0284 : Poly :=
[
  term ((-10237458178395626724323559176773844055866529218815334741145 : Rat) / 1774125825312779769190035666748849376171288221288523041684) [(12, 1), (16, 1)]
]

/-- Partial product 284 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0284 : Poly :=
[
  term ((-10237458178395626724323559176773844055866529218815334741145 : Rat) / 887062912656389884595017833374424688085644110644261520842) [(6, 1), (12, 1), (16, 1)],
  term ((10237458178395626724323559176773844055866529218815334741145 : Rat) / 1774125825312779769190035666748849376171288221288523041684) [(12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0284_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0284
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0285 : Poly :=
[
  term ((205507599951202699175186338027168808793388262855598415134873713864 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 285 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0285 : Poly :=
[
  term ((411015199902405398350372676054337617586776525711196830269747427728 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-205507599951202699175186338027168808793388262855598415134873713864 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0285_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0285
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0286 : Poly :=
[
  term ((19947278612049708429023951692540741544260926160562080311980329360 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 286 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0286 : Poly :=
[
  term ((39894557224099416858047903385081483088521852321124160623960658720 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-19947278612049708429023951692540741544260926160562080311980329360 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0286_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0286
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0287 : Poly :=
[
  term ((-3839245534446483915799347138487028718631676692222649147058680132 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(13, 2), (16, 1)]
]

/-- Partial product 287 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0287 : Poly :=
[
  term ((-7678491068892967831598694276974057437263353384445298294117360264 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(6, 1), (13, 2), (16, 1)],
  term ((3839245534446483915799347138487028718631676692222649147058680132 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0287_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0287
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0288 : Poly :=
[
  term ((-114849856789953380582087165967213650742575904099791315800654896595 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(15, 2), (16, 1)]
]

/-- Partial product 288 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0288 : Poly :=
[
  term ((-229699713579906761164174331934427301485151808199582631601309793190 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(6, 1), (15, 2), (16, 1)],
  term ((114849856789953380582087165967213650742575904099791315800654896595 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0288_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0288
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0289 : Poly :=
[
  term ((918357745336524338585131923898069108223632969762734368922297832 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(15, 4), (16, 1)]
]

/-- Partial product 289 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0289 : Poly :=
[
  term ((1836715490673048677170263847796138216447265939525468737844595664 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(6, 1), (15, 4), (16, 1)],
  term ((-918357745336524338585131923898069108223632969762734368922297832 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0289_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0289
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0290 : Poly :=
[
  term ((1217481808830257929947596277093329014958009333247184571025708488573 : Rat) / 30342368364464258250222960848240547458585333631554542352854572060) [(16, 1)]
]

/-- Partial product 290 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0290 : Poly :=
[
  term ((1217481808830257929947596277093329014958009333247184571025708488573 : Rat) / 15171184182232129125111480424120273729292666815777271176427286030) [(6, 1), (16, 1)],
  term ((-1217481808830257929947596277093329014958009333247184571025708488573 : Rat) / 30342368364464258250222960848240547458585333631554542352854572060) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0290_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0290
        rs_R013_ueqv_R013YYYY_generator_16_0200_0290 =
      rs_R013_ueqv_R013YYYY_partial_16_0290 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YYYY_partials_16_0200_0290 : List Poly :=
[
  rs_R013_ueqv_R013YYYY_partial_16_0200,
  rs_R013_ueqv_R013YYYY_partial_16_0201,
  rs_R013_ueqv_R013YYYY_partial_16_0202,
  rs_R013_ueqv_R013YYYY_partial_16_0203,
  rs_R013_ueqv_R013YYYY_partial_16_0204,
  rs_R013_ueqv_R013YYYY_partial_16_0205,
  rs_R013_ueqv_R013YYYY_partial_16_0206,
  rs_R013_ueqv_R013YYYY_partial_16_0207,
  rs_R013_ueqv_R013YYYY_partial_16_0208,
  rs_R013_ueqv_R013YYYY_partial_16_0209,
  rs_R013_ueqv_R013YYYY_partial_16_0210,
  rs_R013_ueqv_R013YYYY_partial_16_0211,
  rs_R013_ueqv_R013YYYY_partial_16_0212,
  rs_R013_ueqv_R013YYYY_partial_16_0213,
  rs_R013_ueqv_R013YYYY_partial_16_0214,
  rs_R013_ueqv_R013YYYY_partial_16_0215,
  rs_R013_ueqv_R013YYYY_partial_16_0216,
  rs_R013_ueqv_R013YYYY_partial_16_0217,
  rs_R013_ueqv_R013YYYY_partial_16_0218,
  rs_R013_ueqv_R013YYYY_partial_16_0219,
  rs_R013_ueqv_R013YYYY_partial_16_0220,
  rs_R013_ueqv_R013YYYY_partial_16_0221,
  rs_R013_ueqv_R013YYYY_partial_16_0222,
  rs_R013_ueqv_R013YYYY_partial_16_0223,
  rs_R013_ueqv_R013YYYY_partial_16_0224,
  rs_R013_ueqv_R013YYYY_partial_16_0225,
  rs_R013_ueqv_R013YYYY_partial_16_0226,
  rs_R013_ueqv_R013YYYY_partial_16_0227,
  rs_R013_ueqv_R013YYYY_partial_16_0228,
  rs_R013_ueqv_R013YYYY_partial_16_0229,
  rs_R013_ueqv_R013YYYY_partial_16_0230,
  rs_R013_ueqv_R013YYYY_partial_16_0231,
  rs_R013_ueqv_R013YYYY_partial_16_0232,
  rs_R013_ueqv_R013YYYY_partial_16_0233,
  rs_R013_ueqv_R013YYYY_partial_16_0234,
  rs_R013_ueqv_R013YYYY_partial_16_0235,
  rs_R013_ueqv_R013YYYY_partial_16_0236,
  rs_R013_ueqv_R013YYYY_partial_16_0237,
  rs_R013_ueqv_R013YYYY_partial_16_0238,
  rs_R013_ueqv_R013YYYY_partial_16_0239,
  rs_R013_ueqv_R013YYYY_partial_16_0240,
  rs_R013_ueqv_R013YYYY_partial_16_0241,
  rs_R013_ueqv_R013YYYY_partial_16_0242,
  rs_R013_ueqv_R013YYYY_partial_16_0243,
  rs_R013_ueqv_R013YYYY_partial_16_0244,
  rs_R013_ueqv_R013YYYY_partial_16_0245,
  rs_R013_ueqv_R013YYYY_partial_16_0246,
  rs_R013_ueqv_R013YYYY_partial_16_0247,
  rs_R013_ueqv_R013YYYY_partial_16_0248,
  rs_R013_ueqv_R013YYYY_partial_16_0249,
  rs_R013_ueqv_R013YYYY_partial_16_0250,
  rs_R013_ueqv_R013YYYY_partial_16_0251,
  rs_R013_ueqv_R013YYYY_partial_16_0252,
  rs_R013_ueqv_R013YYYY_partial_16_0253,
  rs_R013_ueqv_R013YYYY_partial_16_0254,
  rs_R013_ueqv_R013YYYY_partial_16_0255,
  rs_R013_ueqv_R013YYYY_partial_16_0256,
  rs_R013_ueqv_R013YYYY_partial_16_0257,
  rs_R013_ueqv_R013YYYY_partial_16_0258,
  rs_R013_ueqv_R013YYYY_partial_16_0259,
  rs_R013_ueqv_R013YYYY_partial_16_0260,
  rs_R013_ueqv_R013YYYY_partial_16_0261,
  rs_R013_ueqv_R013YYYY_partial_16_0262,
  rs_R013_ueqv_R013YYYY_partial_16_0263,
  rs_R013_ueqv_R013YYYY_partial_16_0264,
  rs_R013_ueqv_R013YYYY_partial_16_0265,
  rs_R013_ueqv_R013YYYY_partial_16_0266,
  rs_R013_ueqv_R013YYYY_partial_16_0267,
  rs_R013_ueqv_R013YYYY_partial_16_0268,
  rs_R013_ueqv_R013YYYY_partial_16_0269,
  rs_R013_ueqv_R013YYYY_partial_16_0270,
  rs_R013_ueqv_R013YYYY_partial_16_0271,
  rs_R013_ueqv_R013YYYY_partial_16_0272,
  rs_R013_ueqv_R013YYYY_partial_16_0273,
  rs_R013_ueqv_R013YYYY_partial_16_0274,
  rs_R013_ueqv_R013YYYY_partial_16_0275,
  rs_R013_ueqv_R013YYYY_partial_16_0276,
  rs_R013_ueqv_R013YYYY_partial_16_0277,
  rs_R013_ueqv_R013YYYY_partial_16_0278,
  rs_R013_ueqv_R013YYYY_partial_16_0279,
  rs_R013_ueqv_R013YYYY_partial_16_0280,
  rs_R013_ueqv_R013YYYY_partial_16_0281,
  rs_R013_ueqv_R013YYYY_partial_16_0282,
  rs_R013_ueqv_R013YYYY_partial_16_0283,
  rs_R013_ueqv_R013YYYY_partial_16_0284,
  rs_R013_ueqv_R013YYYY_partial_16_0285,
  rs_R013_ueqv_R013YYYY_partial_16_0286,
  rs_R013_ueqv_R013YYYY_partial_16_0287,
  rs_R013_ueqv_R013YYYY_partial_16_0288,
  rs_R013_ueqv_R013YYYY_partial_16_0289,
  rs_R013_ueqv_R013YYYY_partial_16_0290
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YYYY_block_16_0200_0290 : Poly :=
[
  term ((81499884346733525208257272163391202209610406357489935968 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-81499884346733525208257272163391202209610406357489935968 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-40749942173366762604128636081695601104805203178744967984 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(4, 1), (5, 1), (13, 1), (16, 1)],
  term ((40749942173366762604128636081695601104805203178744967984 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((18905690614601314010926965082395902959475750475960159133986816 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(4, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((1184099926137529561531315665130803783311558136479266571640880336 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((316686766893133423547831418802716679665924933500617765268172136 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((20694002759016797748511600260756424084088146982655176638781440 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(4, 1), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((37091447045716716680549966437379649128211589824339041748952490624 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1972626141186851127098875787214085851549681184842498691392139456 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(4, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((10347001379508398874255800130378212042044073491327588319390720 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(4, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((18545723522858358340274983218689824564105794912169520874476245312 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-986313070593425563549437893607042925774840592421249345696069728 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-74182894091433433361099932874759298256423179648678083497904981248 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3945252282373702254197751574428171703099362369684997382784278912 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(4, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-41388005518033595497023200521512848168176293965310353277562880 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(4, 1), (6, 1), (10, 1), (11, 2), (16, 1)],
  term ((18545723522858358340274983218689824564105794912169520874476245312 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((68682900032506388108014670375783967453236389934328000586109131306121056 : Rat) / 7025276262832103560790910416704145207029740273648215209581771702782613) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((39215958365740353272287056575431970764644068535073081792410348895561712 : Rat) / 11708793771386839267984850694506908678382900456080358682636286171304355) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-986313070593425563549437893607042925774840592421249345696069728 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(4, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((10347001379508398874255800130378212042044073491327588319390720 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(4, 1), (6, 1), (11, 2), (15, 2), (16, 1)],
  term ((33627754483402296341331350423729189136643238846814662038019840 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(4, 1), (6, 1), (11, 2), (16, 1)],
  term ((-2200802777218925487750243711662526768522455393919490768384 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term ((-14334892375712981974300540982777480003761132028899842823891843280 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9402645434410277424463269491437464460378330698525737402615756864 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term ((9965406118197896249363711589180513257458558318677997093232290072 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((6880488867136174065058703617307930713997513139974386199296 : Rat) / 1330594368984584826892526750061637032128466165966392281263) [(4, 1), (6, 1), (16, 1)],
  term ((-9452845307300657005463482541197951479737875237980079566993408 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-592049963068764780765657832565401891655779068239633285820440168 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-158343383446566711773915709401358339832962466750308882634086068 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-10347001379508398874255800130378212042044073491327588319390720 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(4, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-18545723522858358340274983218689824564105794912169520874476245312 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((986313070593425563549437893607042925774840592421249345696069728 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-5173500689754199437127900065189106021022036745663794159695360 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-9272861761429179170137491609344912282052897456084760437238122656 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term ((493156535296712781774718946803521462887420296210624672848034864 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((37091447045716716680549966437379649128211589824339041748952490624 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1972626141186851127098875787214085851549681184842498691392139456 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((20694002759016797748511600260756424084088146982655176638781440 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(4, 1), (10, 1), (11, 2), (16, 1)],
  term ((-9272861761429179170137491609344912282052897456084760437238122656 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-34341450016253194054007335187891983726618194967164000293054565653060528 : Rat) / 7025276262832103560790910416704145207029740273648215209581771702782613) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-19607979182870176636143528287715985382322034267536540896205174447780856 : Rat) / 11708793771386839267984850694506908678382900456080358682636286171304355) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((493156535296712781774718946803521462887420296210624672848034864 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((-5173500689754199437127900065189106021022036745663794159695360 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(4, 1), (11, 2), (15, 2), (16, 1)],
  term ((-16813877241701148170665675211864594568321619423407331019009920 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(4, 1), (11, 2), (16, 1)],
  term ((1100401388609462743875121855831263384261227696959745384192 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(4, 1), (12, 1), (16, 1)],
  term ((7167446187856490987150270491388740001880566014449921411945921640 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((4701322717205138712231634745718732230189165349262868701307878432 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(4, 1), (13, 2), (16, 1)],
  term ((-4982703059098948124681855794590256628729279159338998546616145036 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(4, 1), (15, 2), (16, 1)],
  term ((-3440244433568087032529351808653965356998756569987193099648 : Rat) / 1330594368984584826892526750061637032128466165966392281263) [(4, 1), (16, 1)],
  term ((-30100090287505406014102165977248558777758876639821648472126336 : Rat) / 72243734201105376786245144876763208234726984837034624649653743) [(5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-99521043956266650260985911428098546186121604020571129505075923872 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((4578002145397156803938738211522107171855441116145536749271513904 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((5173500689754199437127900065189106021022036745663794159695360 : Rat) / 72243734201105376786245144876763208234726984837034624649653743) [(5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((10014951504750528192957934110517880878734960248116722655089483680 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(5, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-4023887289652978050470338979548773106935773282367526444677632464 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-179846846914373473345259297263072146313513934929964877376387408 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-15050045143752703007051082988624279388879438319910824236063168 : Rat) / 72243734201105376786245144876763208234726984837034624649653743) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-6323032291799527621400959671046759311712994586241473202010092 : Rat) / 72243734201105376786245144876763208234726984837034624649653743) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((9402645434410277424463269491437464460378330698525737402615756864 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((18959745514783738785572764136629566591195196827207740671626609752 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-49760521978133325130492955714049273093060802010285564752537961936 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-21546052719092607818573527466964174776853501069700128276976061368 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-456718709703970917204217315733210253624582722992376391443946994 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((2289001072698578401969369105761053585927720558072768374635756952 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(5, 1), (6, 1), (15, 3), (16, 1)],
  term ((15050045143752703007051082988624279388879438319910824236063168 : Rat) / 72243734201105376786245144876763208234726984837034624649653743) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((49760521978133325130492955714049273093060802010285564752537961936 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-2289001072698578401969369105761053585927720558072768374635756952 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2586750344877099718563950032594553010511018372831897079847680 : Rat) / 72243734201105376786245144876763208234726984837034624649653743) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-5007475752375264096478967055258940439367480124058361327544741840 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(5, 1), (10, 1), (13, 1), (16, 1)],
  term ((2011943644826489025235169489774386553467886641183763222338816232 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term ((89923423457186736672629648631536073156756967464982438688193704 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(5, 1), (11, 1), (12, 1), (16, 1)],
  term ((7525022571876351503525541494312139694439719159955412118031584 : Rat) / 72243734201105376786245144876763208234726984837034624649653743) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((3161516145899763810700479835523379655856497293120736601005046 : Rat) / 72243734201105376786245144876763208234726984837034624649653743) [(5, 1), (11, 1), (16, 1)],
  term ((-4701322717205138712231634745718732230189165349262868701307878432 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-9479872757391869392786382068314783295597598413603870335813304876 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((24880260989066662565246477857024636546530401005142782376268980968 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((10773026359546303909286763733482087388426750534850064138488030684 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(5, 1), (13, 1), (16, 1)],
  term ((228359354851985458602108657866605126812291361496188195721973497 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(5, 1), (15, 1), (16, 1)],
  term ((-1144500536349289200984684552880526792963860279036384187317878476 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(5, 1), (15, 3), (16, 1)],
  term ((48277512731096818866639373871196587363857112139078990688473088 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(6, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((81499884346733525208257272163391202209610406357489935968 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(6, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-81499884346733525208257272163391202209610406357489935968 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-267304509698743601970761984657365402180291361397958427278007744 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-128160481637436909153193627095939971467491468921431202603689601632 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term ((216146203277657355532229566431452678058505102302245542794229120 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-118697189727235530727978774977046650558902994389019624982506128 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-154500299928967560416711699752904857680197472863125038180642136 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-93785615765869185664060518962741942097043994762170116502980328 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1848629816550414022019258576308045282379344291408541191296 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(6, 1), (8, 1), (10, 1), (16, 1)],
  term ((-71822185197050482254062661924423425737670780220566466322716606320 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-89887504983380742253451862989025502100159533105706141241174880136 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1498953026354966877047681802587694605628537507799433216015485728 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term ((124264153362528421084721155281990254007712983861399050208 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-73117490179521951800621773365351374410217044753200899966860 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(6, 1), (8, 1), (16, 1)],
  term ((1366134377023212043246708415711245426693013336661212894937102368 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-114509519786909679525713685785615333828471663633927546031084795104 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((26952060155013564018258087381171723773293836534000661272193491568 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-154156744286316099423480499712872761105677369573482840960 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-5758339110187911267974332112261132218996460065823738032 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-242583178732660875348518104849656257414830484106469608396078563348 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((81499884346733525208257272163391202209610406357489935968 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-30005748088939484835242286584410051785155342056922620555213307860 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-6398722534778357418620593702951744294703907439222214124039775148 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((5758339110187911267974332112261132218996460065823738032 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(6, 1), (9, 2), (10, 1), (16, 1)],
  term ((-254286645835244753437416642676241640234422427788621838448 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(6, 1), (9, 2), (16, 1)],
  term ((372663409967920323559552695420077519132284887708988024707602802848 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((125870889656734356470387551215707556653731393143410959937962777136 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((7049315265482556718684303019554477979735710713591490560586364672 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(6, 1), (10, 1), (11, 2), (16, 1)],
  term ((-6696286326555708678068697788528820647686607518147310301264 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(6, 1), (10, 1), (12, 1), (16, 1)],
  term ((-924314908275207011009629288154022641189672145704270595648 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-114525471083268532069911317405665415528780095323545030869999173034 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(6, 1), (10, 1), (16, 1)],
  term ((473750197133071786998824576330324549117395000899181756657662680 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-93165852491980080889888173855019379783071221927247006176900700712 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-160352274269879610430085253735142631906182506593657391748821983858185238 : Rat) / 7025276262832103560790910416704145207029740273648215209581771702782613) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((104456495543615935046403639705119525965557425203597137290246073776516453 : Rat) / 11708793771386839267984850694506908678382900456080358682636286171304355) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-24511781238436684395145282515864596166344161667576545045579632096712132 : Rat) / 1672684824483834181140692956358129811197557208011479811805183738757765) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1762328816370639179671075754888619494933927678397872640146591168 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((4136611207607383063755477501323971658650022397216883219045170632 : Rat) / 1083656013016580651793677173151448123520904772555519369744806145) [(6, 1), (11, 2), (16, 1)],
  term ((-9343334173303708024975738537008542081045366939211038804213962792 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3731013973819592381670878364223368909979072199784717407330138866 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-10237458178395626724323559176773844055866529218815334741145 : Rat) / 887062912656389884595017833374424688085644110644261520842) [(6, 1), (12, 1), (16, 1)],
  term ((411015199902405398350372676054337617586776525711196830269747427728 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((39894557224099416858047903385081483088521852321124160623960658720 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-7678491068892967831598694276974057437263353384445298294117360264 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(6, 1), (13, 2), (16, 1)],
  term ((-229699713579906761164174331934427301485151808199582631601309793190 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(6, 1), (15, 2), (16, 1)],
  term ((1836715490673048677170263847796138216447265939525468737844595664 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(6, 1), (15, 4), (16, 1)],
  term ((1217481808830257929947596277093329014958009333247184571025708488573 : Rat) / 15171184182232129125111480424120273729292666815777271176427286030) [(6, 1), (16, 1)],
  term ((-5612711135751746200022845665100017344753632052944799500384768 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-222898851018805319492934210993218044046981357154719241098232392 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((219585332748460145633942489211449576006103604768118209595938504 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-24138756365548409433319686935598293681928556069539495344236544 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-40749942173366762604128636081695601104805203178744967984 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((40749942173366762604128636081695601104805203178744967984 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((133652254849371800985380992328682701090145680698979213639003872 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(7, 1), (11, 1), (16, 1)],
  term ((64080240818718454576596813547969985733745734460715601301844800816 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(7, 1), (13, 1), (16, 1)],
  term ((-108073101638828677766114783215726339029252551151122771397114560 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(7, 1), (15, 1), (16, 1)],
  term ((59348594863617765363989387488523325279451497194509812491253064 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((77250149964483780208355849876452428840098736431562519090321068 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((46892807882934592832030259481370971048521997381085058251490164 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((924314908275207011009629288154022641189672145704270595648 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(8, 1), (10, 1), (16, 1)],
  term ((35911092598525241127031330962211712868835390110283233161358303160 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((44943752491690371126725931494512751050079766552853070620587440068 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((749476513177483438523840901293847302814268753899716608007742864 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(8, 1), (11, 2), (16, 1)],
  term ((-62132076681264210542360577640995127003856491930699525104 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(8, 1), (15, 2), (16, 1)],
  term ((36558745089760975900310886682675687205108522376600449983430 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(8, 1), (16, 1)],
  term ((-683067188511606021623354207855622713346506668330606447468551184 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((57254759893454839762856842892807666914235831816963773015542397552 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-13476030077506782009129043690585861886646918267000330636096745784 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((77078372143158049711740249856436380552838684786741420480 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((2879169555093955633987166056130566109498230032911869016 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((121312637033089506722509138096072253772458068173433347196165724554 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(9, 1), (11, 1), (16, 1)],
  term ((-40749942173366762604128636081695601104805203178744967984 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((45064346846163928582736663429363382188744758424672610643094519888 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(9, 1), (13, 1), (16, 1)],
  term ((1048154978067354557633937076391003251116809272806359169873634316 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(9, 1), (15, 1), (16, 1)],
  term ((-2879169555093955633987166056130566109498230032911869016 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(9, 2), (10, 1), (16, 1)],
  term ((127143322917622376718708321338120820117211213894310919224 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(9, 2), (16, 1)],
  term ((-186331704983960161779776347710038759566142443854494012353801401424 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-62935444828367178235193775607853778326865696571705479968981388568 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3524657632741278359342151509777238989867855356795745280293182336 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(10, 1), (11, 2), (16, 1)],
  term ((3348143163277854339034348894264410323843303759073655150632 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(10, 1), (12, 1), (16, 1)],
  term ((462157454137603505504814644077011320594836072852135297824 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(10, 1), (15, 2), (16, 1)],
  term ((57262735541634266034955658702832707764390047661772515434999586517 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(10, 1), (16, 1)],
  term ((-236875098566535893499412288165162274558697500449590878328831340 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((46582926245990040444944086927509689891535610963623503088450350356 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((80176137134939805215042626867571315953091253296828695874410991929092619 : Rat) / 7025276262832103560790910416704145207029740273648215209581771702782613) [(11, 1), (13, 1), (16, 1)],
  term ((-104456495543615935046403639705119525965557425203597137290246073776516453 : Rat) / 23417587542773678535969701389013817356765800912160717365272572342608710) [(11, 1), (15, 1), (16, 1)],
  term ((12255890619218342197572641257932298083172080833788272522789816048356066 : Rat) / 1672684824483834181140692956358129811197557208011479811805183738757765) [(11, 1), (15, 3), (16, 1)],
  term ((881164408185319589835537877444309747466963839198936320073295584 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(11, 2), (15, 2), (16, 1)],
  term ((-2068305603803691531877738750661985829325011198608441609522585316 : Rat) / 1083656013016580651793677173151448123520904772555519369744806145) [(11, 2), (16, 1)],
  term ((4671667086651854012487869268504271040522683469605519402106981396 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1865506986909796190835439182111684454989536099892358703665069433 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(12, 1), (15, 2), (16, 1)],
  term ((10237458178395626724323559176773844055866529218815334741145 : Rat) / 1774125825312779769190035666748849376171288221288523041684) [(12, 1), (16, 1)],
  term ((-205507599951202699175186338027168808793388262855598415134873713864 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(13, 1), (15, 1), (16, 1)],
  term ((-19947278612049708429023951692540741544260926160562080311980329360 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(13, 1), (15, 3), (16, 1)],
  term ((3839245534446483915799347138487028718631676692222649147058680132 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(13, 2), (16, 1)],
  term ((114849856789953380582087165967213650742575904099791315800654896595 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(15, 2), (16, 1)],
  term ((-918357745336524338585131923898069108223632969762734368922297832 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(15, 4), (16, 1)],
  term ((-1217481808830257929947596277093329014958009333247184571025708488573 : Rat) / 30342368364464258250222960848240547458585333631554542352854572060) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 200 through 290. -/
theorem rs_R013_ueqv_R013YYYY_block_16_0200_0290_valid :
    checkProductSumEq rs_R013_ueqv_R013YYYY_partials_16_0200_0290
      rs_R013_ueqv_R013YYYY_block_16_0200_0290 = true := by
  native_decide

end R013UeqvR013YYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
