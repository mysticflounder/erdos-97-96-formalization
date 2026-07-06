/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_041, term block 18:200-299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_041`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2041TermShards

/-- Generator polynomial 18 for endpoint certificate `ep_Q2_041`. -/
def ep_Q2_041_generator_18_0200_0299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0200 : Poly :=
[
  term ((-49945656414809640789968036653966091588270367061404449465055 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (7, 1), (14, 3), (15, 1)]
]

/-- Partial product 200 for generator 18. -/
def ep_Q2_041_partial_18_0200 : Poly :=
[
  term ((-99891312829619281579936073307932183176540734122808898930110 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (7, 1), (8, 1), (14, 3), (15, 1)],
  term ((49945656414809640789968036653966091588270367061404449465055 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (7, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 18. -/
theorem ep_Q2_041_partial_18_0200_valid :
    mulPoly ep_Q2_041_coefficient_18_0200
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0201 : Poly :=
[
  term ((-2981943224101091359564700409425222997269732497497236697359503528 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 201 for generator 18. -/
def ep_Q2_041_partial_18_0201 : Poly :=
[
  term ((-5963886448202182719129400818850445994539464994994473394719007056 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 1), (15, 1)],
  term ((2981943224101091359564700409425222997269732497497236697359503528 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 18. -/
theorem ep_Q2_041_partial_18_0201_valid :
    mulPoly ep_Q2_041_coefficient_18_0201
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0202 : Poly :=
[
  term ((35829447653609089529012873174761258802294236443910661439211725 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (7, 1), (15, 3)]
]

/-- Partial product 202 for generator 18. -/
def ep_Q2_041_partial_18_0202 : Poly :=
[
  term ((71658895307218179058025746349522517604588472887821322878423450 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (7, 1), (8, 1), (15, 3)],
  term ((-35829447653609089529012873174761258802294236443910661439211725 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 18. -/
theorem ep_Q2_041_partial_18_0202_valid :
    mulPoly ep_Q2_041_coefficient_18_0202
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0203 : Poly :=
[
  term ((82221115647528 : Rat) / 3100914216589) [(0, 1), (7, 2)]
]

/-- Partial product 203 for generator 18. -/
def ep_Q2_041_partial_18_0203 : Poly :=
[
  term ((-82221115647528 : Rat) / 3100914216589) [(0, 1), (7, 2)],
  term ((164442231295056 : Rat) / 3100914216589) [(0, 1), (7, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 18. -/
theorem ep_Q2_041_partial_18_0203_valid :
    mulPoly ep_Q2_041_coefficient_18_0203
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0204 : Poly :=
[
  term ((164442231295056 : Rat) / 3100914216589) [(0, 1), (7, 2), (8, 1)]
]

/-- Partial product 204 for generator 18. -/
def ep_Q2_041_partial_18_0204 : Poly :=
[
  term ((-164442231295056 : Rat) / 3100914216589) [(0, 1), (7, 2), (8, 1)],
  term ((328884462590112 : Rat) / 3100914216589) [(0, 1), (7, 2), (8, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 18. -/
theorem ep_Q2_041_partial_18_0204_valid :
    mulPoly ep_Q2_041_coefficient_18_0204
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0205 : Poly :=
[
  term ((-14949434130743043819869854405481902974185877533149318433925600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 2), (8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 205 for generator 18. -/
def ep_Q2_041_partial_18_0205 : Poly :=
[
  term ((14949434130743043819869854405481902974185877533149318433925600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-29898868261486087639739708810963805948371755066298636867851200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 2), (8, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 18. -/
theorem ep_Q2_041_partial_18_0205_valid :
    mulPoly ep_Q2_041_coefficient_18_0205
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0206 : Poly :=
[
  term ((9966289420495362546579902936987935316123918355432878955950400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 2), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 206 for generator 18. -/
def ep_Q2_041_partial_18_0206 : Poly :=
[
  term ((-9966289420495362546579902936987935316123918355432878955950400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 2), (8, 1), (11, 1), (15, 1)],
  term ((19932578840990725093159805873975870632247836710865757911900800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 2), (8, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 18. -/
theorem ep_Q2_041_partial_18_0206_valid :
    mulPoly ep_Q2_041_coefficient_18_0206
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0207 : Poly :=
[
  term ((-246663346942584 : Rat) / 3100914216589) [(0, 1), (7, 2), (8, 1), (14, 1)]
]

/-- Partial product 207 for generator 18. -/
def ep_Q2_041_partial_18_0207 : Poly :=
[
  term ((246663346942584 : Rat) / 3100914216589) [(0, 1), (7, 2), (8, 1), (14, 1)],
  term ((-493326693885168 : Rat) / 3100914216589) [(0, 1), (7, 2), (8, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 18. -/
theorem ep_Q2_041_partial_18_0207_valid :
    mulPoly ep_Q2_041_coefficient_18_0207
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0208 : Poly :=
[
  term ((429953371843309074348154478097135105627530837326927937270540700 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 2), (8, 1), (14, 1), (15, 2)]
]

/-- Partial product 208 for generator 18. -/
def ep_Q2_041_partial_18_0208 : Poly :=
[
  term ((-429953371843309074348154478097135105627530837326927937270540700 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 2), (8, 1), (14, 1), (15, 2)],
  term ((859906743686618148696308956194270211255061674653855874541081400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 2), (8, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 18. -/
theorem ep_Q2_041_partial_18_0208_valid :
    mulPoly ep_Q2_041_coefficient_18_0208
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0209 : Poly :=
[
  term ((-3167957412695895840047614616255189345815304850661874310543486645 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 2), (8, 1), (15, 2)]
]

/-- Partial product 209 for generator 18. -/
def ep_Q2_041_partial_18_0209 : Poly :=
[
  term ((3167957412695895840047614616255189345815304850661874310543486645 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 2), (8, 1), (15, 2)],
  term ((-6335914825391791680095229232510378691630609701323748621086973290 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 2), (8, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 18. -/
theorem ep_Q2_041_partial_18_0209_valid :
    mulPoly ep_Q2_041_coefficient_18_0209
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0210 : Poly :=
[
  term ((164442231295056 : Rat) / 3100914216589) [(0, 1), (7, 2), (10, 1)]
]

/-- Partial product 210 for generator 18. -/
def ep_Q2_041_partial_18_0210 : Poly :=
[
  term ((328884462590112 : Rat) / 3100914216589) [(0, 1), (7, 2), (8, 1), (10, 1)],
  term ((-164442231295056 : Rat) / 3100914216589) [(0, 1), (7, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 18. -/
theorem ep_Q2_041_partial_18_0210_valid :
    mulPoly ep_Q2_041_coefficient_18_0210
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0211 : Poly :=
[
  term ((9966289420495362546579902936987935316123918355432878955950400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 2), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 211 for generator 18. -/
def ep_Q2_041_partial_18_0211 : Poly :=
[
  term ((19932578840990725093159805873975870632247836710865757911900800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-9966289420495362546579902936987935316123918355432878955950400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 18. -/
theorem ep_Q2_041_partial_18_0211_valid :
    mulPoly ep_Q2_041_coefficient_18_0211
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0212 : Poly :=
[
  term ((5476008081705173531398920276316108480375548026669892746545891890 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 2), (10, 1), (15, 2)]
]

/-- Partial product 212 for generator 18. -/
def ep_Q2_041_partial_18_0212 : Poly :=
[
  term ((10952016163410347062797840552632216960751096053339785493091783780 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 2), (8, 1), (10, 1), (15, 2)],
  term ((-5476008081705173531398920276316108480375548026669892746545891890 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 18. -/
theorem ep_Q2_041_partial_18_0212_valid :
    mulPoly ep_Q2_041_coefficient_18_0212
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0213 : Poly :=
[
  term ((-29898868261486087639739708810963805948371755066298636867851200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 2), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 213 for generator 18. -/
def ep_Q2_041_partial_18_0213 : Poly :=
[
  term ((-59797736522972175279479417621927611896743510132597273735702400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((29898868261486087639739708810963805948371755066298636867851200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 18. -/
theorem ep_Q2_041_partial_18_0213_valid :
    mulPoly ep_Q2_041_coefficient_18_0213
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0214 : Poly :=
[
  term ((29898868261486087639739708810963805948371755066298636867851200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 2), (11, 1), (14, 2), (15, 1)]
]

/-- Partial product 214 for generator 18. -/
def ep_Q2_041_partial_18_0214 : Poly :=
[
  term ((59797736522972175279479417621927611896743510132597273735702400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 2), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-29898868261486087639739708810963805948371755066298636867851200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 2), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 18. -/
theorem ep_Q2_041_partial_18_0214_valid :
    mulPoly ep_Q2_041_coefficient_18_0214
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0215 : Poly :=
[
  term ((4983144710247681273289951468493967658061959177716439477975200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 2), (11, 1), (15, 1)]
]

/-- Partial product 215 for generator 18. -/
def ep_Q2_041_partial_18_0215 : Poly :=
[
  term ((9966289420495362546579902936987935316123918355432878955950400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 2), (8, 1), (11, 1), (15, 1)],
  term ((-4983144710247681273289951468493967658061959177716439477975200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 18. -/
theorem ep_Q2_041_partial_18_0215_valid :
    mulPoly ep_Q2_041_coefficient_18_0215
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0216 : Poly :=
[
  term ((-493326693885168 : Rat) / 3100914216589) [(0, 1), (7, 2), (14, 1)]
]

/-- Partial product 216 for generator 18. -/
def ep_Q2_041_partial_18_0216 : Poly :=
[
  term ((-986653387770336 : Rat) / 3100914216589) [(0, 1), (7, 2), (8, 1), (14, 1)],
  term ((493326693885168 : Rat) / 3100914216589) [(0, 1), (7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 18. -/
theorem ep_Q2_041_partial_18_0216_valid :
    mulPoly ep_Q2_041_coefficient_18_0216
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0217 : Poly :=
[
  term ((859906743686618148696308956194270211255061674653855874541081400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 2), (14, 1), (15, 2)]
]

/-- Partial product 217 for generator 18. -/
def ep_Q2_041_partial_18_0217 : Poly :=
[
  term ((1719813487373236297392617912388540422510123349307711749082162800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 2), (8, 1), (14, 1), (15, 2)],
  term ((-859906743686618148696308956194270211255061674653855874541081400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 18. -/
theorem ep_Q2_041_partial_18_0217_valid :
    mulPoly ep_Q2_041_coefficient_18_0217
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0218 : Poly :=
[
  term ((493326693885168 : Rat) / 3100914216589) [(0, 1), (7, 2), (14, 2)]
]

/-- Partial product 218 for generator 18. -/
def ep_Q2_041_partial_18_0218 : Poly :=
[
  term ((986653387770336 : Rat) / 3100914216589) [(0, 1), (7, 2), (8, 1), (14, 2)],
  term ((-493326693885168 : Rat) / 3100914216589) [(0, 1), (7, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 18. -/
theorem ep_Q2_041_partial_18_0218_valid :
    mulPoly ep_Q2_041_coefficient_18_0218
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0219 : Poly :=
[
  term ((-859906743686618148696308956194270211255061674653855874541081400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 2), (14, 2), (15, 2)]
]

/-- Partial product 219 for generator 18. -/
def ep_Q2_041_partial_18_0219 : Poly :=
[
  term ((-1719813487373236297392617912388540422510123349307711749082162800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 2), (8, 1), (14, 2), (15, 2)],
  term ((859906743686618148696308956194270211255061674653855874541081400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 18. -/
theorem ep_Q2_041_partial_18_0219_valid :
    mulPoly ep_Q2_041_coefficient_18_0219
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0220 : Poly :=
[
  term ((-3167957412695895840047614616255189345815304850661874310543486645 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (7, 2), (15, 2)]
]

/-- Partial product 220 for generator 18. -/
def ep_Q2_041_partial_18_0220 : Poly :=
[
  term ((-3167957412695895840047614616255189345815304850661874310543486645 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 2), (8, 1), (15, 2)],
  term ((3167957412695895840047614616255189345815304850661874310543486645 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 18. -/
theorem ep_Q2_041_partial_18_0220_valid :
    mulPoly ep_Q2_041_coefficient_18_0220
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0221 : Poly :=
[
  term ((-428649530245307439014368816899686054157279992208720619877370 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 221 for generator 18. -/
def ep_Q2_041_partial_18_0221 : Poly :=
[
  term ((428649530245307439014368816899686054157279992208720619877370 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-857299060490614878028737633799372108314559984417441239754740 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (10, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 18. -/
theorem ep_Q2_041_partial_18_0221_valid :
    mulPoly ep_Q2_041_coefficient_18_0221
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0222 : Poly :=
[
  term ((623778884071668477053357941153314592517256475948225164235260 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 222 for generator 18. -/
def ep_Q2_041_partial_18_0222 : Poly :=
[
  term ((-623778884071668477053357941153314592517256475948225164235260 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((1247557768143336954106715882306629185034512951896450328470520 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (10, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 18. -/
theorem ep_Q2_041_partial_18_0222_valid :
    mulPoly ep_Q2_041_coefficient_18_0222
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0223 : Poly :=
[
  term ((31376263140655617780759316194366606961649176501183122375815 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 223 for generator 18. -/
def ep_Q2_041_partial_18_0223 : Poly :=
[
  term ((-31376263140655617780759316194366606961649176501183122375815 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((62752526281311235561518632388733213923298353002366244751630 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (10, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 18. -/
theorem ep_Q2_041_partial_18_0223_valid :
    mulPoly ep_Q2_041_coefficient_18_0223
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0224 : Poly :=
[
  term ((-58323985339931372220453146497665189290287252264867156770065264801 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 224 for generator 18. -/
def ep_Q2_041_partial_18_0224 : Poly :=
[
  term ((58323985339931372220453146497665189290287252264867156770065264801 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-58323985339931372220453146497665189290287252264867156770065264801 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 18. -/
theorem ep_Q2_041_partial_18_0224_valid :
    mulPoly ep_Q2_041_coefficient_18_0224
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0225 : Poly :=
[
  term ((20397474847127793187296458367358764862575733456035846576486349495 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 3)]
]

/-- Partial product 225 for generator 18. -/
def ep_Q2_041_partial_18_0225 : Poly :=
[
  term ((-20397474847127793187296458367358764862575733456035846576486349495 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 3)],
  term ((20397474847127793187296458367358764862575733456035846576486349495 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 2), (10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 18. -/
theorem ep_Q2_041_partial_18_0225_valid :
    mulPoly ep_Q2_041_coefficient_18_0225
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0226 : Poly :=
[
  term ((-360496369281308959176251184130851800915032038028423728012861040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (10, 1), (11, 2), (15, 2)]
]

/-- Partial product 226 for generator 18. -/
def ep_Q2_041_partial_18_0226 : Poly :=
[
  term ((360496369281308959176251184130851800915032038028423728012861040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (10, 1), (11, 2), (15, 2)],
  term ((-720992738562617918352502368261703601830064076056847456025722080 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 2), (10, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 18. -/
theorem ep_Q2_041_partial_18_0226_valid :
    mulPoly ep_Q2_041_coefficient_18_0226
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0227 : Poly :=
[
  term ((428649530245307439014368816899686054157279992208720619877370 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (12, 1), (15, 2)]
]

/-- Partial product 227 for generator 18. -/
def ep_Q2_041_partial_18_0227 : Poly :=
[
  term ((-428649530245307439014368816899686054157279992208720619877370 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((857299060490614878028737633799372108314559984417441239754740 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 18. -/
theorem ep_Q2_041_partial_18_0227_valid :
    mulPoly ep_Q2_041_coefficient_18_0227
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0228 : Poly :=
[
  term ((397273267104651821233609500705319447195630815707537497501555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 228 for generator 18. -/
def ep_Q2_041_partial_18_0228 : Poly :=
[
  term ((-397273267104651821233609500705319447195630815707537497501555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((794546534209303642467219001410638894391261631415074995003110 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (10, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 18. -/
theorem ep_Q2_041_partial_18_0228_valid :
    mulPoly ep_Q2_041_coefficient_18_0228
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0229 : Poly :=
[
  term ((-825922797349959260247978317605005501352910807916258117378925 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 229 for generator 18. -/
def ep_Q2_041_partial_18_0229 : Poly :=
[
  term ((825922797349959260247978317605005501352910807916258117378925 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1651845594699918520495956635210011002705821615832516234757850 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 18. -/
theorem ep_Q2_041_partial_18_0229_valid :
    mulPoly ep_Q2_041_coefficient_18_0229
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0230 : Poly :=
[
  term ((-623778884071668477053357941153314592517256475948225164235260 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 3)]
]

/-- Partial product 230 for generator 18. -/
def ep_Q2_041_partial_18_0230 : Poly :=
[
  term ((623778884071668477053357941153314592517256475948225164235260 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 3)],
  term ((-1247557768143336954106715882306629185034512951896450328470520 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (10, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 18. -/
theorem ep_Q2_041_partial_18_0230_valid :
    mulPoly ep_Q2_041_coefficient_18_0230
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0231 : Poly :=
[
  term ((-428649530245307439014368816899686054157279992208720619877370 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (14, 1), (15, 2)]
]

/-- Partial product 231 for generator 18. -/
def ep_Q2_041_partial_18_0231 : Poly :=
[
  term ((428649530245307439014368816899686054157279992208720619877370 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-857299060490614878028737633799372108314559984417441239754740 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (10, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 18. -/
theorem ep_Q2_041_partial_18_0231_valid :
    mulPoly ep_Q2_041_coefficient_18_0231
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0232 : Poly :=
[
  term ((68771886729298932794039543041758090137145608277051394031650956021 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (10, 1), (15, 2)]
]

/-- Partial product 232 for generator 18. -/
def ep_Q2_041_partial_18_0232 : Poly :=
[
  term ((-68771886729298932794039543041758090137145608277051394031650956021 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((68771886729298932794039543041758090137145608277051394031650956021 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 18. -/
theorem ep_Q2_041_partial_18_0232_valid :
    mulPoly ep_Q2_041_coefficient_18_0232
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0233 : Poly :=
[
  term ((-3814641860187581065188903897339582020484259706728355087894741655 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (10, 1), (15, 4)]
]

/-- Partial product 233 for generator 18. -/
def ep_Q2_041_partial_18_0233 : Poly :=
[
  term ((3814641860187581065188903897339582020484259706728355087894741655 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (10, 1), (15, 4)],
  term ((-3814641860187581065188903897339582020484259706728355087894741655 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 2), (10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 18. -/
theorem ep_Q2_041_partial_18_0233_valid :
    mulPoly ep_Q2_041_coefficient_18_0233
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0234 : Poly :=
[
  term ((-117865553965874 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 234 for generator 18. -/
def ep_Q2_041_partial_18_0234 : Poly :=
[
  term ((117865553965874 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-235731107931748 : Rat) / 3100914216589) [(0, 1), (8, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 18. -/
theorem ep_Q2_041_partial_18_0234_valid :
    mulPoly ep_Q2_041_coefficient_18_0234
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0235 : Poly :=
[
  term ((8585028949104341376512184705010746793793945665453909990286530435 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 235 for generator 18. -/
def ep_Q2_041_partial_18_0235 : Poly :=
[
  term ((-8585028949104341376512184705010746793793945665453909990286530435 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((17170057898208682753024369410021493587587891330907819980573060870 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 2), (11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 18. -/
theorem ep_Q2_041_partial_18_0235_valid :
    mulPoly ep_Q2_041_coefficient_18_0235
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0236 : Poly :=
[
  term ((5925899398680850532006900440956488628913936521508139060234970 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 236 for generator 18. -/
def ep_Q2_041_partial_18_0236 : Poly :=
[
  term ((-5925899398680850532006900440956488628913936521508139060234970 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((11851798797361701064013800881912977257827873043016278120469940 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (11, 1), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 18. -/
theorem ep_Q2_041_partial_18_0236_valid :
    mulPoly ep_Q2_041_coefficient_18_0236
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0237 : Poly :=
[
  term ((-3430925816114302707829392110865606824440968135431747792175045 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 237 for generator 18. -/
def ep_Q2_041_partial_18_0237 : Poly :=
[
  term ((3430925816114302707829392110865606824440968135431747792175045 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-6861851632228605415658784221731213648881936270863495584350090 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 18. -/
theorem ep_Q2_041_partial_18_0237_valid :
    mulPoly ep_Q2_041_coefficient_18_0237
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0238 : Poly :=
[
  term ((362217618884567920308020675250623382478314390156473191198933292 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 238 for generator 18. -/
def ep_Q2_041_partial_18_0238 : Poly :=
[
  term ((-362217618884567920308020675250623382478314390156473191198933292 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((724435237769135840616041350501246764956628780312946382397866584 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 18. -/
theorem ep_Q2_041_partial_18_0238_valid :
    mulPoly ep_Q2_041_coefficient_18_0238
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0239 : Poly :=
[
  term ((-5514394737103378351502473018177518967110164473469082601727894430 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 3)]
]

/-- Partial product 239 for generator 18. -/
def ep_Q2_041_partial_18_0239 : Poly :=
[
  term ((5514394737103378351502473018177518967110164473469082601727894430 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 3)],
  term ((-11028789474206756703004946036355037934220328946938165203455788860 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 2), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 18. -/
theorem ep_Q2_041_partial_18_0239_valid :
    mulPoly ep_Q2_041_coefficient_18_0239
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0240 : Poly :=
[
  term ((1721167661605159316313895059848960634908726202153436101315810 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 240 for generator 18. -/
def ep_Q2_041_partial_18_0240 : Poly :=
[
  term ((-1721167661605159316313895059848960634908726202153436101315810 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((3442335323210318632627790119697921269817452404306872202631620 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 18. -/
theorem ep_Q2_041_partial_18_0240_valid :
    mulPoly ep_Q2_041_coefficient_18_0240
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0241 : Poly :=
[
  term ((627584998709526 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 241 for generator 18. -/
def ep_Q2_041_partial_18_0241 : Poly :=
[
  term ((-627584998709526 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 1), (13, 1)],
  term ((1255169997419052 : Rat) / 3100914216589) [(0, 1), (8, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 18. -/
theorem ep_Q2_041_partial_18_0241_valid :
    mulPoly ep_Q2_041_coefficient_18_0241
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0242 : Poly :=
[
  term ((-699447724257568 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 242 for generator 18. -/
def ep_Q2_041_partial_18_0242 : Poly :=
[
  term ((699447724257568 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1398895448515136 : Rat) / 3100914216589) [(0, 1), (8, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 18. -/
theorem ep_Q2_041_partial_18_0242_valid :
    mulPoly ep_Q2_041_coefficient_18_0242
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0243 : Poly :=
[
  term ((16898903707630556685712647572644462574116551406733366252390290 : Rat) / 89221829257929386589734652939729697135092479920272471557459) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 243 for generator 18. -/
def ep_Q2_041_partial_18_0243 : Poly :=
[
  term ((-16898903707630556685712647572644462574116551406733366252390290 : Rat) / 89221829257929386589734652939729697135092479920272471557459) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((33797807415261113371425295145288925148233102813466732504780580 : Rat) / 89221829257929386589734652939729697135092479920272471557459) [(0, 1), (8, 2), (11, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 18. -/
theorem ep_Q2_041_partial_18_0243_valid :
    mulPoly ep_Q2_041_coefficient_18_0243
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0244 : Poly :=
[
  term ((669913632752806326186646749307276296909572125721046636671709895 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 244 for generator 18. -/
def ep_Q2_041_partial_18_0244 : Poly :=
[
  term ((-669913632752806326186646749307276296909572125721046636671709895 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((1339827265505612652373293498614552593819144251442093273343419790 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 18. -/
theorem ep_Q2_041_partial_18_0244_valid :
    mulPoly ep_Q2_041_coefficient_18_0244
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0245 : Poly :=
[
  term ((-1361184864905820119942618965089791089546132324901142754180680530 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 245 for generator 18. -/
def ep_Q2_041_partial_18_0245 : Poly :=
[
  term ((1361184864905820119942618965089791089546132324901142754180680530 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-2722369729811640239885237930179582179092264649802285508361361060 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 2), (11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 18. -/
theorem ep_Q2_041_partial_18_0245_valid :
    mulPoly ep_Q2_041_coefficient_18_0245
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0246 : Poly :=
[
  term ((-54228770050497238682271308873050410749303794635753421650917580 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (8, 1), (11, 1), (13, 2), (15, 1)]
]

/-- Partial product 246 for generator 18. -/
def ep_Q2_041_partial_18_0246 : Poly :=
[
  term ((54228770050497238682271308873050410749303794635753421650917580 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (8, 1), (11, 1), (13, 2), (15, 1)],
  term ((-108457540100994477364542617746100821498607589271506843301835160 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (8, 2), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 18. -/
theorem ep_Q2_041_partial_18_0246_valid :
    mulPoly ep_Q2_041_coefficient_18_0246
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0247 : Poly :=
[
  term ((11145799308042046735054689058474600298237062235584774804826151906 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 247 for generator 18. -/
def ep_Q2_041_partial_18_0247 : Poly :=
[
  term ((-11145799308042046735054689058474600298237062235584774804826151906 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((22291598616084093470109378116949200596474124471169549609652303812 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 18. -/
theorem ep_Q2_041_partial_18_0247_valid :
    mulPoly ep_Q2_041_coefficient_18_0247
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0248 : Poly :=
[
  term ((-15528270413886647218554561703847867698004150755772168507589455215 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 3)]
]

/-- Partial product 248 for generator 18. -/
def ep_Q2_041_partial_18_0248 : Poly :=
[
  term ((15528270413886647218554561703847867698004150755772168507589455215 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 3)],
  term ((-15528270413886647218554561703847867698004150755772168507589455215 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 2), (11, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 18. -/
theorem ep_Q2_041_partial_18_0248_valid :
    mulPoly ep_Q2_041_coefficient_18_0248
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0249 : Poly :=
[
  term ((-1220629436182299852515421582099924839672606984461681900689650 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1)]
]

/-- Partial product 249 for generator 18. -/
def ep_Q2_041_partial_18_0249 : Poly :=
[
  term ((1220629436182299852515421582099924839672606984461681900689650 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-2441258872364599705030843164199849679345213968923363801379300 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 18. -/
theorem ep_Q2_041_partial_18_0249_valid :
    mulPoly ep_Q2_041_coefficient_18_0249
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0250 : Poly :=
[
  term ((-59414501688200955148881706455384010467700459881527238130533272423 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 250 for generator 18. -/
def ep_Q2_041_partial_18_0250 : Poly :=
[
  term ((59414501688200955148881706455384010467700459881527238130533272423 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((-59414501688200955148881706455384010467700459881527238130533272423 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 18. -/
theorem ep_Q2_041_partial_18_0250_valid :
    mulPoly ep_Q2_041_coefficient_18_0250
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0251 : Poly :=
[
  term ((12135630042240587625094109059107469148621570017915561610258448005 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (11, 1), (15, 3)]
]

/-- Partial product 251 for generator 18. -/
def ep_Q2_041_partial_18_0251 : Poly :=
[
  term ((-12135630042240587625094109059107469148621570017915561610258448005 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (11, 1), (15, 3)],
  term ((12135630042240587625094109059107469148621570017915561610258448005 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 18. -/
theorem ep_Q2_041_partial_18_0251_valid :
    mulPoly ep_Q2_041_coefficient_18_0251
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0252 : Poly :=
[
  term ((-252726321864874 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 2)]
]

/-- Partial product 252 for generator 18. -/
def ep_Q2_041_partial_18_0252 : Poly :=
[
  term ((252726321864874 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 2)],
  term ((-505452643729748 : Rat) / 3100914216589) [(0, 1), (8, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 18. -/
theorem ep_Q2_041_partial_18_0252_valid :
    mulPoly ep_Q2_041_coefficient_18_0252
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0253 : Poly :=
[
  term ((149306385144202 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 2), (12, 1)]
]

/-- Partial product 253 for generator 18. -/
def ep_Q2_041_partial_18_0253 : Poly :=
[
  term ((-149306385144202 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 2), (12, 1)],
  term ((298612770288404 : Rat) / 3100914216589) [(0, 1), (8, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 18. -/
theorem ep_Q2_041_partial_18_0253_valid :
    mulPoly ep_Q2_041_coefficient_18_0253
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0254 : Poly :=
[
  term ((-119918993511520446979013061209023871085480418344818392548624520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 254 for generator 18. -/
def ep_Q2_041_partial_18_0254 : Poly :=
[
  term ((119918993511520446979013061209023871085480418344818392548624520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-239837987023040893958026122418047742170960836689636785097249040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 2), (11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 18. -/
theorem ep_Q2_041_partial_18_0254_valid :
    mulPoly ep_Q2_041_coefficient_18_0254
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0255 : Poly :=
[
  term ((77947420902565223821218525820594296594262525706702235199769925 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (11, 2), (12, 1), (15, 2)]
]

/-- Partial product 255 for generator 18. -/
def ep_Q2_041_partial_18_0255 : Poly :=
[
  term ((-77947420902565223821218525820594296594262525706702235199769925 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (11, 2), (12, 1), (15, 2)],
  term ((155894841805130447642437051641188593188525051413404470399539850 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 2), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 18. -/
theorem ep_Q2_041_partial_18_0255_valid :
    mulPoly ep_Q2_041_coefficient_18_0255
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0256 : Poly :=
[
  term ((-128969644850645470393714263597019884010779830662331579181851060 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 256 for generator 18. -/
def ep_Q2_041_partial_18_0256 : Poly :=
[
  term ((128969644850645470393714263597019884010779830662331579181851060 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-257939289701290940787428527194039768021559661324663158363702120 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 2), (11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 18. -/
theorem ep_Q2_041_partial_18_0256_valid :
    mulPoly ep_Q2_041_coefficient_18_0256
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0257 : Poly :=
[
  term ((270784599500205764369703294577764734431581095988992401007403315 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 257 for generator 18. -/
def ep_Q2_041_partial_18_0257 : Poly :=
[
  term ((-270784599500205764369703294577764734431581095988992401007403315 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((541569199000411528739406589155529468863162191977984802014806630 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 18. -/
theorem ep_Q2_041_partial_18_0257_valid :
    mulPoly ep_Q2_041_coefficient_18_0257
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0258 : Poly :=
[
  term ((963630904035228 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 2), (14, 1)]
]

/-- Partial product 258 for generator 18. -/
def ep_Q2_041_partial_18_0258 : Poly :=
[
  term ((-963630904035228 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 2), (14, 1)],
  term ((1927261808070456 : Rat) / 3100914216589) [(0, 1), (8, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 18. -/
theorem ep_Q2_041_partial_18_0258_valid :
    mulPoly ep_Q2_041_coefficient_18_0258
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0259 : Poly :=
[
  term ((3211691557936552283291499051418820159679636861494802849539498685 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (11, 2), (14, 1), (15, 2)]
]

/-- Partial product 259 for generator 18. -/
def ep_Q2_041_partial_18_0259 : Poly :=
[
  term ((-3211691557936552283291499051418820159679636861494802849539498685 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (11, 2), (14, 1), (15, 2)],
  term ((3211691557936552283291499051418820159679636861494802849539498685 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 2), (11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 18. -/
theorem ep_Q2_041_partial_18_0259_valid :
    mulPoly ep_Q2_041_coefficient_18_0259
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0260 : Poly :=
[
  term ((-11730226600294691429112139464725837155232463110250115105931932390 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (11, 2), (15, 2)]
]

/-- Partial product 260 for generator 18. -/
def ep_Q2_041_partial_18_0260 : Poly :=
[
  term ((11730226600294691429112139464725837155232463110250115105931932390 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (11, 2), (15, 2)],
  term ((-23460453200589382858224278929451674310464926220500230211863864780 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 18. -/
theorem ep_Q2_041_partial_18_0260_valid :
    mulPoly ep_Q2_041_coefficient_18_0260
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0261 : Poly :=
[
  term ((86528690768945168867257789483516724780417887501042681824307160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 3), (12, 1), (15, 1)]
]

/-- Partial product 261 for generator 18. -/
def ep_Q2_041_partial_18_0261 : Poly :=
[
  term ((-86528690768945168867257789483516724780417887501042681824307160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 3), (12, 1), (15, 1)],
  term ((173057381537890337734515578967033449560835775002085363648614320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 2), (11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 18. -/
theorem ep_Q2_041_partial_18_0261_valid :
    mulPoly ep_Q2_041_coefficient_18_0261
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0262 : Poly :=
[
  term ((361849052602087466006883906561107219386364834246413746093378720 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 3), (14, 1), (15, 1)]
]

/-- Partial product 262 for generator 18. -/
def ep_Q2_041_partial_18_0262 : Poly :=
[
  term ((-361849052602087466006883906561107219386364834246413746093378720 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 3), (14, 1), (15, 1)],
  term ((723698105204174932013767813122214438772729668492827492186757440 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 2), (11, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 18. -/
theorem ep_Q2_041_partial_18_0262_valid :
    mulPoly ep_Q2_041_coefficient_18_0262
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0263 : Poly :=
[
  term ((-100707616757750888733556898351716896259056715141871125005616400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 3), (15, 1)]
]

/-- Partial product 263 for generator 18. -/
def ep_Q2_041_partial_18_0263 : Poly :=
[
  term ((100707616757750888733556898351716896259056715141871125005616400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 3), (15, 1)],
  term ((-201415233515501777467113796703433792518113430283742250011232800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 18. -/
theorem ep_Q2_041_partial_18_0263_valid :
    mulPoly ep_Q2_041_coefficient_18_0263
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0264 : Poly :=
[
  term ((1721167661605159316313895059848960634908726202153436101315810 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 264 for generator 18. -/
def ep_Q2_041_partial_18_0264 : Poly :=
[
  term ((-1721167661605159316313895059848960634908726202153436101315810 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((3442335323210318632627790119697921269817452404306872202631620 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 18. -/
theorem ep_Q2_041_partial_18_0264_valid :
    mulPoly ep_Q2_041_coefficient_18_0264
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0265 : Poly :=
[
  term ((4504983568346806902223537308967990247864686995766690193193775109 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 265 for generator 18. -/
def ep_Q2_041_partial_18_0265 : Poly :=
[
  term ((-4504983568346806902223537308967990247864686995766690193193775109 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((4504983568346806902223537308967990247864686995766690193193775109 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 18. -/
theorem ep_Q2_041_partial_18_0265_valid :
    mulPoly ep_Q2_041_coefficient_18_0265
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0266 : Poly :=
[
  term ((3275790655354723722537932906051273523903500676657900235984210845 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 3)]
]

/-- Partial product 266 for generator 18. -/
def ep_Q2_041_partial_18_0266 : Poly :=
[
  term ((-3275790655354723722537932906051273523903500676657900235984210845 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 3)],
  term ((3275790655354723722537932906051273523903500676657900235984210845 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 2), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 18. -/
theorem ep_Q2_041_partial_18_0266_valid :
    mulPoly ep_Q2_041_coefficient_18_0266
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0267 : Poly :=
[
  term ((-8779110220267926714084296949565168339131757809641687496644400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (12, 1), (13, 2), (15, 2)]
]

/-- Partial product 267 for generator 18. -/
def ep_Q2_041_partial_18_0267 : Poly :=
[
  term ((8779110220267926714084296949565168339131757809641687496644400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (12, 1), (13, 2), (15, 2)],
  term ((-17558220440535853428168593899130336678263515619283374993288800 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 18. -/
theorem ep_Q2_041_partial_18_0267_valid :
    mulPoly ep_Q2_041_coefficient_18_0267
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0268 : Poly :=
[
  term ((1709758154509143391515497051016646189532241933278311690859235 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 268 for generator 18. -/
def ep_Q2_041_partial_18_0268 : Poly :=
[
  term ((-1709758154509143391515497051016646189532241933278311690859235 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((3419516309018286783030994102033292379064483866556623381718470 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 18. -/
theorem ep_Q2_041_partial_18_0268_valid :
    mulPoly ep_Q2_041_coefficient_18_0268
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0269 : Poly :=
[
  term ((-16553927379757485193250918563596799955372329223309482132338831489 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 269 for generator 18. -/
def ep_Q2_041_partial_18_0269 : Poly :=
[
  term ((16553927379757485193250918563596799955372329223309482132338831489 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (12, 1), (15, 2)],
  term ((-16553927379757485193250918563596799955372329223309482132338831489 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 18. -/
theorem ep_Q2_041_partial_18_0269_valid :
    mulPoly ep_Q2_041_coefficient_18_0269
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0270 : Poly :=
[
  term ((333081161520588202658601154328336146643550123978576889675634925 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (8, 1), (12, 1), (15, 4)]
]

/-- Partial product 270 for generator 18. -/
def ep_Q2_041_partial_18_0270 : Poly :=
[
  term ((-333081161520588202658601154328336146643550123978576889675634925 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (8, 1), (12, 1), (15, 4)],
  term ((333081161520588202658601154328336146643550123978576889675634925 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 2), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 18. -/
theorem ep_Q2_041_partial_18_0270_valid :
    mulPoly ep_Q2_041_coefficient_18_0270
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0271 : Poly :=
[
  term ((-1721167661605159316313895059848960634908726202153436101315810 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (12, 2), (15, 2)]
]

/-- Partial product 271 for generator 18. -/
def ep_Q2_041_partial_18_0271 : Poly :=
[
  term ((1721167661605159316313895059848960634908726202153436101315810 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (12, 2), (15, 2)],
  term ((-3442335323210318632627790119697921269817452404306872202631620 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 18. -/
theorem ep_Q2_041_partial_18_0271_valid :
    mulPoly ep_Q2_041_coefficient_18_0271
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0272 : Poly :=
[
  term ((3757659936289195479008102927253947786928109827100031383625806577 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 272 for generator 18. -/
def ep_Q2_041_partial_18_0272 : Poly :=
[
  term ((-3757659936289195479008102927253947786928109827100031383625806577 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((3757659936289195479008102927253947786928109827100031383625806577 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 18. -/
theorem ep_Q2_041_partial_18_0272_valid :
    mulPoly ep_Q2_041_coefficient_18_0272
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0273 : Poly :=
[
  term ((-672368169784391216617165522790784314727507977724804321382846575 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (8, 1), (13, 1), (14, 1), (15, 3)]
]

/-- Partial product 273 for generator 18. -/
def ep_Q2_041_partial_18_0273 : Poly :=
[
  term ((672368169784391216617165522790784314727507977724804321382846575 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (8, 1), (13, 1), (14, 1), (15, 3)],
  term ((-672368169784391216617165522790784314727507977724804321382846575 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 2), (13, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 18. -/
theorem ep_Q2_041_partial_18_0273_valid :
    mulPoly ep_Q2_041_coefficient_18_0273
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0274 : Poly :=
[
  term ((22908734910754495875384971933474638706063572471009150209560 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (8, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 274 for generator 18. -/
def ep_Q2_041_partial_18_0274 : Poly :=
[
  term ((-22908734910754495875384971933474638706063572471009150209560 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((45817469821508991750769943866949277412127144942018300419120 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (8, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 18. -/
theorem ep_Q2_041_partial_18_0274_valid :
    mulPoly ep_Q2_041_coefficient_18_0274
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0275 : Poly :=
[
  term ((3197609791305865376733785606993565370505032020973968311565890269 : Rat) / 7091195821021518203740649807557647233171697969315568609001524) [(0, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 275 for generator 18. -/
def ep_Q2_041_partial_18_0275 : Poly :=
[
  term ((-3197609791305865376733785606993565370505032020973968311565890269 : Rat) / 7091195821021518203740649807557647233171697969315568609001524) [(0, 1), (8, 1), (13, 1), (15, 1)],
  term ((3197609791305865376733785606993565370505032020973968311565890269 : Rat) / 3545597910510759101870324903778823616585848984657784304500762) [(0, 1), (8, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 18. -/
theorem ep_Q2_041_partial_18_0275_valid :
    mulPoly ep_Q2_041_coefficient_18_0275
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0276 : Poly :=
[
  term ((-387718044410126696308363916713325891549201967310514045952051455 : Rat) / 3545597910510759101870324903778823616585848984657784304500762) [(0, 1), (8, 1), (13, 1), (15, 3)]
]

/-- Partial product 276 for generator 18. -/
def ep_Q2_041_partial_18_0276 : Poly :=
[
  term ((387718044410126696308363916713325891549201967310514045952051455 : Rat) / 3545597910510759101870324903778823616585848984657784304500762) [(0, 1), (8, 1), (13, 1), (15, 3)],
  term ((-387718044410126696308363916713325891549201967310514045952051455 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 18. -/
theorem ep_Q2_041_partial_18_0276_valid :
    mulPoly ep_Q2_041_coefficient_18_0276
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0277 : Poly :=
[
  term ((-1045734199873077 : Rat) / 3100914216589) [(0, 1), (8, 1), (13, 2)]
]

/-- Partial product 277 for generator 18. -/
def ep_Q2_041_partial_18_0277 : Poly :=
[
  term ((1045734199873077 : Rat) / 3100914216589) [(0, 1), (8, 1), (13, 2)],
  term ((-2091468399746154 : Rat) / 3100914216589) [(0, 1), (8, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 18. -/
theorem ep_Q2_041_partial_18_0277_valid :
    mulPoly ep_Q2_041_coefficient_18_0277
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0278 : Poly :=
[
  term ((-295624010955988 : Rat) / 3100914216589) [(0, 1), (8, 1), (13, 2), (14, 1)]
]

/-- Partial product 278 for generator 18. -/
def ep_Q2_041_partial_18_0278 : Poly :=
[
  term ((295624010955988 : Rat) / 3100914216589) [(0, 1), (8, 1), (13, 2), (14, 1)],
  term ((-591248021911976 : Rat) / 3100914216589) [(0, 1), (8, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 18. -/
theorem ep_Q2_041_partial_18_0278_valid :
    mulPoly ep_Q2_041_coefficient_18_0278
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0279 : Poly :=
[
  term ((18258927759451487110775143296384606153569744642502677108909670135 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (13, 2), (14, 1), (15, 2)]
]

/-- Partial product 279 for generator 18. -/
def ep_Q2_041_partial_18_0279 : Poly :=
[
  term ((-18258927759451487110775143296384606153569744642502677108909670135 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (13, 2), (14, 1), (15, 2)],
  term ((18258927759451487110775143296384606153569744642502677108909670135 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 2), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 18. -/
theorem ep_Q2_041_partial_18_0279_valid :
    mulPoly ep_Q2_041_coefficient_18_0279
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0280 : Poly :=
[
  term ((15555636332521923396728476331153881030931769904386309608153498565 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (13, 2), (15, 2)]
]

/-- Partial product 280 for generator 18. -/
def ep_Q2_041_partial_18_0280 : Poly :=
[
  term ((-15555636332521923396728476331153881030931769904386309608153498565 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (13, 2), (15, 2)],
  term ((31111272665043846793456952662307762061863539808772619216306997130 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 18. -/
theorem ep_Q2_041_partial_18_0280_valid :
    mulPoly ep_Q2_041_coefficient_18_0280
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0281 : Poly :=
[
  term ((8779110220267926714084296949565168339131757809641687496644400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (13, 3), (14, 1), (15, 1)]
]

/-- Partial product 281 for generator 18. -/
def ep_Q2_041_partial_18_0281 : Poly :=
[
  term ((-8779110220267926714084296949565168339131757809641687496644400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (13, 3), (14, 1), (15, 1)],
  term ((17558220440535853428168593899130336678263515619283374993288800 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 18. -/
theorem ep_Q2_041_partial_18_0281_valid :
    mulPoly ep_Q2_041_coefficient_18_0281
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0282 : Poly :=
[
  term ((-294562250811621225275196805544620779799815558086661883111095 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (8, 1), (13, 3), (15, 1)]
]

/-- Partial product 282 for generator 18. -/
def ep_Q2_041_partial_18_0282 : Poly :=
[
  term ((294562250811621225275196805544620779799815558086661883111095 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (8, 1), (13, 3), (15, 1)],
  term ((-589124501623242450550393611089241559599631116173323766222190 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (8, 2), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 18. -/
theorem ep_Q2_041_partial_18_0282_valid :
    mulPoly ep_Q2_041_coefficient_18_0282
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0283 : Poly :=
[
  term ((-5577824118149544680680619848531863911581400877416599174767342817 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (8, 1), (14, 1), (15, 2)]
]

/-- Partial product 283 for generator 18. -/
def ep_Q2_041_partial_18_0283 : Poly :=
[
  term ((5577824118149544680680619848531863911581400877416599174767342817 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (8, 1), (14, 1), (15, 2)],
  term ((-5577824118149544680680619848531863911581400877416599174767342817 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 18. -/
theorem ep_Q2_041_partial_18_0283_valid :
    mulPoly ep_Q2_041_coefficient_18_0283
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0284 : Poly :=
[
  term ((1493955265497522703398618245190600931837883384761282320306094815 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (14, 1), (15, 4)]
]

/-- Partial product 284 for generator 18. -/
def ep_Q2_041_partial_18_0284 : Poly :=
[
  term ((-1493955265497522703398618245190600931837883384761282320306094815 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (14, 1), (15, 4)],
  term ((2987910530995045406797236490381201863675766769522564640612189630 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 2), (14, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 18. -/
theorem ep_Q2_041_partial_18_0284_valid :
    mulPoly ep_Q2_041_coefficient_18_0284
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0285 : Poly :=
[
  term ((1770916988710369277245677300553442096342431384899404552190075 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (8, 1), (14, 2), (15, 2)]
]

/-- Partial product 285 for generator 18. -/
def ep_Q2_041_partial_18_0285 : Poly :=
[
  term ((-1770916988710369277245677300553442096342431384899404552190075 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (8, 1), (14, 2), (15, 2)],
  term ((1770916988710369277245677300553442096342431384899404552190075 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 18. -/
theorem ep_Q2_041_partial_18_0285_valid :
    mulPoly ep_Q2_041_coefficient_18_0285
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0286 : Poly :=
[
  term ((10909710733814973590292897265632432224751243248950787078956371361 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (15, 2)]
]

/-- Partial product 286 for generator 18. -/
def ep_Q2_041_partial_18_0286 : Poly :=
[
  term ((-10909710733814973590292897265632432224751243248950787078956371361 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (15, 2)],
  term ((10909710733814973590292897265632432224751243248950787078956371361 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 18. -/
theorem ep_Q2_041_partial_18_0286_valid :
    mulPoly ep_Q2_041_coefficient_18_0286
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0287 : Poly :=
[
  term ((-114615575566079661987532774267138142062813915519644900199521895 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (8, 1), (15, 4)]
]

/-- Partial product 287 for generator 18. -/
def ep_Q2_041_partial_18_0287 : Poly :=
[
  term ((114615575566079661987532774267138142062813915519644900199521895 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (8, 1), (15, 4)],
  term ((-114615575566079661987532774267138142062813915519644900199521895 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 18. -/
theorem ep_Q2_041_partial_18_0287_valid :
    mulPoly ep_Q2_041_coefficient_18_0287
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0288 : Poly :=
[
  term ((252726321864874 : Rat) / 3100914216589) [(0, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 288 for generator 18. -/
def ep_Q2_041_partial_18_0288 : Poly :=
[
  term ((505452643729748 : Rat) / 3100914216589) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-252726321864874 : Rat) / 3100914216589) [(0, 1), (9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 18. -/
theorem ep_Q2_041_partial_18_0288_valid :
    mulPoly ep_Q2_041_coefficient_18_0288
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0289 : Poly :=
[
  term ((-149306385144202 : Rat) / 3100914216589) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 289 for generator 18. -/
def ep_Q2_041_partial_18_0289 : Poly :=
[
  term ((-298612770288404 : Rat) / 3100914216589) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((149306385144202 : Rat) / 3100914216589) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 18. -/
theorem ep_Q2_041_partial_18_0289_valid :
    mulPoly ep_Q2_041_coefficient_18_0289
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0290 : Poly :=
[
  term ((119918993511520446979013061209023871085480418344818392548624520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 290 for generator 18. -/
def ep_Q2_041_partial_18_0290 : Poly :=
[
  term ((239837987023040893958026122418047742170960836689636785097249040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-119918993511520446979013061209023871085480418344818392548624520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 18. -/
theorem ep_Q2_041_partial_18_0290_valid :
    mulPoly ep_Q2_041_coefficient_18_0290
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0291 : Poly :=
[
  term ((-2068107308588304107768147683941478966543873938230683917158834605 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 291 for generator 18. -/
def ep_Q2_041_partial_18_0291 : Poly :=
[
  term ((-4136214617176608215536295367882957933087747876461367834317669210 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((2068107308588304107768147683941478966543873938230683917158834605 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 18. -/
theorem ep_Q2_041_partial_18_0291_valid :
    mulPoly ep_Q2_041_coefficient_18_0291
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0292 : Poly :=
[
  term ((-319408098520387164480427432447604060156002891085124848735834820 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 292 for generator 18. -/
def ep_Q2_041_partial_18_0292 : Poly :=
[
  term ((-638816197040774328960854864895208120312005782170249697471669640 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((319408098520387164480427432447604060156002891085124848735834820 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 18. -/
theorem ep_Q2_041_partial_18_0292_valid :
    mulPoly ep_Q2_041_coefficient_18_0292
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0293 : Poly :=
[
  term ((37731690662824577053099455850053704930802787608500958390655675 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 293 for generator 18. -/
def ep_Q2_041_partial_18_0293 : Poly :=
[
  term ((75463381325649154106198911700107409861605575217001916781311350 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-37731690662824577053099455850053704930802787608500958390655675 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 18. -/
theorem ep_Q2_041_partial_18_0293_valid :
    mulPoly ep_Q2_041_coefficient_18_0293
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0294 : Poly :=
[
  term ((-963630904035228 : Rat) / 3100914216589) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 294 for generator 18. -/
def ep_Q2_041_partial_18_0294 : Poly :=
[
  term ((-1927261808070456 : Rat) / 3100914216589) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((963630904035228 : Rat) / 3100914216589) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 18. -/
theorem ep_Q2_041_partial_18_0294_valid :
    mulPoly ep_Q2_041_coefficient_18_0294
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0295 : Poly :=
[
  term ((-15814204769505286637505195205196233661871887785754330974212977165 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 295 for generator 18. -/
def ep_Q2_041_partial_18_0295 : Poly :=
[
  term ((-15814204769505286637505195205196233661871887785754330974212977165 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((15814204769505286637505195205196233661871887785754330974212977165 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 18. -/
theorem ep_Q2_041_partial_18_0295_valid :
    mulPoly ep_Q2_041_coefficient_18_0295
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0296 : Poly :=
[
  term ((-16116119010730473920977701484243521143147454086156649066382096710 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (9, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 296 for generator 18. -/
def ep_Q2_041_partial_18_0296 : Poly :=
[
  term ((-32232238021460947841955402968487042286294908172313298132764193420 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((16116119010730473920977701484243521143147454086156649066382096710 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (9, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 18. -/
theorem ep_Q2_041_partial_18_0296_valid :
    mulPoly ep_Q2_041_coefficient_18_0296
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0297 : Poly :=
[
  term ((-86528690768945168867257789483516724780417887501042681824307160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 297 for generator 18. -/
def ep_Q2_041_partial_18_0297 : Poly :=
[
  term ((-173057381537890337734515578967033449560835775002085363648614320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((86528690768945168867257789483516724780417887501042681824307160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 18. -/
theorem ep_Q2_041_partial_18_0297_valid :
    mulPoly ep_Q2_041_coefficient_18_0297
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0298 : Poly :=
[
  term ((-361849052602087466006883906561107219386364834246413746093378720 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (10, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 298 for generator 18. -/
def ep_Q2_041_partial_18_0298 : Poly :=
[
  term ((-723698105204174932013767813122214438772729668492827492186757440 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((361849052602087466006883906561107219386364834246413746093378720 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (10, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 18. -/
theorem ep_Q2_041_partial_18_0298_valid :
    mulPoly ep_Q2_041_coefficient_18_0298
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0299 : Poly :=
[
  term ((100707616757750888733556898351716896259056715141871125005616400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 299 for generator 18. -/
def ep_Q2_041_partial_18_0299 : Poly :=
[
  term ((201415233515501777467113796703433792518113430283742250011232800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-100707616757750888733556898351716896259056715141871125005616400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 18. -/
theorem ep_Q2_041_partial_18_0299_valid :
    mulPoly ep_Q2_041_coefficient_18_0299
        ep_Q2_041_generator_18_0200_0299 =
      ep_Q2_041_partial_18_0299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_041_partials_18_0200_0299 : List Poly :=
[
  ep_Q2_041_partial_18_0200,
  ep_Q2_041_partial_18_0201,
  ep_Q2_041_partial_18_0202,
  ep_Q2_041_partial_18_0203,
  ep_Q2_041_partial_18_0204,
  ep_Q2_041_partial_18_0205,
  ep_Q2_041_partial_18_0206,
  ep_Q2_041_partial_18_0207,
  ep_Q2_041_partial_18_0208,
  ep_Q2_041_partial_18_0209,
  ep_Q2_041_partial_18_0210,
  ep_Q2_041_partial_18_0211,
  ep_Q2_041_partial_18_0212,
  ep_Q2_041_partial_18_0213,
  ep_Q2_041_partial_18_0214,
  ep_Q2_041_partial_18_0215,
  ep_Q2_041_partial_18_0216,
  ep_Q2_041_partial_18_0217,
  ep_Q2_041_partial_18_0218,
  ep_Q2_041_partial_18_0219,
  ep_Q2_041_partial_18_0220,
  ep_Q2_041_partial_18_0221,
  ep_Q2_041_partial_18_0222,
  ep_Q2_041_partial_18_0223,
  ep_Q2_041_partial_18_0224,
  ep_Q2_041_partial_18_0225,
  ep_Q2_041_partial_18_0226,
  ep_Q2_041_partial_18_0227,
  ep_Q2_041_partial_18_0228,
  ep_Q2_041_partial_18_0229,
  ep_Q2_041_partial_18_0230,
  ep_Q2_041_partial_18_0231,
  ep_Q2_041_partial_18_0232,
  ep_Q2_041_partial_18_0233,
  ep_Q2_041_partial_18_0234,
  ep_Q2_041_partial_18_0235,
  ep_Q2_041_partial_18_0236,
  ep_Q2_041_partial_18_0237,
  ep_Q2_041_partial_18_0238,
  ep_Q2_041_partial_18_0239,
  ep_Q2_041_partial_18_0240,
  ep_Q2_041_partial_18_0241,
  ep_Q2_041_partial_18_0242,
  ep_Q2_041_partial_18_0243,
  ep_Q2_041_partial_18_0244,
  ep_Q2_041_partial_18_0245,
  ep_Q2_041_partial_18_0246,
  ep_Q2_041_partial_18_0247,
  ep_Q2_041_partial_18_0248,
  ep_Q2_041_partial_18_0249,
  ep_Q2_041_partial_18_0250,
  ep_Q2_041_partial_18_0251,
  ep_Q2_041_partial_18_0252,
  ep_Q2_041_partial_18_0253,
  ep_Q2_041_partial_18_0254,
  ep_Q2_041_partial_18_0255,
  ep_Q2_041_partial_18_0256,
  ep_Q2_041_partial_18_0257,
  ep_Q2_041_partial_18_0258,
  ep_Q2_041_partial_18_0259,
  ep_Q2_041_partial_18_0260,
  ep_Q2_041_partial_18_0261,
  ep_Q2_041_partial_18_0262,
  ep_Q2_041_partial_18_0263,
  ep_Q2_041_partial_18_0264,
  ep_Q2_041_partial_18_0265,
  ep_Q2_041_partial_18_0266,
  ep_Q2_041_partial_18_0267,
  ep_Q2_041_partial_18_0268,
  ep_Q2_041_partial_18_0269,
  ep_Q2_041_partial_18_0270,
  ep_Q2_041_partial_18_0271,
  ep_Q2_041_partial_18_0272,
  ep_Q2_041_partial_18_0273,
  ep_Q2_041_partial_18_0274,
  ep_Q2_041_partial_18_0275,
  ep_Q2_041_partial_18_0276,
  ep_Q2_041_partial_18_0277,
  ep_Q2_041_partial_18_0278,
  ep_Q2_041_partial_18_0279,
  ep_Q2_041_partial_18_0280,
  ep_Q2_041_partial_18_0281,
  ep_Q2_041_partial_18_0282,
  ep_Q2_041_partial_18_0283,
  ep_Q2_041_partial_18_0284,
  ep_Q2_041_partial_18_0285,
  ep_Q2_041_partial_18_0286,
  ep_Q2_041_partial_18_0287,
  ep_Q2_041_partial_18_0288,
  ep_Q2_041_partial_18_0289,
  ep_Q2_041_partial_18_0290,
  ep_Q2_041_partial_18_0291,
  ep_Q2_041_partial_18_0292,
  ep_Q2_041_partial_18_0293,
  ep_Q2_041_partial_18_0294,
  ep_Q2_041_partial_18_0295,
  ep_Q2_041_partial_18_0296,
  ep_Q2_041_partial_18_0297,
  ep_Q2_041_partial_18_0298,
  ep_Q2_041_partial_18_0299
]

/-- Sum of partial products in this block. -/
def ep_Q2_041_block_18_0200_0299 : Poly :=
[
  term ((-99891312829619281579936073307932183176540734122808898930110 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (7, 1), (8, 1), (14, 3), (15, 1)],
  term ((-5963886448202182719129400818850445994539464994994473394719007056 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 1), (15, 1)],
  term ((71658895307218179058025746349522517604588472887821322878423450 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (7, 1), (8, 1), (15, 3)],
  term ((49945656414809640789968036653966091588270367061404449465055 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (7, 1), (14, 3), (15, 1)],
  term ((2981943224101091359564700409425222997269732497497236697359503528 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (15, 1)],
  term ((-35829447653609089529012873174761258802294236443910661439211725 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (7, 1), (15, 3)],
  term ((-82221115647528 : Rat) / 3100914216589) [(0, 1), (7, 2)],
  term ((328884462590112 : Rat) / 3100914216589) [(0, 1), (7, 2), (8, 1), (10, 1)],
  term ((19932578840990725093159805873975870632247836710865757911900800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((10952016163410347062797840552632216960751096053339785493091783780 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 2), (8, 1), (10, 1), (15, 2)],
  term ((-44848302392229131459609563216445708922557632599447955301776800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((59797736522972175279479417621927611896743510132597273735702400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 2), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-739990040827752 : Rat) / 3100914216589) [(0, 1), (7, 2), (8, 1), (14, 1)],
  term ((1289860115529927223044463434291405316882592511980783811811622100 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 2), (8, 1), (14, 1), (15, 2)],
  term ((986653387770336 : Rat) / 3100914216589) [(0, 1), (7, 2), (8, 1), (14, 2)],
  term ((-1719813487373236297392617912388540422510123349307711749082162800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 2), (8, 1), (14, 2), (15, 2)],
  term ((328884462590112 : Rat) / 3100914216589) [(0, 1), (7, 2), (8, 2)],
  term ((-29898868261486087639739708810963805948371755066298636867851200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 2), (8, 2), (11, 1), (14, 1), (15, 1)],
  term ((19932578840990725093159805873975870632247836710865757911900800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 2), (8, 2), (11, 1), (15, 1)],
  term ((-493326693885168 : Rat) / 3100914216589) [(0, 1), (7, 2), (8, 2), (14, 1)],
  term ((859906743686618148696308956194270211255061674653855874541081400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 2), (8, 2), (14, 1), (15, 2)],
  term ((-6335914825391791680095229232510378691630609701323748621086973290 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 2), (8, 2), (15, 2)],
  term ((-164442231295056 : Rat) / 3100914216589) [(0, 1), (7, 2), (10, 1)],
  term ((-9966289420495362546579902936987935316123918355432878955950400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 2), (10, 1), (11, 1), (15, 1)],
  term ((-5476008081705173531398920276316108480375548026669892746545891890 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 2), (10, 1), (15, 2)],
  term ((29898868261486087639739708810963805948371755066298636867851200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 2), (11, 1), (14, 1), (15, 1)],
  term ((-29898868261486087639739708810963805948371755066298636867851200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 2), (11, 1), (14, 2), (15, 1)],
  term ((-4983144710247681273289951468493967658061959177716439477975200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 2), (11, 1), (15, 1)],
  term ((493326693885168 : Rat) / 3100914216589) [(0, 1), (7, 2), (14, 1)],
  term ((-859906743686618148696308956194270211255061674653855874541081400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 2), (14, 1), (15, 2)],
  term ((-493326693885168 : Rat) / 3100914216589) [(0, 1), (7, 2), (14, 2)],
  term ((859906743686618148696308956194270211255061674653855874541081400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 2), (14, 2), (15, 2)],
  term ((3167957412695895840047614616255189345815304850661874310543486645 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (7, 2), (15, 2)],
  term ((505452643729748 : Rat) / 3100914216589) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-298612770288404 : Rat) / 3100914216589) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((239837987023040893958026122418047742170960836689636785097249040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4136214617176608215536295367882957933087747876461367834317669210 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-638816197040774328960854864895208120312005782170249697471669640 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((75463381325649154106198911700107409861605575217001916781311350 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1927261808070456 : Rat) / 3100914216589) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-15814204769505286637505195205196233661871887785754330974212977165 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-32232238021460947841955402968487042286294908172313298132764193420 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-173057381537890337734515578967033449560835775002085363648614320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-723698105204174932013767813122214438772729668492827492186757440 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((201415233515501777467113796703433792518113430283742250011232800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((428649530245307439014368816899686054157279992208720619877370 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-623778884071668477053357941153314592517256475948225164235260 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-31376263140655617780759316194366606961649176501183122375815 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((58323985339931372220453146497665189290287252264867156770065264801 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-20397474847127793187296458367358764862575733456035846576486349495 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 3)],
  term ((360496369281308959176251184130851800915032038028423728012861040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (10, 1), (11, 2), (15, 2)],
  term ((-428649530245307439014368816899686054157279992208720619877370 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-397273267104651821233609500705319447195630815707537497501555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((825922797349959260247978317605005501352910807916258117378925 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((623778884071668477053357941153314592517256475948225164235260 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 3)],
  term ((428649530245307439014368816899686054157279992208720619877370 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-68771886729298932794039543041758090137145608277051394031650956021 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((3814641860187581065188903897339582020484259706728355087894741655 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (10, 1), (15, 4)],
  term ((117865553965874 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-8585028949104341376512184705010746793793945665453909990286530435 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-5925899398680850532006900440956488628913936521508139060234970 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((3430925816114302707829392110865606824440968135431747792175045 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-362217618884567920308020675250623382478314390156473191198933292 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((5514394737103378351502473018177518967110164473469082601727894430 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 3)],
  term ((-1721167661605159316313895059848960634908726202153436101315810 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-627584998709526 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 1), (13, 1)],
  term ((699447724257568 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-16898903707630556685712647572644462574116551406733366252390290 : Rat) / 89221829257929386589734652939729697135092479920272471557459) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-669913632752806326186646749307276296909572125721046636671709895 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((1361184864905820119942618965089791089546132324901142754180680530 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((54228770050497238682271308873050410749303794635753421650917580 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (8, 1), (11, 1), (13, 2), (15, 1)],
  term ((-11145799308042046735054689058474600298237062235584774804826151906 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((15528270413886647218554561703847867698004150755772168507589455215 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 3)],
  term ((1220629436182299852515421582099924839672606984461681900689650 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((59414501688200955148881706455384010467700459881527238130533272423 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((-12135630042240587625094109059107469148621570017915561610258448005 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (11, 1), (15, 3)],
  term ((252726321864874 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 2)],
  term ((-149306385144202 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 2), (12, 1)],
  term ((119918993511520446979013061209023871085480418344818392548624520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-77947420902565223821218525820594296594262525706702235199769925 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (11, 2), (12, 1), (15, 2)],
  term ((128969644850645470393714263597019884010779830662331579181851060 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-270784599500205764369703294577764734431581095988992401007403315 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-963630904035228 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 2), (14, 1)],
  term ((-3211691557936552283291499051418820159679636861494802849539498685 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (11, 2), (14, 1), (15, 2)],
  term ((11730226600294691429112139464725837155232463110250115105931932390 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (11, 2), (15, 2)],
  term ((-86528690768945168867257789483516724780417887501042681824307160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 3), (12, 1), (15, 1)],
  term ((-361849052602087466006883906561107219386364834246413746093378720 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 3), (14, 1), (15, 1)],
  term ((100707616757750888733556898351716896259056715141871125005616400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 3), (15, 1)],
  term ((-1721167661605159316313895059848960634908726202153436101315810 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4504983568346806902223537308967990247864686995766690193193775109 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3275790655354723722537932906051273523903500676657900235984210845 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 3)],
  term ((8779110220267926714084296949565168339131757809641687496644400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (12, 1), (13, 2), (15, 2)],
  term ((-1709758154509143391515497051016646189532241933278311690859235 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((16553927379757485193250918563596799955372329223309482132338831489 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (12, 1), (15, 2)],
  term ((-333081161520588202658601154328336146643550123978576889675634925 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (8, 1), (12, 1), (15, 4)],
  term ((1721167661605159316313895059848960634908726202153436101315810 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (12, 2), (15, 2)],
  term ((-3757659936289195479008102927253947786928109827100031383625806577 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((672368169784391216617165522790784314727507977724804321382846575 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (8, 1), (13, 1), (14, 1), (15, 3)],
  term ((-22908734910754495875384971933474638706063572471009150209560 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3197609791305865376733785606993565370505032020973968311565890269 : Rat) / 7091195821021518203740649807557647233171697969315568609001524) [(0, 1), (8, 1), (13, 1), (15, 1)],
  term ((387718044410126696308363916713325891549201967310514045952051455 : Rat) / 3545597910510759101870324903778823616585848984657784304500762) [(0, 1), (8, 1), (13, 1), (15, 3)],
  term ((1045734199873077 : Rat) / 3100914216589) [(0, 1), (8, 1), (13, 2)],
  term ((295624010955988 : Rat) / 3100914216589) [(0, 1), (8, 1), (13, 2), (14, 1)],
  term ((-18258927759451487110775143296384606153569744642502677108909670135 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (13, 2), (14, 1), (15, 2)],
  term ((-15555636332521923396728476331153881030931769904386309608153498565 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (13, 2), (15, 2)],
  term ((-8779110220267926714084296949565168339131757809641687496644400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (13, 3), (14, 1), (15, 1)],
  term ((294562250811621225275196805544620779799815558086661883111095 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (8, 1), (13, 3), (15, 1)],
  term ((5577824118149544680680619848531863911581400877416599174767342817 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (8, 1), (14, 1), (15, 2)],
  term ((-1493955265497522703398618245190600931837883384761282320306094815 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (14, 1), (15, 4)],
  term ((-1770916988710369277245677300553442096342431384899404552190075 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (8, 1), (14, 2), (15, 2)],
  term ((-10909710733814973590292897265632432224751243248950787078956371361 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (15, 2)],
  term ((114615575566079661987532774267138142062813915519644900199521895 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (8, 1), (15, 4)],
  term ((-857299060490614878028737633799372108314559984417441239754740 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((1247557768143336954106715882306629185034512951896450328470520 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((62752526281311235561518632388733213923298353002366244751630 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-58323985339931372220453146497665189290287252264867156770065264801 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 2), (10, 1), (11, 1), (15, 1)],
  term ((20397474847127793187296458367358764862575733456035846576486349495 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 2), (10, 1), (11, 1), (15, 3)],
  term ((-720992738562617918352502368261703601830064076056847456025722080 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 2), (10, 1), (11, 2), (15, 2)],
  term ((857299060490614878028737633799372108314559984417441239754740 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (10, 1), (12, 1), (15, 2)],
  term ((794546534209303642467219001410638894391261631415074995003110 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1651845594699918520495956635210011002705821615832516234757850 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (10, 1), (13, 1), (15, 1)],
  term ((-1247557768143336954106715882306629185034512951896450328470520 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (10, 1), (13, 1), (15, 3)],
  term ((-857299060490614878028737633799372108314559984417441239754740 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (10, 1), (14, 1), (15, 2)],
  term ((68771886729298932794039543041758090137145608277051394031650956021 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 2), (10, 1), (15, 2)],
  term ((-3814641860187581065188903897339582020484259706728355087894741655 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 2), (10, 1), (15, 4)],
  term ((-235731107931748 : Rat) / 3100914216589) [(0, 1), (8, 2), (11, 1), (12, 1), (13, 1)],
  term ((17170057898208682753024369410021493587587891330907819980573060870 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 2), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((11851798797361701064013800881912977257827873043016278120469940 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-6861851632228605415658784221731213648881936270863495584350090 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((724435237769135840616041350501246764956628780312946382397866584 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 2), (11, 1), (12, 1), (15, 1)],
  term ((-11028789474206756703004946036355037934220328946938165203455788860 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 2), (11, 1), (12, 1), (15, 3)],
  term ((3442335323210318632627790119697921269817452404306872202631620 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (11, 1), (12, 2), (15, 1)],
  term ((1255169997419052 : Rat) / 3100914216589) [(0, 1), (8, 2), (11, 1), (13, 1)],
  term ((-1398895448515136 : Rat) / 3100914216589) [(0, 1), (8, 2), (11, 1), (13, 1), (14, 1)],
  term ((33797807415261113371425295145288925148233102813466732504780580 : Rat) / 89221829257929386589734652939729697135092479920272471557459) [(0, 1), (8, 2), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((1339827265505612652373293498614552593819144251442093273343419790 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 2), (11, 1), (13, 1), (15, 2)],
  term ((-2722369729811640239885237930179582179092264649802285508361361060 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 2), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-108457540100994477364542617746100821498607589271506843301835160 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (8, 2), (11, 1), (13, 2), (15, 1)],
  term ((22291598616084093470109378116949200596474124471169549609652303812 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 2), (11, 1), (14, 1), (15, 1)],
  term ((-15528270413886647218554561703847867698004150755772168507589455215 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 2), (11, 1), (14, 1), (15, 3)],
  term ((-2441258872364599705030843164199849679345213968923363801379300 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (11, 1), (14, 2), (15, 1)],
  term ((-59414501688200955148881706455384010467700459881527238130533272423 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 2), (11, 1), (15, 1)],
  term ((12135630042240587625094109059107469148621570017915561610258448005 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 2), (11, 1), (15, 3)],
  term ((-505452643729748 : Rat) / 3100914216589) [(0, 1), (8, 2), (11, 2)],
  term ((298612770288404 : Rat) / 3100914216589) [(0, 1), (8, 2), (11, 2), (12, 1)],
  term ((-239837987023040893958026122418047742170960836689636785097249040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((155894841805130447642437051641188593188525051413404470399539850 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 2), (11, 2), (12, 1), (15, 2)],
  term ((-257939289701290940787428527194039768021559661324663158363702120 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((541569199000411528739406589155529468863162191977984802014806630 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 2), (11, 2), (13, 1), (15, 1)],
  term ((1927261808070456 : Rat) / 3100914216589) [(0, 1), (8, 2), (11, 2), (14, 1)],
  term ((3211691557936552283291499051418820159679636861494802849539498685 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 2), (11, 2), (14, 1), (15, 2)],
  term ((-23460453200589382858224278929451674310464926220500230211863864780 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 2), (11, 2), (15, 2)],
  term ((173057381537890337734515578967033449560835775002085363648614320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 2), (11, 3), (12, 1), (15, 1)],
  term ((723698105204174932013767813122214438772729668492827492186757440 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 2), (11, 3), (14, 1), (15, 1)],
  term ((-201415233515501777467113796703433792518113430283742250011232800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 2), (11, 3), (15, 1)],
  term ((3442335323210318632627790119697921269817452404306872202631620 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((4504983568346806902223537308967990247864686995766690193193775109 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 2), (12, 1), (13, 1), (15, 1)],
  term ((3275790655354723722537932906051273523903500676657900235984210845 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 2), (12, 1), (13, 1), (15, 3)],
  term ((-17558220440535853428168593899130336678263515619283374993288800 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (12, 1), (13, 2), (15, 2)],
  term ((3419516309018286783030994102033292379064483866556623381718470 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (12, 1), (14, 1), (15, 2)],
  term ((-16553927379757485193250918563596799955372329223309482132338831489 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 2), (12, 1), (15, 2)],
  term ((333081161520588202658601154328336146643550123978576889675634925 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 2), (12, 1), (15, 4)],
  term ((-3442335323210318632627790119697921269817452404306872202631620 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (12, 2), (15, 2)],
  term ((3757659936289195479008102927253947786928109827100031383625806577 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 2), (13, 1), (14, 1), (15, 1)],
  term ((-672368169784391216617165522790784314727507977724804321382846575 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 2), (13, 1), (14, 1), (15, 3)],
  term ((45817469821508991750769943866949277412127144942018300419120 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (8, 2), (13, 1), (14, 2), (15, 1)],
  term ((3197609791305865376733785606993565370505032020973968311565890269 : Rat) / 3545597910510759101870324903778823616585848984657784304500762) [(0, 1), (8, 2), (13, 1), (15, 1)],
  term ((-387718044410126696308363916713325891549201967310514045952051455 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 2), (13, 1), (15, 3)],
  term ((-2091468399746154 : Rat) / 3100914216589) [(0, 1), (8, 2), (13, 2)],
  term ((-591248021911976 : Rat) / 3100914216589) [(0, 1), (8, 2), (13, 2), (14, 1)],
  term ((18258927759451487110775143296384606153569744642502677108909670135 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 2), (13, 2), (14, 1), (15, 2)],
  term ((31111272665043846793456952662307762061863539808772619216306997130 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 2), (13, 2), (15, 2)],
  term ((17558220440535853428168593899130336678263515619283374993288800 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (13, 3), (14, 1), (15, 1)],
  term ((-589124501623242450550393611089241559599631116173323766222190 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (8, 2), (13, 3), (15, 1)],
  term ((-5577824118149544680680619848531863911581400877416599174767342817 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 2), (14, 1), (15, 2)],
  term ((2987910530995045406797236490381201863675766769522564640612189630 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 2), (14, 1), (15, 4)],
  term ((1770916988710369277245677300553442096342431384899404552190075 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 2), (14, 2), (15, 2)],
  term ((10909710733814973590292897265632432224751243248950787078956371361 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 2), (15, 2)],
  term ((-114615575566079661987532774267138142062813915519644900199521895 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 2), (15, 4)],
  term ((-252726321864874 : Rat) / 3100914216589) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((149306385144202 : Rat) / 3100914216589) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-119918993511520446979013061209023871085480418344818392548624520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((2068107308588304107768147683941478966543873938230683917158834605 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((319408098520387164480427432447604060156002891085124848735834820 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-37731690662824577053099455850053704930802787608500958390655675 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((963630904035228 : Rat) / 3100914216589) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((15814204769505286637505195205196233661871887785754330974212977165 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((16116119010730473920977701484243521143147454086156649066382096710 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((86528690768945168867257789483516724780417887501042681824307160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((361849052602087466006883906561107219386364834246413746093378720 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-100707616757750888733556898351716896259056715141871125005616400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 200 through 299. -/
theorem ep_Q2_041_block_18_0200_0299_valid :
    checkProductSumEq ep_Q2_041_partials_18_0200_0299
      ep_Q2_041_block_18_0200_0299 = true := by
  native_decide

end EpQ2041TermShards

end Patterns

end EndpointCertificate

end Problem97
