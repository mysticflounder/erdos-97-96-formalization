/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_041, term block 18:1200-1299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_041`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2041TermShards

/-- Generator polynomial 18 for endpoint certificate `ep_Q2_041`. -/
def ep_Q2_041_generator_18_1200_1299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 1200 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1200 : Poly :=
[
  term ((43263706185058267732 : Rat) / 259001945121800951) [(1, 1), (9, 1), (10, 2), (14, 1)]
]

/-- Partial product 1200 for generator 18. -/
def ep_Q2_041_partial_18_1200 : Poly :=
[
  term ((86527412370116535464 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (10, 2), (14, 1)],
  term ((-43263706185058267732 : Rat) / 259001945121800951) [(1, 1), (9, 1), (10, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1200 for generator 18. -/
theorem ep_Q2_041_partial_18_1200_valid :
    mulPoly ep_Q2_041_coefficient_18_1200
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1200 := by
  native_decide

/-- Coefficient term 1201 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1201 : Poly :=
[
  term ((3755642168 : Rat) / 151763803) [(1, 1), (9, 1), (10, 2), (14, 1), (16, 1)]
]

/-- Partial product 1201 for generator 18. -/
def ep_Q2_041_partial_18_1201 : Poly :=
[
  term ((7511284336 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((-3755642168 : Rat) / 151763803) [(1, 1), (9, 1), (10, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1201 for generator 18. -/
theorem ep_Q2_041_partial_18_1201_valid :
    mulPoly ep_Q2_041_coefficient_18_1201
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1201 := by
  native_decide

/-- Coefficient term 1202 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1202 : Poly :=
[
  term ((241953625345884902413540484415595865791965738828557803182428926958934955 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (10, 2), (15, 2)]
]

/-- Partial product 1202 for generator 18. -/
def ep_Q2_041_partial_18_1202 : Poly :=
[
  term ((241953625345884902413540484415595865791965738828557803182428926958934955 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (9, 1), (10, 2), (15, 2)],
  term ((-241953625345884902413540484415595865791965738828557803182428926958934955 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (10, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1202 for generator 18. -/
theorem ep_Q2_041_partial_18_1202_valid :
    mulPoly ep_Q2_041_coefficient_18_1202
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1202 := by
  native_decide

/-- Coefficient term 1203 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1203 : Poly :=
[
  term ((35837153657424 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 2), (15, 2), (16, 1)]
]

/-- Partial product 1203 for generator 18. -/
def ep_Q2_041_partial_18_1203 : Poly :=
[
  term ((71674307314848 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((-35837153657424 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1203 for generator 18. -/
theorem ep_Q2_041_partial_18_1203_valid :
    mulPoly ep_Q2_041_coefficient_18_1203
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1203 := by
  native_decide

/-- Coefficient term 1204 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1204 : Poly :=
[
  term ((-2458410876 : Rat) / 151763803) [(1, 1), (9, 1), (10, 2), (16, 1)]
]

/-- Partial product 1204 for generator 18. -/
def ep_Q2_041_partial_18_1204 : Poly :=
[
  term ((-4916821752 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((2458410876 : Rat) / 151763803) [(1, 1), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1204 for generator 18. -/
theorem ep_Q2_041_partial_18_1204_valid :
    mulPoly ep_Q2_041_coefficient_18_1204
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1204 := by
  native_decide

/-- Coefficient term 1205 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1205 : Poly :=
[
  term ((-20523552906833829576 : Rat) / 259001945121800951) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1205 for generator 18. -/
def ep_Q2_041_partial_18_1205 : Poly :=
[
  term ((-41047105813667659152 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((20523552906833829576 : Rat) / 259001945121800951) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1205 for generator 18. -/
theorem ep_Q2_041_partial_18_1205_valid :
    mulPoly ep_Q2_041_coefficient_18_1205
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1205 := by
  native_decide

/-- Coefficient term 1206 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1206 : Poly :=
[
  term ((20523552906833829576 : Rat) / 259001945121800951) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1206 for generator 18. -/
def ep_Q2_041_partial_18_1206 : Poly :=
[
  term ((41047105813667659152 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-20523552906833829576 : Rat) / 259001945121800951) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1206 for generator 18. -/
theorem ep_Q2_041_partial_18_1206_valid :
    mulPoly ep_Q2_041_coefficient_18_1206
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1206 := by
  native_decide

/-- Coefficient term 1207 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1207 : Poly :=
[
  term ((-5576471956319409138294664856566985385955282096081573684606947760 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1207 for generator 18. -/
def ep_Q2_041_partial_18_1207 : Poly :=
[
  term ((-11152943912638818276589329713133970771910564192163147369213895520 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((5576471956319409138294664856566985385955282096081573684606947760 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1207 for generator 18. -/
theorem ep_Q2_041_partial_18_1207_valid :
    mulPoly ep_Q2_041_coefficient_18_1207
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1207 := by
  native_decide

/-- Coefficient term 1208 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1208 : Poly :=
[
  term ((1445074560 : Rat) / 151763803) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1208 for generator 18. -/
def ep_Q2_041_partial_18_1208 : Poly :=
[
  term ((2890149120 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1445074560 : Rat) / 151763803) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1208 for generator 18. -/
theorem ep_Q2_041_partial_18_1208_valid :
    mulPoly ep_Q2_041_coefficient_18_1208
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1208 := by
  native_decide

/-- Coefficient term 1209 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1209 : Poly :=
[
  term ((-2167996176984172204190207594398341026797823179435340417608582740 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1209 for generator 18. -/
def ep_Q2_041_partial_18_1209 : Poly :=
[
  term ((-4335992353968344408380415188796682053595646358870680835217165480 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((2167996176984172204190207594398341026797823179435340417608582740 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1209 for generator 18. -/
theorem ep_Q2_041_partial_18_1209_valid :
    mulPoly ep_Q2_041_coefficient_18_1209
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1209 := by
  native_decide

/-- Coefficient term 1210 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1210 : Poly :=
[
  term ((-1445074560 : Rat) / 151763803) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1210 for generator 18. -/
def ep_Q2_041_partial_18_1210 : Poly :=
[
  term ((-2890149120 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1445074560 : Rat) / 151763803) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1210 for generator 18. -/
theorem ep_Q2_041_partial_18_1210_valid :
    mulPoly ep_Q2_041_coefficient_18_1210
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1210 := by
  native_decide

/-- Coefficient term 1211 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1211 : Poly :=
[
  term ((2631071516813791103520712846774108579686458754857612756171200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 1211 for generator 18. -/
def ep_Q2_041_partial_18_1211 : Poly :=
[
  term ((5262143033627582207041425693548217159372917509715225512342400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-2631071516813791103520712846774108579686458754857612756171200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1211 for generator 18. -/
theorem ep_Q2_041_partial_18_1211_valid :
    mulPoly ep_Q2_041_coefficient_18_1211
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1211 := by
  native_decide

/-- Coefficient term 1212 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1212 : Poly :=
[
  term ((-1882999009313464782024427773801402539035751733062379107958480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 1212 for generator 18. -/
def ep_Q2_041_partial_18_1212 : Poly :=
[
  term ((-3765998018626929564048855547602805078071503466124758215916960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((1882999009313464782024427773801402539035751733062379107958480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1212 for generator 18. -/
theorem ep_Q2_041_partial_18_1212_valid :
    mulPoly ep_Q2_041_coefficient_18_1212
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1212 := by
  native_decide

/-- Coefficient term 1213 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1213 : Poly :=
[
  term ((190910644121107922237314101899633597222199305663615694726440234704057875 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1213 for generator 18. -/
def ep_Q2_041_partial_18_1213 : Poly :=
[
  term ((190910644121107922237314101899633597222199305663615694726440234704057875 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-190910644121107922237314101899633597222199305663615694726440234704057875 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1213 for generator 18. -/
theorem ep_Q2_041_partial_18_1213_valid :
    mulPoly ep_Q2_041_coefficient_18_1213
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1213 := by
  native_decide

/-- Coefficient term 1214 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1214 : Poly :=
[
  term ((49301331612624 : Rat) / 275754830051) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1214 for generator 18. -/
def ep_Q2_041_partial_18_1214 : Poly :=
[
  term ((98602663225248 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-49301331612624 : Rat) / 275754830051) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1214 for generator 18. -/
theorem ep_Q2_041_partial_18_1214_valid :
    mulPoly ep_Q2_041_coefficient_18_1214
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1214 := by
  native_decide

/-- Coefficient term 1215 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1215 : Poly :=
[
  term ((1694446317545838398949917222503065764137372221142007873096840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 2), (15, 1)]
]

/-- Partial product 1215 for generator 18. -/
def ep_Q2_041_partial_18_1215 : Poly :=
[
  term ((3388892635091676797899834445006131528274744442284015746193680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1694446317545838398949917222503065764137372221142007873096840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1215 for generator 18. -/
theorem ep_Q2_041_partial_18_1215_valid :
    mulPoly ep_Q2_041_coefficient_18_1215
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1215 := by
  native_decide

/-- Coefficient term 1216 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1216 : Poly :=
[
  term ((3219226903341238060319536625900395256691154812442612490234611112702599125 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1216 for generator 18. -/
def ep_Q2_041_partial_18_1216 : Poly :=
[
  term ((3219226903341238060319536625900395256691154812442612490234611112702599125 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3219226903341238060319536625900395256691154812442612490234611112702599125 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1216 for generator 18. -/
theorem ep_Q2_041_partial_18_1216_valid :
    mulPoly ep_Q2_041_coefficient_18_1216
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1216 := by
  native_decide

/-- Coefficient term 1217 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1217 : Poly :=
[
  term ((-49301331612624 : Rat) / 275754830051) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1217 for generator 18. -/
def ep_Q2_041_partial_18_1217 : Poly :=
[
  term ((-98602663225248 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((49301331612624 : Rat) / 275754830051) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1217 for generator 18. -/
theorem ep_Q2_041_partial_18_1217_valid :
    mulPoly ep_Q2_041_coefficient_18_1217
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1217 := by
  native_decide

/-- Coefficient term 1218 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1218 : Poly :=
[
  term ((-549394448999987218949237397951204412983034420007743084605785680 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 3)]
]

/-- Partial product 1218 for generator 18. -/
def ep_Q2_041_partial_18_1218 : Poly :=
[
  term ((-1098788897999974437898474795902408825966068840015486169211571360 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 3)],
  term ((549394448999987218949237397951204412983034420007743084605785680 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1218 for generator 18. -/
theorem ep_Q2_041_partial_18_1218_valid :
    mulPoly ep_Q2_041_coefficient_18_1218
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1218 := by
  native_decide

/-- Coefficient term 1219 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1219 : Poly :=
[
  term ((-2697429333614315349044998730281144409353644297568214760708640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 2)]
]

/-- Partial product 1219 for generator 18. -/
def ep_Q2_041_partial_18_1219 : Poly :=
[
  term ((-5394858667228630698089997460562288818707288595136429521417280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 2)],
  term ((2697429333614315349044998730281144409353644297568214760708640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1219 for generator 18. -/
theorem ep_Q2_041_partial_18_1219_valid :
    mulPoly ep_Q2_041_coefficient_18_1219
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1219 := by
  native_decide

/-- Coefficient term 1220 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1220 : Poly :=
[
  term ((-1531696890181467267616877701234495989511202672749463909501830 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 1220 for generator 18. -/
def ep_Q2_041_partial_18_1220 : Poly :=
[
  term ((-3063393780362934535233755402468991979022405345498927819003660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((1531696890181467267616877701234495989511202672749463909501830 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1220 for generator 18. -/
theorem ep_Q2_041_partial_18_1220_valid :
    mulPoly ep_Q2_041_coefficient_18_1220
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1220 := by
  native_decide

/-- Coefficient term 1221 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1221 : Poly :=
[
  term ((230319108750220856155872392289534380451963751014279212513944700 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (11, 1), (12, 2), (15, 3)]
]

/-- Partial product 1221 for generator 18. -/
def ep_Q2_041_partial_18_1221 : Poly :=
[
  term ((460638217500441712311744784579068760903927502028558425027889400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 2), (15, 3)],
  term ((-230319108750220856155872392289534380451963751014279212513944700 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (11, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1221 for generator 18. -/
theorem ep_Q2_041_partial_18_1221_valid :
    mulPoly ep_Q2_041_coefficient_18_1221
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1221 := by
  native_decide

/-- Coefficient term 1222 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1222 : Poly :=
[
  term ((36296283381530198602 : Rat) / 259001945121800951) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1222 for generator 18. -/
def ep_Q2_041_partial_18_1222 : Poly :=
[
  term ((72592566763060397204 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-36296283381530198602 : Rat) / 259001945121800951) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1222 for generator 18. -/
theorem ep_Q2_041_partial_18_1222_valid :
    mulPoly ep_Q2_041_coefficient_18_1222
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1222 := by
  native_decide

/-- Coefficient term 1223 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1223 : Poly :=
[
  term ((20125757751765732853938630679720680313357607708241588340368302680 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1223 for generator 18. -/
def ep_Q2_041_partial_18_1223 : Poly :=
[
  term ((40251515503531465707877261359441360626715215416483176680736605360 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-20125757751765732853938630679720680313357607708241588340368302680 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1223 for generator 18. -/
theorem ep_Q2_041_partial_18_1223_valid :
    mulPoly ep_Q2_041_coefficient_18_1223
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1223 := by
  native_decide

/-- Coefficient term 1224 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1224 : Poly :=
[
  term ((2555641120 : Rat) / 151763803) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1224 for generator 18. -/
def ep_Q2_041_partial_18_1224 : Poly :=
[
  term ((5111282240 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2555641120 : Rat) / 151763803) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1224 for generator 18. -/
theorem ep_Q2_041_partial_18_1224_valid :
    mulPoly ep_Q2_041_coefficient_18_1224
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1224 := by
  native_decide

/-- Coefficient term 1225 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1225 : Poly :=
[
  term ((-2437109144132916302886422980986957498006409535601631240706156880 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 2)]
]

/-- Partial product 1225 for generator 18. -/
def ep_Q2_041_partial_18_1225 : Poly :=
[
  term ((-4874218288265832605772845961973914996012819071203262481412313760 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 2)],
  term ((2437109144132916302886422980986957498006409535601631240706156880 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1225 for generator 18. -/
theorem ep_Q2_041_partial_18_1225_valid :
    mulPoly ep_Q2_041_coefficient_18_1225
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1225 := by
  native_decide

/-- Coefficient term 1226 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1226 : Poly :=
[
  term ((6216689561193671507462868696153825778441425492998009515771720 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 1226 for generator 18. -/
def ep_Q2_041_partial_18_1226 : Poly :=
[
  term ((12433379122387343014925737392307651556882850985996019031543440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-6216689561193671507462868696153825778441425492998009515771720 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1226 for generator 18. -/
theorem ep_Q2_041_partial_18_1226_valid :
    mulPoly ep_Q2_041_coefficient_18_1226
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1226 := by
  native_decide

/-- Coefficient term 1227 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1227 : Poly :=
[
  term ((5602353231352808801862689670583915311734492002641676810702560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (11, 1), (13, 2), (14, 2), (15, 1)]
]

/-- Partial product 1227 for generator 18. -/
def ep_Q2_041_partial_18_1227 : Poly :=
[
  term ((11204706462705617603725379341167830623468984005283353621405120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 2), (14, 2), (15, 1)],
  term ((-5602353231352808801862689670583915311734492002641676810702560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (11, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1227 for generator 18. -/
theorem ep_Q2_041_partial_18_1227_valid :
    mulPoly ep_Q2_041_coefficient_18_1227
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1227 := by
  native_decide

/-- Coefficient term 1228 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1228 : Poly :=
[
  term ((-3078345825771661297359169330377159891783599781616369025096728199654156537 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1228 for generator 18. -/
def ep_Q2_041_partial_18_1228 : Poly :=
[
  term ((-3078345825771661297359169330377159891783599781616369025096728199654156537 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((3078345825771661297359169330377159891783599781616369025096728199654156537 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1228 for generator 18. -/
theorem ep_Q2_041_partial_18_1228_valid :
    mulPoly ep_Q2_041_coefficient_18_1228
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1228 := by
  native_decide

/-- Coefficient term 1229 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1229 : Poly :=
[
  term ((103931651809072 : Rat) / 275754830051) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1229 for generator 18. -/
def ep_Q2_041_partial_18_1229 : Poly :=
[
  term ((207863303618144 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-103931651809072 : Rat) / 275754830051) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1229 for generator 18. -/
theorem ep_Q2_041_partial_18_1229_valid :
    mulPoly ep_Q2_041_coefficient_18_1229
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1229 := by
  native_decide

/-- Coefficient term 1230 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1230 : Poly :=
[
  term ((-13649001810197914516293926607130641026338131954434187050396020 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 3)]
]

/-- Partial product 1230 for generator 18. -/
def ep_Q2_041_partial_18_1230 : Poly :=
[
  term ((-27298003620395829032587853214261282052676263908868374100792040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 3)],
  term ((13649001810197914516293926607130641026338131954434187050396020 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1230 for generator 18. -/
theorem ep_Q2_041_partial_18_1230_valid :
    mulPoly ep_Q2_041_coefficient_18_1230
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1230 := by
  native_decide

/-- Coefficient term 1231 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1231 : Poly :=
[
  term ((-2019800291221834075134764535979342424129497786252069279944974214803857615 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 1)]
]

/-- Partial product 1231 for generator 18. -/
def ep_Q2_041_partial_18_1231 : Poly :=
[
  term ((-2019800291221834075134764535979342424129497786252069279944974214803857615 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((2019800291221834075134764535979342424129497786252069279944974214803857615 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1231 for generator 18. -/
theorem ep_Q2_041_partial_18_1231_valid :
    mulPoly ep_Q2_041_coefficient_18_1231
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1231 := by
  native_decide

/-- Coefficient term 1232 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1232 : Poly :=
[
  term ((-7265669363232 : Rat) / 275754830051) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1232 for generator 18. -/
def ep_Q2_041_partial_18_1232 : Poly :=
[
  term ((-14531338726464 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((7265669363232 : Rat) / 275754830051) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1232 for generator 18. -/
theorem ep_Q2_041_partial_18_1232_valid :
    mulPoly ep_Q2_041_coefficient_18_1232
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1232 := by
  native_decide

/-- Coefficient term 1233 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1233 : Poly :=
[
  term ((-503775505403144821955082842897916855474685818713572056437145800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 3)]
]

/-- Partial product 1233 for generator 18. -/
def ep_Q2_041_partial_18_1233 : Poly :=
[
  term ((-1007551010806289643910165685795833710949371637427144112874291600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (9, 1), (11, 1), (14, 2), (15, 3)],
  term ((503775505403144821955082842897916855474685818713572056437145800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1233 for generator 18. -/
theorem ep_Q2_041_partial_18_1233_valid :
    mulPoly ep_Q2_041_coefficient_18_1233
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1233 := by
  native_decide

/-- Coefficient term 1234 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1234 : Poly :=
[
  term ((28012199459789503001272374708189139368292253089819832181060 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (9, 1), (11, 1), (14, 3), (15, 1)]
]

/-- Partial product 1234 for generator 18. -/
def ep_Q2_041_partial_18_1234 : Poly :=
[
  term ((56024398919579006002544749416378278736584506179639664362120 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (9, 1), (11, 1), (14, 3), (15, 1)],
  term ((-28012199459789503001272374708189139368292253089819832181060 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (9, 1), (11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1234 for generator 18. -/
theorem ep_Q2_041_partial_18_1234_valid :
    mulPoly ep_Q2_041_coefficient_18_1234
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1234 := by
  native_decide

/-- Coefficient term 1235 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1235 : Poly :=
[
  term ((589721392773979873880283123219359506498367579225439664284480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1235 for generator 18. -/
def ep_Q2_041_partial_18_1235 : Poly :=
[
  term ((1179442785547959747760566246438719012996735158450879328568960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-589721392773979873880283123219359506498367579225439664284480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1235 for generator 18. -/
theorem ep_Q2_041_partial_18_1235_valid :
    mulPoly ep_Q2_041_coefficient_18_1235
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1235 := by
  native_decide

/-- Coefficient term 1236 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1236 : Poly :=
[
  term ((-589721392773979873880283123219359506498367579225439664284480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1236 for generator 18. -/
def ep_Q2_041_partial_18_1236 : Poly :=
[
  term ((-1179442785547959747760566246438719012996735158450879328568960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((589721392773979873880283123219359506498367579225439664284480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1236 for generator 18. -/
theorem ep_Q2_041_partial_18_1236_valid :
    mulPoly ep_Q2_041_coefficient_18_1236
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1236 := by
  native_decide

/-- Coefficient term 1237 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1237 : Poly :=
[
  term ((-884806632469033803918800235620937109904153730096239143003347300 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 1237 for generator 18. -/
def ep_Q2_041_partial_18_1237 : Poly :=
[
  term ((-1769613264938067607837600471241874219808307460192478286006694600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((884806632469033803918800235620937109904153730096239143003347300 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1237 for generator 18. -/
theorem ep_Q2_041_partial_18_1237_valid :
    mulPoly ep_Q2_041_coefficient_18_1237
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1237 := by
  native_decide

/-- Coefficient term 1238 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1238 : Poly :=
[
  term ((884806632469033803918800235620937109904153730096239143003347300 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (11, 2), (12, 1), (15, 2)]
]

/-- Partial product 1238 for generator 18. -/
def ep_Q2_041_partial_18_1238 : Poly :=
[
  term ((1769613264938067607837600471241874219808307460192478286006694600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (9, 1), (11, 2), (12, 1), (15, 2)],
  term ((-884806632469033803918800235620937109904153730096239143003347300 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1238 for generator 18. -/
theorem ep_Q2_041_partial_18_1238_valid :
    mulPoly ep_Q2_041_coefficient_18_1238
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1238 := by
  native_decide

/-- Coefficient term 1239 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1239 : Poly :=
[
  term ((1042933203887316258436426634582385793899890811407953480354960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1239 for generator 18. -/
def ep_Q2_041_partial_18_1239 : Poly :=
[
  term ((2085866407774632516872853269164771587799781622815906960709920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1042933203887316258436426634582385793899890811407953480354960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1239 for generator 18. -/
theorem ep_Q2_041_partial_18_1239_valid :
    mulPoly ep_Q2_041_coefficient_18_1239
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1239 := by
  native_decide

/-- Coefficient term 1240 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1240 : Poly :=
[
  term ((-2059256760793481507626063571152755836009257306713490441098588580 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (11, 2), (14, 1), (15, 2)]
]

/-- Partial product 1240 for generator 18. -/
def ep_Q2_041_partial_18_1240 : Poly :=
[
  term ((-4118513521586963015252127142305511672018514613426980882197177160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (9, 1), (11, 2), (14, 1), (15, 2)],
  term ((2059256760793481507626063571152755836009257306713490441098588580 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1240 for generator 18. -/
theorem ep_Q2_041_partial_18_1240_valid :
    mulPoly ep_Q2_041_coefficient_18_1240
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1240 := by
  native_decide

/-- Coefficient term 1241 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1241 : Poly :=
[
  term ((130396324635349441390754255125646626119491426161960292454951400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (11, 2), (14, 2), (15, 2)]
]

/-- Partial product 1241 for generator 18. -/
def ep_Q2_041_partial_18_1241 : Poly :=
[
  term ((260792649270698882781508510251293252238982852323920584909902800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (9, 1), (11, 2), (14, 2), (15, 2)],
  term ((-130396324635349441390754255125646626119491426161960292454951400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (11, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1241 for generator 18. -/
theorem ep_Q2_041_partial_18_1241_valid :
    mulPoly ep_Q2_041_coefficient_18_1241
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1241 := by
  native_decide

/-- Coefficient term 1242 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1242 : Poly :=
[
  term ((97269813895697037682 : Rat) / 259001945121800951) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 1242 for generator 18. -/
def ep_Q2_041_partial_18_1242 : Poly :=
[
  term ((194539627791394075364 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (12, 1)],
  term ((-97269813895697037682 : Rat) / 259001945121800951) [(1, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1242 for generator 18. -/
theorem ep_Q2_041_partial_18_1242_valid :
    mulPoly ep_Q2_041_coefficient_18_1242
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1242 := by
  native_decide

/-- Coefficient term 1243 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1243 : Poly :=
[
  term ((226841165763836472702031894972728249997007280298902700083320027875575125 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1243 for generator 18. -/
def ep_Q2_041_partial_18_1243 : Poly :=
[
  term ((226841165763836472702031894972728249997007280298902700083320027875575125 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-226841165763836472702031894972728249997007280298902700083320027875575125 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1243 for generator 18. -/
theorem ep_Q2_041_partial_18_1243_valid :
    mulPoly ep_Q2_041_coefficient_18_1243
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1243 := by
  native_decide

/-- Coefficient term 1244 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1244 : Poly :=
[
  term ((12833356284336 : Rat) / 275754830051) [(1, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1244 for generator 18. -/
def ep_Q2_041_partial_18_1244 : Poly :=
[
  term ((25666712568672 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12833356284336 : Rat) / 275754830051) [(1, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1244 for generator 18. -/
theorem ep_Q2_041_partial_18_1244_valid :
    mulPoly ep_Q2_041_coefficient_18_1244
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1244 := by
  native_decide

/-- Coefficient term 1245 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1245 : Poly :=
[
  term ((-409894808766229435061457795689186989756959109116713910360 : Rat) / 45151897594564336676646268799872954391995631824590381587) [(1, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 1245 for generator 18. -/
def ep_Q2_041_partial_18_1245 : Poly :=
[
  term ((-819789617532458870122915591378373979513918218233427820720 : Rat) / 45151897594564336676646268799872954391995631824590381587) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((409894808766229435061457795689186989756959109116713910360 : Rat) / 45151897594564336676646268799872954391995631824590381587) [(1, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1245 for generator 18. -/
theorem ep_Q2_041_partial_18_1245_valid :
    mulPoly ep_Q2_041_coefficient_18_1245
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1245 := by
  native_decide

/-- Coefficient term 1246 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1246 : Poly :=
[
  term ((1014404167833927839178641708275233507352335139686266640904900244607836823 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1246 for generator 18. -/
def ep_Q2_041_partial_18_1246 : Poly :=
[
  term ((1014404167833927839178641708275233507352335139686266640904900244607836823 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1014404167833927839178641708275233507352335139686266640904900244607836823 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1246 for generator 18. -/
theorem ep_Q2_041_partial_18_1246_valid :
    mulPoly ep_Q2_041_coefficient_18_1246
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1246 := by
  native_decide

/-- Coefficient term 1247 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1247 : Poly :=
[
  term ((43146659906272 : Rat) / 275754830051) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1247 for generator 18. -/
def ep_Q2_041_partial_18_1247 : Poly :=
[
  term ((86293319812544 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-43146659906272 : Rat) / 275754830051) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1247 for generator 18. -/
theorem ep_Q2_041_partial_18_1247_valid :
    mulPoly ep_Q2_041_coefficient_18_1247
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1247 := by
  native_decide

/-- Coefficient term 1248 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1248 : Poly :=
[
  term ((-95036327353963842048428831415407096365797310994385602950131280 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 3)]
]

/-- Partial product 1248 for generator 18. -/
def ep_Q2_041_partial_18_1248 : Poly :=
[
  term ((-190072654707927684096857662830814192731594621988771205900262560 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((95036327353963842048428831415407096365797310994385602950131280 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1248 for generator 18. -/
theorem ep_Q2_041_partial_18_1248_valid :
    mulPoly ep_Q2_041_coefficient_18_1248
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1248 := by
  native_decide

/-- Coefficient term 1249 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1249 : Poly :=
[
  term ((-9691677761560419522 : Rat) / 37000277874542993) [(1, 1), (9, 1), (12, 1), (13, 2)]
]

/-- Partial product 1249 for generator 18. -/
def ep_Q2_041_partial_18_1249 : Poly :=
[
  term ((-19383355523120839044 : Rat) / 37000277874542993) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 2)],
  term ((9691677761560419522 : Rat) / 37000277874542993) [(1, 1), (9, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1249 for generator 18. -/
theorem ep_Q2_041_partial_18_1249_valid :
    mulPoly ep_Q2_041_coefficient_18_1249
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1249 := by
  native_decide

/-- Coefficient term 1250 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1250 : Poly :=
[
  term ((93876251259036220468 : Rat) / 259001945121800951) [(1, 1), (9, 1), (12, 1), (13, 2), (14, 1)]
]

/-- Partial product 1250 for generator 18. -/
def ep_Q2_041_partial_18_1250 : Poly :=
[
  term ((187752502518072440936 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 2), (14, 1)],
  term ((-93876251259036220468 : Rat) / 259001945121800951) [(1, 1), (9, 1), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1250 for generator 18. -/
theorem ep_Q2_041_partial_18_1250_valid :
    mulPoly ep_Q2_041_coefficient_18_1250
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1250 := by
  native_decide

/-- Coefficient term 1251 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1251 : Poly :=
[
  term ((-72659421747640907409816939519693738392146671709425595410846740 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 2)]
]

/-- Partial product 1251 for generator 18. -/
def ep_Q2_041_partial_18_1251 : Poly :=
[
  term ((-145318843495281814819633879039387476784293343418851190821693480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 2)],
  term ((72659421747640907409816939519693738392146671709425595410846740 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1251 for generator 18. -/
theorem ep_Q2_041_partial_18_1251_valid :
    mulPoly ep_Q2_041_coefficient_18_1251
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1251 := by
  native_decide

/-- Coefficient term 1252 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1252 : Poly :=
[
  term ((6609878080 : Rat) / 151763803) [(1, 1), (9, 1), (12, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1252 for generator 18. -/
def ep_Q2_041_partial_18_1252 : Poly :=
[
  term ((13219756160 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-6609878080 : Rat) / 151763803) [(1, 1), (9, 1), (12, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1252 for generator 18. -/
theorem ep_Q2_041_partial_18_1252_valid :
    mulPoly ep_Q2_041_coefficient_18_1252
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1252 := by
  native_decide

/-- Coefficient term 1253 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1253 : Poly :=
[
  term ((-359779819951265100686714857769779135488377028833688510215698760 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (12, 1), (13, 2), (15, 2)]
]

/-- Partial product 1253 for generator 18. -/
def ep_Q2_041_partial_18_1253 : Poly :=
[
  term ((-719559639902530201373429715539558270976754057667377020431397520 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 2), (15, 2)],
  term ((359779819951265100686714857769779135488377028833688510215698760 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1253 for generator 18. -/
theorem ep_Q2_041_partial_18_1253_valid :
    mulPoly ep_Q2_041_coefficient_18_1253
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1253 := by
  native_decide

/-- Coefficient term 1254 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1254 : Poly :=
[
  term ((-4776774240 : Rat) / 151763803) [(1, 1), (9, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1254 for generator 18. -/
def ep_Q2_041_partial_18_1254 : Poly :=
[
  term ((-9553548480 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((4776774240 : Rat) / 151763803) [(1, 1), (9, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1254 for generator 18. -/
theorem ep_Q2_041_partial_18_1254_valid :
    mulPoly ep_Q2_041_coefficient_18_1254
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1254 := by
  native_decide

/-- Coefficient term 1255 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1255 : Poly :=
[
  term ((-303525569439434974898122467152552776440644982398494354087920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (12, 1), (13, 3), (14, 1), (15, 1)]
]

/-- Partial product 1255 for generator 18. -/
def ep_Q2_041_partial_18_1255 : Poly :=
[
  term ((-607051138878869949796244934305105552881289964796988708175840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 3), (14, 1), (15, 1)],
  term ((303525569439434974898122467152552776440644982398494354087920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (12, 1), (13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1255 for generator 18. -/
theorem ep_Q2_041_partial_18_1255_valid :
    mulPoly ep_Q2_041_coefficient_18_1255
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1255 := by
  native_decide

/-- Coefficient term 1256 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1256 : Poly :=
[
  term ((31335635711358671497579444989433586231726506280006502142680 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (9, 1), (12, 1), (13, 3), (15, 1)]
]

/-- Partial product 1256 for generator 18. -/
def ep_Q2_041_partial_18_1256 : Poly :=
[
  term ((62671271422717342995158889978867172463453012560013004285360 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 3), (15, 1)],
  term ((-31335635711358671497579444989433586231726506280006502142680 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (9, 1), (12, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1256 for generator 18. -/
theorem ep_Q2_041_partial_18_1256_valid :
    mulPoly ep_Q2_041_coefficient_18_1256
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1256 := by
  native_decide

/-- Coefficient term 1257 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1257 : Poly :=
[
  term ((-3608945759067816087 : Rat) / 259001945121800951) [(1, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 1257 for generator 18. -/
def ep_Q2_041_partial_18_1257 : Poly :=
[
  term ((-7217891518135632174 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((3608945759067816087 : Rat) / 259001945121800951) [(1, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1257 for generator 18. -/
theorem ep_Q2_041_partial_18_1257_valid :
    mulPoly ep_Q2_041_coefficient_18_1257
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1257 := by
  native_decide

/-- Coefficient term 1258 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1258 : Poly :=
[
  term ((519656902 : Rat) / 151763803) [(1, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1258 for generator 18. -/
def ep_Q2_041_partial_18_1258 : Poly :=
[
  term ((1039313804 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-519656902 : Rat) / 151763803) [(1, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1258 for generator 18. -/
theorem ep_Q2_041_partial_18_1258_valid :
    mulPoly ep_Q2_041_coefficient_18_1258
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1258 := by
  native_decide

/-- Coefficient term 1259 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1259 : Poly :=
[
  term ((59783863086999726370 : Rat) / 259001945121800951) [(1, 1), (9, 1), (12, 1), (14, 2)]
]

/-- Partial product 1259 for generator 18. -/
def ep_Q2_041_partial_18_1259 : Poly :=
[
  term ((119567726173999452740 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 2)],
  term ((-59783863086999726370 : Rat) / 259001945121800951) [(1, 1), (9, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1259 for generator 18. -/
theorem ep_Q2_041_partial_18_1259_valid :
    mulPoly ep_Q2_041_coefficient_18_1259
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1259 := by
  native_decide

/-- Coefficient term 1260 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1260 : Poly :=
[
  term ((4235090036 : Rat) / 151763803) [(1, 1), (9, 1), (12, 1), (14, 2), (16, 1)]
]

/-- Partial product 1260 for generator 18. -/
def ep_Q2_041_partial_18_1260 : Poly :=
[
  term ((8470180072 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-4235090036 : Rat) / 151763803) [(1, 1), (9, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1260 for generator 18. -/
theorem ep_Q2_041_partial_18_1260_valid :
    mulPoly ep_Q2_041_coefficient_18_1260
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1260 := by
  native_decide

/-- Coefficient term 1261 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1261 : Poly :=
[
  term ((5466028268387053902875432211208942526066911847036463030005071367706344 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 1261 for generator 18. -/
def ep_Q2_041_partial_18_1261 : Poly :=
[
  term ((10932056536774107805750864422417885052133823694072926060010142735412688 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((-5466028268387053902875432211208942526066911847036463030005071367706344 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1261 for generator 18. -/
theorem ep_Q2_041_partial_18_1261_valid :
    mulPoly ep_Q2_041_coefficient_18_1261
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1261 := by
  native_decide

/-- Coefficient term 1262 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1262 : Poly :=
[
  term ((29119789614936 : Rat) / 275754830051) [(1, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1262 for generator 18. -/
def ep_Q2_041_partial_18_1262 : Poly :=
[
  term ((58239579229872 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-29119789614936 : Rat) / 275754830051) [(1, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1262 for generator 18. -/
theorem ep_Q2_041_partial_18_1262_valid :
    mulPoly ep_Q2_041_coefficient_18_1262
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1262 := by
  native_decide

/-- Coefficient term 1263 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1263 : Poly :=
[
  term ((5176990454 : Rat) / 151763803) [(1, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 1263 for generator 18. -/
def ep_Q2_041_partial_18_1263 : Poly :=
[
  term ((10353980908 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-5176990454 : Rat) / 151763803) [(1, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1263 for generator 18. -/
theorem ep_Q2_041_partial_18_1263_valid :
    mulPoly ep_Q2_041_coefficient_18_1263
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1263 := by
  native_decide

/-- Coefficient term 1264 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1264 : Poly :=
[
  term ((-40185124441471888453 : Rat) / 259001945121800951) [(1, 1), (9, 1), (12, 2)]
]

/-- Partial product 1264 for generator 18. -/
def ep_Q2_041_partial_18_1264 : Poly :=
[
  term ((-80370248882943776906 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (12, 2)],
  term ((40185124441471888453 : Rat) / 259001945121800951) [(1, 1), (9, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1264 for generator 18. -/
theorem ep_Q2_041_partial_18_1264_valid :
    mulPoly ep_Q2_041_coefficient_18_1264
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1264 := by
  native_decide

/-- Coefficient term 1265 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1265 : Poly :=
[
  term ((-173107223947691935100018013100093311046070998327571320800307168602278 : Rat) / 486522082104852146217635551756856548751611499001224231107364970631) [(1, 1), (9, 1), (12, 2), (13, 1), (15, 1)]
]

/-- Partial product 1265 for generator 18. -/
def ep_Q2_041_partial_18_1265 : Poly :=
[
  term ((-346214447895383870200036026200186622092141996655142641600614337204556 : Rat) / 486522082104852146217635551756856548751611499001224231107364970631) [(1, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((173107223947691935100018013100093311046070998327571320800307168602278 : Rat) / 486522082104852146217635551756856548751611499001224231107364970631) [(1, 1), (9, 1), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1265 for generator 18. -/
theorem ep_Q2_041_partial_18_1265_valid :
    mulPoly ep_Q2_041_coefficient_18_1265
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1265 := by
  native_decide

/-- Coefficient term 1266 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1266 : Poly :=
[
  term ((-6609878080 : Rat) / 151763803) [(1, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1266 for generator 18. -/
def ep_Q2_041_partial_18_1266 : Poly :=
[
  term ((-13219756160 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((6609878080 : Rat) / 151763803) [(1, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1266 for generator 18. -/
theorem ep_Q2_041_partial_18_1266_valid :
    mulPoly ep_Q2_041_coefficient_18_1266
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1266 := by
  native_decide

/-- Coefficient term 1267 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1267 : Poly :=
[
  term ((72659421747640907409816939519693738392146671709425595410846740 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (12, 2), (13, 1), (15, 3)]
]

/-- Partial product 1267 for generator 18. -/
def ep_Q2_041_partial_18_1267 : Poly :=
[
  term ((145318843495281814819633879039387476784293343418851190821693480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 3)],
  term ((-72659421747640907409816939519693738392146671709425595410846740 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (12, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1267 for generator 18. -/
theorem ep_Q2_041_partial_18_1267_valid :
    mulPoly ep_Q2_041_coefficient_18_1267
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1267 := by
  native_decide

/-- Coefficient term 1268 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1268 : Poly :=
[
  term ((303525569439434974898122467152552776440644982398494354087920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (12, 2), (13, 2), (15, 2)]
]

/-- Partial product 1268 for generator 18. -/
def ep_Q2_041_partial_18_1268 : Poly :=
[
  term ((607051138878869949796244934305105552881289964796988708175840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (12, 2), (13, 2), (15, 2)],
  term ((-303525569439434974898122467152552776440644982398494354087920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (12, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1268 for generator 18. -/
theorem ep_Q2_041_partial_18_1268_valid :
    mulPoly ep_Q2_041_coefficient_18_1268
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1268 := by
  native_decide

/-- Coefficient term 1269 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1269 : Poly :=
[
  term ((-14997105462506511390078102866122788255007952787771030870137641064432675 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 1), (9, 1), (12, 2), (15, 2)]
]

/-- Partial product 1269 for generator 18. -/
def ep_Q2_041_partial_18_1269 : Poly :=
[
  term ((-14997105462506511390078102866122788255007952787771030870137641064432675 : Rat) / 1768021246369032699354887595084416698163356187370448855844164303273054) [(1, 1), (8, 1), (9, 1), (12, 2), (15, 2)],
  term ((14997105462506511390078102866122788255007952787771030870137641064432675 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 1), (9, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1269 for generator 18. -/
theorem ep_Q2_041_partial_18_1269_valid :
    mulPoly ep_Q2_041_coefficient_18_1269
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1269 := by
  native_decide

/-- Coefficient term 1270 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1270 : Poly :=
[
  term ((-12833356284336 : Rat) / 275754830051) [(1, 1), (9, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 1270 for generator 18. -/
def ep_Q2_041_partial_18_1270 : Poly :=
[
  term ((-25666712568672 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((12833356284336 : Rat) / 275754830051) [(1, 1), (9, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1270 for generator 18. -/
theorem ep_Q2_041_partial_18_1270_valid :
    mulPoly ep_Q2_041_coefficient_18_1270
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1270 := by
  native_decide

/-- Coefficient term 1271 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1271 : Poly :=
[
  term ((-1957066672 : Rat) / 151763803) [(1, 1), (9, 1), (12, 2), (16, 1)]
]

/-- Partial product 1271 for generator 18. -/
def ep_Q2_041_partial_18_1271 : Poly :=
[
  term ((-3914133344 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((1957066672 : Rat) / 151763803) [(1, 1), (9, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1271 for generator 18. -/
theorem ep_Q2_041_partial_18_1271_valid :
    mulPoly ep_Q2_041_coefficient_18_1271
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1271 := by
  native_decide

/-- Coefficient term 1272 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1272 : Poly :=
[
  term ((-5970840854104795604331327193889287424866938713463808260514974277281160875 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1272 for generator 18. -/
def ep_Q2_041_partial_18_1272 : Poly :=
[
  term ((-5970840854104795604331327193889287424866938713463808260514974277281160875 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((5970840854104795604331327193889287424866938713463808260514974277281160875 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1272 for generator 18. -/
theorem ep_Q2_041_partial_18_1272_valid :
    mulPoly ep_Q2_041_coefficient_18_1272
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1272 := by
  native_decide

/-- Coefficient term 1273 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1273 : Poly :=
[
  term ((-62904082064596 : Rat) / 275754830051) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1273 for generator 18. -/
def ep_Q2_041_partial_18_1273 : Poly :=
[
  term ((-125808164129192 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((62904082064596 : Rat) / 275754830051) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1273 for generator 18. -/
theorem ep_Q2_041_partial_18_1273_valid :
    mulPoly ep_Q2_041_coefficient_18_1273
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1273 := by
  native_decide

/-- Coefficient term 1274 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1274 : Poly :=
[
  term ((46421044525350675928152687865425849734235864744837292884015380 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 3)]
]

/-- Partial product 1274 for generator 18. -/
def ep_Q2_041_partial_18_1274 : Poly :=
[
  term ((92842089050701351856305375730851699468471729489674585768030760 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 3)],
  term ((-46421044525350675928152687865425849734235864744837292884015380 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1274 for generator 18. -/
theorem ep_Q2_041_partial_18_1274_valid :
    mulPoly ep_Q2_041_coefficient_18_1274
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1274 := by
  native_decide

/-- Coefficient term 1275 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1275 : Poly :=
[
  term ((-798286137745401246718391921351561900770160761800219053132232443692704243 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 1275 for generator 18. -/
def ep_Q2_041_partial_18_1275 : Poly :=
[
  term ((-798286137745401246718391921351561900770160761800219053132232443692704243 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((798286137745401246718391921351561900770160761800219053132232443692704243 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1275 for generator 18. -/
theorem ep_Q2_041_partial_18_1275_valid :
    mulPoly ep_Q2_041_coefficient_18_1275
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1275 := by
  native_decide

/-- Coefficient term 1276 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1276 : Poly :=
[
  term ((-184729282208 : Rat) / 275754830051) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1276 for generator 18. -/
def ep_Q2_041_partial_18_1276 : Poly :=
[
  term ((-369458564416 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((184729282208 : Rat) / 275754830051) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1276 for generator 18. -/
theorem ep_Q2_041_partial_18_1276_valid :
    mulPoly ep_Q2_041_coefficient_18_1276
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1276 := by
  native_decide

/-- Coefficient term 1277 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1277 : Poly :=
[
  term ((-158927485920913412787977288733769595263024524986344152542318360 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 3)]
]

/-- Partial product 1277 for generator 18. -/
def ep_Q2_041_partial_18_1277 : Poly :=
[
  term ((-317854971841826825575954577467539190526049049972688305084636720 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (13, 1), (14, 2), (15, 3)],
  term ((158927485920913412787977288733769595263024524986344152542318360 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1277 for generator 18. -/
theorem ep_Q2_041_partial_18_1277_valid :
    mulPoly ep_Q2_041_coefficient_18_1277
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1277 := by
  native_decide

/-- Coefficient term 1278 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1278 : Poly :=
[
  term ((-114596712075453142539177216159853914012998238244611614549900 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (13, 1), (14, 3), (15, 1)]
]

/-- Partial product 1278 for generator 18. -/
def ep_Q2_041_partial_18_1278 : Poly :=
[
  term ((-229193424150906285078354432319707828025996476489223229099800 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (13, 1), (14, 3), (15, 1)],
  term ((114596712075453142539177216159853914012998238244611614549900 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1278 for generator 18. -/
theorem ep_Q2_041_partial_18_1278_valid :
    mulPoly ep_Q2_041_coefficient_18_1278
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1278 := by
  native_decide

/-- Coefficient term 1279 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1279 : Poly :=
[
  term ((220438160851178169520 : Rat) / 259001945121800951) [(1, 1), (9, 1), (13, 2), (14, 1)]
]

/-- Partial product 1279 for generator 18. -/
def ep_Q2_041_partial_18_1279 : Poly :=
[
  term ((440876321702356339040 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (13, 2), (14, 1)],
  term ((-220438160851178169520 : Rat) / 259001945121800951) [(1, 1), (9, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1279 for generator 18. -/
theorem ep_Q2_041_partial_18_1279_valid :
    mulPoly ep_Q2_041_coefficient_18_1279
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1279 := by
  native_decide

/-- Coefficient term 1280 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1280 : Poly :=
[
  term ((560686573779848879726227866814919021074709041114862191297149060 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (13, 2), (14, 1), (15, 2)]
]

/-- Partial product 1280 for generator 18. -/
def ep_Q2_041_partial_18_1280 : Poly :=
[
  term ((1121373147559697759452455733629838042149418082229724382594298120 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (13, 2), (14, 1), (15, 2)],
  term ((-560686573779848879726227866814919021074709041114862191297149060 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1280 for generator 18. -/
theorem ep_Q2_041_partial_18_1280_valid :
    mulPoly ep_Q2_041_coefficient_18_1280
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1280 := by
  native_decide

/-- Coefficient term 1281 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1281 : Poly :=
[
  term ((15521171200 : Rat) / 151763803) [(1, 1), (9, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1281 for generator 18. -/
def ep_Q2_041_partial_18_1281 : Poly :=
[
  term ((31042342400 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-15521171200 : Rat) / 151763803) [(1, 1), (9, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1281 for generator 18. -/
theorem ep_Q2_041_partial_18_1281_valid :
    mulPoly ep_Q2_041_coefficient_18_1281
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1281 := by
  native_decide

/-- Coefficient term 1282 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1282 : Poly :=
[
  term ((194973752614921380972 : Rat) / 259001945121800951) [(1, 1), (9, 1), (13, 2), (14, 2)]
]

/-- Partial product 1282 for generator 18. -/
def ep_Q2_041_partial_18_1282 : Poly :=
[
  term ((389947505229842761944 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (13, 2), (14, 2)],
  term ((-194973752614921380972 : Rat) / 259001945121800951) [(1, 1), (9, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1282 for generator 18. -/
theorem ep_Q2_041_partial_18_1282_valid :
    mulPoly ep_Q2_041_coefficient_18_1282
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1282 := by
  native_decide

/-- Coefficient term 1283 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1283 : Poly :=
[
  term ((18046735559728110370260720253780410121758639591460308156813800 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (9, 1), (13, 2), (14, 2), (15, 2)]
]

/-- Partial product 1283 for generator 18. -/
def ep_Q2_041_partial_18_1283 : Poly :=
[
  term ((36093471119456220740521440507560820243517279182920616313627600 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 1), (9, 1), (13, 2), (14, 2), (15, 2)],
  term ((-18046735559728110370260720253780410121758639591460308156813800 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (9, 1), (13, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1283 for generator 18. -/
theorem ep_Q2_041_partial_18_1283_valid :
    mulPoly ep_Q2_041_coefficient_18_1283
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1283 := by
  native_decide

/-- Coefficient term 1284 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1284 : Poly :=
[
  term ((13728208320 : Rat) / 151763803) [(1, 1), (9, 1), (13, 2), (14, 2), (16, 1)]
]

/-- Partial product 1284 for generator 18. -/
def ep_Q2_041_partial_18_1284 : Poly :=
[
  term ((27456416640 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (13, 2), (14, 2), (16, 1)],
  term ((-13728208320 : Rat) / 151763803) [(1, 1), (9, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1284 for generator 18. -/
theorem ep_Q2_041_partial_18_1284_valid :
    mulPoly ep_Q2_041_coefficient_18_1284
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1284 := by
  native_decide

/-- Coefficient term 1285 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1285 : Poly :=
[
  term ((-712732106376001155631218748779273726054955829113873382068800 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (13, 3), (14, 1), (15, 1)]
]

/-- Partial product 1285 for generator 18. -/
def ep_Q2_041_partial_18_1285 : Poly :=
[
  term ((-1425464212752002311262437497558547452109911658227746764137600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (13, 3), (14, 1), (15, 1)],
  term ((712732106376001155631218748779273726054955829113873382068800 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1285 for generator 18. -/
theorem ep_Q2_041_partial_18_1285_valid :
    mulPoly ep_Q2_041_coefficient_18_1285
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1285 := by
  native_decide

/-- Coefficient term 1286 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1286 : Poly :=
[
  term ((-630399259604980332480715893316840381838262655750719043105680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (13, 3), (14, 2), (15, 1)]
]

/-- Partial product 1286 for generator 18. -/
def ep_Q2_041_partial_18_1286 : Poly :=
[
  term ((-1260798519209960664961431786633680763676525311501438086211360 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (13, 3), (14, 2), (15, 1)],
  term ((630399259604980332480715893316840381838262655750719043105680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (13, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1286 for generator 18. -/
theorem ep_Q2_041_partial_18_1286_valid :
    mulPoly ep_Q2_041_coefficient_18_1286
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1286 := by
  native_decide

/-- Coefficient term 1287 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1287 : Poly :=
[
  term ((387290158069589283455 : Rat) / 1554011670730805706) [(1, 1), (9, 1), (14, 1)]
]

/-- Partial product 1287 for generator 18. -/
def ep_Q2_041_partial_18_1287 : Poly :=
[
  term ((387290158069589283455 : Rat) / 777005835365402853) [(1, 1), (8, 1), (9, 1), (14, 1)],
  term ((-387290158069589283455 : Rat) / 1554011670730805706) [(1, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1287 for generator 18. -/
theorem ep_Q2_041_partial_18_1287_valid :
    mulPoly ep_Q2_041_coefficient_18_1287
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1287 := by
  native_decide

/-- Coefficient term 1288 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1288 : Poly :=
[
  term ((1613176194980541548812486443689241334931813221102754244091262491188225569 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (14, 1), (15, 2)]
]

/-- Partial product 1288 for generator 18. -/
def ep_Q2_041_partial_18_1288 : Poly :=
[
  term ((1613176194980541548812486443689241334931813221102754244091262491188225569 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (9, 1), (14, 1), (15, 2)],
  term ((-1613176194980541548812486443689241334931813221102754244091262491188225569 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1288 for generator 18. -/
theorem ep_Q2_041_partial_18_1288_valid :
    mulPoly ep_Q2_041_coefficient_18_1288
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1288 := by
  native_decide

/-- Coefficient term 1289 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1289 : Poly :=
[
  term ((4305278510468 : Rat) / 275754830051) [(1, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1289 for generator 18. -/
def ep_Q2_041_partial_18_1289 : Poly :=
[
  term ((8610557020936 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4305278510468 : Rat) / 275754830051) [(1, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1289 for generator 18. -/
theorem ep_Q2_041_partial_18_1289_valid :
    mulPoly ep_Q2_041_coefficient_18_1289
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1289 := by
  native_decide

/-- Coefficient term 1290 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1290 : Poly :=
[
  term ((6953879391 : Rat) / 151763803) [(1, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 1290 for generator 18. -/
def ep_Q2_041_partial_18_1290 : Poly :=
[
  term ((13907758782 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-6953879391 : Rat) / 151763803) [(1, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1290 for generator 18. -/
theorem ep_Q2_041_partial_18_1290_valid :
    mulPoly ep_Q2_041_coefficient_18_1290
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1290 := by
  native_decide

/-- Coefficient term 1291 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1291 : Poly :=
[
  term ((-1020653184882203832451 : Rat) / 1554011670730805706) [(1, 1), (9, 1), (14, 2)]
]

/-- Partial product 1291 for generator 18. -/
def ep_Q2_041_partial_18_1291 : Poly :=
[
  term ((-1020653184882203832451 : Rat) / 777005835365402853) [(1, 1), (8, 1), (9, 1), (14, 2)],
  term ((1020653184882203832451 : Rat) / 1554011670730805706) [(1, 1), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1291 for generator 18. -/
theorem ep_Q2_041_partial_18_1291_valid :
    mulPoly ep_Q2_041_coefficient_18_1291
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1291 := by
  native_decide

/-- Coefficient term 1292 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1292 : Poly :=
[
  term ((8124426726235107295747457781070385711781354334216594642247301184637905 : Rat) / 1768021246369032699354887595084416698163356187370448855844164303273054) [(1, 1), (9, 1), (14, 2), (15, 2)]
]

/-- Partial product 1292 for generator 18. -/
def ep_Q2_041_partial_18_1292 : Poly :=
[
  term ((8124426726235107295747457781070385711781354334216594642247301184637905 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (8, 1), (9, 1), (14, 2), (15, 2)],
  term ((-8124426726235107295747457781070385711781354334216594642247301184637905 : Rat) / 1768021246369032699354887595084416698163356187370448855844164303273054) [(1, 1), (9, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1292 for generator 18. -/
theorem ep_Q2_041_partial_18_1292_valid :
    mulPoly ep_Q2_041_coefficient_18_1292
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1292 := by
  native_decide

/-- Coefficient term 1293 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1293 : Poly :=
[
  term ((28070317670304 : Rat) / 275754830051) [(1, 1), (9, 1), (14, 2), (15, 2), (16, 1)]
]

/-- Partial product 1293 for generator 18. -/
def ep_Q2_041_partial_18_1293 : Poly :=
[
  term ((56140635340608 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-28070317670304 : Rat) / 275754830051) [(1, 1), (9, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1293 for generator 18. -/
theorem ep_Q2_041_partial_18_1293_valid :
    mulPoly ep_Q2_041_coefficient_18_1293
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1293 := by
  native_decide

/-- Coefficient term 1294 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1294 : Poly :=
[
  term ((-12088160975 : Rat) / 151763803) [(1, 1), (9, 1), (14, 2), (16, 1)]
]

/-- Partial product 1294 for generator 18. -/
def ep_Q2_041_partial_18_1294 : Poly :=
[
  term ((-24176321950 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((12088160975 : Rat) / 151763803) [(1, 1), (9, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1294 for generator 18. -/
theorem ep_Q2_041_partial_18_1294_valid :
    mulPoly ep_Q2_041_coefficient_18_1294
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1294 := by
  native_decide

/-- Coefficient term 1295 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1295 : Poly :=
[
  term ((-15315890480686479743 : Rat) / 777005835365402853) [(1, 1), (9, 1), (14, 3)]
]

/-- Partial product 1295 for generator 18. -/
def ep_Q2_041_partial_18_1295 : Poly :=
[
  term ((-30631780961372959486 : Rat) / 777005835365402853) [(1, 1), (8, 1), (9, 1), (14, 3)],
  term ((15315890480686479743 : Rat) / 777005835365402853) [(1, 1), (9, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1295 for generator 18. -/
theorem ep_Q2_041_partial_18_1295_valid :
    mulPoly ep_Q2_041_coefficient_18_1295
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1295 := by
  native_decide

/-- Coefficient term 1296 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1296 : Poly :=
[
  term ((-1558887598 : Rat) / 151763803) [(1, 1), (9, 1), (14, 3), (16, 1)]
]

/-- Partial product 1296 for generator 18. -/
def ep_Q2_041_partial_18_1296 : Poly :=
[
  term ((-3117775196 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (14, 3), (16, 1)],
  term ((1558887598 : Rat) / 151763803) [(1, 1), (9, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1296 for generator 18. -/
theorem ep_Q2_041_partial_18_1296_valid :
    mulPoly ep_Q2_041_coefficient_18_1296
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1296 := by
  native_decide

/-- Coefficient term 1297 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1297 : Poly :=
[
  term ((-45634073661390544847 : Rat) / 518003890243601902) [(1, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 1297 for generator 18. -/
def ep_Q2_041_partial_18_1297 : Poly :=
[
  term ((-45634073661390544847 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((45634073661390544847 : Rat) / 518003890243601902) [(1, 1), (10, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1297 for generator 18. -/
theorem ep_Q2_041_partial_18_1297_valid :
    mulPoly ep_Q2_041_coefficient_18_1297
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1297 := by
  native_decide

/-- Coefficient term 1298 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1298 : Poly :=
[
  term ((1905673759982583110964988981514411738591947084719244841067440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1298 for generator 18. -/
def ep_Q2_041_partial_18_1298 : Poly :=
[
  term ((3811347519965166221929977963028823477183894169438489682134880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1905673759982583110964988981514411738591947084719244841067440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1298 for generator 18. -/
theorem ep_Q2_041_partial_18_1298_valid :
    mulPoly ep_Q2_041_coefficient_18_1298
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1298 := by
  native_decide

/-- Coefficient term 1299 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1299 : Poly :=
[
  term ((-1141733060255338051182429465734315840062392130480778230868140 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1299 for generator 18. -/
def ep_Q2_041_partial_18_1299 : Poly :=
[
  term ((-2283466120510676102364858931468631680124784260961556461736280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((1141733060255338051182429465734315840062392130480778230868140 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1299 for generator 18. -/
theorem ep_Q2_041_partial_18_1299_valid :
    mulPoly ep_Q2_041_coefficient_18_1299
        ep_Q2_041_generator_18_1200_1299 =
      ep_Q2_041_partial_18_1299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_041_partials_18_1200_1299 : List Poly :=
[
  ep_Q2_041_partial_18_1200,
  ep_Q2_041_partial_18_1201,
  ep_Q2_041_partial_18_1202,
  ep_Q2_041_partial_18_1203,
  ep_Q2_041_partial_18_1204,
  ep_Q2_041_partial_18_1205,
  ep_Q2_041_partial_18_1206,
  ep_Q2_041_partial_18_1207,
  ep_Q2_041_partial_18_1208,
  ep_Q2_041_partial_18_1209,
  ep_Q2_041_partial_18_1210,
  ep_Q2_041_partial_18_1211,
  ep_Q2_041_partial_18_1212,
  ep_Q2_041_partial_18_1213,
  ep_Q2_041_partial_18_1214,
  ep_Q2_041_partial_18_1215,
  ep_Q2_041_partial_18_1216,
  ep_Q2_041_partial_18_1217,
  ep_Q2_041_partial_18_1218,
  ep_Q2_041_partial_18_1219,
  ep_Q2_041_partial_18_1220,
  ep_Q2_041_partial_18_1221,
  ep_Q2_041_partial_18_1222,
  ep_Q2_041_partial_18_1223,
  ep_Q2_041_partial_18_1224,
  ep_Q2_041_partial_18_1225,
  ep_Q2_041_partial_18_1226,
  ep_Q2_041_partial_18_1227,
  ep_Q2_041_partial_18_1228,
  ep_Q2_041_partial_18_1229,
  ep_Q2_041_partial_18_1230,
  ep_Q2_041_partial_18_1231,
  ep_Q2_041_partial_18_1232,
  ep_Q2_041_partial_18_1233,
  ep_Q2_041_partial_18_1234,
  ep_Q2_041_partial_18_1235,
  ep_Q2_041_partial_18_1236,
  ep_Q2_041_partial_18_1237,
  ep_Q2_041_partial_18_1238,
  ep_Q2_041_partial_18_1239,
  ep_Q2_041_partial_18_1240,
  ep_Q2_041_partial_18_1241,
  ep_Q2_041_partial_18_1242,
  ep_Q2_041_partial_18_1243,
  ep_Q2_041_partial_18_1244,
  ep_Q2_041_partial_18_1245,
  ep_Q2_041_partial_18_1246,
  ep_Q2_041_partial_18_1247,
  ep_Q2_041_partial_18_1248,
  ep_Q2_041_partial_18_1249,
  ep_Q2_041_partial_18_1250,
  ep_Q2_041_partial_18_1251,
  ep_Q2_041_partial_18_1252,
  ep_Q2_041_partial_18_1253,
  ep_Q2_041_partial_18_1254,
  ep_Q2_041_partial_18_1255,
  ep_Q2_041_partial_18_1256,
  ep_Q2_041_partial_18_1257,
  ep_Q2_041_partial_18_1258,
  ep_Q2_041_partial_18_1259,
  ep_Q2_041_partial_18_1260,
  ep_Q2_041_partial_18_1261,
  ep_Q2_041_partial_18_1262,
  ep_Q2_041_partial_18_1263,
  ep_Q2_041_partial_18_1264,
  ep_Q2_041_partial_18_1265,
  ep_Q2_041_partial_18_1266,
  ep_Q2_041_partial_18_1267,
  ep_Q2_041_partial_18_1268,
  ep_Q2_041_partial_18_1269,
  ep_Q2_041_partial_18_1270,
  ep_Q2_041_partial_18_1271,
  ep_Q2_041_partial_18_1272,
  ep_Q2_041_partial_18_1273,
  ep_Q2_041_partial_18_1274,
  ep_Q2_041_partial_18_1275,
  ep_Q2_041_partial_18_1276,
  ep_Q2_041_partial_18_1277,
  ep_Q2_041_partial_18_1278,
  ep_Q2_041_partial_18_1279,
  ep_Q2_041_partial_18_1280,
  ep_Q2_041_partial_18_1281,
  ep_Q2_041_partial_18_1282,
  ep_Q2_041_partial_18_1283,
  ep_Q2_041_partial_18_1284,
  ep_Q2_041_partial_18_1285,
  ep_Q2_041_partial_18_1286,
  ep_Q2_041_partial_18_1287,
  ep_Q2_041_partial_18_1288,
  ep_Q2_041_partial_18_1289,
  ep_Q2_041_partial_18_1290,
  ep_Q2_041_partial_18_1291,
  ep_Q2_041_partial_18_1292,
  ep_Q2_041_partial_18_1293,
  ep_Q2_041_partial_18_1294,
  ep_Q2_041_partial_18_1295,
  ep_Q2_041_partial_18_1296,
  ep_Q2_041_partial_18_1297,
  ep_Q2_041_partial_18_1298,
  ep_Q2_041_partial_18_1299
]

/-- Sum of partial products in this block. -/
def ep_Q2_041_block_18_1200_1299 : Poly :=
[
  term ((86527412370116535464 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (10, 2), (14, 1)],
  term ((7511284336 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((241953625345884902413540484415595865791965738828557803182428926958934955 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (9, 1), (10, 2), (15, 2)],
  term ((71674307314848 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((-4916821752 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((-41047105813667659152 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((41047105813667659152 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-11152943912638818276589329713133970771910564192163147369213895520 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((2890149120 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4335992353968344408380415188796682053595646358870680835217165480 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2890149120 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((5262143033627582207041425693548217159372917509715225512342400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-3765998018626929564048855547602805078071503466124758215916960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((190910644121107922237314101899633597222199305663615694726440234704057875 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((98602663225248 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3388892635091676797899834445006131528274744442284015746193680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((3219226903341238060319536625900395256691154812442612490234611112702599125 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-98602663225248 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1098788897999974437898474795902408825966068840015486169211571360 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 3)],
  term ((-5394858667228630698089997460562288818707288595136429521417280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 2)],
  term ((-3063393780362934535233755402468991979022405345498927819003660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((460638217500441712311744784579068760903927502028558425027889400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 2), (15, 3)],
  term ((72592566763060397204 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((40251515503531465707877261359441360626715215416483176680736605360 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((5111282240 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4874218288265832605772845961973914996012819071203262481412313760 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 2)],
  term ((12433379122387343014925737392307651556882850985996019031543440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((11204706462705617603725379341167830623468984005283353621405120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 2), (14, 2), (15, 1)],
  term ((-3078345825771661297359169330377159891783599781616369025096728199654156537 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((207863303618144 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-27298003620395829032587853214261282052676263908868374100792040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 3)],
  term ((-2019800291221834075134764535979342424129497786252069279944974214803857615 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((-14531338726464 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1007551010806289643910165685795833710949371637427144112874291600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (9, 1), (11, 1), (14, 2), (15, 3)],
  term ((56024398919579006002544749416378278736584506179639664362120 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (9, 1), (11, 1), (14, 3), (15, 1)],
  term ((1179442785547959747760566246438719012996735158450879328568960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1179442785547959747760566246438719012996735158450879328568960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1769613264938067607837600471241874219808307460192478286006694600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((1769613264938067607837600471241874219808307460192478286006694600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (9, 1), (11, 2), (12, 1), (15, 2)],
  term ((2085866407774632516872853269164771587799781622815906960709920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-4118513521586963015252127142305511672018514613426980882197177160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (9, 1), (11, 2), (14, 1), (15, 2)],
  term ((260792649270698882781508510251293252238982852323920584909902800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (9, 1), (11, 2), (14, 2), (15, 2)],
  term ((194539627791394075364 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (12, 1)],
  term ((226841165763836472702031894972728249997007280298902700083320027875575125 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((25666712568672 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-819789617532458870122915591378373979513918218233427820720 : Rat) / 45151897594564336676646268799872954391995631824590381587) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((1014404167833927839178641708275233507352335139686266640904900244607836823 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((86293319812544 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-190072654707927684096857662830814192731594621988771205900262560 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((-19383355523120839044 : Rat) / 37000277874542993) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 2)],
  term ((187752502518072440936 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 2), (14, 1)],
  term ((-145318843495281814819633879039387476784293343418851190821693480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 2)],
  term ((13219756160 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-719559639902530201373429715539558270976754057667377020431397520 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 2), (15, 2)],
  term ((-9553548480 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((-607051138878869949796244934305105552881289964796988708175840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 3), (14, 1), (15, 1)],
  term ((62671271422717342995158889978867172463453012560013004285360 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 3), (15, 1)],
  term ((-7217891518135632174 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((1039313804 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((119567726173999452740 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 2)],
  term ((8470180072 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((10932056536774107805750864422417885052133823694072926060010142735412688 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((58239579229872 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((10353980908 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-80370248882943776906 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (12, 2)],
  term ((-346214447895383870200036026200186622092141996655142641600614337204556 : Rat) / 486522082104852146217635551756856548751611499001224231107364970631) [(1, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((-13219756160 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((145318843495281814819633879039387476784293343418851190821693480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 3)],
  term ((607051138878869949796244934305105552881289964796988708175840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (12, 2), (13, 2), (15, 2)],
  term ((-14997105462506511390078102866122788255007952787771030870137641064432675 : Rat) / 1768021246369032699354887595084416698163356187370448855844164303273054) [(1, 1), (8, 1), (9, 1), (12, 2), (15, 2)],
  term ((-25666712568672 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-3914133344 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((-5970840854104795604331327193889287424866938713463808260514974277281160875 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-125808164129192 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((92842089050701351856305375730851699468471729489674585768030760 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 3)],
  term ((-798286137745401246718391921351561900770160761800219053132232443692704243 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-369458564416 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-317854971841826825575954577467539190526049049972688305084636720 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (13, 1), (14, 2), (15, 3)],
  term ((-229193424150906285078354432319707828025996476489223229099800 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (13, 1), (14, 3), (15, 1)],
  term ((440876321702356339040 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (13, 2), (14, 1)],
  term ((1121373147559697759452455733629838042149418082229724382594298120 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (13, 2), (14, 1), (15, 2)],
  term ((31042342400 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((389947505229842761944 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (13, 2), (14, 2)],
  term ((36093471119456220740521440507560820243517279182920616313627600 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 1), (9, 1), (13, 2), (14, 2), (15, 2)],
  term ((27456416640 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (13, 2), (14, 2), (16, 1)],
  term ((-1425464212752002311262437497558547452109911658227746764137600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (13, 3), (14, 1), (15, 1)],
  term ((-1260798519209960664961431786633680763676525311501438086211360 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (13, 3), (14, 2), (15, 1)],
  term ((387290158069589283455 : Rat) / 777005835365402853) [(1, 1), (8, 1), (9, 1), (14, 1)],
  term ((1613176194980541548812486443689241334931813221102754244091262491188225569 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (9, 1), (14, 1), (15, 2)],
  term ((8610557020936 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((13907758782 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1020653184882203832451 : Rat) / 777005835365402853) [(1, 1), (8, 1), (9, 1), (14, 2)],
  term ((8124426726235107295747457781070385711781354334216594642247301184637905 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (8, 1), (9, 1), (14, 2), (15, 2)],
  term ((56140635340608 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-24176321950 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((-30631780961372959486 : Rat) / 777005835365402853) [(1, 1), (8, 1), (9, 1), (14, 3)],
  term ((-3117775196 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (14, 3), (16, 1)],
  term ((-45634073661390544847 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((3811347519965166221929977963028823477183894169438489682134880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2283466120510676102364858931468631680124784260961556461736280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-43263706185058267732 : Rat) / 259001945121800951) [(1, 1), (9, 1), (10, 2), (14, 1)],
  term ((-3755642168 : Rat) / 151763803) [(1, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((-241953625345884902413540484415595865791965738828557803182428926958934955 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (10, 2), (15, 2)],
  term ((-35837153657424 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((2458410876 : Rat) / 151763803) [(1, 1), (9, 1), (10, 2), (16, 1)],
  term ((20523552906833829576 : Rat) / 259001945121800951) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-20523552906833829576 : Rat) / 259001945121800951) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((5576471956319409138294664856566985385955282096081573684606947760 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1445074560 : Rat) / 151763803) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2167996176984172204190207594398341026797823179435340417608582740 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((1445074560 : Rat) / 151763803) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2631071516813791103520712846774108579686458754857612756171200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((1882999009313464782024427773801402539035751733062379107958480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-190910644121107922237314101899633597222199305663615694726440234704057875 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-49301331612624 : Rat) / 275754830051) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1694446317545838398949917222503065764137372221142007873096840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-3219226903341238060319536625900395256691154812442612490234611112702599125 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((49301331612624 : Rat) / 275754830051) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((549394448999987218949237397951204412983034420007743084605785680 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 3)],
  term ((2697429333614315349044998730281144409353644297568214760708640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 2)],
  term ((1531696890181467267616877701234495989511202672749463909501830 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((-230319108750220856155872392289534380451963751014279212513944700 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (11, 1), (12, 2), (15, 3)],
  term ((-36296283381530198602 : Rat) / 259001945121800951) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-20125757751765732853938630679720680313357607708241588340368302680 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2555641120 : Rat) / 151763803) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2437109144132916302886422980986957498006409535601631240706156880 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-6216689561193671507462868696153825778441425492998009515771720 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-5602353231352808801862689670583915311734492002641676810702560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (11, 1), (13, 2), (14, 2), (15, 1)],
  term ((3078345825771661297359169330377159891783599781616369025096728199654156537 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-103931651809072 : Rat) / 275754830051) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((13649001810197914516293926607130641026338131954434187050396020 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 3)],
  term ((2019800291221834075134764535979342424129497786252069279944974214803857615 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((7265669363232 : Rat) / 275754830051) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((503775505403144821955082842897916855474685818713572056437145800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 3)],
  term ((-28012199459789503001272374708189139368292253089819832181060 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (9, 1), (11, 1), (14, 3), (15, 1)],
  term ((-589721392773979873880283123219359506498367579225439664284480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((589721392773979873880283123219359506498367579225439664284480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((884806632469033803918800235620937109904153730096239143003347300 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-884806632469033803918800235620937109904153730096239143003347300 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (11, 2), (12, 1), (15, 2)],
  term ((-1042933203887316258436426634582385793899890811407953480354960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((2059256760793481507626063571152755836009257306713490441098588580 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (11, 2), (14, 1), (15, 2)],
  term ((-130396324635349441390754255125646626119491426161960292454951400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (11, 2), (14, 2), (15, 2)],
  term ((-97269813895697037682 : Rat) / 259001945121800951) [(1, 1), (9, 1), (12, 1)],
  term ((-226841165763836472702031894972728249997007280298902700083320027875575125 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-12833356284336 : Rat) / 275754830051) [(1, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((409894808766229435061457795689186989756959109116713910360 : Rat) / 45151897594564336676646268799872954391995631824590381587) [(1, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1014404167833927839178641708275233507352335139686266640904900244607836823 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-43146659906272 : Rat) / 275754830051) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((95036327353963842048428831415407096365797310994385602950131280 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((9691677761560419522 : Rat) / 37000277874542993) [(1, 1), (9, 1), (12, 1), (13, 2)],
  term ((-93876251259036220468 : Rat) / 259001945121800951) [(1, 1), (9, 1), (12, 1), (13, 2), (14, 1)],
  term ((72659421747640907409816939519693738392146671709425595410846740 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 2)],
  term ((-6609878080 : Rat) / 151763803) [(1, 1), (9, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((359779819951265100686714857769779135488377028833688510215698760 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (12, 1), (13, 2), (15, 2)],
  term ((4776774240 : Rat) / 151763803) [(1, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((303525569439434974898122467152552776440644982398494354087920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (12, 1), (13, 3), (14, 1), (15, 1)],
  term ((-31335635711358671497579444989433586231726506280006502142680 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (9, 1), (12, 1), (13, 3), (15, 1)],
  term ((3608945759067816087 : Rat) / 259001945121800951) [(1, 1), (9, 1), (12, 1), (14, 1)],
  term ((-519656902 : Rat) / 151763803) [(1, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-59783863086999726370 : Rat) / 259001945121800951) [(1, 1), (9, 1), (12, 1), (14, 2)],
  term ((-4235090036 : Rat) / 151763803) [(1, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-5466028268387053902875432211208942526066911847036463030005071367706344 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (9, 1), (12, 1), (15, 2)],
  term ((-29119789614936 : Rat) / 275754830051) [(1, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5176990454 : Rat) / 151763803) [(1, 1), (9, 1), (12, 1), (16, 1)],
  term ((40185124441471888453 : Rat) / 259001945121800951) [(1, 1), (9, 1), (12, 2)],
  term ((173107223947691935100018013100093311046070998327571320800307168602278 : Rat) / 486522082104852146217635551756856548751611499001224231107364970631) [(1, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((6609878080 : Rat) / 151763803) [(1, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-72659421747640907409816939519693738392146671709425595410846740 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (12, 2), (13, 1), (15, 3)],
  term ((-303525569439434974898122467152552776440644982398494354087920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (12, 2), (13, 2), (15, 2)],
  term ((14997105462506511390078102866122788255007952787771030870137641064432675 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 1), (9, 1), (12, 2), (15, 2)],
  term ((12833356284336 : Rat) / 275754830051) [(1, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((1957066672 : Rat) / 151763803) [(1, 1), (9, 1), (12, 2), (16, 1)],
  term ((5970840854104795604331327193889287424866938713463808260514974277281160875 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((62904082064596 : Rat) / 275754830051) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-46421044525350675928152687865425849734235864744837292884015380 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 3)],
  term ((798286137745401246718391921351561900770160761800219053132232443692704243 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((184729282208 : Rat) / 275754830051) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((158927485920913412787977288733769595263024524986344152542318360 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 3)],
  term ((114596712075453142539177216159853914012998238244611614549900 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (13, 1), (14, 3), (15, 1)],
  term ((-220438160851178169520 : Rat) / 259001945121800951) [(1, 1), (9, 1), (13, 2), (14, 1)],
  term ((-560686573779848879726227866814919021074709041114862191297149060 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (13, 2), (14, 1), (15, 2)],
  term ((-15521171200 : Rat) / 151763803) [(1, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-194973752614921380972 : Rat) / 259001945121800951) [(1, 1), (9, 1), (13, 2), (14, 2)],
  term ((-18046735559728110370260720253780410121758639591460308156813800 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (9, 1), (13, 2), (14, 2), (15, 2)],
  term ((-13728208320 : Rat) / 151763803) [(1, 1), (9, 1), (13, 2), (14, 2), (16, 1)],
  term ((712732106376001155631218748779273726054955829113873382068800 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (13, 3), (14, 1), (15, 1)],
  term ((630399259604980332480715893316840381838262655750719043105680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (13, 3), (14, 2), (15, 1)],
  term ((-387290158069589283455 : Rat) / 1554011670730805706) [(1, 1), (9, 1), (14, 1)],
  term ((-1613176194980541548812486443689241334931813221102754244091262491188225569 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (14, 1), (15, 2)],
  term ((-4305278510468 : Rat) / 275754830051) [(1, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6953879391 : Rat) / 151763803) [(1, 1), (9, 1), (14, 1), (16, 1)],
  term ((1020653184882203832451 : Rat) / 1554011670730805706) [(1, 1), (9, 1), (14, 2)],
  term ((-8124426726235107295747457781070385711781354334216594642247301184637905 : Rat) / 1768021246369032699354887595084416698163356187370448855844164303273054) [(1, 1), (9, 1), (14, 2), (15, 2)],
  term ((-28070317670304 : Rat) / 275754830051) [(1, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((12088160975 : Rat) / 151763803) [(1, 1), (9, 1), (14, 2), (16, 1)],
  term ((15315890480686479743 : Rat) / 777005835365402853) [(1, 1), (9, 1), (14, 3)],
  term ((1558887598 : Rat) / 151763803) [(1, 1), (9, 1), (14, 3), (16, 1)],
  term ((45634073661390544847 : Rat) / 518003890243601902) [(1, 1), (10, 1), (11, 1), (12, 1)],
  term ((-1905673759982583110964988981514411738591947084719244841067440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1141733060255338051182429465734315840062392130480778230868140 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 1200 through 1299. -/
theorem ep_Q2_041_block_18_1200_1299_valid :
    checkProductSumEq ep_Q2_041_partials_18_1200_1299
      ep_Q2_041_block_18_1200_1299 = true := by
  native_decide

end EpQ2041TermShards

end Patterns

end EndpointCertificate

end Problem97
