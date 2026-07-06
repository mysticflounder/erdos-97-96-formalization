/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_041, term block 18:1600-1699

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_041`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2041TermShards

/-- Generator polynomial 18 for endpoint certificate `ep_Q2_041`. -/
def ep_Q2_041_generator_18_1600_1699 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 1600 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1600 : Poly :=
[
  term ((-145318843495281814819633879039387476784293343418851190821693480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (13, 3), (14, 2), (15, 2)]
]

/-- Partial product 1600 for generator 18. -/
def ep_Q2_041_partial_18_1600 : Poly :=
[
  term ((-290637686990563629639267758078774953568586686837702381643386960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (13, 3), (14, 2), (15, 2)],
  term ((145318843495281814819633879039387476784293343418851190821693480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (13, 3), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1600 for generator 18. -/
theorem ep_Q2_041_partial_18_1600_valid :
    mulPoly ep_Q2_041_coefficient_18_1600
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1600 := by
  native_decide

/-- Coefficient term 1601 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1601 : Poly :=
[
  term ((13219756160 : Rat) / 151763803) [(1, 1), (13, 3), (14, 2), (16, 1)]
]

/-- Partial product 1601 for generator 18. -/
def ep_Q2_041_partial_18_1601 : Poly :=
[
  term ((26439512320 : Rat) / 151763803) [(1, 1), (8, 1), (13, 3), (14, 2), (16, 1)],
  term ((-13219756160 : Rat) / 151763803) [(1, 1), (13, 3), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1601 for generator 18. -/
theorem ep_Q2_041_partial_18_1601_valid :
    mulPoly ep_Q2_041_coefficient_18_1601
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1601 := by
  native_decide

/-- Coefficient term 1602 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1602 : Poly :=
[
  term ((827407028618229600234319662150859747865115885166798222717354180 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (13, 3), (15, 2)]
]

/-- Partial product 1602 for generator 18. -/
def ep_Q2_041_partial_18_1602 : Poly :=
[
  term ((1654814057236459200468639324301719495730231770333596445434708360 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (13, 3), (15, 2)],
  term ((-827407028618229600234319662150859747865115885166798222717354180 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1602 for generator 18. -/
theorem ep_Q2_041_partial_18_1602_valid :
    mulPoly ep_Q2_041_coefficient_18_1602
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1602 := by
  native_decide

/-- Coefficient term 1603 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1603 : Poly :=
[
  term ((2388387120 : Rat) / 151763803) [(1, 1), (13, 3), (16, 1)]
]

/-- Partial product 1603 for generator 18. -/
def ep_Q2_041_partial_18_1603 : Poly :=
[
  term ((4776774240 : Rat) / 151763803) [(1, 1), (8, 1), (13, 3), (16, 1)],
  term ((-2388387120 : Rat) / 151763803) [(1, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1603 for generator 18. -/
theorem ep_Q2_041_partial_18_1603_valid :
    mulPoly ep_Q2_041_coefficient_18_1603
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1603 := by
  native_decide

/-- Coefficient term 1604 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1604 : Poly :=
[
  term ((590461684678738888415173463428346595464493579119338207041480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (13, 4), (14, 1), (15, 1)]
]

/-- Partial product 1604 for generator 18. -/
def ep_Q2_041_partial_18_1604 : Poly :=
[
  term ((1180923369357477776830346926856693190928987158238676414082960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (13, 4), (14, 1), (15, 1)],
  term ((-590461684678738888415173463428346595464493579119338207041480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (13, 4), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1604 for generator 18. -/
theorem ep_Q2_041_partial_18_1604_valid :
    mulPoly ep_Q2_041_coefficient_18_1604
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1604 := by
  native_decide

/-- Coefficient term 1605 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1605 : Poly :=
[
  term ((-607051138878869949796244934305105552881289964796988708175840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (13, 4), (14, 2), (15, 1)]
]

/-- Partial product 1605 for generator 18. -/
def ep_Q2_041_partial_18_1605 : Poly :=
[
  term ((-1214102277757739899592489868610211105762579929593977416351680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (13, 4), (14, 2), (15, 1)],
  term ((607051138878869949796244934305105552881289964796988708175840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (13, 4), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1605 for generator 18. -/
theorem ep_Q2_041_partial_18_1605_valid :
    mulPoly ep_Q2_041_coefficient_18_1605
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1605 := by
  native_decide

/-- Coefficient term 1606 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1606 : Poly :=
[
  term ((-15667817855679335748789722494716793115863253140003251071340 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (13, 4), (15, 1)]
]

/-- Partial product 1606 for generator 18. -/
def ep_Q2_041_partial_18_1606 : Poly :=
[
  term ((-31335635711358671497579444989433586231726506280006502142680 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (13, 4), (15, 1)],
  term ((15667817855679335748789722494716793115863253140003251071340 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (13, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1606 for generator 18. -/
theorem ep_Q2_041_partial_18_1606_valid :
    mulPoly ep_Q2_041_coefficient_18_1606
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1606 := by
  native_decide

/-- Coefficient term 1607 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1607 : Poly :=
[
  term ((91657588509425894260711176902569553897294285368180739765720227414369617127 : Rat) / 148513784694998746745810557987091002645721919739117703890909801474936536) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 1607 for generator 18. -/
def ep_Q2_041_partial_18_1607 : Poly :=
[
  term ((91657588509425894260711176902569553897294285368180739765720227414369617127 : Rat) / 74256892347499373372905278993545501322860959869558851945454900737468268) [(1, 1), (8, 1), (14, 1), (15, 1)],
  term ((-91657588509425894260711176902569553897294285368180739765720227414369617127 : Rat) / 148513784694998746745810557987091002645721919739117703890909801474936536) [(1, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1607 for generator 18. -/
theorem ep_Q2_041_partial_18_1607_valid :
    mulPoly ep_Q2_041_coefficient_18_1607
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1607 := by
  native_decide

/-- Coefficient term 1608 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1608 : Poly :=
[
  term ((174079116663624 : Rat) / 275754830051) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1608 for generator 18. -/
def ep_Q2_041_partial_18_1608 : Poly :=
[
  term ((348158233327248 : Rat) / 275754830051) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-174079116663624 : Rat) / 275754830051) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1608 for generator 18. -/
theorem ep_Q2_041_partial_18_1608_valid :
    mulPoly ep_Q2_041_coefficient_18_1608
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1608 := by
  native_decide

/-- Coefficient term 1609 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1609 : Poly :=
[
  term ((-3432738529963001142716563892520652402164832800516052397172835366237829965 : Rat) / 74256892347499373372905278993545501322860959869558851945454900737468268) [(1, 1), (14, 1), (15, 3)]
]

/-- Partial product 1609 for generator 18. -/
def ep_Q2_041_partial_18_1609 : Poly :=
[
  term ((-3432738529963001142716563892520652402164832800516052397172835366237829965 : Rat) / 37128446173749686686452639496772750661430479934779425972727450368734134) [(1, 1), (8, 1), (14, 1), (15, 3)],
  term ((3432738529963001142716563892520652402164832800516052397172835366237829965 : Rat) / 74256892347499373372905278993545501322860959869558851945454900737468268) [(1, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1609 for generator 18. -/
theorem ep_Q2_041_partial_18_1609_valid :
    mulPoly ep_Q2_041_coefficient_18_1609
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1609 := by
  native_decide

/-- Coefficient term 1610 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1610 : Poly :=
[
  term ((-116738578482064 : Rat) / 275754830051) [(1, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 1610 for generator 18. -/
def ep_Q2_041_partial_18_1610 : Poly :=
[
  term ((-233477156964128 : Rat) / 275754830051) [(1, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((116738578482064 : Rat) / 275754830051) [(1, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1610 for generator 18. -/
theorem ep_Q2_041_partial_18_1610_valid :
    mulPoly ep_Q2_041_coefficient_18_1610
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1610 := by
  native_decide

/-- Coefficient term 1611 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1611 : Poly :=
[
  term ((-5322734116874473893682655679622677263685973677163039844185699436578860419 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (14, 2), (15, 1)]
]

/-- Partial product 1611 for generator 18. -/
def ep_Q2_041_partial_18_1611 : Poly :=
[
  term ((-5322734116874473893682655679622677263685973677163039844185699436578860419 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (14, 2), (15, 1)],
  term ((5322734116874473893682655679622677263685973677163039844185699436578860419 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1611 for generator 18. -/
theorem ep_Q2_041_partial_18_1611_valid :
    mulPoly ep_Q2_041_coefficient_18_1611
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1611 := by
  native_decide

/-- Coefficient term 1612 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1612 : Poly :=
[
  term ((-199892885409037 : Rat) / 275754830051) [(1, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1612 for generator 18. -/
def ep_Q2_041_partial_18_1612 : Poly :=
[
  term ((-399785770818074 : Rat) / 275754830051) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((199892885409037 : Rat) / 275754830051) [(1, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1612 for generator 18. -/
theorem ep_Q2_041_partial_18_1612_valid :
    mulPoly ep_Q2_041_coefficient_18_1612
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1612 := by
  native_decide

/-- Coefficient term 1613 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1613 : Poly :=
[
  term ((-220278058187773282999997266982694835689611792792502218098877184516480850 : Rat) / 18564223086874843343226319748386375330715239967389712986363725184367067) [(1, 1), (14, 3), (15, 1)]
]

/-- Partial product 1613 for generator 18. -/
def ep_Q2_041_partial_18_1613 : Poly :=
[
  term ((-440556116375546565999994533965389671379223585585004436197754369032961700 : Rat) / 18564223086874843343226319748386375330715239967389712986363725184367067) [(1, 1), (8, 1), (14, 3), (15, 1)],
  term ((220278058187773282999997266982694835689611792792502218098877184516480850 : Rat) / 18564223086874843343226319748386375330715239967389712986363725184367067) [(1, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1613 for generator 18. -/
theorem ep_Q2_041_partial_18_1613_valid :
    mulPoly ep_Q2_041_coefficient_18_1613
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1613 := by
  native_decide

/-- Coefficient term 1614 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1614 : Poly :=
[
  term ((-26556013211392 : Rat) / 275754830051) [(1, 1), (14, 3), (15, 1), (16, 1)]
]

/-- Partial product 1614 for generator 18. -/
def ep_Q2_041_partial_18_1614 : Poly :=
[
  term ((-53112026422784 : Rat) / 275754830051) [(1, 1), (8, 1), (14, 3), (15, 1), (16, 1)],
  term ((26556013211392 : Rat) / 275754830051) [(1, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1614 for generator 18. -/
theorem ep_Q2_041_partial_18_1614_valid :
    mulPoly ep_Q2_041_coefficient_18_1614
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1614 := by
  native_decide

/-- Coefficient term 1615 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1615 : Poly :=
[
  term ((-387290158069589283455 : Rat) / 3108023341461611412) [(1, 1), (15, 1)]
]

/-- Partial product 1615 for generator 18. -/
def ep_Q2_041_partial_18_1615 : Poly :=
[
  term ((-387290158069589283455 : Rat) / 1554011670730805706) [(1, 1), (8, 1), (15, 1)],
  term ((387290158069589283455 : Rat) / 3108023341461611412) [(1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1615 for generator 18. -/
theorem ep_Q2_041_partial_18_1615_valid :
    mulPoly ep_Q2_041_coefficient_18_1615
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1615 := by
  native_decide

/-- Coefficient term 1616 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1616 : Poly :=
[
  term ((-6953879391 : Rat) / 303527606) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 1616 for generator 18. -/
def ep_Q2_041_partial_18_1616 : Poly :=
[
  term ((-6953879391 : Rat) / 151763803) [(1, 1), (8, 1), (15, 1), (16, 1)],
  term ((6953879391 : Rat) / 303527606) [(1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1616 for generator 18. -/
theorem ep_Q2_041_partial_18_1616_valid :
    mulPoly ep_Q2_041_coefficient_18_1616
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1616 := by
  native_decide

/-- Coefficient term 1617 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1617 : Poly :=
[
  term ((-1613176194980541548812486443689241334931813221102754244091262491188225569 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (15, 3)]
]

/-- Partial product 1617 for generator 18. -/
def ep_Q2_041_partial_18_1617 : Poly :=
[
  term ((-1613176194980541548812486443689241334931813221102754244091262491188225569 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (15, 3)],
  term ((1613176194980541548812486443689241334931813221102754244091262491188225569 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1617 for generator 18. -/
theorem ep_Q2_041_partial_18_1617_valid :
    mulPoly ep_Q2_041_coefficient_18_1617
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1617 := by
  native_decide

/-- Coefficient term 1618 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1618 : Poly :=
[
  term ((-2152639255234 : Rat) / 275754830051) [(1, 1), (15, 3), (16, 1)]
]

/-- Partial product 1618 for generator 18. -/
def ep_Q2_041_partial_18_1618 : Poly :=
[
  term ((-4305278510468 : Rat) / 275754830051) [(1, 1), (8, 1), (15, 3), (16, 1)],
  term ((2152639255234 : Rat) / 275754830051) [(1, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1618 for generator 18. -/
theorem ep_Q2_041_partial_18_1618_valid :
    mulPoly ep_Q2_041_coefficient_18_1618
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1618 := by
  native_decide

/-- Coefficient term 1619 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1619 : Poly :=
[
  term ((-5291111385166541646203651355551475572193686891383805876774640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 2), (3, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1619 for generator 18. -/
def ep_Q2_041_partial_18_1619 : Poly :=
[
  term ((-10582222770333083292407302711102951144387373782767611753549280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 2), (3, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((5291111385166541646203651355551475572193686891383805876774640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 2), (3, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1619 for generator 18. -/
theorem ep_Q2_041_partial_18_1619_valid :
    mulPoly ep_Q2_041_coefficient_18_1619
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1619 := by
  native_decide

/-- Coefficient term 1620 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1620 : Poly :=
[
  term ((248509261792180206850910691777720843567122729989858093393470350 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 2), (3, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 1620 for generator 18. -/
def ep_Q2_041_partial_18_1620 : Poly :=
[
  term ((497018523584360413701821383555441687134245459979716186786940700 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 2), (3, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-248509261792180206850910691777720843567122729989858093393470350 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 2), (3, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1620 for generator 18. -/
theorem ep_Q2_041_partial_18_1620_valid :
    mulPoly ep_Q2_041_coefficient_18_1620
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1620 := by
  native_decide

/-- Coefficient term 1621 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1621 : Poly :=
[
  term ((-184141877469647970918 : Rat) / 259001945121800951) [(1, 2), (3, 1), (13, 1), (14, 1)]
]

/-- Partial product 1621 for generator 18. -/
def ep_Q2_041_partial_18_1621 : Poly :=
[
  term ((-368283754939295941836 : Rat) / 259001945121800951) [(1, 2), (3, 1), (8, 1), (13, 1), (14, 1)],
  term ((184141877469647970918 : Rat) / 259001945121800951) [(1, 2), (3, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1621 for generator 18. -/
theorem ep_Q2_041_partial_18_1621_valid :
    mulPoly ep_Q2_041_coefficient_18_1621
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1621 := by
  native_decide

/-- Coefficient term 1622 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1622 : Poly :=
[
  term ((78397920861768754478418180225882878601279685513560334974574970 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 2), (3, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1622 for generator 18. -/
def ep_Q2_041_partial_18_1622 : Poly :=
[
  term ((156795841723537508956836360451765757202559371027120669949149940 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 2), (3, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-78397920861768754478418180225882878601279685513560334974574970 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 2), (3, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1622 for generator 18. -/
theorem ep_Q2_041_partial_18_1622_valid :
    mulPoly ep_Q2_041_coefficient_18_1622
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1622 := by
  native_decide

/-- Coefficient term 1623 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1623 : Poly :=
[
  term ((-12965530080 : Rat) / 151763803) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1623 for generator 18. -/
def ep_Q2_041_partial_18_1623 : Poly :=
[
  term ((-25931060160 : Rat) / 151763803) [(1, 2), (3, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((12965530080 : Rat) / 151763803) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1623 for generator 18. -/
theorem ep_Q2_041_partial_18_1623_valid :
    mulPoly ep_Q2_041_coefficient_18_1623
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1623 := by
  native_decide

/-- Coefficient term 1624 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1624 : Poly :=
[
  term ((595377078515814758454009454799238138402803619320123540710920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 2), (3, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 1624 for generator 18. -/
def ep_Q2_041_partial_18_1624 : Poly :=
[
  term ((1190754157031629516908018909598476276805607238640247081421840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 2), (3, 1), (8, 1), (13, 2), (14, 1), (15, 1)],
  term ((-595377078515814758454009454799238138402803619320123540710920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 2), (3, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1624 for generator 18. -/
theorem ep_Q2_041_partial_18_1624_valid :
    mulPoly ep_Q2_041_coefficient_18_1624
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1624 := by
  native_decide

/-- Coefficient term 1625 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1625 : Poly :=
[
  term ((-294646250950017878360345213745923955152152911724983466265355794307761645 : Rat) / 7072084985476130797419550380337666792653424749481795423376657213092216) [(1, 2), (3, 1), (14, 1), (15, 1)]
]

/-- Partial product 1625 for generator 18. -/
def ep_Q2_041_partial_18_1625 : Poly :=
[
  term ((-294646250950017878360345213745923955152152911724983466265355794307761645 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 2), (3, 1), (8, 1), (14, 1), (15, 1)],
  term ((294646250950017878360345213745923955152152911724983466265355794307761645 : Rat) / 7072084985476130797419550380337666792653424749481795423376657213092216) [(1, 2), (3, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1625 for generator 18. -/
theorem ep_Q2_041_partial_18_1625_valid :
    mulPoly ep_Q2_041_coefficient_18_1625
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1625 := by
  native_decide

/-- Coefficient term 1626 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1626 : Poly :=
[
  term ((-96928367762856 : Rat) / 275754830051) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1626 for generator 18. -/
def ep_Q2_041_partial_18_1626 : Poly :=
[
  term ((-193856735525712 : Rat) / 275754830051) [(1, 2), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((96928367762856 : Rat) / 275754830051) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1626 for generator 18. -/
theorem ep_Q2_041_partial_18_1626_valid :
    mulPoly ep_Q2_041_coefficient_18_1626
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1626 := by
  native_decide

/-- Coefficient term 1627 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1627 : Poly :=
[
  term ((121621054262718990080 : Rat) / 259001945121800951) [(1, 2), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1627 for generator 18. -/
def ep_Q2_041_partial_18_1627 : Poly :=
[
  term ((243242108525437980160 : Rat) / 259001945121800951) [(1, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-121621054262718990080 : Rat) / 259001945121800951) [(1, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1627 for generator 18. -/
theorem ep_Q2_041_partial_18_1627_valid :
    mulPoly ep_Q2_041_coefficient_18_1627
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1627 := by
  native_decide

/-- Coefficient term 1628 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1628 : Poly :=
[
  term ((-217554759773245390342469177178550651323367467984060200286877620 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 2), (11, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1628 for generator 18. -/
def ep_Q2_041_partial_18_1628 : Poly :=
[
  term ((-435109519546490780684938354357101302646734935968120400573755240 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 2), (8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((217554759773245390342469177178550651323367467984060200286877620 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 2), (11, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1628 for generator 18. -/
theorem ep_Q2_041_partial_18_1628_valid :
    mulPoly ep_Q2_041_coefficient_18_1628
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1628 := by
  native_decide

/-- Coefficient term 1629 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1629 : Poly :=
[
  term ((8563404800 : Rat) / 151763803) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1629 for generator 18. -/
def ep_Q2_041_partial_18_1629 : Poly :=
[
  term ((17126809600 : Rat) / 151763803) [(1, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8563404800 : Rat) / 151763803) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1629 for generator 18. -/
theorem ep_Q2_041_partial_18_1629_valid :
    mulPoly ep_Q2_041_coefficient_18_1629
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1629 := by
  native_decide

/-- Coefficient term 1630 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1630 : Poly :=
[
  term ((-393231506966069603106879309671323435064803216062826693555200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 2), (11, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 1630 for generator 18. -/
def ep_Q2_041_partial_18_1630 : Poly :=
[
  term ((-786463013932139206213758619342646870129606432125653387110400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 2), (8, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((393231506966069603106879309671323435064803216062826693555200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 2), (11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1630 for generator 18. -/
theorem ep_Q2_041_partial_18_1630_valid :
    mulPoly ep_Q2_041_coefficient_18_1630
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1630 := by
  native_decide

/-- Coefficient term 1631 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1631 : Poly :=
[
  term ((408822667992322456415889086975640053376233773529640784965823187726381085 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 2), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1631 for generator 18. -/
def ep_Q2_041_partial_18_1631 : Poly :=
[
  term ((408822667992322456415889086975640053376233773529640784965823187726381085 : Rat) / 1768021246369032699354887595084416698163356187370448855844164303273054) [(1, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-408822667992322456415889086975640053376233773529640784965823187726381085 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1631 for generator 18. -/
theorem ep_Q2_041_partial_18_1631_valid :
    mulPoly ep_Q2_041_coefficient_18_1631
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1631 := by
  native_decide

/-- Coefficient term 1632 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1632 : Poly :=
[
  term ((268976875050576 : Rat) / 275754830051) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1632 for generator 18. -/
def ep_Q2_041_partial_18_1632 : Poly :=
[
  term ((537953750101152 : Rat) / 275754830051) [(1, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-268976875050576 : Rat) / 275754830051) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1632 for generator 18. -/
theorem ep_Q2_041_partial_18_1632_valid :
    mulPoly ep_Q2_041_coefficient_18_1632
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1632 := by
  native_decide

/-- Coefficient term 1633 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1633 : Poly :=
[
  term ((3494645290512473326697974063522130408879215284298901714278400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 2), (11, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1633 for generator 18. -/
def ep_Q2_041_partial_18_1633 : Poly :=
[
  term ((6989290581024946653395948127044260817758430568597803428556800 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 2), (8, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-3494645290512473326697974063522130408879215284298901714278400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 2), (11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1633 for generator 18. -/
theorem ep_Q2_041_partial_18_1633_valid :
    mulPoly ep_Q2_041_coefficient_18_1633
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1633 := by
  native_decide

/-- Coefficient term 1634 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1634 : Poly :=
[
  term ((-689614879531698778748426158456190856255141512897038458141131100 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 2), (11, 2), (14, 1), (15, 2)]
]

/-- Partial product 1634 for generator 18. -/
def ep_Q2_041_partial_18_1634 : Poly :=
[
  term ((-1379229759063397557496852316912381712510283025794076916282262200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 2), (8, 1), (11, 2), (14, 1), (15, 2)],
  term ((689614879531698778748426158456190856255141512897038458141131100 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 2), (11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1634 for generator 18. -/
theorem ep_Q2_041_partial_18_1634_valid :
    mulPoly ep_Q2_041_coefficient_18_1634
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1634 := by
  native_decide

/-- Coefficient term 1635 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1635 : Poly :=
[
  term ((654548583300923671606759545690746940191912480274855613535737461821088000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (3, 1), (6, 1), (15, 3)]
]

/-- Partial product 1635 for generator 18. -/
def ep_Q2_041_partial_18_1635 : Poly :=
[
  term ((1309097166601847343213519091381493880383824960549711227071474923642176000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (3, 1), (6, 1), (8, 1), (15, 3)],
  term ((-654548583300923671606759545690746940191912480274855613535737461821088000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (3, 1), (6, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1635 for generator 18. -/
theorem ep_Q2_041_partial_18_1635_valid :
    mulPoly ep_Q2_041_coefficient_18_1635
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1635 := by
  native_decide

/-- Coefficient term 1636 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1636 : Poly :=
[
  term ((436365722200615781071173030460497960127941653516570409023824974547392000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (3, 1), (7, 1), (14, 1), (15, 2)]
]

/-- Partial product 1636 for generator 18. -/
def ep_Q2_041_partial_18_1636 : Poly :=
[
  term ((872731444401231562142346060920995920255883307033140818047649949094784000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (3, 1), (7, 1), (8, 1), (14, 1), (15, 2)],
  term ((-436365722200615781071173030460497960127941653516570409023824974547392000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (3, 1), (7, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1636 for generator 18. -/
theorem ep_Q2_041_partial_18_1636_valid :
    mulPoly ep_Q2_041_coefficient_18_1636
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1636 := by
  native_decide

/-- Coefficient term 1637 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1637 : Poly :=
[
  term ((-163637145825230917901689886422686735047978120068713903383934365455272000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (5, 1), (6, 1), (7, 1), (15, 2)]
]

/-- Partial product 1637 for generator 18. -/
def ep_Q2_041_partial_18_1637 : Poly :=
[
  term ((-327274291650461835803379772845373470095956240137427806767868730910544000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (5, 1), (6, 1), (7, 1), (8, 1), (15, 2)],
  term ((163637145825230917901689886422686735047978120068713903383934365455272000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (5, 1), (6, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1637 for generator 18. -/
theorem ep_Q2_041_partial_18_1637_valid :
    mulPoly ep_Q2_041_coefficient_18_1637
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1637 := by
  native_decide

/-- Coefficient term 1638 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1638 : Poly :=
[
  term ((11362429311393422166770592035370496231350687287711477117807421293040 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 1638 for generator 18. -/
def ep_Q2_041_partial_18_1638 : Poly :=
[
  term ((22724858622786844333541184070740992462701374575422954235614842586080 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-11362429311393422166770592035370496231350687287711477117807421293040 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1638 for generator 18. -/
theorem ep_Q2_041_partial_18_1638_valid :
    mulPoly ep_Q2_041_coefficient_18_1638
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1638 := by
  native_decide

/-- Coefficient term 1639 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1639 : Poly :=
[
  term ((-27272857637538486316948314403781122507996353344785650563989060909212000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 3)]
]

/-- Partial product 1639 for generator 18. -/
def ep_Q2_041_partial_18_1639 : Poly :=
[
  term ((-54545715275076972633896628807562245015992706689571301127978121818424000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 3)],
  term ((27272857637538486316948314403781122507996353344785650563989060909212000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1639 for generator 18. -/
theorem ep_Q2_041_partial_18_1639_valid :
    mulPoly ep_Q2_041_coefficient_18_1639
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1639 := by
  native_decide

/-- Coefficient term 1640 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1640 : Poly :=
[
  term ((28380828968216027499993828553531379364758729927724947764681103024880 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (5, 1), (6, 1), (14, 2), (15, 1)]
]

/-- Partial product 1640 for generator 18. -/
def ep_Q2_041_partial_18_1640 : Poly :=
[
  term ((56761657936432054999987657107062758729517459855449895529362206049760 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (5, 1), (6, 1), (8, 1), (14, 2), (15, 1)],
  term ((-28380828968216027499993828553531379364758729927724947764681103024880 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (5, 1), (6, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1640 for generator 18. -/
theorem ep_Q2_041_partial_18_1640_valid :
    mulPoly ep_Q2_041_coefficient_18_1640
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1640 := by
  native_decide

/-- Coefficient term 1641 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1641 : Poly :=
[
  term ((33405320640594145283864144131814991462951786760060068487866291464880 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (5, 1), (6, 1), (15, 1)]
]

/-- Partial product 1641 for generator 18. -/
def ep_Q2_041_partial_18_1641 : Poly :=
[
  term ((66810641281188290567728288263629982925903573520120136975732582929760 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 1)],
  term ((-33405320640594145283864144131814991462951786760060068487866291464880 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (5, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1641 for generator 18. -/
theorem ep_Q2_041_partial_18_1641_valid :
    mulPoly ep_Q2_041_coefficient_18_1641
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1641 := by
  native_decide

/-- Coefficient term 1642 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1642 : Poly :=
[
  term ((463638579838154267388121344864279082635938006861356059587814035456604000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (5, 1), (6, 1), (15, 3)]
]

/-- Partial product 1642 for generator 18. -/
def ep_Q2_041_partial_18_1642 : Poly :=
[
  term ((927277159676308534776242689728558165271876013722712119175628070913208000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 3)],
  term ((-463638579838154267388121344864279082635938006861356059587814035456604000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (5, 1), (6, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1642 for generator 18. -/
theorem ep_Q2_041_partial_18_1642_valid :
    mulPoly ep_Q2_041_coefficient_18_1642
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1642 := by
  native_decide

/-- Coefficient term 1643 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1643 : Poly :=
[
  term ((409092864563077294754224716056716837619945300171784758459835913638180000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (5, 1), (7, 1), (14, 1), (15, 2)]
]

/-- Partial product 1643 for generator 18. -/
def ep_Q2_041_partial_18_1643 : Poly :=
[
  term ((818185729126154589508449432113433675239890600343569516919671827276360000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (5, 1), (7, 1), (8, 1), (14, 1), (15, 2)],
  term ((-409092864563077294754224716056716837619945300171784758459835913638180000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (5, 1), (7, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1643 for generator 18. -/
theorem ep_Q2_041_partial_18_1643_valid :
    mulPoly ep_Q2_041_coefficient_18_1643
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1643 := by
  native_decide

/-- Coefficient term 1644 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1644 : Poly :=
[
  term ((-386112600648879602293141063483615188324818467289890182746306892945600 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (5, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1644 for generator 18. -/
def ep_Q2_041_partial_18_1644 : Poly :=
[
  term ((-772225201297759204586282126967230376649636934579780365492613785891200 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((386112600648879602293141063483615188324818467289890182746306892945600 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (5, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1644 for generator 18. -/
theorem ep_Q2_041_partial_18_1644_valid :
    mulPoly ep_Q2_041_coefficient_18_1644
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1644 := by
  native_decide

/-- Coefficient term 1645 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1645 : Poly :=
[
  term ((-1565027826612460818061664432381643843300080636217251152770986221800 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (5, 1), (14, 1), (15, 1)]
]

/-- Partial product 1645 for generator 18. -/
def ep_Q2_041_partial_18_1645 : Poly :=
[
  term ((-3130055653224921636123328864763287686600161272434502305541972443600 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((1565027826612460818061664432381643843300080636217251152770986221800 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1645 for generator 18. -/
theorem ep_Q2_041_partial_18_1645_valid :
    mulPoly ep_Q2_041_coefficient_18_1645
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1645 := by
  native_decide

/-- Coefficient term 1646 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1646 : Poly :=
[
  term ((-1628896675047946779063364881760645857644256274214864448129213319340565600 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (5, 1), (14, 1), (15, 3)]
]

/-- Partial product 1646 for generator 18. -/
def ep_Q2_041_partial_18_1646 : Poly :=
[
  term ((-3257793350095893558126729763521291715288512548429728896258426638681131200 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 3)],
  term ((1628896675047946779063364881760645857644256274214864448129213319340565600 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (5, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1646 for generator 18. -/
theorem ep_Q2_041_partial_18_1646_valid :
    mulPoly ep_Q2_041_coefficient_18_1646
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1646 := by
  native_decide

/-- Coefficient term 1647 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1647 : Poly :=
[
  term ((-4956217470994829137994493353674771754899767441649651304209412238600 : Rat) / 486522082104852146217635551756856548751611499001224231107364970631) [(2, 1), (5, 1), (14, 2), (15, 1)]
]

/-- Partial product 1647 for generator 18. -/
def ep_Q2_041_partial_18_1647 : Poly :=
[
  term ((-9912434941989658275988986707349543509799534883299302608418824477200 : Rat) / 486522082104852146217635551756856548751611499001224231107364970631) [(2, 1), (5, 1), (8, 1), (14, 2), (15, 1)],
  term ((4956217470994829137994493353674771754899767441649651304209412238600 : Rat) / 486522082104852146217635551756856548751611499001224231107364970631) [(2, 1), (5, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1647 for generator 18. -/
theorem ep_Q2_041_partial_18_1647_valid :
    mulPoly ep_Q2_041_coefficient_18_1647
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1647 := by
  native_decide

/-- Coefficient term 1648 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1648 : Poly :=
[
  term ((-655237090024558995307156478946305312882793397158150892112860726002000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (7, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 1648 for generator 18. -/
def ep_Q2_041_partial_18_1648 : Poly :=
[
  term ((655237090024558995307156478946305312882793397158150892112860726002000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-1310474180049117990614312957892610625765586794316301784225721452004000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (7, 1), (8, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1648 for generator 18. -/
theorem ep_Q2_041_partial_18_1648_valid :
    mulPoly ep_Q2_041_coefficient_18_1648
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1648 := by
  native_decide

/-- Coefficient term 1649 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1649 : Poly :=
[
  term ((-25667877252710132844047565416496877035478980483379027643530362211440 : Rat) / 486522082104852146217635551756856548751611499001224231107364970631) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 1649 for generator 18. -/
def ep_Q2_041_partial_18_1649 : Poly :=
[
  term ((25667877252710132844047565416496877035478980483379027643530362211440 : Rat) / 486522082104852146217635551756856548751611499001224231107364970631) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-51335754505420265688095130832993754070957960966758055287060724422880 : Rat) / 486522082104852146217635551756856548751611499001224231107364970631) [(2, 1), (6, 1), (7, 1), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1649 for generator 18. -/
theorem ep_Q2_041_partial_18_1649_valid :
    mulPoly ep_Q2_041_coefficient_18_1649
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1649 := by
  native_decide

/-- Coefficient term 1650 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1650 : Poly :=
[
  term ((-327274291650461835803379772845373470095956240137427806767868730910544000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 3)]
]

/-- Partial product 1650 for generator 18. -/
def ep_Q2_041_partial_18_1650 : Poly :=
[
  term ((327274291650461835803379772845373470095956240137427806767868730910544000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 3)],
  term ((-654548583300923671606759545690746940191912480274855613535737461821088000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (7, 1), (8, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1650 for generator 18. -/
theorem ep_Q2_041_partial_18_1650_valid :
    mulPoly ep_Q2_041_coefficient_18_1650
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1650 := by
  native_decide

/-- Coefficient term 1651 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1651 : Poly :=
[
  term ((-327274291650461835803379772845373470095956240137427806767868730910544000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (7, 1), (9, 1), (14, 1), (15, 2)]
]

/-- Partial product 1651 for generator 18. -/
def ep_Q2_041_partial_18_1651 : Poly :=
[
  term ((-654548583300923671606759545690746940191912480274855613535737461821088000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 2)],
  term ((327274291650461835803379772845373470095956240137427806767868730910544000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (7, 1), (9, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1651 for generator 18. -/
theorem ep_Q2_041_partial_18_1651_valid :
    mulPoly ep_Q2_041_coefficient_18_1651
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1651 := by
  native_decide

/-- Coefficient term 1652 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1652 : Poly :=
[
  term ((871122322654748249822468484295096538092485132294480909708037841208306720 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (7, 1), (9, 1), (15, 2)]
]

/-- Partial product 1652 for generator 18. -/
def ep_Q2_041_partial_18_1652 : Poly :=
[
  term ((1742244645309496499644936968590193076184970264588961819416075682416613440 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (7, 1), (8, 1), (9, 1), (15, 2)],
  term ((-871122322654748249822468484295096538092485132294480909708037841208306720 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1652 for generator 18. -/
theorem ep_Q2_041_partial_18_1652_valid :
    mulPoly ep_Q2_041_coefficient_18_1652
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1652 := by
  native_decide

/-- Coefficient term 1653 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1653 : Poly :=
[
  term ((2620948360098235981228625915785221251531173588632603568451442904008000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (7, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 1653 for generator 18. -/
def ep_Q2_041_partial_18_1653 : Poly :=
[
  term ((5241896720196471962457251831570442503062347177265207136902885808016000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2620948360098235981228625915785221251531173588632603568451442904008000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (7, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1653 for generator 18. -/
theorem ep_Q2_041_partial_18_1653_valid :
    mulPoly ep_Q2_041_coefficient_18_1653
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1653 := by
  native_decide

/-- Coefficient term 1654 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1654 : Poly :=
[
  term ((-623505353498896633144068802588501690827484368969919951159866018042840 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (7, 1), (10, 1), (15, 1)]
]

/-- Partial product 1654 for generator 18. -/
def ep_Q2_041_partial_18_1654 : Poly :=
[
  term ((-1247010706997793266288137605177003381654968737939839902319732036085680 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((623505353498896633144068802588501690827484368969919951159866018042840 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1654 for generator 18. -/
theorem ep_Q2_041_partial_18_1654_valid :
    mulPoly ep_Q2_041_coefficient_18_1654
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1654 := by
  native_decide

/-- Coefficient term 1655 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1655 : Poly :=
[
  term ((-1310474180049117990614312957892610625765586794316301784225721452004000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (7, 1), (10, 2), (15, 1)]
]

/-- Partial product 1655 for generator 18. -/
def ep_Q2_041_partial_18_1655 : Poly :=
[
  term ((-2620948360098235981228625915785221251531173588632603568451442904008000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (7, 1), (8, 1), (10, 2), (15, 1)],
  term ((1310474180049117990614312957892610625765586794316301784225721452004000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (7, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1655 for generator 18. -/
theorem ep_Q2_041_partial_18_1655_valid :
    mulPoly ep_Q2_041_coefficient_18_1655
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1655 := by
  native_decide

/-- Coefficient term 1656 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1656 : Poly :=
[
  term ((-1087696062008572828038177422899446135993057784314106205880338220595525440 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (7, 1), (11, 1), (15, 2)]
]

/-- Partial product 1656 for generator 18. -/
def ep_Q2_041_partial_18_1656 : Poly :=
[
  term ((-2175392124017145656076354845798892271986115568628212411760676441191050880 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 2)],
  term ((1087696062008572828038177422899446135993057784314106205880338220595525440 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1656 for generator 18. -/
theorem ep_Q2_041_partial_18_1656_valid :
    mulPoly ep_Q2_041_coefficient_18_1656
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1656 := by
  native_decide

/-- Coefficient term 1657 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1657 : Poly :=
[
  term ((-655237090024558995307156478946305312882793397158150892112860726002000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 1657 for generator 18. -/
def ep_Q2_041_partial_18_1657 : Poly :=
[
  term ((-1310474180049117990614312957892610625765586794316301784225721452004000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((655237090024558995307156478946305312882793397158150892112860726002000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1657 for generator 18. -/
theorem ep_Q2_041_partial_18_1657_valid :
    mulPoly ep_Q2_041_coefficient_18_1657
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1657 := by
  native_decide

/-- Coefficient term 1658 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1658 : Poly :=
[
  term ((1309097166601847343213519091381493880383824960549711227071474923642176000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 3)]
]

/-- Partial product 1658 for generator 18. -/
def ep_Q2_041_partial_18_1658 : Poly :=
[
  term ((2618194333203694686427038182762987760767649921099422454142949847284352000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (7, 1), (8, 1), (14, 1), (15, 3)],
  term ((-1309097166601847343213519091381493880383824960549711227071474923642176000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1658 for generator 18. -/
theorem ep_Q2_041_partial_18_1658_valid :
    mulPoly ep_Q2_041_coefficient_18_1658
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1658 := by
  native_decide

/-- Coefficient term 1659 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1659 : Poly :=
[
  term ((299707187663422407743439301893953210110594703996539668036486980654040 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (7, 1), (15, 1)]
]

/-- Partial product 1659 for generator 18. -/
def ep_Q2_041_partial_18_1659 : Poly :=
[
  term ((599414375326844815486878603787906420221189407993079336072973961308080 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-299707187663422407743439301893953210110594703996539668036486980654040 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1659 for generator 18. -/
theorem ep_Q2_041_partial_18_1659_valid :
    mulPoly ep_Q2_041_coefficient_18_1659
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1659 := by
  native_decide

/-- Coefficient term 1660 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1660 : Poly :=
[
  term ((-654548583300923671606759545690746940191912480274855613535737461821088000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (7, 1), (15, 3)]
]

/-- Partial product 1660 for generator 18. -/
def ep_Q2_041_partial_18_1660 : Poly :=
[
  term ((-1309097166601847343213519091381493880383824960549711227071474923642176000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 3)],
  term ((654548583300923671606759545690746940191912480274855613535737461821088000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1660 for generator 18. -/
theorem ep_Q2_041_partial_18_1660_valid :
    mulPoly ep_Q2_041_coefficient_18_1660
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1660 := by
  native_decide

/-- Coefficient term 1661 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1661 : Poly :=
[
  term ((-655237090024558995307156478946305312882793397158150892112860726002000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 1661 for generator 18. -/
def ep_Q2_041_partial_18_1661 : Poly :=
[
  term ((655237090024558995307156478946305312882793397158150892112860726002000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1310474180049117990614312957892610625765586794316301784225721452004000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1661 for generator 18. -/
theorem ep_Q2_041_partial_18_1661_valid :
    mulPoly ep_Q2_041_coefficient_18_1661
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1661 := by
  native_decide

/-- Coefficient term 1662 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1662 : Poly :=
[
  term ((655237090024558995307156478946305312882793397158150892112860726002000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 1), (10, 1), (15, 2)]
]

/-- Partial product 1662 for generator 18. -/
def ep_Q2_041_partial_18_1662 : Poly :=
[
  term ((-655237090024558995307156478946305312882793397158150892112860726002000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 1), (10, 1), (15, 2)],
  term ((1310474180049117990614312957892610625765586794316301784225721452004000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1662 for generator 18. -/
theorem ep_Q2_041_partial_18_1662_valid :
    mulPoly ep_Q2_041_coefficient_18_1662
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1662 := by
  native_decide

/-- Coefficient term 1663 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1663 : Poly :=
[
  term ((655237090024558995307156478946305312882793397158150892112860726002000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1663 for generator 18. -/
def ep_Q2_041_partial_18_1663 : Poly :=
[
  term ((-655237090024558995307156478946305312882793397158150892112860726002000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((1310474180049117990614312957892610625765586794316301784225721452004000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1663 for generator 18. -/
theorem ep_Q2_041_partial_18_1663_valid :
    mulPoly ep_Q2_041_coefficient_18_1663
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1663 := by
  native_decide

/-- Coefficient term 1664 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1664 : Poly :=
[
  term ((21154491017108241442058450905202414703539352125487293968663138639440 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 1664 for generator 18. -/
def ep_Q2_041_partial_18_1664 : Poly :=
[
  term ((-21154491017108241442058450905202414703539352125487293968663138639440 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((42308982034216482884116901810404829407078704250974587937326277278880 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1664 for generator 18. -/
theorem ep_Q2_041_partial_18_1664_valid :
    mulPoly ep_Q2_041_coefficient_18_1664
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1664 := by
  native_decide

/-- Coefficient term 1665 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1665 : Poly :=
[
  term ((872731444401231562142346060920995920255883307033140818047649949094784000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 3)]
]

/-- Partial product 1665 for generator 18. -/
def ep_Q2_041_partial_18_1665 : Poly :=
[
  term ((-872731444401231562142346060920995920255883307033140818047649949094784000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 3)],
  term ((1745462888802463124284692121841991840511766614066281636095299898189568000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1665 for generator 18. -/
theorem ep_Q2_041_partial_18_1665_valid :
    mulPoly ep_Q2_041_coefficient_18_1665
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1665 := by
  native_decide

/-- Coefficient term 1666 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1666 : Poly :=
[
  term ((28380828968216027499993828553531379364758729927724947764681103024880 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 1), (14, 1), (15, 2)]
]

/-- Partial product 1666 for generator 18. -/
def ep_Q2_041_partial_18_1666 : Poly :=
[
  term ((-28380828968216027499993828553531379364758729927724947764681103024880 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 1), (14, 1), (15, 2)],
  term ((56761657936432054999987657107062758729517459855449895529362206049760 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1666 for generator 18. -/
theorem ep_Q2_041_partial_18_1666_valid :
    mulPoly ep_Q2_041_coefficient_18_1666
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1666 := by
  native_decide

/-- Coefficient term 1667 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1667 : Poly :=
[
  term ((-186116294917239414520526968981037815029991229960923017167254647892200 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 1), (15, 2)]
]

/-- Partial product 1667 for generator 18. -/
def ep_Q2_041_partial_18_1667 : Poly :=
[
  term ((186116294917239414520526968981037815029991229960923017167254647892200 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 1), (15, 2)],
  term ((-372232589834478829041053937962075630059982459921846034334509295784400 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1667 for generator 18. -/
theorem ep_Q2_041_partial_18_1667_valid :
    mulPoly ep_Q2_041_coefficient_18_1667
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1667 := by
  native_decide

/-- Coefficient term 1668 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1668 : Poly :=
[
  term ((-81818572912615458950844943211343367523989060034356951691967182727636000 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(2, 1), (6, 1), (8, 1), (15, 4)]
]

/-- Partial product 1668 for generator 18. -/
def ep_Q2_041_partial_18_1668 : Poly :=
[
  term ((81818572912615458950844943211343367523989060034356951691967182727636000 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(2, 1), (6, 1), (8, 1), (15, 4)],
  term ((-163637145825230917901689886422686735047978120068713903383934365455272000 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(2, 1), (6, 1), (8, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1668 for generator 18. -/
theorem ep_Q2_041_partial_18_1668_valid :
    mulPoly ep_Q2_041_coefficient_18_1668
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1668 := by
  native_decide

/-- Coefficient term 1669 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1669 : Poly :=
[
  term ((-1310474180049117990614312957892610625765586794316301784225721452004000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 1669 for generator 18. -/
def ep_Q2_041_partial_18_1669 : Poly :=
[
  term ((-2620948360098235981228625915785221251531173588632603568451442904008000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((1310474180049117990614312957892610625765586794316301784225721452004000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (9, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1669 for generator 18. -/
theorem ep_Q2_041_partial_18_1669_valid :
    mulPoly ep_Q2_041_coefficient_18_1669
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1669 := by
  native_decide

/-- Coefficient term 1670 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1670 : Poly :=
[
  term ((-21154491017108241442058450905202414703539352125487293968663138639440 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 1670 for generator 18. -/
def ep_Q2_041_partial_18_1670 : Poly :=
[
  term ((-42308982034216482884116901810404829407078704250974587937326277278880 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((21154491017108241442058450905202414703539352125487293968663138639440 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1670 for generator 18. -/
theorem ep_Q2_041_partial_18_1670_valid :
    mulPoly ep_Q2_041_coefficient_18_1670
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1670 := by
  native_decide

/-- Coefficient term 1671 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1671 : Poly :=
[
  term ((-872731444401231562142346060920995920255883307033140818047649949094784000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (9, 1), (10, 1), (15, 3)]
]

/-- Partial product 1671 for generator 18. -/
def ep_Q2_041_partial_18_1671 : Poly :=
[
  term ((-1745462888802463124284692121841991840511766614066281636095299898189568000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 1), (9, 1), (10, 1), (15, 3)],
  term ((872731444401231562142346060920995920255883307033140818047649949094784000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (9, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1671 for generator 18. -/
theorem ep_Q2_041_partial_18_1671_valid :
    mulPoly ep_Q2_041_coefficient_18_1671
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1671 := by
  native_decide

/-- Coefficient term 1672 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1672 : Poly :=
[
  term ((655237090024558995307156478946305312882793397158150892112860726002000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (9, 1), (10, 2), (15, 1)]
]

/-- Partial product 1672 for generator 18. -/
def ep_Q2_041_partial_18_1672 : Poly :=
[
  term ((1310474180049117990614312957892610625765586794316301784225721452004000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 1), (9, 1), (10, 2), (15, 1)],
  term ((-655237090024558995307156478946305312882793397158150892112860726002000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (9, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1672 for generator 18. -/
theorem ep_Q2_041_partial_18_1672_valid :
    mulPoly ep_Q2_041_coefficient_18_1672
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1672 := by
  native_decide

/-- Coefficient term 1673 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1673 : Poly :=
[
  term ((2903914393381439138733663586245703508075495506867187356496502541158720 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(2, 1), (6, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 1673 for generator 18. -/
def ep_Q2_041_partial_18_1673 : Poly :=
[
  term ((5807828786762878277467327172491407016150991013734374712993005082317440 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(2, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 2)],
  term ((-2903914393381439138733663586245703508075495506867187356496502541158720 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(2, 1), (6, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1673 for generator 18. -/
theorem ep_Q2_041_partial_18_1673_valid :
    mulPoly ep_Q2_041_coefficient_18_1673
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1673 := by
  native_decide

/-- Coefficient term 1674 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1674 : Poly :=
[
  term ((-125395401658814610031940122577215174900573818580707883979509277774400 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 1674 for generator 18. -/
def ep_Q2_041_partial_18_1674 : Poly :=
[
  term ((-250790803317629220063880245154430349801147637161415767959018555548800 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((125395401658814610031940122577215174900573818580707883979509277774400 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1674 for generator 18. -/
theorem ep_Q2_041_partial_18_1674_valid :
    mulPoly ep_Q2_041_coefficient_18_1674
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1674 := by
  native_decide

/-- Coefficient term 1675 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1675 : Poly :=
[
  term ((600002868025846698972862916883184695175919773585284312407759340002664000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 3)]
]

/-- Partial product 1675 for generator 18. -/
def ep_Q2_041_partial_18_1675 : Poly :=
[
  term ((1200005736051693397945725833766369390351839547170568624815518680005328000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 1), (9, 1), (14, 1), (15, 3)],
  term ((-600002868025846698972862916883184695175919773585284312407759340002664000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1675 for generator 18. -/
theorem ep_Q2_041_partial_18_1675_valid :
    mulPoly ep_Q2_041_coefficient_18_1675
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1675 := by
  native_decide

/-- Coefficient term 1676 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1676 : Poly :=
[
  term ((-56761657936432054999987657107062758729517459855449895529362206049760 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (9, 1), (14, 2), (15, 1)]
]

/-- Partial product 1676 for generator 18. -/
def ep_Q2_041_partial_18_1676 : Poly :=
[
  term ((-113523315872864109999975314214125517459034919710899791058724412099520 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 1), (9, 1), (14, 2), (15, 1)],
  term ((56761657936432054999987657107062758729517459855449895529362206049760 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1676 for generator 18. -/
theorem ep_Q2_041_partial_18_1676_valid :
    mulPoly ep_Q2_041_coefficient_18_1676
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1676 := by
  native_decide

/-- Coefficient term 1677 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1677 : Poly :=
[
  term ((128777905414964722401387870524600026944274655913913693322293322968800 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (9, 1), (15, 1)]
]

/-- Partial product 1677 for generator 18. -/
def ep_Q2_041_partial_18_1677 : Poly :=
[
  term ((257555810829929444802775741049200053888549311827827386644586645937600 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-128777905414964722401387870524600026944274655913913693322293322968800 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1677 for generator 18. -/
theorem ep_Q2_041_partial_18_1677_valid :
    mulPoly ep_Q2_041_coefficient_18_1677
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1677 := by
  native_decide

/-- Coefficient term 1678 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1678 : Poly :=
[
  term ((898395180292286736139416798698877660600481485639266560272026902117518720 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (9, 1), (15, 3)]
]

/-- Partial product 1678 for generator 18. -/
def ep_Q2_041_partial_18_1678 : Poly :=
[
  term ((1796790360584573472278833597397755321200962971278533120544053804235037440 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 1), (9, 1), (15, 3)],
  term ((-898395180292286736139416798698877660600481485639266560272026902117518720 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1678 for generator 18. -/
theorem ep_Q2_041_partial_18_1678_valid :
    mulPoly ep_Q2_041_coefficient_18_1678
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1678 := by
  native_decide

/-- Coefficient term 1679 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1679 : Poly :=
[
  term ((-317041299503725376932549014020551449089627022516331799072098793681280 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 1679 for generator 18. -/
def ep_Q2_041_partial_18_1679 : Poly :=
[
  term ((-634082599007450753865098028041102898179254045032663598144197587362560 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((317041299503725376932549014020551449089627022516331799072098793681280 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1679 for generator 18. -/
theorem ep_Q2_041_partial_18_1679_valid :
    mulPoly ep_Q2_041_coefficient_18_1679
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1679 := by
  native_decide

/-- Coefficient term 1680 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1680 : Poly :=
[
  term ((951069883321730461956000561525614986808413477268448420480 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(2, 1), (6, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 1680 for generator 18. -/
def ep_Q2_041_partial_18_1680 : Poly :=
[
  term ((1902139766643460923912001123051229973616826954536896840960 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(2, 1), (6, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-951069883321730461956000561525614986808413477268448420480 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(2, 1), (6, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1680 for generator 18. -/
theorem ep_Q2_041_partial_18_1680_valid :
    mulPoly ep_Q2_041_coefficient_18_1680
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1680 := by
  native_decide

/-- Coefficient term 1681 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1681 : Poly :=
[
  term ((436365722200615781071173030460497960127941653516570409023824974547392000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (10, 1), (14, 1), (15, 2)]
]

/-- Partial product 1681 for generator 18. -/
def ep_Q2_041_partial_18_1681 : Poly :=
[
  term ((872731444401231562142346060920995920255883307033140818047649949094784000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-436365722200615781071173030460497960127941653516570409023824974547392000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (10, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1681 for generator 18. -/
theorem ep_Q2_041_partial_18_1681_valid :
    mulPoly ep_Q2_041_coefficient_18_1681
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1681 := by
  native_decide

/-- Coefficient term 1682 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1682 : Poly :=
[
  term ((1178566257399494600207292153102394695519977079705077322600072727736667120 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (10, 1), (15, 2)]
]

/-- Partial product 1682 for generator 18. -/
def ep_Q2_041_partial_18_1682 : Poly :=
[
  term ((2357132514798989200414584306204789391039954159410154645200145455473334240 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 1), (10, 1), (15, 2)],
  term ((-1178566257399494600207292153102394695519977079705077322600072727736667120 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1682 for generator 18. -/
theorem ep_Q2_041_partial_18_1682_valid :
    mulPoly ep_Q2_041_coefficient_18_1682
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1682 := by
  native_decide

/-- Coefficient term 1683 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1683 : Poly :=
[
  term ((1745462888802463124284692121841991840511766614066281636095299898189568000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (10, 1), (15, 4)]
]

/-- Partial product 1683 for generator 18. -/
def ep_Q2_041_partial_18_1683 : Poly :=
[
  term ((3490925777604926248569384243683983681023533228132563272190599796379136000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 1), (10, 1), (15, 4)],
  term ((-1745462888802463124284692121841991840511766614066281636095299898189568000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1683 for generator 18. -/
theorem ep_Q2_041_partial_18_1683_valid :
    mulPoly ep_Q2_041_coefficient_18_1683
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1683 := by
  native_decide

/-- Coefficient term 1684 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1684 : Poly :=
[
  term ((151246906408370817791277641089368203105746982866079975477774947395763440 : Rat) / 269046711403983236858352460121541671459641158947676999802372828758943) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1684 for generator 18. -/
def ep_Q2_041_partial_18_1684 : Poly :=
[
  term ((302493812816741635582555282178736406211493965732159950955549894791526880 : Rat) / 269046711403983236858352460121541671459641158947676999802372828758943) [(2, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-151246906408370817791277641089368203105746982866079975477774947395763440 : Rat) / 269046711403983236858352460121541671459641158947676999802372828758943) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1684 for generator 18. -/
theorem ep_Q2_041_partial_18_1684_valid :
    mulPoly ep_Q2_041_coefficient_18_1684
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1684 := by
  native_decide

/-- Coefficient term 1685 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1685 : Poly :=
[
  term ((-2836377194304002576962624697993236740831620747857707658654862334558048000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 3)]
]

/-- Partial product 1685 for generator 18. -/
def ep_Q2_041_partial_18_1685 : Poly :=
[
  term ((-5672754388608005153925249395986473481663241495715415317309724669116096000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 3)],
  term ((2836377194304002576962624697993236740831620747857707658654862334558048000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1685 for generator 18. -/
theorem ep_Q2_041_partial_18_1685_valid :
    mulPoly ep_Q2_041_coefficient_18_1685
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1685 := by
  native_decide

/-- Coefficient term 1686 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1686 : Poly :=
[
  term ((-91949925519874738567713646749499037977834406209065749805588491640600 : Rat) / 486522082104852146217635551756856548751611499001224231107364970631) [(2, 1), (6, 1), (11, 1), (15, 1)]
]

/-- Partial product 1686 for generator 18. -/
def ep_Q2_041_partial_18_1686 : Poly :=
[
  term ((-183899851039749477135427293498998075955668812418131499611176983281200 : Rat) / 486522082104852146217635551756856548751611499001224231107364970631) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((91949925519874738567713646749499037977834406209065749805588491640600 : Rat) / 486522082104852146217635551756856548751611499001224231107364970631) [(2, 1), (6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1686 for generator 18. -/
theorem ep_Q2_041_partial_18_1686_valid :
    mulPoly ep_Q2_041_coefficient_18_1686
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1686 := by
  native_decide

/-- Coefficient term 1687 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1687 : Poly :=
[
  term ((163637145825230917901689886422686735047978120068713903383934365455272000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (11, 1), (15, 3)]
]

/-- Partial product 1687 for generator 18. -/
def ep_Q2_041_partial_18_1687 : Poly :=
[
  term ((327274291650461835803379772845373470095956240137427806767868730910544000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 3)],
  term ((-163637145825230917901689886422686735047978120068713903383934365455272000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1687 for generator 18. -/
theorem ep_Q2_041_partial_18_1687_valid :
    mulPoly ep_Q2_041_coefficient_18_1687
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1687 := by
  native_decide

/-- Coefficient term 1688 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1688 : Poly :=
[
  term ((1090914305501539452677932576151244900319854133791426022559562436368480000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (11, 2), (14, 1), (15, 2)]
]

/-- Partial product 1688 for generator 18. -/
def ep_Q2_041_partial_18_1688 : Poly :=
[
  term ((2181828611003078905355865152302489800639708267582852045119124872736960000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 1), (11, 2), (14, 1), (15, 2)],
  term ((-1090914305501539452677932576151244900319854133791426022559562436368480000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1688 for generator 18. -/
theorem ep_Q2_041_partial_18_1688_valid :
    mulPoly ep_Q2_041_coefficient_18_1688
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1688 := by
  native_decide

/-- Coefficient term 1689 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1689 : Poly :=
[
  term ((-37436558014373523302516136955641084786260587618820806311726819803267520 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (11, 2), (15, 2)]
]

/-- Partial product 1689 for generator 18. -/
def ep_Q2_041_partial_18_1689 : Poly :=
[
  term ((-74873116028747046605032273911282169572521175237641612623453639606535040 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 1), (11, 2), (15, 2)],
  term ((37436558014373523302516136955641084786260587618820806311726819803267520 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1689 for generator 18. -/
theorem ep_Q2_041_partial_18_1689_valid :
    mulPoly ep_Q2_041_coefficient_18_1689
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1689 := by
  native_decide

/-- Coefficient term 1690 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1690 : Poly :=
[
  term ((7977401081020390555212232755342774699725413690225471945504249820 : Rat) / 19148152187595627590842179611456522117420683531067762794559721) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1690 for generator 18. -/
def ep_Q2_041_partial_18_1690 : Poly :=
[
  term ((15954802162040781110424465510685549399450827380450943891008499640 : Rat) / 19148152187595627590842179611456522117420683531067762794559721) [(2, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7977401081020390555212232755342774699725413690225471945504249820 : Rat) / 19148152187595627590842179611456522117420683531067762794559721) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1690 for generator 18. -/
theorem ep_Q2_041_partial_18_1690_valid :
    mulPoly ep_Q2_041_coefficient_18_1690
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1690 := by
  native_decide

/-- Coefficient term 1691 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1691 : Poly :=
[
  term ((-951069883321730461956000561525614986808413477268448420480 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(2, 1), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 1691 for generator 18. -/
def ep_Q2_041_partial_18_1691 : Poly :=
[
  term ((-1902139766643460923912001123051229973616826954536896840960 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(2, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((951069883321730461956000561525614986808413477268448420480 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(2, 1), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1691 for generator 18. -/
theorem ep_Q2_041_partial_18_1691_valid :
    mulPoly ep_Q2_041_coefficient_18_1691
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1691 := by
  native_decide

/-- Coefficient term 1692 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1692 : Poly :=
[
  term ((31191727351560 : Rat) / 134822357243) [(2, 1), (6, 1), (14, 1)]
]

/-- Partial product 1692 for generator 18. -/
def ep_Q2_041_partial_18_1692 : Poly :=
[
  term ((62383454703120 : Rat) / 134822357243) [(2, 1), (6, 1), (8, 1), (14, 1)],
  term ((-31191727351560 : Rat) / 134822357243) [(2, 1), (6, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1692 for generator 18. -/
theorem ep_Q2_041_partial_18_1692_valid :
    mulPoly ep_Q2_041_coefficient_18_1692
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1692 := by
  native_decide

/-- Coefficient term 1693 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1693 : Poly :=
[
  term ((1650370246422638685154823756616838815416473727490616351466137103279830975732040045 : Rat) / 903976501691130127502130083788000938451196675497550060093279725085571485296228) [(2, 1), (6, 1), (14, 1), (15, 2)]
]

/-- Partial product 1693 for generator 18. -/
def ep_Q2_041_partial_18_1693 : Poly :=
[
  term ((1650370246422638685154823756616838815416473727490616351466137103279830975732040045 : Rat) / 451988250845565063751065041894000469225598337748775030046639862542785742648114) [(2, 1), (6, 1), (8, 1), (14, 1), (15, 2)],
  term ((-1650370246422638685154823756616838815416473727490616351466137103279830975732040045 : Rat) / 903976501691130127502130083788000938451196675497550060093279725085571485296228) [(2, 1), (6, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1693 for generator 18. -/
theorem ep_Q2_041_partial_18_1693_valid :
    mulPoly ep_Q2_041_coefficient_18_1693
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1693 := by
  native_decide

/-- Coefficient term 1694 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1694 : Poly :=
[
  term ((-27272857637538486316948314403781122507996353344785650563989060909212000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (14, 1), (15, 4)]
]

/-- Partial product 1694 for generator 18. -/
def ep_Q2_041_partial_18_1694 : Poly :=
[
  term ((-54545715275076972633896628807562245015992706689571301127978121818424000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 1), (14, 1), (15, 4)],
  term ((27272857637538486316948314403781122507996353344785650563989060909212000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (14, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1694 for generator 18. -/
theorem ep_Q2_041_partial_18_1694_valid :
    mulPoly ep_Q2_041_coefficient_18_1694
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1694 := by
  native_decide

/-- Coefficient term 1695 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1695 : Poly :=
[
  term ((815207980086326138842041589787637946529664505932674445880119269654142960 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (14, 2), (15, 2)]
]

/-- Partial product 1695 for generator 18. -/
def ep_Q2_041_partial_18_1695 : Poly :=
[
  term ((1630415960172652277684083179575275893059329011865348891760238539308285920 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 1), (14, 2), (15, 2)],
  term ((-815207980086326138842041589787637946529664505932674445880119269654142960 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1695 for generator 18. -/
theorem ep_Q2_041_partial_18_1695_valid :
    mulPoly ep_Q2_041_coefficient_18_1695
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1695 := by
  native_decide

/-- Coefficient term 1696 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1696 : Poly :=
[
  term ((1481300453610032020590181226272371565270277860022147646496320297107105760 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (15, 2)]
]

/-- Partial product 1696 for generator 18. -/
def ep_Q2_041_partial_18_1696 : Poly :=
[
  term ((2962600907220064041180362452544743130540555720044295292992640594214211520 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 1), (15, 2)],
  term ((-1481300453610032020590181226272371565270277860022147646496320297107105760 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1696 for generator 18. -/
theorem ep_Q2_041_partial_18_1696_valid :
    mulPoly ep_Q2_041_coefficient_18_1696
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1696 := by
  native_decide

/-- Coefficient term 1697 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1697 : Poly :=
[
  term ((-272728576375384863169483144037811225079963533447856505639890609092120000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (15, 4)]
]

/-- Partial product 1697 for generator 18. -/
def ep_Q2_041_partial_18_1697 : Poly :=
[
  term ((-545457152750769726338966288075622450159927066895713011279781218184240000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 1), (15, 4)],
  term ((272728576375384863169483144037811225079963533447856505639890609092120000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1697 for generator 18. -/
theorem ep_Q2_041_partial_18_1697_valid :
    mulPoly ep_Q2_041_coefficient_18_1697
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1697 := by
  native_decide

/-- Coefficient term 1698 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1698 : Poly :=
[
  term ((655237090024558995307156478946305312882793397158150892112860726002000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 2), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 1698 for generator 18. -/
def ep_Q2_041_partial_18_1698 : Poly :=
[
  term ((-655237090024558995307156478946305312882793397158150892112860726002000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 2), (8, 1), (11, 1), (15, 1)],
  term ((1310474180049117990614312957892610625765586794316301784225721452004000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 2), (8, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1698 for generator 18. -/
theorem ep_Q2_041_partial_18_1698_valid :
    mulPoly ep_Q2_041_coefficient_18_1698
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1698 := by
  native_decide

/-- Coefficient term 1699 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1699 : Poly :=
[
  term ((-655237090024558995307156478946305312882793397158150892112860726002000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 2), (8, 1), (15, 2)]
]

/-- Partial product 1699 for generator 18. -/
def ep_Q2_041_partial_18_1699 : Poly :=
[
  term ((655237090024558995307156478946305312882793397158150892112860726002000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 2), (8, 1), (15, 2)],
  term ((-1310474180049117990614312957892610625765586794316301784225721452004000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 2), (8, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1699 for generator 18. -/
theorem ep_Q2_041_partial_18_1699_valid :
    mulPoly ep_Q2_041_coefficient_18_1699
        ep_Q2_041_generator_18_1600_1699 =
      ep_Q2_041_partial_18_1699 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_041_partials_18_1600_1699 : List Poly :=
[
  ep_Q2_041_partial_18_1600,
  ep_Q2_041_partial_18_1601,
  ep_Q2_041_partial_18_1602,
  ep_Q2_041_partial_18_1603,
  ep_Q2_041_partial_18_1604,
  ep_Q2_041_partial_18_1605,
  ep_Q2_041_partial_18_1606,
  ep_Q2_041_partial_18_1607,
  ep_Q2_041_partial_18_1608,
  ep_Q2_041_partial_18_1609,
  ep_Q2_041_partial_18_1610,
  ep_Q2_041_partial_18_1611,
  ep_Q2_041_partial_18_1612,
  ep_Q2_041_partial_18_1613,
  ep_Q2_041_partial_18_1614,
  ep_Q2_041_partial_18_1615,
  ep_Q2_041_partial_18_1616,
  ep_Q2_041_partial_18_1617,
  ep_Q2_041_partial_18_1618,
  ep_Q2_041_partial_18_1619,
  ep_Q2_041_partial_18_1620,
  ep_Q2_041_partial_18_1621,
  ep_Q2_041_partial_18_1622,
  ep_Q2_041_partial_18_1623,
  ep_Q2_041_partial_18_1624,
  ep_Q2_041_partial_18_1625,
  ep_Q2_041_partial_18_1626,
  ep_Q2_041_partial_18_1627,
  ep_Q2_041_partial_18_1628,
  ep_Q2_041_partial_18_1629,
  ep_Q2_041_partial_18_1630,
  ep_Q2_041_partial_18_1631,
  ep_Q2_041_partial_18_1632,
  ep_Q2_041_partial_18_1633,
  ep_Q2_041_partial_18_1634,
  ep_Q2_041_partial_18_1635,
  ep_Q2_041_partial_18_1636,
  ep_Q2_041_partial_18_1637,
  ep_Q2_041_partial_18_1638,
  ep_Q2_041_partial_18_1639,
  ep_Q2_041_partial_18_1640,
  ep_Q2_041_partial_18_1641,
  ep_Q2_041_partial_18_1642,
  ep_Q2_041_partial_18_1643,
  ep_Q2_041_partial_18_1644,
  ep_Q2_041_partial_18_1645,
  ep_Q2_041_partial_18_1646,
  ep_Q2_041_partial_18_1647,
  ep_Q2_041_partial_18_1648,
  ep_Q2_041_partial_18_1649,
  ep_Q2_041_partial_18_1650,
  ep_Q2_041_partial_18_1651,
  ep_Q2_041_partial_18_1652,
  ep_Q2_041_partial_18_1653,
  ep_Q2_041_partial_18_1654,
  ep_Q2_041_partial_18_1655,
  ep_Q2_041_partial_18_1656,
  ep_Q2_041_partial_18_1657,
  ep_Q2_041_partial_18_1658,
  ep_Q2_041_partial_18_1659,
  ep_Q2_041_partial_18_1660,
  ep_Q2_041_partial_18_1661,
  ep_Q2_041_partial_18_1662,
  ep_Q2_041_partial_18_1663,
  ep_Q2_041_partial_18_1664,
  ep_Q2_041_partial_18_1665,
  ep_Q2_041_partial_18_1666,
  ep_Q2_041_partial_18_1667,
  ep_Q2_041_partial_18_1668,
  ep_Q2_041_partial_18_1669,
  ep_Q2_041_partial_18_1670,
  ep_Q2_041_partial_18_1671,
  ep_Q2_041_partial_18_1672,
  ep_Q2_041_partial_18_1673,
  ep_Q2_041_partial_18_1674,
  ep_Q2_041_partial_18_1675,
  ep_Q2_041_partial_18_1676,
  ep_Q2_041_partial_18_1677,
  ep_Q2_041_partial_18_1678,
  ep_Q2_041_partial_18_1679,
  ep_Q2_041_partial_18_1680,
  ep_Q2_041_partial_18_1681,
  ep_Q2_041_partial_18_1682,
  ep_Q2_041_partial_18_1683,
  ep_Q2_041_partial_18_1684,
  ep_Q2_041_partial_18_1685,
  ep_Q2_041_partial_18_1686,
  ep_Q2_041_partial_18_1687,
  ep_Q2_041_partial_18_1688,
  ep_Q2_041_partial_18_1689,
  ep_Q2_041_partial_18_1690,
  ep_Q2_041_partial_18_1691,
  ep_Q2_041_partial_18_1692,
  ep_Q2_041_partial_18_1693,
  ep_Q2_041_partial_18_1694,
  ep_Q2_041_partial_18_1695,
  ep_Q2_041_partial_18_1696,
  ep_Q2_041_partial_18_1697,
  ep_Q2_041_partial_18_1698,
  ep_Q2_041_partial_18_1699
]

/-- Sum of partial products in this block. -/
def ep_Q2_041_block_18_1600_1699 : Poly :=
[
  term ((-290637686990563629639267758078774953568586686837702381643386960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (13, 3), (14, 2), (15, 2)],
  term ((26439512320 : Rat) / 151763803) [(1, 1), (8, 1), (13, 3), (14, 2), (16, 1)],
  term ((1654814057236459200468639324301719495730231770333596445434708360 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (13, 3), (15, 2)],
  term ((4776774240 : Rat) / 151763803) [(1, 1), (8, 1), (13, 3), (16, 1)],
  term ((1180923369357477776830346926856693190928987158238676414082960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (13, 4), (14, 1), (15, 1)],
  term ((-1214102277757739899592489868610211105762579929593977416351680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (13, 4), (14, 2), (15, 1)],
  term ((-31335635711358671497579444989433586231726506280006502142680 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (13, 4), (15, 1)],
  term ((91657588509425894260711176902569553897294285368180739765720227414369617127 : Rat) / 74256892347499373372905278993545501322860959869558851945454900737468268) [(1, 1), (8, 1), (14, 1), (15, 1)],
  term ((348158233327248 : Rat) / 275754830051) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3432738529963001142716563892520652402164832800516052397172835366237829965 : Rat) / 37128446173749686686452639496772750661430479934779425972727450368734134) [(1, 1), (8, 1), (14, 1), (15, 3)],
  term ((-233477156964128 : Rat) / 275754830051) [(1, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((-5322734116874473893682655679622677263685973677163039844185699436578860419 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (14, 2), (15, 1)],
  term ((-399785770818074 : Rat) / 275754830051) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-440556116375546565999994533965389671379223585585004436197754369032961700 : Rat) / 18564223086874843343226319748386375330715239967389712986363725184367067) [(1, 1), (8, 1), (14, 3), (15, 1)],
  term ((-53112026422784 : Rat) / 275754830051) [(1, 1), (8, 1), (14, 3), (15, 1), (16, 1)],
  term ((-387290158069589283455 : Rat) / 1554011670730805706) [(1, 1), (8, 1), (15, 1)],
  term ((-6953879391 : Rat) / 151763803) [(1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1613176194980541548812486443689241334931813221102754244091262491188225569 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (15, 3)],
  term ((-4305278510468 : Rat) / 275754830051) [(1, 1), (8, 1), (15, 3), (16, 1)],
  term ((145318843495281814819633879039387476784293343418851190821693480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (13, 3), (14, 2), (15, 2)],
  term ((-13219756160 : Rat) / 151763803) [(1, 1), (13, 3), (14, 2), (16, 1)],
  term ((-827407028618229600234319662150859747865115885166798222717354180 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (13, 3), (15, 2)],
  term ((-2388387120 : Rat) / 151763803) [(1, 1), (13, 3), (16, 1)],
  term ((-590461684678738888415173463428346595464493579119338207041480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (13, 4), (14, 1), (15, 1)],
  term ((607051138878869949796244934305105552881289964796988708175840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (13, 4), (14, 2), (15, 1)],
  term ((15667817855679335748789722494716793115863253140003251071340 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (13, 4), (15, 1)],
  term ((-91657588509425894260711176902569553897294285368180739765720227414369617127 : Rat) / 148513784694998746745810557987091002645721919739117703890909801474936536) [(1, 1), (14, 1), (15, 1)],
  term ((-174079116663624 : Rat) / 275754830051) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((3432738529963001142716563892520652402164832800516052397172835366237829965 : Rat) / 74256892347499373372905278993545501322860959869558851945454900737468268) [(1, 1), (14, 1), (15, 3)],
  term ((116738578482064 : Rat) / 275754830051) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((5322734116874473893682655679622677263685973677163039844185699436578860419 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (14, 2), (15, 1)],
  term ((199892885409037 : Rat) / 275754830051) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((220278058187773282999997266982694835689611792792502218098877184516480850 : Rat) / 18564223086874843343226319748386375330715239967389712986363725184367067) [(1, 1), (14, 3), (15, 1)],
  term ((26556013211392 : Rat) / 275754830051) [(1, 1), (14, 3), (15, 1), (16, 1)],
  term ((387290158069589283455 : Rat) / 3108023341461611412) [(1, 1), (15, 1)],
  term ((6953879391 : Rat) / 303527606) [(1, 1), (15, 1), (16, 1)],
  term ((1613176194980541548812486443689241334931813221102754244091262491188225569 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (15, 3)],
  term ((2152639255234 : Rat) / 275754830051) [(1, 1), (15, 3), (16, 1)],
  term ((-10582222770333083292407302711102951144387373782767611753549280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 2), (3, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((497018523584360413701821383555441687134245459979716186786940700 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 2), (3, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-368283754939295941836 : Rat) / 259001945121800951) [(1, 2), (3, 1), (8, 1), (13, 1), (14, 1)],
  term ((156795841723537508956836360451765757202559371027120669949149940 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 2), (3, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-25931060160 : Rat) / 151763803) [(1, 2), (3, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((1190754157031629516908018909598476276805607238640247081421840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 2), (3, 1), (8, 1), (13, 2), (14, 1), (15, 1)],
  term ((-294646250950017878360345213745923955152152911724983466265355794307761645 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 2), (3, 1), (8, 1), (14, 1), (15, 1)],
  term ((-193856735525712 : Rat) / 275754830051) [(1, 2), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((5291111385166541646203651355551475572193686891383805876774640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 2), (3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-248509261792180206850910691777720843567122729989858093393470350 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 2), (3, 1), (11, 1), (14, 1), (15, 2)],
  term ((184141877469647970918 : Rat) / 259001945121800951) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((-78397920861768754478418180225882878601279685513560334974574970 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 2), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((12965530080 : Rat) / 151763803) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-595377078515814758454009454799238138402803619320123540710920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 2), (3, 1), (13, 2), (14, 1), (15, 1)],
  term ((294646250950017878360345213745923955152152911724983466265355794307761645 : Rat) / 7072084985476130797419550380337666792653424749481795423376657213092216) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((96928367762856 : Rat) / 275754830051) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((243242108525437980160 : Rat) / 259001945121800951) [(1, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-435109519546490780684938354357101302646734935968120400573755240 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 2), (8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((17126809600 : Rat) / 151763803) [(1, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-786463013932139206213758619342646870129606432125653387110400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 2), (8, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((408822667992322456415889086975640053376233773529640784965823187726381085 : Rat) / 1768021246369032699354887595084416698163356187370448855844164303273054) [(1, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((537953750101152 : Rat) / 275754830051) [(1, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6989290581024946653395948127044260817758430568597803428556800 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 2), (8, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1379229759063397557496852316912381712510283025794076916282262200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 2), (8, 1), (11, 2), (14, 1), (15, 2)],
  term ((-121621054262718990080 : Rat) / 259001945121800951) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((217554759773245390342469177178550651323367467984060200286877620 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 2), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-8563404800 : Rat) / 151763803) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((393231506966069603106879309671323435064803216062826693555200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 2), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-408822667992322456415889086975640053376233773529640784965823187726381085 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((-268976875050576 : Rat) / 275754830051) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3494645290512473326697974063522130408879215284298901714278400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((689614879531698778748426158456190856255141512897038458141131100 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 2), (11, 2), (14, 1), (15, 2)],
  term ((1309097166601847343213519091381493880383824960549711227071474923642176000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (3, 1), (6, 1), (8, 1), (15, 3)],
  term ((-654548583300923671606759545690746940191912480274855613535737461821088000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (3, 1), (6, 1), (15, 3)],
  term ((872731444401231562142346060920995920255883307033140818047649949094784000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (3, 1), (7, 1), (8, 1), (14, 1), (15, 2)],
  term ((-436365722200615781071173030460497960127941653516570409023824974547392000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (3, 1), (7, 1), (14, 1), (15, 2)],
  term ((-327274291650461835803379772845373470095956240137427806767868730910544000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (5, 1), (6, 1), (7, 1), (8, 1), (15, 2)],
  term ((163637145825230917901689886422686735047978120068713903383934365455272000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (5, 1), (6, 1), (7, 1), (15, 2)],
  term ((22724858622786844333541184070740992462701374575422954235614842586080 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-54545715275076972633896628807562245015992706689571301127978121818424000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 3)],
  term ((56761657936432054999987657107062758729517459855449895529362206049760 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (5, 1), (6, 1), (8, 1), (14, 2), (15, 1)],
  term ((66810641281188290567728288263629982925903573520120136975732582929760 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 1)],
  term ((927277159676308534776242689728558165271876013722712119175628070913208000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 3)],
  term ((-11362429311393422166770592035370496231350687287711477117807421293040 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((27272857637538486316948314403781122507996353344785650563989060909212000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 3)],
  term ((-28380828968216027499993828553531379364758729927724947764681103024880 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (5, 1), (6, 1), (14, 2), (15, 1)],
  term ((-33405320640594145283864144131814991462951786760060068487866291464880 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (5, 1), (6, 1), (15, 1)],
  term ((-463638579838154267388121344864279082635938006861356059587814035456604000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (5, 1), (6, 1), (15, 3)],
  term ((818185729126154589508449432113433675239890600343569516919671827276360000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (5, 1), (7, 1), (8, 1), (14, 1), (15, 2)],
  term ((-409092864563077294754224716056716837619945300171784758459835913638180000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (5, 1), (7, 1), (14, 1), (15, 2)],
  term ((-772225201297759204586282126967230376649636934579780365492613785891200 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3130055653224921636123328864763287686600161272434502305541972443600 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((-3257793350095893558126729763521291715288512548429728896258426638681131200 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 3)],
  term ((-9912434941989658275988986707349543509799534883299302608418824477200 : Rat) / 486522082104852146217635551756856548751611499001224231107364970631) [(2, 1), (5, 1), (8, 1), (14, 2), (15, 1)],
  term ((386112600648879602293141063483615188324818467289890182746306892945600 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (5, 1), (13, 1), (14, 1), (15, 2)],
  term ((1565027826612460818061664432381643843300080636217251152770986221800 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (5, 1), (14, 1), (15, 1)],
  term ((1628896675047946779063364881760645857644256274214864448129213319340565600 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (5, 1), (14, 1), (15, 3)],
  term ((4956217470994829137994493353674771754899767441649651304209412238600 : Rat) / 486522082104852146217635551756856548751611499001224231107364970631) [(2, 1), (5, 1), (14, 2), (15, 1)],
  term ((-654548583300923671606759545690746940191912480274855613535737461821088000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 2)],
  term ((1742244645309496499644936968590193076184970264588961819416075682416613440 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (7, 1), (8, 1), (9, 1), (15, 2)],
  term ((5241896720196471962457251831570442503062347177265207136902885808016000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1247010706997793266288137605177003381654968737939839902319732036085680 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-2620948360098235981228625915785221251531173588632603568451442904008000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (7, 1), (8, 1), (10, 2), (15, 1)],
  term ((-2175392124017145656076354845798892271986115568628212411760676441191050880 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 2)],
  term ((-655237090024558995307156478946305312882793397158150892112860726002000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((2618194333203694686427038182762987760767649921099422454142949847284352000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (7, 1), (8, 1), (14, 1), (15, 3)],
  term ((779089516095815745395211561703384559469542271376732529577686496788160 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-981822874951385507410139318536120410287868720412283420303606192731632000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 3)],
  term ((-1310474180049117990614312957892610625765586794316301784225721452004000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (7, 1), (8, 2), (14, 1), (15, 1)],
  term ((-51335754505420265688095130832993754070957960966758055287060724422880 : Rat) / 486522082104852146217635551756856548751611499001224231107364970631) [(2, 1), (6, 1), (7, 1), (8, 2), (15, 1)],
  term ((-654548583300923671606759545690746940191912480274855613535737461821088000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (7, 1), (8, 2), (15, 3)],
  term ((327274291650461835803379772845373470095956240137427806767868730910544000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (7, 1), (9, 1), (14, 1), (15, 2)],
  term ((-871122322654748249822468484295096538092485132294480909708037841208306720 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (7, 1), (9, 1), (15, 2)],
  term ((-2620948360098235981228625915785221251531173588632603568451442904008000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((623505353498896633144068802588501690827484368969919951159866018042840 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (7, 1), (10, 1), (15, 1)],
  term ((1310474180049117990614312957892610625765586794316301784225721452004000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (7, 1), (10, 2), (15, 1)],
  term ((1087696062008572828038177422899446135993057784314106205880338220595525440 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (7, 1), (11, 1), (15, 2)],
  term ((655237090024558995307156478946305312882793397158150892112860726002000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-1309097166601847343213519091381493880383824960549711227071474923642176000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 3)],
  term ((-299707187663422407743439301893953210110594703996539668036486980654040 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (7, 1), (15, 1)],
  term ((654548583300923671606759545690746940191912480274855613535737461821088000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (7, 1), (15, 3)],
  term ((-2620948360098235981228625915785221251531173588632603568451442904008000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-42308982034216482884116901810404829407078704250974587937326277278880 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1745462888802463124284692121841991840511766614066281636095299898189568000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 1), (9, 1), (10, 1), (15, 3)],
  term ((1310474180049117990614312957892610625765586794316301784225721452004000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 1), (9, 1), (10, 2), (15, 1)],
  term ((5807828786762878277467327172491407016150991013734374712993005082317440 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(2, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 2)],
  term ((-250790803317629220063880245154430349801147637161415767959018555548800 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((1200005736051693397945725833766369390351839547170568624815518680005328000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 1), (9, 1), (14, 1), (15, 3)],
  term ((-113523315872864109999975314214125517459034919710899791058724412099520 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 1), (9, 1), (14, 2), (15, 1)],
  term ((257555810829929444802775741049200053888549311827827386644586645937600 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((1796790360584573472278833597397755321200962971278533120544053804235037440 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 1), (9, 1), (15, 3)],
  term ((21154491017108241442058450905202414703539352125487293968663138639440 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((1902139766643460923912001123051229973616826954536896840960 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(2, 1), (6, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((872731444401231562142346060920995920255883307033140818047649949094784000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((1166566722224365505941480983959352637531918556773794474231077516327700240 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 1), (10, 1), (15, 2)],
  term ((3490925777604926248569384243683983681023533228132563272190599796379136000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 1), (10, 1), (15, 4)],
  term ((35818583243543067850469988620282612356250469622380861496947699633909840 : Rat) / 38435244486283319551193208588791667351377308421096714257481832679849) [(2, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-5672754388608005153925249395986473481663241495715415317309724669116096000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 3)],
  term ((-1308453448295354581390049505398188946393221039052407791246902021607840 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-545457152750769726338966288075622450159927066895713011279781218184240000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 3)],
  term ((2181828611003078905355865152302489800639708267582852045119124872736960000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 1), (11, 2), (14, 1), (15, 2)],
  term ((-74873116028747046605032273911282169572521175237641612623453639606535040 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 1), (11, 2), (15, 2)],
  term ((15954802162040781110424465510685549399450827380450943891008499640 : Rat) / 19148152187595627590842179611456522117420683531067762794559721) [(2, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1902139766643460923912001123051229973616826954536896840960 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(2, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((62383454703120 : Rat) / 134822357243) [(2, 1), (6, 1), (8, 1), (14, 1)],
  term ((1646603628005709787546517263017686473359841759799947818757682358605859797099731085 : Rat) / 451988250845565063751065041894000469225598337748775030046639862542785742648114) [(2, 1), (6, 1), (8, 1), (14, 1), (15, 2)],
  term ((-54545715275076972633896628807562245015992706689571301127978121818424000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 1), (14, 1), (15, 4)],
  term ((1630415960172652277684083179575275893059329011865348891760238539308285920 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 1), (14, 2), (15, 2)],
  term ((3300774215084688057364159955183288840450049784883292415185542289434338920 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 1), (15, 2)],
  term ((27272857637538486316948314403781122507996353344785650563989060909212000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 1), (15, 4)],
  term ((-1310474180049117990614312957892610625765586794316301784225721452004000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 2), (10, 1), (11, 1), (15, 1)],
  term ((1310474180049117990614312957892610625765586794316301784225721452004000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 2), (10, 1), (15, 2)],
  term ((1310474180049117990614312957892610625765586794316301784225721452004000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 2), (11, 1), (14, 1), (15, 1)],
  term ((42308982034216482884116901810404829407078704250974587937326277278880 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 2), (11, 1), (15, 1)],
  term ((1745462888802463124284692121841991840511766614066281636095299898189568000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (8, 2), (11, 1), (15, 3)],
  term ((56761657936432054999987657107062758729517459855449895529362206049760 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 2), (14, 1), (15, 2)],
  term ((-372232589834478829041053937962075630059982459921846034334509295784400 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (8, 2), (15, 2)],
  term ((-163637145825230917901689886422686735047978120068713903383934365455272000 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(2, 1), (6, 1), (8, 2), (15, 4)],
  term ((1310474180049117990614312957892610625765586794316301784225721452004000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((21154491017108241442058450905202414703539352125487293968663138639440 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((872731444401231562142346060920995920255883307033140818047649949094784000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (9, 1), (10, 1), (15, 3)],
  term ((-655237090024558995307156478946305312882793397158150892112860726002000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (9, 1), (10, 2), (15, 1)],
  term ((-2903914393381439138733663586245703508075495506867187356496502541158720 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(2, 1), (6, 1), (9, 1), (11, 1), (15, 2)],
  term ((125395401658814610031940122577215174900573818580707883979509277774400 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-600002868025846698972862916883184695175919773585284312407759340002664000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 3)],
  term ((56761657936432054999987657107062758729517459855449895529362206049760 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (9, 1), (14, 2), (15, 1)],
  term ((-128777905414964722401387870524600026944274655913913693322293322968800 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term ((-898395180292286736139416798698877660600481485639266560272026902117518720 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (9, 1), (15, 3)],
  term ((317041299503725376932549014020551449089627022516331799072098793681280 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((-951069883321730461956000561525614986808413477268448420480 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(2, 1), (6, 1), (10, 1), (13, 1), (15, 1)],
  term ((-436365722200615781071173030460497960127941653516570409023824974547392000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (10, 1), (14, 1), (15, 2)],
  term ((-1178566257399494600207292153102394695519977079705077322600072727736667120 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (10, 1), (15, 2)],
  term ((-1745462888802463124284692121841991840511766614066281636095299898189568000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (10, 1), (15, 4)],
  term ((-151246906408370817791277641089368203105746982866079975477774947395763440 : Rat) / 269046711403983236858352460121541671459641158947676999802372828758943) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((2836377194304002576962624697993236740831620747857707658654862334558048000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 3)],
  term ((91949925519874738567713646749499037977834406209065749805588491640600 : Rat) / 486522082104852146217635551756856548751611499001224231107364970631) [(2, 1), (6, 1), (11, 1), (15, 1)],
  term ((-163637145825230917901689886422686735047978120068713903383934365455272000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (11, 1), (15, 3)],
  term ((-1090914305501539452677932576151244900319854133791426022559562436368480000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (11, 2), (14, 1), (15, 2)],
  term ((37436558014373523302516136955641084786260587618820806311726819803267520 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (11, 2), (15, 2)],
  term ((-7977401081020390555212232755342774699725413690225471945504249820 : Rat) / 19148152187595627590842179611456522117420683531067762794559721) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((951069883321730461956000561525614986808413477268448420480 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-31191727351560 : Rat) / 134822357243) [(2, 1), (6, 1), (14, 1)],
  term ((-1650370246422638685154823756616838815416473727490616351466137103279830975732040045 : Rat) / 903976501691130127502130083788000938451196675497550060093279725085571485296228) [(2, 1), (6, 1), (14, 1), (15, 2)],
  term ((27272857637538486316948314403781122507996353344785650563989060909212000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (14, 1), (15, 4)],
  term ((-815207980086326138842041589787637946529664505932674445880119269654142960 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (14, 2), (15, 2)],
  term ((-1481300453610032020590181226272371565270277860022147646496320297107105760 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (15, 2)],
  term ((272728576375384863169483144037811225079963533447856505639890609092120000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(2, 1), (6, 1), (15, 4)],
  term ((-655237090024558995307156478946305312882793397158150892112860726002000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 2), (8, 1), (11, 1), (15, 1)],
  term ((655237090024558995307156478946305312882793397158150892112860726002000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 2), (8, 1), (15, 2)],
  term ((1310474180049117990614312957892610625765586794316301784225721452004000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 2), (8, 2), (11, 1), (15, 1)],
  term ((-1310474180049117990614312957892610625765586794316301784225721452004000 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(2, 1), (6, 2), (8, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 1600 through 1699. -/
theorem ep_Q2_041_block_18_1600_1699_valid :
    checkProductSumEq ep_Q2_041_partials_18_1600_1699
      ep_Q2_041_block_18_1600_1699 = true := by
  native_decide

end EpQ2041TermShards

end Patterns

end EndpointCertificate

end Problem97
