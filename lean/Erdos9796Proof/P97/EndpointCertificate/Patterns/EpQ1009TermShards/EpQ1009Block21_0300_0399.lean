/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_009, term block 21:300-399

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_009`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1009TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q1_009`. -/
def ep_Q1_009_generator_21_0300_0399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0300 : Poly :=
[
  term ((-442059787318935108193 : Rat) / 30564306391144094857) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 300 for generator 21. -/
def ep_Q1_009_partial_21_0300 : Poly :=
[
  term ((-884119574637870216386 : Rat) / 30564306391144094857) [(3, 1), (5, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((442059787318935108193 : Rat) / 30564306391144094857) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 21. -/
theorem ep_Q1_009_partial_21_0300_valid :
    mulPoly ep_Q1_009_coefficient_21_0300
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0301 : Poly :=
[
  term ((-1091413301468703815000972756692080 : Rat) / 24049240021528595265061175145067379) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 301 for generator 21. -/
def ep_Q1_009_partial_21_0301 : Poly :=
[
  term ((-2182826602937407630001945513384160 : Rat) / 24049240021528595265061175145067379) [(3, 1), (5, 1), (6, 1), (10, 1), (13, 1), (15, 1)],
  term ((1091413301468703815000972756692080 : Rat) / 24049240021528595265061175145067379) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 21. -/
theorem ep_Q1_009_partial_21_0301_valid :
    mulPoly ep_Q1_009_coefficient_21_0301
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0302 : Poly :=
[
  term ((1310030566858894467252019011895171114441065272115638440997579140968493838924824636687862896482339811 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(3, 1), (5, 1), (6, 1), (15, 2)]
]

/-- Partial product 302 for generator 21. -/
def ep_Q1_009_partial_21_0302 : Poly :=
[
  term ((1310030566858894467252019011895171114441065272115638440997579140968493838924824636687862896482339811 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(3, 1), (5, 1), (6, 1), (10, 1), (15, 2)],
  term ((-1310030566858894467252019011895171114441065272115638440997579140968493838924824636687862896482339811 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(3, 1), (5, 1), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 21. -/
theorem ep_Q1_009_partial_21_0302_valid :
    mulPoly ep_Q1_009_coefficient_21_0302
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0303 : Poly :=
[
  term ((-2067140832184623 : Rat) / 1395206957462413) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 303 for generator 21. -/
def ep_Q1_009_partial_21_0303 : Poly :=
[
  term ((-4134281664369246 : Rat) / 1395206957462413) [(3, 1), (5, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((2067140832184623 : Rat) / 1395206957462413) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 21. -/
theorem ep_Q1_009_partial_21_0303_valid :
    mulPoly ep_Q1_009_coefficient_21_0303
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0304 : Poly :=
[
  term ((-3580960609 : Rat) / 33007268) [(3, 1), (5, 1), (6, 1), (16, 1)]
]

/-- Partial product 304 for generator 21. -/
def ep_Q1_009_partial_21_0304 : Poly :=
[
  term ((-3580960609 : Rat) / 16503634) [(3, 1), (5, 1), (6, 1), (10, 1), (16, 1)],
  term ((3580960609 : Rat) / 33007268) [(3, 1), (5, 1), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 21. -/
theorem ep_Q1_009_partial_21_0304_valid :
    mulPoly ep_Q1_009_coefficient_21_0304
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0305 : Poly :=
[
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 139375546017252349464005563682260959965358465317040887172869381368953082572091389357137839152) [(3, 1), (5, 1), (7, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 305 for generator 21. -/
def ep_Q1_009_partial_21_0305 : Poly :=
[
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 69687773008626174732002781841130479982679232658520443586434690684476541286045694678568919576) [(3, 1), (5, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 139375546017252349464005563682260959965358465317040887172869381368953082572091389357137839152) [(3, 1), (5, 1), (7, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 21. -/
theorem ep_Q1_009_partial_21_0305_valid :
    mulPoly ep_Q1_009_coefficient_21_0305
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0306 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 296466738352028633689641645777273720417206836079539836147819300461770902317227116366148440) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1)]
]

/-- Partial product 306 for generator 21. -/
def ep_Q1_009_partial_21_0306 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 148233369176014316844820822888636860208603418039769918073909650230885451158613558183074220) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 296466738352028633689641645777273720417206836079539836147819300461770902317227116366148440) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 21. -/
theorem ep_Q1_009_partial_21_0306_valid :
    mulPoly ep_Q1_009_coefficient_21_0306
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0307 : Poly :=
[
  term ((27492749791071081803571451773161984000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 2)]
]

/-- Partial product 307 for generator 21. -/
def ep_Q1_009_partial_21_0307 : Poly :=
[
  term ((54985499582142163607142903546323968000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((-27492749791071081803571451773161984000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 21. -/
theorem ep_Q1_009_partial_21_0307_valid :
    mulPoly ep_Q1_009_coefficient_21_0307
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0308 : Poly :=
[
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 160036260389546081895386215669846844279679463524758398800387993263114540599541503708313868870552) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 308 for generator 21. -/
def ep_Q1_009_partial_21_0308 : Poly :=
[
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 80018130194773040947693107834923422139839731762379199400193996631557270299770751854156934435276) [(3, 1), (5, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 160036260389546081895386215669846844279679463524758398800387993263114540599541503708313868870552) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 21. -/
theorem ep_Q1_009_partial_21_0308_valid :
    mulPoly ep_Q1_009_coefficient_21_0308
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0309 : Poly :=
[
  term ((4592240 : Rat) / 3536493) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 309 for generator 21. -/
def ep_Q1_009_partial_21_0309 : Poly :=
[
  term ((9184480 : Rat) / 3536493) [(3, 1), (5, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4592240 : Rat) / 3536493) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 21. -/
theorem ep_Q1_009_partial_21_0309_valid :
    mulPoly ep_Q1_009_coefficient_21_0309
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0310 : Poly :=
[
  term ((3923648913495604439820613487890302670161013766311903475360458108761301201599332974901155264994773 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(3, 1), (5, 1), (8, 1), (14, 1)]
]

/-- Partial product 310 for generator 21. -/
def ep_Q1_009_partial_21_0310 : Poly :=
[
  term ((3923648913495604439820613487890302670161013766311903475360458108761301201599332974901155264994773 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 1)],
  term ((-3923648913495604439820613487890302670161013766311903475360458108761301201599332974901155264994773 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(3, 1), (5, 1), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 21. -/
theorem ep_Q1_009_partial_21_0310_valid :
    mulPoly ep_Q1_009_coefficient_21_0310
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0311 : Poly :=
[
  term ((-1097777345943255900401211723952676 : Rat) / 10306817152083683685026217919314591) [(3, 1), (5, 1), (8, 1), (14, 1), (15, 2)]
]

/-- Partial product 311 for generator 21. -/
def ep_Q1_009_partial_21_0311 : Poly :=
[
  term ((-2195554691886511800802423447905352 : Rat) / 10306817152083683685026217919314591) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((1097777345943255900401211723952676 : Rat) / 10306817152083683685026217919314591) [(3, 1), (5, 1), (8, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 21. -/
theorem ep_Q1_009_partial_21_0311_valid :
    mulPoly ep_Q1_009_coefficient_21_0311
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0312 : Poly :=
[
  term ((-132267930523694104282921036322170354977419335013223049497616203602176807306087210845332543125973985762103139618748727 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 312 for generator 21. -/
def ep_Q1_009_partial_21_0312 : Poly :=
[
  term ((-132267930523694104282921036322170354977419335013223049497616203602176807306087210845332543125973985762103139618748727 : Rat) / 2365506791739801684150139206674736447626870958371294731673776576413501834607965349549223117520031542949081317972480) [(3, 1), (5, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((132267930523694104282921036322170354977419335013223049497616203602176807306087210845332543125973985762103139618748727 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 21. -/
theorem ep_Q1_009_partial_21_0312_valid :
    mulPoly ep_Q1_009_coefficient_21_0312
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0313 : Poly :=
[
  term ((442059787318935108193 : Rat) / 30564306391144094857) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 313 for generator 21. -/
def ep_Q1_009_partial_21_0313 : Poly :=
[
  term ((884119574637870216386 : Rat) / 30564306391144094857) [(3, 1), (5, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-442059787318935108193 : Rat) / 30564306391144094857) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 21. -/
theorem ep_Q1_009_partial_21_0313_valid :
    mulPoly ep_Q1_009_coefficient_21_0313
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0314 : Poly :=
[
  term ((1091413301468703815000972756692080 : Rat) / 24049240021528595265061175145067379) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 314 for generator 21. -/
def ep_Q1_009_partial_21_0314 : Poly :=
[
  term ((2182826602937407630001945513384160 : Rat) / 24049240021528595265061175145067379) [(3, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1091413301468703815000972756692080 : Rat) / 24049240021528595265061175145067379) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 21. -/
theorem ep_Q1_009_partial_21_0314_valid :
    mulPoly ep_Q1_009_coefficient_21_0314
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0315 : Poly :=
[
  term ((6661724079086717290020924974730589803503439422405400515393470879240830726754760960109302866595304961 : Rat) / 6075952936823444465180764798312829342143762682973878191743544151006382558355474039095306207966720) [(3, 1), (5, 1), (14, 1)]
]

/-- Partial product 315 for generator 21. -/
def ep_Q1_009_partial_21_0315 : Poly :=
[
  term ((6661724079086717290020924974730589803503439422405400515393470879240830726754760960109302866595304961 : Rat) / 3037976468411722232590382399156414671071881341486939095871772075503191279177737019547653103983360) [(3, 1), (5, 1), (10, 1), (14, 1)],
  term ((-6661724079086717290020924974730589803503439422405400515393470879240830726754760960109302866595304961 : Rat) / 6075952936823444465180764798312829342143762682973878191743544151006382558355474039095306207966720) [(3, 1), (5, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 21. -/
theorem ep_Q1_009_partial_21_0315_valid :
    mulPoly ep_Q1_009_coefficient_21_0315
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0316 : Poly :=
[
  term ((-1310030566858894467252019011895171114441065272115638440997579140968493838924824636687862896482339811 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(3, 1), (5, 1), (14, 1), (15, 2)]
]

/-- Partial product 316 for generator 21. -/
def ep_Q1_009_partial_21_0316 : Poly :=
[
  term ((-1310030566858894467252019011895171114441065272115638440997579140968493838924824636687862896482339811 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(3, 1), (5, 1), (10, 1), (14, 1), (15, 2)],
  term ((1310030566858894467252019011895171114441065272115638440997579140968493838924824636687862896482339811 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(3, 1), (5, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 21. -/
theorem ep_Q1_009_partial_21_0316_valid :
    mulPoly ep_Q1_009_coefficient_21_0316
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0317 : Poly :=
[
  term ((2067140832184623 : Rat) / 1395206957462413) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 317 for generator 21. -/
def ep_Q1_009_partial_21_0317 : Poly :=
[
  term ((4134281664369246 : Rat) / 1395206957462413) [(3, 1), (5, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2067140832184623 : Rat) / 1395206957462413) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 21. -/
theorem ep_Q1_009_partial_21_0317_valid :
    mulPoly ep_Q1_009_coefficient_21_0317
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0318 : Poly :=
[
  term ((3526595697 : Rat) / 33007268) [(3, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 318 for generator 21. -/
def ep_Q1_009_partial_21_0318 : Poly :=
[
  term ((3526595697 : Rat) / 16503634) [(3, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-3526595697 : Rat) / 33007268) [(3, 1), (5, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 21. -/
theorem ep_Q1_009_partial_21_0318_valid :
    mulPoly ep_Q1_009_coefficient_21_0318
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0319 : Poly :=
[
  term ((8419695923510322705928972921500055374497826073117976267729155934046875 : Rat) / 890571716835482906164955021823166604126951794348629016670548606994258302) [(3, 1), (6, 1), (7, 1)]
]

/-- Partial product 319 for generator 21. -/
def ep_Q1_009_partial_21_0319 : Poly :=
[
  term ((-8419695923510322705928972921500055374497826073117976267729155934046875 : Rat) / 890571716835482906164955021823166604126951794348629016670548606994258302) [(3, 1), (6, 1), (7, 1)],
  term ((8419695923510322705928972921500055374497826073117976267729155934046875 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(3, 1), (6, 1), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 21. -/
theorem ep_Q1_009_partial_21_0319_valid :
    mulPoly ep_Q1_009_coefficient_21_0319
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0320 : Poly :=
[
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(3, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 320 for generator 21. -/
def ep_Q1_009_partial_21_0320 : Poly :=
[
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(3, 1), (6, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(3, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 21. -/
theorem ep_Q1_009_partial_21_0320_valid :
    mulPoly ep_Q1_009_coefficient_21_0320
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0321 : Poly :=
[
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 185834061356336465952007418243014613287144620422721182897159175158604110096121852476183785536) [(3, 1), (6, 1), (7, 1), (8, 1), (15, 2)]
]

/-- Partial product 321 for generator 21. -/
def ep_Q1_009_partial_21_0321 : Poly :=
[
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 92917030678168232976003709121507306643572310211360591448579587579302055048060926238091892768) [(3, 1), (6, 1), (7, 1), (8, 1), (10, 1), (15, 2)],
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 185834061356336465952007418243014613287144620422721182897159175158604110096121852476183785536) [(3, 1), (6, 1), (7, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 21. -/
theorem ep_Q1_009_partial_21_0321_valid :
    mulPoly ep_Q1_009_coefficient_21_0321
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0322 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 474346781363245813903426633243637952667530937727263737836510880738833443707563386185837504) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 322 for generator 21. -/
def ep_Q1_009_partial_21_0322 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 237173390681622906951713316621818976333765468863631868918255440369416721853781693092918752) [(3, 1), (6, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 474346781363245813903426633243637952667530937727263737836510880738833443707563386185837504) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 21. -/
theorem ep_Q1_009_partial_21_0322_valid :
    mulPoly ep_Q1_009_coefficient_21_0322
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0323 : Poly :=
[
  term ((-17182968619419426127232157358226240000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 323 for generator 21. -/
def ep_Q1_009_partial_21_0323 : Poly :=
[
  term ((-34365937238838852254464314716452480000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (6, 1), (7, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((17182968619419426127232157358226240000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 21. -/
theorem ep_Q1_009_partial_21_0323_valid :
    mulPoly ep_Q1_009_coefficient_21_0323
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0324 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 395288984469371511586188861036364960556275781439386448197092400615694536422969488488197920) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 324 for generator 21. -/
def ep_Q1_009_partial_21_0324 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 197644492234685755793094430518182480278137890719693224098546200307847268211484744244098960) [(3, 1), (6, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 395288984469371511586188861036364960556275781439386448197092400615694536422969488488197920) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 21. -/
theorem ep_Q1_009_partial_21_0324_valid :
    mulPoly ep_Q1_009_coefficient_21_0324
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0325 : Poly :=
[
  term ((6873187447767770450892862943290496000 : Rat) / 714705621776938877770773029179031683713) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 3)]
]

/-- Partial product 325 for generator 21. -/
def ep_Q1_009_partial_21_0325 : Poly :=
[
  term ((13746374895535540901785725886580992000 : Rat) / 714705621776938877770773029179031683713) [(3, 1), (6, 1), (7, 1), (9, 1), (10, 1), (15, 3)],
  term ((-6873187447767770450892862943290496000 : Rat) / 714705621776938877770773029179031683713) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 21. -/
theorem ep_Q1_009_partial_21_0325_valid :
    mulPoly ep_Q1_009_coefficient_21_0325
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0326 : Poly :=
[
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 326 for generator 21. -/
def ep_Q1_009_partial_21_0326 : Poly :=
[
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 640145041558184327581544862679387377118717854099033595201551973052458162398166014833255475482208) [(3, 1), (6, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 21. -/
theorem ep_Q1_009_partial_21_0326_valid :
    mulPoly ep_Q1_009_coefficient_21_0326
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0327 : Poly :=
[
  term ((-2870150 : Rat) / 3536493) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 327 for generator 21. -/
def ep_Q1_009_partial_21_0327 : Poly :=
[
  term ((-5740300 : Rat) / 3536493) [(3, 1), (6, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2870150 : Rat) / 3536493) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 21. -/
theorem ep_Q1_009_partial_21_0327_valid :
    mulPoly ep_Q1_009_coefficient_21_0327
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0328 : Poly :=
[
  term ((-152 : Rat) / 51) [(3, 1), (6, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 328 for generator 21. -/
def ep_Q1_009_partial_21_0328 : Poly :=
[
  term ((-304 : Rat) / 51) [(3, 1), (6, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((152 : Rat) / 51) [(3, 1), (6, 1), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 21. -/
theorem ep_Q1_009_partial_21_0328_valid :
    mulPoly ep_Q1_009_coefficient_21_0328
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0329 : Poly :=
[
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 213381680519394775860514954226462459039572618033011198400517324350819387466055338277751825160736) [(3, 1), (6, 1), (7, 1), (15, 2)]
]

/-- Partial product 329 for generator 21. -/
def ep_Q1_009_partial_21_0329 : Poly :=
[
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 106690840259697387930257477113231229519786309016505599200258662175409693733027669138875912580368) [(3, 1), (6, 1), (7, 1), (10, 1), (15, 2)],
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 213381680519394775860514954226462459039572618033011198400517324350819387466055338277751825160736) [(3, 1), (6, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 21. -/
theorem ep_Q1_009_partial_21_0329_valid :
    mulPoly ep_Q1_009_coefficient_21_0329
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0330 : Poly :=
[
  term ((1148060 : Rat) / 1178831) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 330 for generator 21. -/
def ep_Q1_009_partial_21_0330 : Poly :=
[
  term ((2296120 : Rat) / 1178831) [(3, 1), (6, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1148060 : Rat) / 1178831) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 21. -/
theorem ep_Q1_009_partial_21_0330_valid :
    mulPoly ep_Q1_009_coefficient_21_0330
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0331 : Poly :=
[
  term ((-55412037762367802488998947802790069297608676532488218983418489765917640 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(3, 1), (6, 1), (8, 1), (13, 1)]
]

/-- Partial product 331 for generator 21. -/
def ep_Q1_009_partial_21_0331 : Poly :=
[
  term ((-110824075524735604977997895605580138595217353064976437966836979531835280 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(3, 1), (6, 1), (8, 1), (10, 1), (13, 1)],
  term ((55412037762367802488998947802790069297608676532488218983418489765917640 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(3, 1), (6, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 21. -/
theorem ep_Q1_009_partial_21_0331_valid :
    mulPoly ep_Q1_009_coefficient_21_0331
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0332 : Poly :=
[
  term ((40928848604860122640326673804152 : Rat) / 3435605717361227895008739306438197) [(3, 1), (6, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 332 for generator 21. -/
def ep_Q1_009_partial_21_0332 : Poly :=
[
  term ((81857697209720245280653347608304 : Rat) / 3435605717361227895008739306438197) [(3, 1), (6, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-40928848604860122640326673804152 : Rat) / 3435605717361227895008739306438197) [(3, 1), (6, 1), (8, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 21. -/
theorem ep_Q1_009_partial_21_0332_valid :
    mulPoly ep_Q1_009_coefficient_21_0332
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0333 : Poly :=
[
  term ((2332745824089091189416886543874293 : Rat) / 30920451456251051055078653757943773) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 333 for generator 21. -/
def ep_Q1_009_partial_21_0333 : Poly :=
[
  term ((4665491648178182378833773087748586 : Rat) / 30920451456251051055078653757943773) [(3, 1), (6, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2332745824089091189416886543874293 : Rat) / 30920451456251051055078653757943773) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 21. -/
theorem ep_Q1_009_partial_21_0333_valid :
    mulPoly ep_Q1_009_coefficient_21_0333
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0334 : Poly :=
[
  term ((203053469596726319919239379458055542725602016183523364704845004871749338317813017167339807420177 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(3, 1), (6, 1), (8, 1), (15, 1)]
]

/-- Partial product 334 for generator 21. -/
def ep_Q1_009_partial_21_0334 : Poly :=
[
  term ((203053469596726319919239379458055542725602016183523364704845004871749338317813017167339807420177 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(3, 1), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((-203053469596726319919239379458055542725602016183523364704845004871749338317813017167339807420177 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(3, 1), (6, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 21. -/
theorem ep_Q1_009_partial_21_0334_valid :
    mulPoly ep_Q1_009_coefficient_21_0334
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0335 : Poly :=
[
  term ((-513148782780892634464288557584084 : Rat) / 30920451456251051055078653757943773) [(3, 1), (6, 1), (8, 1), (15, 3)]
]

/-- Partial product 335 for generator 21. -/
def ep_Q1_009_partial_21_0335 : Poly :=
[
  term ((-1026297565561785268928577115168168 : Rat) / 30920451456251051055078653757943773) [(3, 1), (6, 1), (8, 1), (10, 1), (15, 3)],
  term ((513148782780892634464288557584084 : Rat) / 30920451456251051055078653757943773) [(3, 1), (6, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 21. -/
theorem ep_Q1_009_partial_21_0335_valid :
    mulPoly ep_Q1_009_coefficient_21_0335
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0336 : Poly :=
[
  term ((-383253308500450074592987468741180705219237251690855492080230492765636037144032600094330661572189421481709119802411 : Rat) / 9278771431193142178573725743269375621973507068874899658440898559111554144086159743267362069213166140521034833920) [(3, 1), (6, 1), (9, 1)]
]

/-- Partial product 336 for generator 21. -/
def ep_Q1_009_partial_21_0336 : Poly :=
[
  term ((383253308500450074592987468741180705219237251690855492080230492765636037144032600094330661572189421481709119802411 : Rat) / 9278771431193142178573725743269375621973507068874899658440898559111554144086159743267362069213166140521034833920) [(3, 1), (6, 1), (9, 1)],
  term ((-383253308500450074592987468741180705219237251690855492080230492765636037144032600094330661572189421481709119802411 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(3, 1), (6, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 21. -/
theorem ep_Q1_009_partial_21_0336_valid :
    mulPoly ep_Q1_009_coefficient_21_0336
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0337 : Poly :=
[
  term ((169463783708544948739876431317275482101263338467851552120237286686067037160961170247919865295166504505792788951 : Rat) / 64435912716619042906761984328259552930371576867186803183617351104941348222820553772690014369535875975840519680) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 337 for generator 21. -/
def ep_Q1_009_partial_21_0337 : Poly :=
[
  term ((169463783708544948739876431317275482101263338467851552120237286686067037160961170247919865295166504505792788951 : Rat) / 32217956358309521453380992164129776465185788433593401591808675552470674111410276886345007184767937987920259840) [(3, 1), (6, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-169463783708544948739876431317275482101263338467851552120237286686067037160961170247919865295166504505792788951 : Rat) / 64435912716619042906761984328259552930371576867186803183617351104941348222820553772690014369535875975840519680) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 21. -/
theorem ep_Q1_009_partial_21_0337_valid :
    mulPoly ep_Q1_009_coefficient_21_0337
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0338 : Poly :=
[
  term ((-2222571080448390025354 : Rat) / 1558779625948348837707) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 338 for generator 21. -/
def ep_Q1_009_partial_21_0338 : Poly :=
[
  term ((-4445142160896780050708 : Rat) / 1558779625948348837707) [(3, 1), (6, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2222571080448390025354 : Rat) / 1558779625948348837707) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 21. -/
theorem ep_Q1_009_partial_21_0338_valid :
    mulPoly ep_Q1_009_coefficient_21_0338
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0339 : Poly :=
[
  term ((117283306522936956553750233179464979379491942247212709346858909469230676785132376220421200023174920811237195459047 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(3, 1), (6, 1), (9, 1), (14, 1)]
]

/-- Partial product 339 for generator 21. -/
def ep_Q1_009_partial_21_0339 : Poly :=
[
  term ((117283306522936956553750233179464979379491942247212709346858909469230676785132376220421200023174920811237195459047 : Rat) / 2319692857798285544643431435817343905493376767218724914610224639777888536021539935816840517303291535130258708480) [(3, 1), (6, 1), (9, 1), (10, 1), (14, 1)],
  term ((-117283306522936956553750233179464979379491942247212709346858909469230676785132376220421200023174920811237195459047 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(3, 1), (6, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 21. -/
theorem ep_Q1_009_partial_21_0339_valid :
    mulPoly ep_Q1_009_coefficient_21_0339
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0340 : Poly :=
[
  term ((-237656816706250445897783 : Rat) / 18705355511380186052484) [(3, 1), (6, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 340 for generator 21. -/
def ep_Q1_009_partial_21_0340 : Poly :=
[
  term ((-237656816706250445897783 : Rat) / 9352677755690093026242) [(3, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((237656816706250445897783 : Rat) / 18705355511380186052484) [(3, 1), (6, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 21. -/
theorem ep_Q1_009_partial_21_0340_valid :
    mulPoly ep_Q1_009_coefficient_21_0340
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0341 : Poly :=
[
  term ((-25994488512823395253950655536071599487653325102923881572719866502400887777853539345913619122643075256982448796693741 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(3, 1), (6, 1), (9, 1), (15, 2)]
]

/-- Partial product 341 for generator 21. -/
def ep_Q1_009_partial_21_0341 : Poly :=
[
  term ((-25994488512823395253950655536071599487653325102923881572719866502400887777853539345913619122643075256982448796693741 : Rat) / 2365506791739801684150139206674736447626870958371294731673776576413501834607965349549223117520031542949081317972480) [(3, 1), (6, 1), (9, 1), (10, 1), (15, 2)],
  term ((25994488512823395253950655536071599487653325102923881572719866502400887777853539345913619122643075256982448796693741 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(3, 1), (6, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 21. -/
theorem ep_Q1_009_partial_21_0341_valid :
    mulPoly ep_Q1_009_coefficient_21_0341
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0342 : Poly :=
[
  term ((12321701761277009843027 : Rat) / 4676338877845046513121) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 342 for generator 21. -/
def ep_Q1_009_partial_21_0342 : Poly :=
[
  term ((24643403522554019686054 : Rat) / 4676338877845046513121) [(3, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-12321701761277009843027 : Rat) / 4676338877845046513121) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 21. -/
theorem ep_Q1_009_partial_21_0342_valid :
    mulPoly ep_Q1_009_coefficient_21_0342
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0343 : Poly :=
[
  term ((804097384918378324117487 : Rat) / 37410711022760372104968) [(3, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 343 for generator 21. -/
def ep_Q1_009_partial_21_0343 : Poly :=
[
  term ((804097384918378324117487 : Rat) / 18705355511380186052484) [(3, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-804097384918378324117487 : Rat) / 37410711022760372104968) [(3, 1), (6, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 21. -/
theorem ep_Q1_009_partial_21_0343_valid :
    mulPoly ep_Q1_009_coefficient_21_0343
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0344 : Poly :=
[
  term ((-28 : Rat) / 17) [(3, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 344 for generator 21. -/
def ep_Q1_009_partial_21_0344 : Poly :=
[
  term ((-56 : Rat) / 17) [(3, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((28 : Rat) / 17) [(3, 1), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 21. -/
theorem ep_Q1_009_partial_21_0344_valid :
    mulPoly ep_Q1_009_coefficient_21_0344
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0345 : Poly :=
[
  term ((-16 : Rat) / 3) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 345 for generator 21. -/
def ep_Q1_009_partial_21_0345 : Poly :=
[
  term ((-32 : Rat) / 3) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 21. -/
theorem ep_Q1_009_partial_21_0345_valid :
    mulPoly ep_Q1_009_coefficient_21_0345
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0346 : Poly :=
[
  term ((626645514959974605488232872800594631960943144392431178400185812244868407543 : Rat) / 427474424081031794959178410475119969980936861287341928001863331357243984960) [(3, 1), (6, 1), (13, 1)]
]

/-- Partial product 346 for generator 21. -/
def ep_Q1_009_partial_21_0346 : Poly :=
[
  term ((626645514959974605488232872800594631960943144392431178400185812244868407543 : Rat) / 213737212040515897479589205237559984990468430643670964000931665678621992480) [(3, 1), (6, 1), (10, 1), (13, 1)],
  term ((-626645514959974605488232872800594631960943144392431178400185812244868407543 : Rat) / 427474424081031794959178410475119969980936861287341928001863331357243984960) [(3, 1), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 21. -/
theorem ep_Q1_009_partial_21_0346_valid :
    mulPoly ep_Q1_009_coefficient_21_0346
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0347 : Poly :=
[
  term ((65663139991819280207290980719877027868636711893225174095436857307951225635287207188195226300428647 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(3, 1), (6, 1), (13, 1), (15, 2)]
]

/-- Partial product 347 for generator 21. -/
def ep_Q1_009_partial_21_0347 : Poly :=
[
  term ((65663139991819280207290980719877027868636711893225174095436857307951225635287207188195226300428647 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(3, 1), (6, 1), (10, 1), (13, 1), (15, 2)],
  term ((-65663139991819280207290980719877027868636711893225174095436857307951225635287207188195226300428647 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(3, 1), (6, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 21. -/
theorem ep_Q1_009_partial_21_0347_valid :
    mulPoly ep_Q1_009_coefficient_21_0347
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0348 : Poly :=
[
  term ((-187125879140226 : Rat) / 1395206957462413) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 348 for generator 21. -/
def ep_Q1_009_partial_21_0348 : Poly :=
[
  term ((-374251758280452 : Rat) / 1395206957462413) [(3, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((187125879140226 : Rat) / 1395206957462413) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 21. -/
theorem ep_Q1_009_partial_21_0348_valid :
    mulPoly ep_Q1_009_coefficient_21_0348
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0349 : Poly :=
[
  term ((56 : Rat) / 17) [(3, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 349 for generator 21. -/
def ep_Q1_009_partial_21_0349 : Poly :=
[
  term ((112 : Rat) / 17) [(3, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-56 : Rat) / 17) [(3, 1), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 21. -/
theorem ep_Q1_009_partial_21_0349_valid :
    mulPoly ep_Q1_009_coefficient_21_0349
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0350 : Poly :=
[
  term ((-199353402624020669520491780413200 : Rat) / 24049240021528595265061175145067379) [(3, 1), (6, 1), (13, 2), (15, 1)]
]

/-- Partial product 350 for generator 21. -/
def ep_Q1_009_partial_21_0350 : Poly :=
[
  term ((-398706805248041339040983560826400 : Rat) / 24049240021528595265061175145067379) [(3, 1), (6, 1), (10, 1), (13, 2), (15, 1)],
  term ((199353402624020669520491780413200 : Rat) / 24049240021528595265061175145067379) [(3, 1), (6, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 21. -/
theorem ep_Q1_009_partial_21_0350_valid :
    mulPoly ep_Q1_009_coefficient_21_0350
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0351 : Poly :=
[
  term ((3817624489429911942769709814591122835268377223751305553290718383573802487769065256849548229578270949 : Rat) / 4068840203605724319142464459187676949900482602810108376717691651108670310399806997889371834364361536) [(3, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 351 for generator 21. -/
def ep_Q1_009_partial_21_0351 : Poly :=
[
  term ((3817624489429911942769709814591122835268377223751305553290718383573802487769065256849548229578270949 : Rat) / 2034420101802862159571232229593838474950241301405054188358845825554335155199903498944685917182180768) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((-3817624489429911942769709814591122835268377223751305553290718383573802487769065256849548229578270949 : Rat) / 4068840203605724319142464459187676949900482602810108376717691651108670310399806997889371834364361536) [(3, 1), (6, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 21. -/
theorem ep_Q1_009_partial_21_0351_valid :
    mulPoly ep_Q1_009_coefficient_21_0351
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0352 : Poly :=
[
  term ((-12202670913797219 : Rat) / 16742483489548956) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 352 for generator 21. -/
def ep_Q1_009_partial_21_0352 : Poly :=
[
  term ((-12202670913797219 : Rat) / 8371241744774478) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((12202670913797219 : Rat) / 16742483489548956) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 21. -/
theorem ep_Q1_009_partial_21_0352_valid :
    mulPoly ep_Q1_009_coefficient_21_0352
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0353 : Poly :=
[
  term ((6452581370046093410277057289245965218840475093666510816253624422358914604335613389387481141600779251775737242956401 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 353 for generator 21. -/
def ep_Q1_009_partial_21_0353 : Poly :=
[
  term ((6452581370046093410277057289245965218840475093666510816253624422358914604335613389387481141600779251775737242956401 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(3, 1), (6, 1), (10, 1), (15, 1)],
  term ((-6452581370046093410277057289245965218840475093666510816253624422358914604335613389387481141600779251775737242956401 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(3, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 21. -/
theorem ep_Q1_009_partial_21_0353_valid :
    mulPoly ep_Q1_009_coefficient_21_0353
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0354 : Poly :=
[
  term ((388415848957243806845749 : Rat) / 16253636456621105582712) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 354 for generator 21. -/
def ep_Q1_009_partial_21_0354 : Poly :=
[
  term ((388415848957243806845749 : Rat) / 8126818228310552791356) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-388415848957243806845749 : Rat) / 16253636456621105582712) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 21. -/
theorem ep_Q1_009_partial_21_0354_valid :
    mulPoly ep_Q1_009_coefficient_21_0354
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0355 : Poly :=
[
  term ((-86390108977959545291059138260723807046989609847373194385063957032530632079793713493528575227492771 : Rat) / 339070016967143693261872038265639745825040216900842364726474304259055859199983916490780986197030128) [(3, 1), (6, 1), (15, 3)]
]

/-- Partial product 355 for generator 21. -/
def ep_Q1_009_partial_21_0355 : Poly :=
[
  term ((-86390108977959545291059138260723807046989609847373194385063957032530632079793713493528575227492771 : Rat) / 169535008483571846630936019132819872912520108450421182363237152129527929599991958245390493098515064) [(3, 1), (6, 1), (10, 1), (15, 3)],
  term ((86390108977959545291059138260723807046989609847373194385063957032530632079793713493528575227492771 : Rat) / 339070016967143693261872038265639745825040216900842364726474304259055859199983916490780986197030128) [(3, 1), (6, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 21. -/
theorem ep_Q1_009_partial_21_0355_valid :
    mulPoly ep_Q1_009_coefficient_21_0355
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0356 : Poly :=
[
  term ((409692818756533 : Rat) / 1395206957462413) [(3, 1), (6, 1), (15, 3), (16, 1)]
]

/-- Partial product 356 for generator 21. -/
def ep_Q1_009_partial_21_0356 : Poly :=
[
  term ((819385637513066 : Rat) / 1395206957462413) [(3, 1), (6, 1), (10, 1), (15, 3), (16, 1)],
  term ((-409692818756533 : Rat) / 1395206957462413) [(3, 1), (6, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 21. -/
theorem ep_Q1_009_partial_21_0356_valid :
    mulPoly ep_Q1_009_coefficient_21_0356
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0357 : Poly :=
[
  term ((152 : Rat) / 51) [(3, 1), (6, 2), (15, 1), (16, 1)]
]

/-- Partial product 357 for generator 21. -/
def ep_Q1_009_partial_21_0357 : Poly :=
[
  term ((304 : Rat) / 51) [(3, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-152 : Rat) / 51) [(3, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 21. -/
theorem ep_Q1_009_partial_21_0357_valid :
    mulPoly ep_Q1_009_coefficient_21_0357
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0358 : Poly :=
[
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 358 for generator 21. -/
def ep_Q1_009_partial_21_0358 : Poly :=
[
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 278751092034504698928011127364521919930716930634081774345738762737906165144182778714275678304) [(3, 1), (7, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 21. -/
theorem ep_Q1_009_partial_21_0358_valid :
    mulPoly ep_Q1_009_coefficient_21_0358
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0359 : Poly :=
[
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(3, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 359 for generator 21. -/
def ep_Q1_009_partial_21_0359 : Poly :=
[
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(3, 1), (7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(3, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 21. -/
theorem ep_Q1_009_partial_21_0359_valid :
    mulPoly ep_Q1_009_coefficient_21_0359
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0360 : Poly :=
[
  term ((-449130101129454428491796242000690653478090848365018915555828264158336271796856412593319377807901 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(3, 1), (7, 1), (8, 1), (14, 1)]
]

/-- Partial product 360 for generator 21. -/
def ep_Q1_009_partial_21_0360 : Poly :=
[
  term ((-449130101129454428491796242000690653478090848365018915555828264158336271796856412593319377807901 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(3, 1), (7, 1), (8, 1), (10, 1), (14, 1)],
  term ((449130101129454428491796242000690653478090848365018915555828264158336271796856412593319377807901 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(3, 1), (7, 1), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 21. -/
theorem ep_Q1_009_partial_21_0360_valid :
    mulPoly ep_Q1_009_coefficient_21_0360
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0361 : Poly :=
[
  term ((1140016332605893286655848513775284 : Rat) / 30920451456251051055078653757943773) [(3, 1), (7, 1), (8, 1), (14, 1), (15, 2)]
]

/-- Partial product 361 for generator 21. -/
def ep_Q1_009_partial_21_0361 : Poly :=
[
  term ((2280032665211786573311697027550568 : Rat) / 30920451456251051055078653757943773) [(3, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-1140016332605893286655848513775284 : Rat) / 30920451456251051055078653757943773) [(3, 1), (7, 1), (8, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 21. -/
theorem ep_Q1_009_partial_21_0361_valid :
    mulPoly ep_Q1_009_coefficient_21_0361
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0362 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 237173390681622906951713316621818976333765468863631868918255440369416721853781693092918752) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 362 for generator 21. -/
def ep_Q1_009_partial_21_0362 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 118586695340811453475856658310909488166882734431815934459127720184708360926890846546459376) [(3, 1), (7, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 237173390681622906951713316621818976333765468863631868918255440369416721853781693092918752) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 21. -/
theorem ep_Q1_009_partial_21_0362_valid :
    mulPoly ep_Q1_009_coefficient_21_0362
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0363 : Poly :=
[
  term ((-34365937238838852254464314716452480000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 363 for generator 21. -/
def ep_Q1_009_partial_21_0363 : Poly :=
[
  term ((-68731874477677704508928629432904960000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (7, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((34365937238838852254464314716452480000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 21. -/
theorem ep_Q1_009_partial_21_0363_valid :
    mulPoly ep_Q1_009_coefficient_21_0363
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0364 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 474346781363245813903426633243637952667530937727263737836510880738833443707563386185837504) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 364 for generator 21. -/
def ep_Q1_009_partial_21_0364 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 237173390681622906951713316621818976333765468863631868918255440369416721853781693092918752) [(3, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 474346781363245813903426633243637952667530937727263737836510880738833443707563386185837504) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 21. -/
theorem ep_Q1_009_partial_21_0364_valid :
    mulPoly ep_Q1_009_coefficient_21_0364
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0365 : Poly :=
[
  term ((17182968619419426127232157358226240000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 365 for generator 21. -/
def ep_Q1_009_partial_21_0365 : Poly :=
[
  term ((34365937238838852254464314716452480000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-17182968619419426127232157358226240000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 21. -/
theorem ep_Q1_009_partial_21_0365_valid :
    mulPoly ep_Q1_009_coefficient_21_0365
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0366 : Poly :=
[
  term ((15474553360946985075742857304763682800591622395855024465770747064011911783777679546781868099013402695396480915043847 : Rat) / 1577004527826534456100092804449824298417913972247529821115851050942334556405310233032815411680021028632720878648320) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 366 for generator 21. -/
def ep_Q1_009_partial_21_0366 : Poly :=
[
  term ((15474553360946985075742857304763682800591622395855024465770747064011911783777679546781868099013402695396480915043847 : Rat) / 788502263913267228050046402224912149208956986123764910557925525471167278202655116516407705840010514316360439324160) [(3, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-15474553360946985075742857304763682800591622395855024465770747064011911783777679546781868099013402695396480915043847 : Rat) / 1577004527826534456100092804449824298417913972247529821115851050942334556405310233032815411680021028632720878648320) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 21. -/
theorem ep_Q1_009_partial_21_0366_valid :
    mulPoly ep_Q1_009_coefficient_21_0366
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0367 : Poly :=
[
  term ((-23320267409785460644907 : Rat) / 4676338877845046513121) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 367 for generator 21. -/
def ep_Q1_009_partial_21_0367 : Poly :=
[
  term ((-46640534819570921289814 : Rat) / 4676338877845046513121) [(3, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((23320267409785460644907 : Rat) / 4676338877845046513121) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 21. -/
theorem ep_Q1_009_partial_21_0367_valid :
    mulPoly ep_Q1_009_coefficient_21_0367
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0368 : Poly :=
[
  term ((28 : Rat) / 17) [(3, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 368 for generator 21. -/
def ep_Q1_009_partial_21_0368 : Poly :=
[
  term ((-28 : Rat) / 17) [(3, 1), (7, 1), (10, 1), (16, 1)],
  term ((56 : Rat) / 17) [(3, 1), (7, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 21. -/
theorem ep_Q1_009_partial_21_0368_valid :
    mulPoly ep_Q1_009_coefficient_21_0368
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0369 : Poly :=
[
  term ((-16839391847020645411857945843000110748995652146235952535458311868093750 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(3, 1), (7, 1), (12, 1)]
]

/-- Partial product 369 for generator 21. -/
def ep_Q1_009_partial_21_0369 : Poly :=
[
  term ((-33678783694041290823715891686000221497991304292471905070916623736187500 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(3, 1), (7, 1), (10, 1), (12, 1)],
  term ((16839391847020645411857945843000110748995652146235952535458311868093750 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(3, 1), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 21. -/
theorem ep_Q1_009_partial_21_0369_valid :
    mulPoly ep_Q1_009_coefficient_21_0369
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0370 : Poly :=
[
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 640145041558184327581544862679387377118717854099033595201551973052458162398166014833255475482208) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 370 for generator 21. -/
def ep_Q1_009_partial_21_0370 : Poly :=
[
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 320072520779092163790772431339693688559358927049516797600775986526229081199083007416627737741104) [(3, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 640145041558184327581544862679387377118717854099033595201551973052458162398166014833255475482208) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 21. -/
theorem ep_Q1_009_partial_21_0370_valid :
    mulPoly ep_Q1_009_coefficient_21_0370
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0371 : Poly :=
[
  term ((-5740300 : Rat) / 3536493) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 371 for generator 21. -/
def ep_Q1_009_partial_21_0371 : Poly :=
[
  term ((-11480600 : Rat) / 3536493) [(3, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5740300 : Rat) / 3536493) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 21. -/
theorem ep_Q1_009_partial_21_0371_valid :
    mulPoly ep_Q1_009_coefficient_21_0371
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0372 : Poly :=
[
  term ((16 : Rat) / 3) [(3, 1), (7, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 372 for generator 21. -/
def ep_Q1_009_partial_21_0372 : Poly :=
[
  term ((32 : Rat) / 3) [(3, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(3, 1), (7, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 21. -/
theorem ep_Q1_009_partial_21_0372_valid :
    mulPoly ep_Q1_009_coefficient_21_0372
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0373 : Poly :=
[
  term ((-56 : Rat) / 17) [(3, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 373 for generator 21. -/
def ep_Q1_009_partial_21_0373 : Poly :=
[
  term ((-112 : Rat) / 17) [(3, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((56 : Rat) / 17) [(3, 1), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 21. -/
theorem ep_Q1_009_partial_21_0373_valid :
    mulPoly ep_Q1_009_coefficient_21_0373
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0374 : Poly :=
[
  term ((6745982505310522073976992872153600512077025150703269159418234954655211329851278040953537991751435 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 374 for generator 21. -/
def ep_Q1_009_partial_21_0374 : Poly :=
[
  term ((6745982505310522073976992872153600512077025150703269159418234954655211329851278040953537991751435 : Rat) / 640145041558184327581544862679387377118717854099033595201551973052458162398166014833255475482208) [(3, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6745982505310522073976992872153600512077025150703269159418234954655211329851278040953537991751435 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 21. -/
theorem ep_Q1_009_partial_21_0374_valid :
    mulPoly ep_Q1_009_coefficient_21_0374
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0375 : Poly :=
[
  term ((2870150 : Rat) / 3536493) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 375 for generator 21. -/
def ep_Q1_009_partial_21_0375 : Poly :=
[
  term ((5740300 : Rat) / 3536493) [(3, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2870150 : Rat) / 3536493) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 21. -/
theorem ep_Q1_009_partial_21_0375_valid :
    mulPoly ep_Q1_009_coefficient_21_0375
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0376 : Poly :=
[
  term ((-233695020731260428375255282987666655611687199227716610546198536619080118874015278565115496392541127 : Rat) / 2025317645607814821726921599437609780714587560991292730581181383668794186118491346365102069322240) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 376 for generator 21. -/
def ep_Q1_009_partial_21_0376 : Poly :=
[
  term ((-233695020731260428375255282987666655611687199227716610546198536619080118874015278565115496392541127 : Rat) / 1012658822803907410863460799718804890357293780495646365290590691834397093059245673182551034661120) [(3, 1), (7, 1), (10, 1), (14, 1)],
  term ((233695020731260428375255282987666655611687199227716610546198536619080118874015278565115496392541127 : Rat) / 2025317645607814821726921599437609780714587560991292730581181383668794186118491346365102069322240) [(3, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 21. -/
theorem ep_Q1_009_partial_21_0376_valid :
    mulPoly ep_Q1_009_coefficient_21_0376
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0377 : Poly :=
[
  term ((150172204631315247228672936800150943900085083267525227756517611509176575191463877463364970073521131 : Rat) / 339070016967143693261872038265639745825040216900842364726474304259055859199983916490780986197030128) [(3, 1), (7, 1), (14, 1), (15, 2)]
]

/-- Partial product 377 for generator 21. -/
def ep_Q1_009_partial_21_0377 : Poly :=
[
  term ((150172204631315247228672936800150943900085083267525227756517611509176575191463877463364970073521131 : Rat) / 169535008483571846630936019132819872912520108450421182363237152129527929599991958245390493098515064) [(3, 1), (7, 1), (10, 1), (14, 1), (15, 2)],
  term ((-150172204631315247228672936800150943900085083267525227756517611509176575191463877463364970073521131 : Rat) / 339070016967143693261872038265639745825040216900842364726474304259055859199983916490780986197030128) [(3, 1), (7, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 21. -/
theorem ep_Q1_009_partial_21_0377_valid :
    mulPoly ep_Q1_009_coefficient_21_0377
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0378 : Poly :=
[
  term ((-711027152606173 : Rat) / 1395206957462413) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 378 for generator 21. -/
def ep_Q1_009_partial_21_0378 : Poly :=
[
  term ((-1422054305212346 : Rat) / 1395206957462413) [(3, 1), (7, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((711027152606173 : Rat) / 1395206957462413) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 21. -/
theorem ep_Q1_009_partial_21_0378_valid :
    mulPoly ep_Q1_009_coefficient_21_0378
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0379 : Poly :=
[
  term ((-1301412835 : Rat) / 99021804) [(3, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 379 for generator 21. -/
def ep_Q1_009_partial_21_0379 : Poly :=
[
  term ((-1301412835 : Rat) / 49510902) [(3, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((1301412835 : Rat) / 99021804) [(3, 1), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 21. -/
theorem ep_Q1_009_partial_21_0379_valid :
    mulPoly ep_Q1_009_coefficient_21_0379
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0380 : Poly :=
[
  term ((-20 : Rat) / 51) [(3, 1), (7, 1), (14, 2), (16, 1)]
]

/-- Partial product 380 for generator 21. -/
def ep_Q1_009_partial_21_0380 : Poly :=
[
  term ((-40 : Rat) / 51) [(3, 1), (7, 1), (10, 1), (14, 2), (16, 1)],
  term ((20 : Rat) / 51) [(3, 1), (7, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 21. -/
theorem ep_Q1_009_partial_21_0380_valid :
    mulPoly ep_Q1_009_coefficient_21_0380
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0381 : Poly :=
[
  term ((14 : Rat) / 17) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 381 for generator 21. -/
def ep_Q1_009_partial_21_0381 : Poly :=
[
  term ((28 : Rat) / 17) [(3, 1), (7, 1), (10, 1), (16, 1)],
  term ((-14 : Rat) / 17) [(3, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 21. -/
theorem ep_Q1_009_partial_21_0381_valid :
    mulPoly ep_Q1_009_coefficient_21_0381
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0382 : Poly :=
[
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 185834061356336465952007418243014613287144620422721182897159175158604110096121852476183785536) [(3, 1), (7, 2), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 382 for generator 21. -/
def ep_Q1_009_partial_21_0382 : Poly :=
[
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 92917030678168232976003709121507306643572310211360591448579587579302055048060926238091892768) [(3, 1), (7, 2), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 185834061356336465952007418243014613287144620422721182897159175158604110096121852476183785536) [(3, 1), (7, 2), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 21. -/
theorem ep_Q1_009_partial_21_0382_valid :
    mulPoly ep_Q1_009_coefficient_21_0382
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0383 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 395288984469371511586188861036364960556275781439386448197092400615694536422969488488197920) [(3, 1), (7, 2), (9, 1), (14, 1)]
]

/-- Partial product 383 for generator 21. -/
def ep_Q1_009_partial_21_0383 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 197644492234685755793094430518182480278137890719693224098546200307847268211484744244098960) [(3, 1), (7, 2), (9, 1), (10, 1), (14, 1)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 395288984469371511586188861036364960556275781439386448197092400615694536422969488488197920) [(3, 1), (7, 2), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 21. -/
theorem ep_Q1_009_partial_21_0383_valid :
    mulPoly ep_Q1_009_coefficient_21_0383
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0384 : Poly :=
[
  term ((-6873187447767770450892862943290496000 : Rat) / 714705621776938877770773029179031683713) [(3, 1), (7, 2), (9, 1), (14, 1), (15, 2)]
]

/-- Partial product 384 for generator 21. -/
def ep_Q1_009_partial_21_0384 : Poly :=
[
  term ((-13746374895535540901785725886580992000 : Rat) / 714705621776938877770773029179031683713) [(3, 1), (7, 2), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((6873187447767770450892862943290496000 : Rat) / 714705621776938877770773029179031683713) [(3, 1), (7, 2), (9, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 21. -/
theorem ep_Q1_009_partial_21_0384_valid :
    mulPoly ep_Q1_009_coefficient_21_0384
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0385 : Poly :=
[
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 213381680519394775860514954226462459039572618033011198400517324350819387466055338277751825160736) [(3, 1), (7, 2), (14, 1), (15, 1)]
]

/-- Partial product 385 for generator 21. -/
def ep_Q1_009_partial_21_0385 : Poly :=
[
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 106690840259697387930257477113231229519786309016505599200258662175409693733027669138875912580368) [(3, 1), (7, 2), (10, 1), (14, 1), (15, 1)],
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 213381680519394775860514954226462459039572618033011198400517324350819387466055338277751825160736) [(3, 1), (7, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 21. -/
theorem ep_Q1_009_partial_21_0385_valid :
    mulPoly ep_Q1_009_coefficient_21_0385
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0386 : Poly :=
[
  term ((-1148060 : Rat) / 1178831) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 386 for generator 21. -/
def ep_Q1_009_partial_21_0386 : Poly :=
[
  term ((-2296120 : Rat) / 1178831) [(3, 1), (7, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1148060 : Rat) / 1178831) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 21. -/
theorem ep_Q1_009_partial_21_0386_valid :
    mulPoly ep_Q1_009_coefficient_21_0386
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0387 : Poly :=
[
  term ((-5532535653259266684495236042636825358755467556413414157137376570868900 : Rat) / 26193285789278909004851618288916664827263288069077324019722017852772303) [(3, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 387 for generator 21. -/
def ep_Q1_009_partial_21_0387 : Poly :=
[
  term ((-11065071306518533368990472085273650717510935112826828314274753141737800 : Rat) / 26193285789278909004851618288916664827263288069077324019722017852772303) [(3, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((5532535653259266684495236042636825358755467556413414157137376570868900 : Rat) / 26193285789278909004851618288916664827263288069077324019722017852772303) [(3, 1), (8, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 21. -/
theorem ep_Q1_009_partial_21_0387_valid :
    mulPoly ep_Q1_009_coefficient_21_0387
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0388 : Poly :=
[
  term ((81857697209720245280653347608304 : Rat) / 3435605717361227895008739306438197) [(3, 1), (8, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 388 for generator 21. -/
def ep_Q1_009_partial_21_0388 : Poly :=
[
  term ((163715394419440490561306695216608 : Rat) / 3435605717361227895008739306438197) [(3, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-81857697209720245280653347608304 : Rat) / 3435605717361227895008739306438197) [(3, 1), (8, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 21. -/
theorem ep_Q1_009_partial_21_0388_valid :
    mulPoly ep_Q1_009_coefficient_21_0388
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0389 : Poly :=
[
  term ((-806123093943420706238297175500980 : Rat) / 10306817152083683685026217919314591) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 389 for generator 21. -/
def ep_Q1_009_partial_21_0389 : Poly :=
[
  term ((-1612246187886841412476594351001960 : Rat) / 10306817152083683685026217919314591) [(3, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((806123093943420706238297175500980 : Rat) / 10306817152083683685026217919314591) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 21. -/
theorem ep_Q1_009_partial_21_0389_valid :
    mulPoly ep_Q1_009_coefficient_21_0389
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0390 : Poly :=
[
  term ((72577356191970864110039342674525166865829809078578561069583053926712031032581916321069132198227 : Rat) / 1486672490850691727616059345944116906297156963381769463177273401268832880768974819809470284288) [(3, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 390 for generator 21. -/
def ep_Q1_009_partial_21_0390 : Poly :=
[
  term ((72577356191970864110039342674525166865829809078578561069583053926712031032581916321069132198227 : Rat) / 743336245425345863808029672972058453148578481690884731588636700634416440384487409904735142144) [(3, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-72577356191970864110039342674525166865829809078578561069583053926712031032581916321069132198227 : Rat) / 1486672490850691727616059345944116906297156963381769463177273401268832880768974819809470284288) [(3, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 21. -/
theorem ep_Q1_009_partial_21_0390_valid :
    mulPoly ep_Q1_009_coefficient_21_0390
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0391 : Poly :=
[
  term ((-27860779992222251208513775830720 : Rat) / 3435605717361227895008739306438197) [(3, 1), (8, 1), (12, 1), (15, 3)]
]

/-- Partial product 391 for generator 21. -/
def ep_Q1_009_partial_21_0391 : Poly :=
[
  term ((-55721559984444502417027551661440 : Rat) / 3435605717361227895008739306438197) [(3, 1), (8, 1), (10, 1), (12, 1), (15, 3)],
  term ((27860779992222251208513775830720 : Rat) / 3435605717361227895008739306438197) [(3, 1), (8, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 21. -/
theorem ep_Q1_009_partial_21_0391_valid :
    mulPoly ep_Q1_009_coefficient_21_0391
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0392 : Poly :=
[
  term ((55412037762367802488998947802790069297608676532488218983418489765917640 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(3, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 392 for generator 21. -/
def ep_Q1_009_partial_21_0392 : Poly :=
[
  term ((110824075524735604977997895605580138595217353064976437966836979531835280 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-55412037762367802488998947802790069297608676532488218983418489765917640 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(3, 1), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 21. -/
theorem ep_Q1_009_partial_21_0392_valid :
    mulPoly ep_Q1_009_coefficient_21_0392
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0393 : Poly :=
[
  term ((-40928848604860122640326673804152 : Rat) / 3435605717361227895008739306438197) [(3, 1), (8, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 393 for generator 21. -/
def ep_Q1_009_partial_21_0393 : Poly :=
[
  term ((-81857697209720245280653347608304 : Rat) / 3435605717361227895008739306438197) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((40928848604860122640326673804152 : Rat) / 3435605717361227895008739306438197) [(3, 1), (8, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 21. -/
theorem ep_Q1_009_partial_21_0393_valid :
    mulPoly ep_Q1_009_coefficient_21_0393
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0394 : Poly :=
[
  term ((-7450971053867742594946489685414715690082118378288555245909373472432268293453439228342293920149 : Rat) / 3672955565631120738816146619391347650851799556590253967849734285487704764252761319529279525888) [(3, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 394 for generator 21. -/
def ep_Q1_009_partial_21_0394 : Poly :=
[
  term ((-7450971053867742594946489685414715690082118378288555245909373472432268293453439228342293920149 : Rat) / 1836477782815560369408073309695673825425899778295126983924867142743852382126380659764639762944) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((7450971053867742594946489685414715690082118378288555245909373472432268293453439228342293920149 : Rat) / 3672955565631120738816146619391347650851799556590253967849734285487704764252761319529279525888) [(3, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 21. -/
theorem ep_Q1_009_partial_21_0394_valid :
    mulPoly ep_Q1_009_coefficient_21_0394
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0395 : Poly :=
[
  term ((-69651949980555628021284439576800 : Rat) / 3435605717361227895008739306438197) [(3, 1), (8, 1), (14, 1), (15, 3)]
]

/-- Partial product 395 for generator 21. -/
def ep_Q1_009_partial_21_0395 : Poly :=
[
  term ((-139303899961111256042568879153600 : Rat) / 3435605717361227895008739306438197) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 3)],
  term ((69651949980555628021284439576800 : Rat) / 3435605717361227895008739306438197) [(3, 1), (8, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 21. -/
theorem ep_Q1_009_partial_21_0395_valid :
    mulPoly ep_Q1_009_coefficient_21_0395
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0396 : Poly :=
[
  term ((-2332745824089091189416886543874293 : Rat) / 30920451456251051055078653757943773) [(3, 1), (8, 1), (14, 2), (15, 1)]
]

/-- Partial product 396 for generator 21. -/
def ep_Q1_009_partial_21_0396 : Poly :=
[
  term ((-4665491648178182378833773087748586 : Rat) / 30920451456251051055078653757943773) [(3, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((2332745824089091189416886543874293 : Rat) / 30920451456251051055078653757943773) [(3, 1), (8, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 21. -/
theorem ep_Q1_009_partial_21_0396_valid :
    mulPoly ep_Q1_009_coefficient_21_0396
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0397 : Poly :=
[
  term ((49883605692827815994342986972256115594407912661981712762329961959195204833267336394789951893272120858439209881391 : Rat) / 1325538775884734596939103677609910803139072438410699951205842651301650592012308534752480295601880877217290690560) [(3, 1), (9, 1), (12, 1)]
]

/-- Partial product 397 for generator 21. -/
def ep_Q1_009_partial_21_0397 : Poly :=
[
  term ((49883605692827815994342986972256115594407912661981712762329961959195204833267336394789951893272120858439209881391 : Rat) / 662769387942367298469551838804955401569536219205349975602921325650825296006154267376240147800940438608645345280) [(3, 1), (9, 1), (10, 1), (12, 1)],
  term ((-49883605692827815994342986972256115594407912661981712762329961959195204833267336394789951893272120858439209881391 : Rat) / 1325538775884734596939103677609910803139072438410699951205842651301650592012308534752480295601880877217290690560) [(3, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 21. -/
theorem ep_Q1_009_partial_21_0397_valid :
    mulPoly ep_Q1_009_coefficient_21_0397
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0398 : Poly :=
[
  term ((169463783708544948739876431317275482101263338467851552120237286686067037160961170247919865295166504505792788951 : Rat) / 32217956358309521453380992164129776465185788433593401591808675552470674111410276886345007184767937987920259840) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 398 for generator 21. -/
def ep_Q1_009_partial_21_0398 : Poly :=
[
  term ((169463783708544948739876431317275482101263338467851552120237286686067037160961170247919865295166504505792788951 : Rat) / 16108978179154760726690496082064888232592894216796700795904337776235337055705138443172503592383968993960129920) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-169463783708544948739876431317275482101263338467851552120237286686067037160961170247919865295166504505792788951 : Rat) / 32217956358309521453380992164129776465185788433593401591808675552470674111410276886345007184767937987920259840) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 21. -/
theorem ep_Q1_009_partial_21_0398_valid :
    mulPoly ep_Q1_009_coefficient_21_0398
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0399 : Poly :=
[
  term ((-4445142160896780050708 : Rat) / 1558779625948348837707) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 399 for generator 21. -/
def ep_Q1_009_partial_21_0399 : Poly :=
[
  term ((-8890284321793560101416 : Rat) / 1558779625948348837707) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4445142160896780050708 : Rat) / 1558779625948348837707) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 21. -/
theorem ep_Q1_009_partial_21_0399_valid :
    mulPoly ep_Q1_009_coefficient_21_0399
        ep_Q1_009_generator_21_0300_0399 =
      ep_Q1_009_partial_21_0399 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_009_partials_21_0300_0399 : List Poly :=
[
  ep_Q1_009_partial_21_0300,
  ep_Q1_009_partial_21_0301,
  ep_Q1_009_partial_21_0302,
  ep_Q1_009_partial_21_0303,
  ep_Q1_009_partial_21_0304,
  ep_Q1_009_partial_21_0305,
  ep_Q1_009_partial_21_0306,
  ep_Q1_009_partial_21_0307,
  ep_Q1_009_partial_21_0308,
  ep_Q1_009_partial_21_0309,
  ep_Q1_009_partial_21_0310,
  ep_Q1_009_partial_21_0311,
  ep_Q1_009_partial_21_0312,
  ep_Q1_009_partial_21_0313,
  ep_Q1_009_partial_21_0314,
  ep_Q1_009_partial_21_0315,
  ep_Q1_009_partial_21_0316,
  ep_Q1_009_partial_21_0317,
  ep_Q1_009_partial_21_0318,
  ep_Q1_009_partial_21_0319,
  ep_Q1_009_partial_21_0320,
  ep_Q1_009_partial_21_0321,
  ep_Q1_009_partial_21_0322,
  ep_Q1_009_partial_21_0323,
  ep_Q1_009_partial_21_0324,
  ep_Q1_009_partial_21_0325,
  ep_Q1_009_partial_21_0326,
  ep_Q1_009_partial_21_0327,
  ep_Q1_009_partial_21_0328,
  ep_Q1_009_partial_21_0329,
  ep_Q1_009_partial_21_0330,
  ep_Q1_009_partial_21_0331,
  ep_Q1_009_partial_21_0332,
  ep_Q1_009_partial_21_0333,
  ep_Q1_009_partial_21_0334,
  ep_Q1_009_partial_21_0335,
  ep_Q1_009_partial_21_0336,
  ep_Q1_009_partial_21_0337,
  ep_Q1_009_partial_21_0338,
  ep_Q1_009_partial_21_0339,
  ep_Q1_009_partial_21_0340,
  ep_Q1_009_partial_21_0341,
  ep_Q1_009_partial_21_0342,
  ep_Q1_009_partial_21_0343,
  ep_Q1_009_partial_21_0344,
  ep_Q1_009_partial_21_0345,
  ep_Q1_009_partial_21_0346,
  ep_Q1_009_partial_21_0347,
  ep_Q1_009_partial_21_0348,
  ep_Q1_009_partial_21_0349,
  ep_Q1_009_partial_21_0350,
  ep_Q1_009_partial_21_0351,
  ep_Q1_009_partial_21_0352,
  ep_Q1_009_partial_21_0353,
  ep_Q1_009_partial_21_0354,
  ep_Q1_009_partial_21_0355,
  ep_Q1_009_partial_21_0356,
  ep_Q1_009_partial_21_0357,
  ep_Q1_009_partial_21_0358,
  ep_Q1_009_partial_21_0359,
  ep_Q1_009_partial_21_0360,
  ep_Q1_009_partial_21_0361,
  ep_Q1_009_partial_21_0362,
  ep_Q1_009_partial_21_0363,
  ep_Q1_009_partial_21_0364,
  ep_Q1_009_partial_21_0365,
  ep_Q1_009_partial_21_0366,
  ep_Q1_009_partial_21_0367,
  ep_Q1_009_partial_21_0368,
  ep_Q1_009_partial_21_0369,
  ep_Q1_009_partial_21_0370,
  ep_Q1_009_partial_21_0371,
  ep_Q1_009_partial_21_0372,
  ep_Q1_009_partial_21_0373,
  ep_Q1_009_partial_21_0374,
  ep_Q1_009_partial_21_0375,
  ep_Q1_009_partial_21_0376,
  ep_Q1_009_partial_21_0377,
  ep_Q1_009_partial_21_0378,
  ep_Q1_009_partial_21_0379,
  ep_Q1_009_partial_21_0380,
  ep_Q1_009_partial_21_0381,
  ep_Q1_009_partial_21_0382,
  ep_Q1_009_partial_21_0383,
  ep_Q1_009_partial_21_0384,
  ep_Q1_009_partial_21_0385,
  ep_Q1_009_partial_21_0386,
  ep_Q1_009_partial_21_0387,
  ep_Q1_009_partial_21_0388,
  ep_Q1_009_partial_21_0389,
  ep_Q1_009_partial_21_0390,
  ep_Q1_009_partial_21_0391,
  ep_Q1_009_partial_21_0392,
  ep_Q1_009_partial_21_0393,
  ep_Q1_009_partial_21_0394,
  ep_Q1_009_partial_21_0395,
  ep_Q1_009_partial_21_0396,
  ep_Q1_009_partial_21_0397,
  ep_Q1_009_partial_21_0398,
  ep_Q1_009_partial_21_0399
]

/-- Sum of partial products in this block. -/
def ep_Q1_009_block_21_0300_0399 : Poly :=
[
  term ((-884119574637870216386 : Rat) / 30564306391144094857) [(3, 1), (5, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((442059787318935108193 : Rat) / 30564306391144094857) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2182826602937407630001945513384160 : Rat) / 24049240021528595265061175145067379) [(3, 1), (5, 1), (6, 1), (10, 1), (13, 1), (15, 1)],
  term ((1310030566858894467252019011895171114441065272115638440997579140968493838924824636687862896482339811 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(3, 1), (5, 1), (6, 1), (10, 1), (15, 2)],
  term ((-4134281664369246 : Rat) / 1395206957462413) [(3, 1), (5, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3580960609 : Rat) / 16503634) [(3, 1), (5, 1), (6, 1), (10, 1), (16, 1)],
  term ((1091413301468703815000972756692080 : Rat) / 24049240021528595265061175145067379) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((-1310030566858894467252019011895171114441065272115638440997579140968493838924824636687862896482339811 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(3, 1), (5, 1), (6, 1), (15, 2)],
  term ((2067140832184623 : Rat) / 1395206957462413) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((3580960609 : Rat) / 33007268) [(3, 1), (5, 1), (6, 1), (16, 1)],
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 69687773008626174732002781841130479982679232658520443586434690684476541286045694678568919576) [(3, 1), (5, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 139375546017252349464005563682260959965358465317040887172869381368953082572091389357137839152) [(3, 1), (5, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 148233369176014316844820822888636860208603418039769918073909650230885451158613558183074220) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((54985499582142163607142903546323968000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 296466738352028633689641645777273720417206836079539836147819300461770902317227116366148440) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1)],
  term ((-27492749791071081803571451773161984000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 2)],
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 80018130194773040947693107834923422139839731762379199400193996631557270299770751854156934435276) [(3, 1), (5, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((9184480 : Rat) / 3536493) [(3, 1), (5, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 160036260389546081895386215669846844279679463524758398800387993263114540599541503708313868870552) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term ((-4592240 : Rat) / 3536493) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((3923648913495604439820613487890302670161013766311903475360458108761301201599332974901155264994773 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 1)],
  term ((-2195554691886511800802423447905352 : Rat) / 10306817152083683685026217919314591) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-3923648913495604439820613487890302670161013766311903475360458108761301201599332974901155264994773 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(3, 1), (5, 1), (8, 1), (14, 1)],
  term ((1097777345943255900401211723952676 : Rat) / 10306817152083683685026217919314591) [(3, 1), (5, 1), (8, 1), (14, 1), (15, 2)],
  term ((-132267930523694104282921036322170354977419335013223049497616203602176807306087210845332543125973985762103139618748727 : Rat) / 2365506791739801684150139206674736447626870958371294731673776576413501834607965349549223117520031542949081317972480) [(3, 1), (5, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((884119574637870216386 : Rat) / 30564306391144094857) [(3, 1), (5, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((132267930523694104282921036322170354977419335013223049497616203602176807306087210845332543125973985762103139618748727 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1)],
  term ((-442059787318935108193 : Rat) / 30564306391144094857) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((2182826602937407630001945513384160 : Rat) / 24049240021528595265061175145067379) [(3, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((6661724079086717290020924974730589803503439422405400515393470879240830726754760960109302866595304961 : Rat) / 3037976468411722232590382399156414671071881341486939095871772075503191279177737019547653103983360) [(3, 1), (5, 1), (10, 1), (14, 1)],
  term ((-1310030566858894467252019011895171114441065272115638440997579140968493838924824636687862896482339811 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(3, 1), (5, 1), (10, 1), (14, 1), (15, 2)],
  term ((4134281664369246 : Rat) / 1395206957462413) [(3, 1), (5, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((3526595697 : Rat) / 16503634) [(3, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1091413301468703815000972756692080 : Rat) / 24049240021528595265061175145067379) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6661724079086717290020924974730589803503439422405400515393470879240830726754760960109302866595304961 : Rat) / 6075952936823444465180764798312829342143762682973878191743544151006382558355474039095306207966720) [(3, 1), (5, 1), (14, 1)],
  term ((1310030566858894467252019011895171114441065272115638440997579140968493838924824636687862896482339811 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((-2067140832184623 : Rat) / 1395206957462413) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3526595697 : Rat) / 33007268) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-8419695923510322705928972921500055374497826073117976267729155934046875 : Rat) / 890571716835482906164955021823166604126951794348629016670548606994258302) [(3, 1), (6, 1), (7, 1)],
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(3, 1), (6, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 92917030678168232976003709121507306643572310211360591448579587579302055048060926238091892768) [(3, 1), (6, 1), (7, 1), (8, 1), (10, 1), (15, 2)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(3, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 185834061356336465952007418243014613287144620422721182897159175158604110096121852476183785536) [(3, 1), (6, 1), (7, 1), (8, 1), (15, 2)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 237173390681622906951713316621818976333765468863631868918255440369416721853781693092918752) [(3, 1), (6, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-34365937238838852254464314716452480000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (6, 1), (7, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 197644492234685755793094430518182480278137890719693224098546200307847268211484744244098960) [(3, 1), (6, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((13746374895535540901785725886580992000 : Rat) / 714705621776938877770773029179031683713) [(3, 1), (6, 1), (7, 1), (9, 1), (10, 1), (15, 3)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 474346781363245813903426633243637952667530937727263737836510880738833443707563386185837504) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((17182968619419426127232157358226240000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 395288984469371511586188861036364960556275781439386448197092400615694536422969488488197920) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((-6873187447767770450892862943290496000 : Rat) / 714705621776938877770773029179031683713) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 3)],
  term ((8419695923510322705928972921500055374497826073117976267729155934046875 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(3, 1), (6, 1), (7, 1), (10, 1)],
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 640145041558184327581544862679387377118717854099033595201551973052458162398166014833255475482208) [(3, 1), (6, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-5740300 : Rat) / 3536493) [(3, 1), (6, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-304 : Rat) / 51) [(3, 1), (6, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 106690840259697387930257477113231229519786309016505599200258662175409693733027669138875912580368) [(3, 1), (6, 1), (7, 1), (10, 1), (15, 2)],
  term ((2296120 : Rat) / 1178831) [(3, 1), (6, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((2870150 : Rat) / 3536493) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((152 : Rat) / 51) [(3, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 213381680519394775860514954226462459039572618033011198400517324350819387466055338277751825160736) [(3, 1), (6, 1), (7, 1), (15, 2)],
  term ((-1148060 : Rat) / 1178831) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-110824075524735604977997895605580138595217353064976437966836979531835280 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(3, 1), (6, 1), (8, 1), (10, 1), (13, 1)],
  term ((81857697209720245280653347608304 : Rat) / 3435605717361227895008739306438197) [(3, 1), (6, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((4665491648178182378833773087748586 : Rat) / 30920451456251051055078653757943773) [(3, 1), (6, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((203053469596726319919239379458055542725602016183523364704845004871749338317813017167339807420177 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(3, 1), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((-1026297565561785268928577115168168 : Rat) / 30920451456251051055078653757943773) [(3, 1), (6, 1), (8, 1), (10, 1), (15, 3)],
  term ((55412037762367802488998947802790069297608676532488218983418489765917640 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(3, 1), (6, 1), (8, 1), (13, 1)],
  term ((-40928848604860122640326673804152 : Rat) / 3435605717361227895008739306438197) [(3, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((-2332745824089091189416886543874293 : Rat) / 30920451456251051055078653757943773) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-203053469596726319919239379458055542725602016183523364704845004871749338317813017167339807420177 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(3, 1), (6, 1), (8, 1), (15, 1)],
  term ((513148782780892634464288557584084 : Rat) / 30920451456251051055078653757943773) [(3, 1), (6, 1), (8, 1), (15, 3)],
  term ((383253308500450074592987468741180705219237251690855492080230492765636037144032600094330661572189421481709119802411 : Rat) / 9278771431193142178573725743269375621973507068874899658440898559111554144086159743267362069213166140521034833920) [(3, 1), (6, 1), (9, 1)],
  term ((-383253308500450074592987468741180705219237251690855492080230492765636037144032600094330661572189421481709119802411 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(3, 1), (6, 1), (9, 1), (10, 1)],
  term ((169463783708544948739876431317275482101263338467851552120237286686067037160961170247919865295166504505792788951 : Rat) / 32217956358309521453380992164129776465185788433593401591808675552470674111410276886345007184767937987920259840) [(3, 1), (6, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-4445142160896780050708 : Rat) / 1558779625948348837707) [(3, 1), (6, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((117283306522936956553750233179464979379491942247212709346858909469230676785132376220421200023174920811237195459047 : Rat) / 2319692857798285544643431435817343905493376767218724914610224639777888536021539935816840517303291535130258708480) [(3, 1), (6, 1), (9, 1), (10, 1), (14, 1)],
  term ((-237656816706250445897783 : Rat) / 9352677755690093026242) [(3, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-25994488512823395253950655536071599487653325102923881572719866502400887777853539345913619122643075256982448796693741 : Rat) / 2365506791739801684150139206674736447626870958371294731673776576413501834607965349549223117520031542949081317972480) [(3, 1), (6, 1), (9, 1), (10, 1), (15, 2)],
  term ((24643403522554019686054 : Rat) / 4676338877845046513121) [(3, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((804097384918378324117487 : Rat) / 18705355511380186052484) [(3, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-169463783708544948739876431317275482101263338467851552120237286686067037160961170247919865295166504505792788951 : Rat) / 64435912716619042906761984328259552930371576867186803183617351104941348222820553772690014369535875975840519680) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((2222571080448390025354 : Rat) / 1558779625948348837707) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-117283306522936956553750233179464979379491942247212709346858909469230676785132376220421200023174920811237195459047 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(3, 1), (6, 1), (9, 1), (14, 1)],
  term ((237656816706250445897783 : Rat) / 18705355511380186052484) [(3, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((25994488512823395253950655536071599487653325102923881572719866502400887777853539345913619122643075256982448796693741 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(3, 1), (6, 1), (9, 1), (15, 2)],
  term ((-12321701761277009843027 : Rat) / 4676338877845046513121) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-804097384918378324117487 : Rat) / 37410711022760372104968) [(3, 1), (6, 1), (9, 1), (16, 1)],
  term ((-56 : Rat) / 17) [(3, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((626645514959974605488232872800594631960943144392431178400185812244868407543 : Rat) / 213737212040515897479589205237559984990468430643670964000931665678621992480) [(3, 1), (6, 1), (10, 1), (13, 1)],
  term ((65663139991819280207290980719877027868636711893225174095436857307951225635287207188195226300428647 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(3, 1), (6, 1), (10, 1), (13, 1), (15, 2)],
  term ((-374251758280452 : Rat) / 1395206957462413) [(3, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((112 : Rat) / 17) [(3, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-398706805248041339040983560826400 : Rat) / 24049240021528595265061175145067379) [(3, 1), (6, 1), (10, 1), (13, 2), (15, 1)],
  term ((3817624489429911942769709814591122835268377223751305553290718383573802487769065256849548229578270949 : Rat) / 2034420101802862159571232229593838474950241301405054188358845825554335155199903498944685917182180768) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((-12202670913797219 : Rat) / 8371241744774478) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((6452581370046093410277057289245965218840475093666510816253624422358914604335613389387481141600779251775737242956401 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(3, 1), (6, 1), (10, 1), (15, 1)],
  term ((388415848957243806845749 : Rat) / 8126818228310552791356) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-86390108977959545291059138260723807046989609847373194385063957032530632079793713493528575227492771 : Rat) / 169535008483571846630936019132819872912520108450421182363237152129527929599991958245390493098515064) [(3, 1), (6, 1), (10, 1), (15, 3)],
  term ((819385637513066 : Rat) / 1395206957462413) [(3, 1), (6, 1), (10, 1), (15, 3), (16, 1)],
  term ((28 : Rat) / 17) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term ((16 : Rat) / 3) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-626645514959974605488232872800594631960943144392431178400185812244868407543 : Rat) / 427474424081031794959178410475119969980936861287341928001863331357243984960) [(3, 1), (6, 1), (13, 1)],
  term ((-65663139991819280207290980719877027868636711893225174095436857307951225635287207188195226300428647 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((187125879140226 : Rat) / 1395206957462413) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-56 : Rat) / 17) [(3, 1), (6, 1), (13, 1), (16, 1)],
  term ((199353402624020669520491780413200 : Rat) / 24049240021528595265061175145067379) [(3, 1), (6, 1), (13, 2), (15, 1)],
  term ((-3817624489429911942769709814591122835268377223751305553290718383573802487769065256849548229578270949 : Rat) / 4068840203605724319142464459187676949900482602810108376717691651108670310399806997889371834364361536) [(3, 1), (6, 1), (14, 1), (15, 1)],
  term ((12202670913797219 : Rat) / 16742483489548956) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6452581370046093410277057289245965218840475093666510816253624422358914604335613389387481141600779251775737242956401 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(3, 1), (6, 1), (15, 1)],
  term ((-388415848957243806845749 : Rat) / 16253636456621105582712) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((86390108977959545291059138260723807046989609847373194385063957032530632079793713493528575227492771 : Rat) / 339070016967143693261872038265639745825040216900842364726474304259055859199983916490780986197030128) [(3, 1), (6, 1), (15, 3)],
  term ((-409692818756533 : Rat) / 1395206957462413) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((304 : Rat) / 51) [(3, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-152 : Rat) / 51) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 278751092034504698928011127364521919930716930634081774345738762737906165144182778714275678304) [(3, 1), (7, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(3, 1), (7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-449130101129454428491796242000690653478090848365018915555828264158336271796856412593319377807901 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(3, 1), (7, 1), (8, 1), (10, 1), (14, 1)],
  term ((2280032665211786573311697027550568 : Rat) / 30920451456251051055078653757943773) [(3, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(3, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((449130101129454428491796242000690653478090848365018915555828264158336271796856412593319377807901 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(3, 1), (7, 1), (8, 1), (14, 1)],
  term ((-1140016332605893286655848513775284 : Rat) / 30920451456251051055078653757943773) [(3, 1), (7, 1), (8, 1), (14, 1), (15, 2)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 118586695340811453475856658310909488166882734431815934459127720184708360926890846546459376) [(3, 1), (7, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-68731874477677704508928629432904960000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (7, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 237173390681622906951713316621818976333765468863631868918255440369416721853781693092918752) [(3, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((34365937238838852254464314716452480000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((15474553360946985075742857304763682800591622395855024465770747064011911783777679546781868099013402695396480915043847 : Rat) / 788502263913267228050046402224912149208956986123764910557925525471167278202655116516407705840010514316360439324160) [(3, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-46640534819570921289814 : Rat) / 4676338877845046513121) [(3, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 237173390681622906951713316621818976333765468863631868918255440369416721853781693092918752) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((34365937238838852254464314716452480000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 474346781363245813903426633243637952667530937727263737836510880738833443707563386185837504) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-17182968619419426127232157358226240000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-15474553360946985075742857304763682800591622395855024465770747064011911783777679546781868099013402695396480915043847 : Rat) / 1577004527826534456100092804449824298417913972247529821115851050942334556405310233032815411680021028632720878648320) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((23320267409785460644907 : Rat) / 4676338877845046513121) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33678783694041290823715891686000221497991304292471905070916623736187500 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(3, 1), (7, 1), (10, 1), (12, 1)],
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 320072520779092163790772431339693688559358927049516797600775986526229081199083007416627737741104) [(3, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-11480600 : Rat) / 3536493) [(3, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 3) [(3, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-112 : Rat) / 17) [(3, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((6745982505310522073976992872153600512077025150703269159418234954655211329851278040953537991751435 : Rat) / 640145041558184327581544862679387377118717854099033595201551973052458162398166014833255475482208) [(3, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((5740300 : Rat) / 3536493) [(3, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-233695020731260428375255282987666655611687199227716610546198536619080118874015278565115496392541127 : Rat) / 1012658822803907410863460799718804890357293780495646365290590691834397093059245673182551034661120) [(3, 1), (7, 1), (10, 1), (14, 1)],
  term ((150172204631315247228672936800150943900085083267525227756517611509176575191463877463364970073521131 : Rat) / 169535008483571846630936019132819872912520108450421182363237152129527929599991958245390493098515064) [(3, 1), (7, 1), (10, 1), (14, 1), (15, 2)],
  term ((-1422054305212346 : Rat) / 1395206957462413) [(3, 1), (7, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1301412835 : Rat) / 49510902) [(3, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-40 : Rat) / 51) [(3, 1), (7, 1), (10, 1), (14, 2), (16, 1)],
  term ((56 : Rat) / 17) [(3, 1), (7, 1), (10, 2), (16, 1)],
  term ((16839391847020645411857945843000110748995652146235952535458311868093750 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(3, 1), (7, 1), (12, 1)],
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 640145041558184327581544862679387377118717854099033595201551973052458162398166014833255475482208) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((5740300 : Rat) / 3536493) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(3, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((56 : Rat) / 17) [(3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-6745982505310522073976992872153600512077025150703269159418234954655211329851278040953537991751435 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2870150 : Rat) / 3536493) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((233695020731260428375255282987666655611687199227716610546198536619080118874015278565115496392541127 : Rat) / 2025317645607814821726921599437609780714587560991292730581181383668794186118491346365102069322240) [(3, 1), (7, 1), (14, 1)],
  term ((-150172204631315247228672936800150943900085083267525227756517611509176575191463877463364970073521131 : Rat) / 339070016967143693261872038265639745825040216900842364726474304259055859199983916490780986197030128) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((711027152606173 : Rat) / 1395206957462413) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((1301412835 : Rat) / 99021804) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term ((20 : Rat) / 51) [(3, 1), (7, 1), (14, 2), (16, 1)],
  term ((-14 : Rat) / 17) [(3, 1), (7, 1), (16, 1)],
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 92917030678168232976003709121507306643572310211360591448579587579302055048060926238091892768) [(3, 1), (7, 2), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 185834061356336465952007418243014613287144620422721182897159175158604110096121852476183785536) [(3, 1), (7, 2), (8, 1), (14, 1), (15, 1)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 197644492234685755793094430518182480278137890719693224098546200307847268211484744244098960) [(3, 1), (7, 2), (9, 1), (10, 1), (14, 1)],
  term ((-13746374895535540901785725886580992000 : Rat) / 714705621776938877770773029179031683713) [(3, 1), (7, 2), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 395288984469371511586188861036364960556275781439386448197092400615694536422969488488197920) [(3, 1), (7, 2), (9, 1), (14, 1)],
  term ((6873187447767770450892862943290496000 : Rat) / 714705621776938877770773029179031683713) [(3, 1), (7, 2), (9, 1), (14, 1), (15, 2)],
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 106690840259697387930257477113231229519786309016505599200258662175409693733027669138875912580368) [(3, 1), (7, 2), (10, 1), (14, 1), (15, 1)],
  term ((-2296120 : Rat) / 1178831) [(3, 1), (7, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 213381680519394775860514954226462459039572618033011198400517324350819387466055338277751825160736) [(3, 1), (7, 2), (14, 1), (15, 1)],
  term ((1148060 : Rat) / 1178831) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-11065071306518533368990472085273650717510935112826828314274753141737800 : Rat) / 26193285789278909004851618288916664827263288069077324019722017852772303) [(3, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((163715394419440490561306695216608 : Rat) / 3435605717361227895008739306438197) [(3, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1612246187886841412476594351001960 : Rat) / 10306817152083683685026217919314591) [(3, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((72577356191970864110039342674525166865829809078578561069583053926712031032581916321069132198227 : Rat) / 743336245425345863808029672972058453148578481690884731588636700634416440384487409904735142144) [(3, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-55721559984444502417027551661440 : Rat) / 3435605717361227895008739306438197) [(3, 1), (8, 1), (10, 1), (12, 1), (15, 3)],
  term ((110824075524735604977997895605580138595217353064976437966836979531835280 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-81857697209720245280653347608304 : Rat) / 3435605717361227895008739306438197) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-7450971053867742594946489685414715690082118378288555245909373472432268293453439228342293920149 : Rat) / 1836477782815560369408073309695673825425899778295126983924867142743852382126380659764639762944) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-139303899961111256042568879153600 : Rat) / 3435605717361227895008739306438197) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 3)],
  term ((-4665491648178182378833773087748586 : Rat) / 30920451456251051055078653757943773) [(3, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((5532535653259266684495236042636825358755467556413414157137376570868900 : Rat) / 26193285789278909004851618288916664827263288069077324019722017852772303) [(3, 1), (8, 1), (12, 1), (13, 1)],
  term ((-81857697209720245280653347608304 : Rat) / 3435605717361227895008739306438197) [(3, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((806123093943420706238297175500980 : Rat) / 10306817152083683685026217919314591) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-72577356191970864110039342674525166865829809078578561069583053926712031032581916321069132198227 : Rat) / 1486672490850691727616059345944116906297156963381769463177273401268832880768974819809470284288) [(3, 1), (8, 1), (12, 1), (15, 1)],
  term ((27860779992222251208513775830720 : Rat) / 3435605717361227895008739306438197) [(3, 1), (8, 1), (12, 1), (15, 3)],
  term ((-55412037762367802488998947802790069297608676532488218983418489765917640 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(3, 1), (8, 1), (13, 1), (14, 1)],
  term ((40928848604860122640326673804152 : Rat) / 3435605717361227895008739306438197) [(3, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((7450971053867742594946489685414715690082118378288555245909373472432268293453439228342293920149 : Rat) / 3672955565631120738816146619391347650851799556590253967849734285487704764252761319529279525888) [(3, 1), (8, 1), (14, 1), (15, 1)],
  term ((69651949980555628021284439576800 : Rat) / 3435605717361227895008739306438197) [(3, 1), (8, 1), (14, 1), (15, 3)],
  term ((2332745824089091189416886543874293 : Rat) / 30920451456251051055078653757943773) [(3, 1), (8, 1), (14, 2), (15, 1)],
  term ((49883605692827815994342986972256115594407912661981712762329961959195204833267336394789951893272120858439209881391 : Rat) / 662769387942367298469551838804955401569536219205349975602921325650825296006154267376240147800940438608645345280) [(3, 1), (9, 1), (10, 1), (12, 1)],
  term ((169463783708544948739876431317275482101263338467851552120237286686067037160961170247919865295166504505792788951 : Rat) / 16108978179154760726690496082064888232592894216796700795904337776235337055705138443172503592383968993960129920) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-8890284321793560101416 : Rat) / 1558779625948348837707) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-49883605692827815994342986972256115594407912661981712762329961959195204833267336394789951893272120858439209881391 : Rat) / 1325538775884734596939103677609910803139072438410699951205842651301650592012308534752480295601880877217290690560) [(3, 1), (9, 1), (12, 1)],
  term ((-169463783708544948739876431317275482101263338467851552120237286686067037160961170247919865295166504505792788951 : Rat) / 32217956358309521453380992164129776465185788433593401591808675552470674111410276886345007184767937987920259840) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((4445142160896780050708 : Rat) / 1558779625948348837707) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 300 through 399. -/
theorem ep_Q1_009_block_21_0300_0399_valid :
    checkProductSumEq ep_Q1_009_partials_21_0300_0399
      ep_Q1_009_block_21_0300_0399 = true := by
  native_decide

end EpQ1009TermShards

end Patterns

end EndpointCertificate

end Problem97
