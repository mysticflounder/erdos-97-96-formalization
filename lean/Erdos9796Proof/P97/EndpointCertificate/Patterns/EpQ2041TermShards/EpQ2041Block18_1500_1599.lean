/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_041, term block 18:1500-1599

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_041`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2041TermShards

/-- Generator polynomial 18 for endpoint certificate `ep_Q2_041`. -/
def ep_Q2_041_generator_18_1500_1599 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 1500 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1500 : Poly :=
[
  term ((-2427479312580066729159209335086718456190702318210401174825522092197120895 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 1500 for generator 18. -/
def ep_Q2_041_partial_18_1500 : Poly :=
[
  term ((-2427479312580066729159209335086718456190702318210401174825522092197120895 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((2427479312580066729159209335086718456190702318210401174825522092197120895 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1500 for generator 18. -/
theorem ep_Q2_041_partial_18_1500_valid :
    mulPoly ep_Q2_041_coefficient_18_1500
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1500 := by
  native_decide

/-- Coefficient term 1501 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1501 : Poly :=
[
  term ((-3632834681616 : Rat) / 275754830051) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1501 for generator 18. -/
def ep_Q2_041_partial_18_1501 : Poly :=
[
  term ((-7265669363232 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((3632834681616 : Rat) / 275754830051) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1501 for generator 18. -/
theorem ep_Q2_041_partial_18_1501_valid :
    mulPoly ep_Q2_041_coefficient_18_1501
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1501 := by
  native_decide

/-- Coefficient term 1502 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1502 : Poly :=
[
  term ((-370162920850113456127330805568050538609785220183406988816258410 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 2), (12, 1), (15, 3)]
]

/-- Partial product 1502 for generator 18. -/
def ep_Q2_041_partial_18_1502 : Poly :=
[
  term ((-740325841700226912254661611136101077219570440366813977632516820 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 3)],
  term ((370162920850113456127330805568050538609785220183406988816258410 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 2), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1502 for generator 18. -/
theorem ep_Q2_041_partial_18_1502_valid :
    mulPoly ep_Q2_041_coefficient_18_1502
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1502 := by
  native_decide

/-- Coefficient term 1503 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1503 : Poly :=
[
  term ((84069517984525991562960761045536924498523713922759102411440 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (11, 2), (12, 2), (15, 1)]
]

/-- Partial product 1503 for generator 18. -/
def ep_Q2_041_partial_18_1503 : Poly :=
[
  term ((168139035969051983125921522091073848997047427845518204822880 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (11, 2), (12, 2), (15, 1)],
  term ((-84069517984525991562960761045536924498523713922759102411440 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (11, 2), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1503 for generator 18. -/
theorem ep_Q2_041_partial_18_1503_valid :
    mulPoly ep_Q2_041_coefficient_18_1503
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1503 := by
  native_decide

/-- Coefficient term 1504 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1504 : Poly :=
[
  term ((-2375411216068730275 : Rat) / 259001945121800951) [(1, 1), (11, 2), (13, 1)]
]

/-- Partial product 1504 for generator 18. -/
def ep_Q2_041_partial_18_1504 : Poly :=
[
  term ((-4750822432137460550 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 2), (13, 1)],
  term ((2375411216068730275 : Rat) / 259001945121800951) [(1, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1504 for generator 18. -/
theorem ep_Q2_041_partial_18_1504_valid :
    mulPoly ep_Q2_041_coefficient_18_1504
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1504 := by
  native_decide

/-- Coefficient term 1505 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1505 : Poly :=
[
  term ((7763720280615399732117994210166676566182875492208007317402781030 : Rat) / 17474732558945884144932315597195630681744541424384794072182327) [(1, 1), (11, 2), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1505 for generator 18. -/
def ep_Q2_041_partial_18_1505 : Poly :=
[
  term ((15527440561230799464235988420333353132365750984416014634805562060 : Rat) / 17474732558945884144932315597195630681744541424384794072182327) [(1, 1), (8, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-7763720280615399732117994210166676566182875492208007317402781030 : Rat) / 17474732558945884144932315597195630681744541424384794072182327) [(1, 1), (11, 2), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1505 for generator 18. -/
theorem ep_Q2_041_partial_18_1505_valid :
    mulPoly ep_Q2_041_coefficient_18_1505
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1505 := by
  native_decide

/-- Coefficient term 1506 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1506 : Poly :=
[
  term ((-41047105813667659152 : Rat) / 259001945121800951) [(1, 1), (11, 2), (13, 1), (14, 2)]
]

/-- Partial product 1506 for generator 18. -/
def ep_Q2_041_partial_18_1506 : Poly :=
[
  term ((-82094211627335318304 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 2), (13, 1), (14, 2)],
  term ((41047105813667659152 : Rat) / 259001945121800951) [(1, 1), (11, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1506 for generator 18. -/
theorem ep_Q2_041_partial_18_1506_valid :
    mulPoly ep_Q2_041_coefficient_18_1506
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1506 := by
  native_decide

/-- Coefficient term 1507 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1507 : Poly :=
[
  term ((-24826404861754743577216026060446224274773805292978561667966302520 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 2), (13, 1), (14, 2), (15, 2)]
]

/-- Partial product 1507 for generator 18. -/
def ep_Q2_041_partial_18_1507 : Poly :=
[
  term ((-49652809723509487154432052120892448549547610585957123335932605040 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 2), (13, 1), (14, 2), (15, 2)],
  term ((24826404861754743577216026060446224274773805292978561667966302520 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 2), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1507 for generator 18. -/
theorem ep_Q2_041_partial_18_1507_valid :
    mulPoly ep_Q2_041_coefficient_18_1507
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1507 := by
  native_decide

/-- Coefficient term 1508 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1508 : Poly :=
[
  term ((-2890149120 : Rat) / 151763803) [(1, 1), (11, 2), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 1508 for generator 18. -/
def ep_Q2_041_partial_18_1508 : Poly :=
[
  term ((-5780298240 : Rat) / 151763803) [(1, 1), (8, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((2890149120 : Rat) / 151763803) [(1, 1), (11, 2), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1508 for generator 18. -/
theorem ep_Q2_041_partial_18_1508_valid :
    mulPoly ep_Q2_041_coefficient_18_1508
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1508 := by
  native_decide

/-- Coefficient term 1509 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1509 : Poly :=
[
  term ((-599413767358070058245677437663228351461972402247173634128308620 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (11, 2), (13, 1), (15, 2)]
]

/-- Partial product 1509 for generator 18. -/
def ep_Q2_041_partial_18_1509 : Poly :=
[
  term ((-1198827534716140116491354875326456702923944804494347268256617240 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 1), (11, 2), (13, 1), (15, 2)],
  term ((599413767358070058245677437663228351461972402247173634128308620 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1509 for generator 18. -/
theorem ep_Q2_041_partial_18_1509_valid :
    mulPoly ep_Q2_041_coefficient_18_1509
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1509 := by
  native_decide

/-- Coefficient term 1510 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1510 : Poly :=
[
  term ((-167254000 : Rat) / 151763803) [(1, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 1510 for generator 18. -/
def ep_Q2_041_partial_18_1510 : Poly :=
[
  term ((-334508000 : Rat) / 151763803) [(1, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((167254000 : Rat) / 151763803) [(1, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1510 for generator 18. -/
theorem ep_Q2_041_partial_18_1510_valid :
    mulPoly ep_Q2_041_coefficient_18_1510
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1510 := by
  native_decide

/-- Coefficient term 1511 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1511 : Poly :=
[
  term ((404068361715504728399453251094746328526659267247060510713440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 2), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 1511 for generator 18. -/
def ep_Q2_041_partial_18_1511 : Poly :=
[
  term ((808136723431009456798906502189492657053318534494121021426880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-404068361715504728399453251094746328526659267247060510713440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 2), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1511 for generator 18. -/
theorem ep_Q2_041_partial_18_1511_valid :
    mulPoly ep_Q2_041_coefficient_18_1511
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1511 := by
  native_decide

/-- Coefficient term 1512 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1512 : Poly :=
[
  term ((-15287406710785240063006238788277328769845166356547699805178560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 2), (13, 2), (14, 2), (15, 1)]
]

/-- Partial product 1512 for generator 18. -/
def ep_Q2_041_partial_18_1512 : Poly :=
[
  term ((-30574813421570480126012477576554657539690332713095399610357120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (13, 2), (14, 2), (15, 1)],
  term ((15287406710785240063006238788277328769845166356547699805178560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 2), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1512 for generator 18. -/
theorem ep_Q2_041_partial_18_1512_valid :
    mulPoly ep_Q2_041_coefficient_18_1512
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1512 := by
  native_decide

/-- Coefficient term 1513 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1513 : Poly :=
[
  term ((-254418093918004452566666818247141744824831708508690544712380 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 2), (13, 2), (15, 1)]
]

/-- Partial product 1513 for generator 18. -/
def ep_Q2_041_partial_18_1513 : Poly :=
[
  term ((-508836187836008905133333636494283489649663417017381089424760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (13, 2), (15, 1)],
  term ((254418093918004452566666818247141744824831708508690544712380 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1513 for generator 18. -/
theorem ep_Q2_041_partial_18_1513_valid :
    mulPoly ep_Q2_041_coefficient_18_1513
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1513 := by
  native_decide

/-- Coefficient term 1514 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1514 : Poly :=
[
  term ((-24707161753878613579769888701221781336866730784615039165567384136078029919 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 1514 for generator 18. -/
def ep_Q2_041_partial_18_1514 : Poly :=
[
  term ((-24707161753878613579769888701221781336866730784615039165567384136078029919 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 2), (14, 1), (15, 1)],
  term ((24707161753878613579769888701221781336866730784615039165567384136078029919 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1514 for generator 18. -/
theorem ep_Q2_041_partial_18_1514_valid :
    mulPoly ep_Q2_041_coefficient_18_1514
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1514 := by
  native_decide

/-- Coefficient term 1515 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1515 : Poly :=
[
  term ((3628569228376 : Rat) / 275754830051) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1515 for generator 18. -/
def ep_Q2_041_partial_18_1515 : Poly :=
[
  term ((7257138456752 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3628569228376 : Rat) / 275754830051) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1515 for generator 18. -/
theorem ep_Q2_041_partial_18_1515_valid :
    mulPoly ep_Q2_041_coefficient_18_1515
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1515 := by
  native_decide

/-- Coefficient term 1516 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1516 : Poly :=
[
  term ((-283874858345991359555382817551696271493967453571748126758860910 : Rat) / 759770980823734093257926765095462203554110496712382350964449) [(1, 1), (11, 2), (14, 1), (15, 3)]
]

/-- Partial product 1516 for generator 18. -/
def ep_Q2_041_partial_18_1516 : Poly :=
[
  term ((-567749716691982719110765635103392542987934907143496253517721820 : Rat) / 759770980823734093257926765095462203554110496712382350964449) [(1, 1), (8, 1), (11, 2), (14, 1), (15, 3)],
  term ((283874858345991359555382817551696271493967453571748126758860910 : Rat) / 759770980823734093257926765095462203554110496712382350964449) [(1, 1), (11, 2), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1516 for generator 18. -/
theorem ep_Q2_041_partial_18_1516_valid :
    mulPoly ep_Q2_041_coefficient_18_1516
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1516 := by
  native_decide

/-- Coefficient term 1517 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1517 : Poly :=
[
  term ((3698108914481995037772151545566291255280454637876631576682164940161737155 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (11, 2), (14, 2), (15, 1)]
]

/-- Partial product 1517 for generator 18. -/
def ep_Q2_041_partial_18_1517 : Poly :=
[
  term ((3698108914481995037772151545566291255280454637876631576682164940161737155 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 2), (14, 2), (15, 1)],
  term ((-3698108914481995037772151545566291255280454637876631576682164940161737155 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (11, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1517 for generator 18. -/
theorem ep_Q2_041_partial_18_1517_valid :
    mulPoly ep_Q2_041_coefficient_18_1517
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1517 := by
  native_decide

/-- Coefficient term 1518 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1518 : Poly :=
[
  term ((-57142968588384 : Rat) / 275754830051) [(1, 1), (11, 2), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1518 for generator 18. -/
def ep_Q2_041_partial_18_1518 : Poly :=
[
  term ((-114285937176768 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((57142968588384 : Rat) / 275754830051) [(1, 1), (11, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1518 for generator 18. -/
theorem ep_Q2_041_partial_18_1518_valid :
    mulPoly ep_Q2_041_coefficient_18_1518
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1518 := by
  native_decide

/-- Coefficient term 1519 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1519 : Poly :=
[
  term ((983386969864941428964727354372412579135876314802758883661637600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 2), (14, 2), (15, 3)]
]

/-- Partial product 1519 for generator 18. -/
def ep_Q2_041_partial_18_1519 : Poly :=
[
  term ((1966773939729882857929454708744825158271752629605517767323275200 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 2), (14, 2), (15, 3)],
  term ((-983386969864941428964727354372412579135876314802758883661637600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 2), (14, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1519 for generator 18. -/
theorem ep_Q2_041_partial_18_1519_valid :
    mulPoly ep_Q2_041_coefficient_18_1519
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1519 := by
  native_decide

/-- Coefficient term 1520 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1520 : Poly :=
[
  term ((-712693263064363844427311623563740859334706356978886456803440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 2), (14, 3), (15, 1)]
]

/-- Partial product 1520 for generator 18. -/
def ep_Q2_041_partial_18_1520 : Poly :=
[
  term ((-1425386526128727688854623247127481718669412713957772913606880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (14, 3), (15, 1)],
  term ((712693263064363844427311623563740859334706356978886456803440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 2), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1520 for generator 18. -/
theorem ep_Q2_041_partial_18_1520_valid :
    mulPoly ep_Q2_041_coefficient_18_1520
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1520 := by
  native_decide

/-- Coefficient term 1521 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1521 : Poly :=
[
  term ((447364131677087943808155909176435850396283268296150438583890600862139672 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (11, 2), (15, 1)]
]

/-- Partial product 1521 for generator 18. -/
def ep_Q2_041_partial_18_1521 : Poly :=
[
  term ((894728263354175887616311818352871700792566536592300877167781201724279344 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((-447364131677087943808155909176435850396283268296150438583890600862139672 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1521 for generator 18. -/
theorem ep_Q2_041_partial_18_1521_valid :
    mulPoly ep_Q2_041_coefficient_18_1521
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1521 := by
  native_decide

/-- Coefficient term 1522 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1522 : Poly :=
[
  term ((-1828819842040 : Rat) / 275754830051) [(1, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 1522 for generator 18. -/
def ep_Q2_041_partial_18_1522 : Poly :=
[
  term ((-3657639684080 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((1828819842040 : Rat) / 275754830051) [(1, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1522 for generator 18. -/
theorem ep_Q2_041_partial_18_1522_valid :
    mulPoly ep_Q2_041_coefficient_18_1522
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1522 := by
  native_decide

/-- Coefficient term 1523 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1523 : Poly :=
[
  term ((295170140892872265627738181933094838696537721878974978855031270 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 2), (15, 3)]
]

/-- Partial product 1523 for generator 18. -/
def ep_Q2_041_partial_18_1523 : Poly :=
[
  term ((590340281785744531255476363866189677393075443757949957710062540 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 2), (15, 3)],
  term ((-295170140892872265627738181933094838696537721878974978855031270 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1523 for generator 18. -/
theorem ep_Q2_041_partial_18_1523_valid :
    mulPoly ep_Q2_041_coefficient_18_1523
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1523 := by
  native_decide

/-- Coefficient term 1524 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1524 : Poly :=
[
  term ((65198162317674720695377127562823313059745713080980146227475700 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 3), (12, 1), (15, 2)]
]

/-- Partial product 1524 for generator 18. -/
def ep_Q2_041_partial_18_1524 : Poly :=
[
  term ((130396324635349441390754255125646626119491426161960292454951400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 3), (12, 1), (15, 2)],
  term ((-65198162317674720695377127562823313059745713080980146227475700 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 3), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1524 for generator 18. -/
theorem ep_Q2_041_partial_18_1524_valid :
    mulPoly ep_Q2_041_coefficient_18_1524
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1524 := by
  native_decide

/-- Coefficient term 1525 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1525 : Poly :=
[
  term ((-1179442785547959747760566246438719012996735158450879328568960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 3), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 1525 for generator 18. -/
def ep_Q2_041_partial_18_1525 : Poly :=
[
  term ((-2358885571095919495521132492877438025993470316901758657137920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 3), (13, 1), (14, 2), (15, 1)],
  term ((1179442785547959747760566246438719012996735158450879328568960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 3), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1525 for generator 18. -/
theorem ep_Q2_041_partial_18_1525_valid :
    mulPoly ep_Q2_041_coefficient_18_1525
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1525 := by
  native_decide

/-- Coefficient term 1526 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1526 : Poly :=
[
  term ((-68254790830321744662069805928166609548422173521462924107000 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 3), (13, 1), (15, 1)]
]

/-- Partial product 1526 for generator 18. -/
def ep_Q2_041_partial_18_1526 : Poly :=
[
  term ((-136509581660643489324139611856333219096844347042925848214000 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 3), (13, 1), (15, 1)],
  term ((68254790830321744662069805928166609548422173521462924107000 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1526 for generator 18. -/
theorem ep_Q2_041_partial_18_1526_valid :
    mulPoly ep_Q2_041_coefficient_18_1526
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1526 := by
  native_decide

/-- Coefficient term 1527 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1527 : Poly :=
[
  term ((-10024099343632392479657403452591790940370558673110369736034760 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (11, 3), (14, 1), (15, 2)]
]

/-- Partial product 1527 for generator 18. -/
def ep_Q2_041_partial_18_1527 : Poly :=
[
  term ((-20048198687264784959314806905183581880741117346220739472069520 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (8, 1), (11, 3), (14, 1), (15, 2)],
  term ((10024099343632392479657403452591790940370558673110369736034760 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (11, 3), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1527 for generator 18. -/
theorem ep_Q2_041_partial_18_1527_valid :
    mulPoly ep_Q2_041_coefficient_18_1527
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1527 := by
  native_decide

/-- Coefficient term 1528 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1528 : Poly :=
[
  term ((146505685262914918021046476074594047328488307911550445263387400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (11, 3), (14, 2), (15, 2)]
]

/-- Partial product 1528 for generator 18. -/
def ep_Q2_041_partial_18_1528 : Poly :=
[
  term ((293011370525829836042092952149188094656976615823100890526774800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (8, 1), (11, 3), (14, 2), (15, 2)],
  term ((-146505685262914918021046476074594047328488307911550445263387400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (11, 3), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1528 for generator 18. -/
theorem ep_Q2_041_partial_18_1528_valid :
    mulPoly ep_Q2_041_coefficient_18_1528
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1528 := by
  native_decide

/-- Coefficient term 1529 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1529 : Poly :=
[
  term ((66838130960102499371074519636579179004439156466692504831314320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 3), (15, 2)]
]

/-- Partial product 1529 for generator 18. -/
def ep_Q2_041_partial_18_1529 : Poly :=
[
  term ((133676261920204998742149039273158358008878312933385009662628640 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 3), (15, 2)],
  term ((-66838130960102499371074519636579179004439156466692504831314320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1529 for generator 18. -/
theorem ep_Q2_041_partial_18_1529_valid :
    mulPoly ep_Q2_041_coefficient_18_1529
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1529 := by
  native_decide

/-- Coefficient term 1530 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1530 : Poly :=
[
  term ((-44759580645145906181 : Rat) / 259001945121800951) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 1530 for generator 18. -/
def ep_Q2_041_partial_18_1530 : Poly :=
[
  term ((-89519161290291812362 : Rat) / 259001945121800951) [(1, 1), (8, 1), (12, 1), (13, 1)],
  term ((44759580645145906181 : Rat) / 259001945121800951) [(1, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1530 for generator 18. -/
theorem ep_Q2_041_partial_18_1530_valid :
    mulPoly ep_Q2_041_coefficient_18_1530
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1530 := by
  native_decide

/-- Coefficient term 1531 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1531 : Poly :=
[
  term ((119911966386416342912 : Rat) / 259001945121800951) [(1, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1531 for generator 18. -/
def ep_Q2_041_partial_18_1531 : Poly :=
[
  term ((239823932772832685824 : Rat) / 259001945121800951) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-119911966386416342912 : Rat) / 259001945121800951) [(1, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1531 for generator 18. -/
theorem ep_Q2_041_partial_18_1531_valid :
    mulPoly ep_Q2_041_coefficient_18_1531
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1531 := by
  native_decide

/-- Coefficient term 1532 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1532 : Poly :=
[
  term ((-55820070801092195389107951077861199705646997557826848475992873756807945 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1532 for generator 18. -/
def ep_Q2_041_partial_18_1532 : Poly :=
[
  term ((-111640141602184390778215902155722399411293995115653696951985747513615890 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((55820070801092195389107951077861199705646997557826848475992873756807945 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1532 for generator 18. -/
theorem ep_Q2_041_partial_18_1532_valid :
    mulPoly ep_Q2_041_coefficient_18_1532
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1532 := by
  native_decide

/-- Coefficient term 1533 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1533 : Poly :=
[
  term ((-51333425137344 : Rat) / 275754830051) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1533 for generator 18. -/
def ep_Q2_041_partial_18_1533 : Poly :=
[
  term ((-102666850274688 : Rat) / 275754830051) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((51333425137344 : Rat) / 275754830051) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1533 for generator 18. -/
theorem ep_Q2_041_partial_18_1533_valid :
    mulPoly ep_Q2_041_coefficient_18_1533
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1533 := by
  native_decide

/-- Coefficient term 1534 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1534 : Poly :=
[
  term ((10848303860 : Rat) / 151763803) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1534 for generator 18. -/
def ep_Q2_041_partial_18_1534 : Poly :=
[
  term ((21696607720 : Rat) / 151763803) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-10848303860 : Rat) / 151763803) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1534 for generator 18. -/
theorem ep_Q2_041_partial_18_1534_valid :
    mulPoly ep_Q2_041_coefficient_18_1534
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1534 := by
  native_decide

/-- Coefficient term 1535 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1535 : Poly :=
[
  term ((-46938125629518110234 : Rat) / 259001945121800951) [(1, 1), (12, 1), (13, 1), (14, 2)]
]

/-- Partial product 1535 for generator 18. -/
def ep_Q2_041_partial_18_1535 : Poly :=
[
  term ((-93876251259036220468 : Rat) / 259001945121800951) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 2)],
  term ((46938125629518110234 : Rat) / 259001945121800951) [(1, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1535 for generator 18. -/
theorem ep_Q2_041_partial_18_1535_valid :
    mulPoly ep_Q2_041_coefficient_18_1535
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1535 := by
  native_decide

/-- Coefficient term 1536 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1536 : Poly :=
[
  term ((111260245350359142298445045730706065863391612072583687614548890 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (12, 1), (13, 1), (14, 2), (15, 2)]
]

/-- Partial product 1536 for generator 18. -/
def ep_Q2_041_partial_18_1536 : Poly :=
[
  term ((222520490700718284596890091461412131726783224145167375229097780 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((-111260245350359142298445045730706065863391612072583687614548890 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (12, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1536 for generator 18. -/
theorem ep_Q2_041_partial_18_1536_valid :
    mulPoly ep_Q2_041_coefficient_18_1536
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1536 := by
  native_decide

/-- Coefficient term 1537 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1537 : Poly :=
[
  term ((-3304939040 : Rat) / 151763803) [(1, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 1537 for generator 18. -/
def ep_Q2_041_partial_18_1537 : Poly :=
[
  term ((-6609878080 : Rat) / 151763803) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((3304939040 : Rat) / 151763803) [(1, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1537 for generator 18. -/
theorem ep_Q2_041_partial_18_1537_valid :
    mulPoly ep_Q2_041_coefficient_18_1537
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1537 := by
  native_decide

/-- Coefficient term 1538 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1538 : Poly :=
[
  term ((-3560798019505834622466641843545926672565039434824942827162777209891979229 : Rat) / 7072084985476130797419550380337666792653424749481795423376657213092216) [(1, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1538 for generator 18. -/
def ep_Q2_041_partial_18_1538 : Poly :=
[
  term ((-3560798019505834622466641843545926672565039434824942827162777209891979229 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((3560798019505834622466641843545926672565039434824942827162777209891979229 : Rat) / 7072084985476130797419550380337666792653424749481795423376657213092216) [(1, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1538 for generator 18. -/
theorem ep_Q2_041_partial_18_1538_valid :
    mulPoly ep_Q2_041_coefficient_18_1538
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1538 := by
  native_decide

/-- Coefficient term 1539 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1539 : Poly :=
[
  term ((-90719812152616 : Rat) / 275754830051) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1539 for generator 18. -/
def ep_Q2_041_partial_18_1539 : Poly :=
[
  term ((-181439624305232 : Rat) / 275754830051) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((90719812152616 : Rat) / 275754830051) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1539 for generator 18. -/
theorem ep_Q2_041_partial_18_1539_valid :
    mulPoly ep_Q2_041_coefficient_18_1539
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1539 := by
  native_decide

/-- Coefficient term 1540 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1540 : Poly :=
[
  term ((-136864550909094988085982278432475786254262550604843741516740740 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (12, 1), (13, 1), (15, 4)]
]

/-- Partial product 1540 for generator 18. -/
def ep_Q2_041_partial_18_1540 : Poly :=
[
  term ((-273729101818189976171964556864951572508525101209687483033481480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 4)],
  term ((136864550909094988085982278432475786254262550604843741516740740 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (12, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1540 for generator 18. -/
theorem ep_Q2_041_partial_18_1540_valid :
    mulPoly ep_Q2_041_coefficient_18_1540
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1540 := by
  native_decide

/-- Coefficient term 1541 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1541 : Poly :=
[
  term ((-4023936368 : Rat) / 151763803) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1541 for generator 18. -/
def ep_Q2_041_partial_18_1541 : Poly :=
[
  term ((-8047872736 : Rat) / 151763803) [(1, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((4023936368 : Rat) / 151763803) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1541 for generator 18. -/
theorem ep_Q2_041_partial_18_1541_valid :
    mulPoly ep_Q2_041_coefficient_18_1541
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1541 := by
  native_decide

/-- Coefficient term 1542 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1542 : Poly :=
[
  term ((-4979584475402280018480935574626348030566480932445011200739500624880044 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 1542 for generator 18. -/
def ep_Q2_041_partial_18_1542 : Poly :=
[
  term ((-9959168950804560036961871149252696061132961864890022401479001249760088 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((4979584475402280018480935574626348030566480932445011200739500624880044 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1542 for generator 18. -/
theorem ep_Q2_041_partial_18_1542_valid :
    mulPoly ep_Q2_041_coefficient_18_1542
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1542 := by
  native_decide

/-- Coefficient term 1543 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1543 : Poly :=
[
  term ((-26439512320 : Rat) / 151763803) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1543 for generator 18. -/
def ep_Q2_041_partial_18_1543 : Poly :=
[
  term ((-52879024640 : Rat) / 151763803) [(1, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((26439512320 : Rat) / 151763803) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1543 for generator 18. -/
theorem ep_Q2_041_partial_18_1543_valid :
    mulPoly ep_Q2_041_coefficient_18_1543
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1543 := by
  native_decide

/-- Coefficient term 1544 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1544 : Poly :=
[
  term ((290637686990563629639267758078774953568586686837702381643386960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 3)]
]

/-- Partial product 1544 for generator 18. -/
def ep_Q2_041_partial_18_1544 : Poly :=
[
  term ((581275373981127259278535516157549907137173373675404763286773920 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 3)],
  term ((-290637686990563629639267758078774953568586686837702381643386960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1544 for generator 18. -/
theorem ep_Q2_041_partial_18_1544_valid :
    mulPoly ep_Q2_041_coefficient_18_1544
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1544 := by
  native_decide

/-- Coefficient term 1545 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1545 : Poly :=
[
  term ((151762784719717487449061233576276388220322491199247177043960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (12, 1), (13, 2), (14, 2), (15, 1)]
]

/-- Partial product 1545 for generator 18. -/
def ep_Q2_041_partial_18_1545 : Poly :=
[
  term ((303525569439434974898122467152552776440644982398494354087920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (12, 1), (13, 2), (14, 2), (15, 1)],
  term ((-151762784719717487449061233576276388220322491199247177043960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (12, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1545 for generator 18. -/
theorem ep_Q2_041_partial_18_1545_valid :
    mulPoly ep_Q2_041_coefficient_18_1545
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1545 := by
  native_decide

/-- Coefficient term 1546 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1546 : Poly :=
[
  term ((2420357934942095294342784555259643466895369555670197134668696331191584 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 1546 for generator 18. -/
def ep_Q2_041_partial_18_1546 : Poly :=
[
  term ((4840715869884190588685569110519286933790739111340394269337392662383168 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((-2420357934942095294342784555259643466895369555670197134668696331191584 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1546 for generator 18. -/
theorem ep_Q2_041_partial_18_1546_valid :
    mulPoly ep_Q2_041_coefficient_18_1546
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1546 := by
  native_decide

/-- Coefficient term 1547 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1547 : Poly :=
[
  term ((12858487520 : Rat) / 151763803) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1547 for generator 18. -/
def ep_Q2_041_partial_18_1547 : Poly :=
[
  term ((25716975040 : Rat) / 151763803) [(1, 1), (8, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-12858487520 : Rat) / 151763803) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1547 for generator 18. -/
theorem ep_Q2_041_partial_18_1547_valid :
    mulPoly ep_Q2_041_coefficient_18_1547
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1547 := by
  native_decide

/-- Coefficient term 1548 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1548 : Poly :=
[
  term ((1181148265088361961895019790670440195459876596561766756439489910 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (12, 1), (13, 2), (15, 3)]
]

/-- Partial product 1548 for generator 18. -/
def ep_Q2_041_partial_18_1548 : Poly :=
[
  term ((2362296530176723923790039581340880390919753193123533512878979820 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (12, 1), (13, 2), (15, 3)],
  term ((-1181148265088361961895019790670440195459876596561766756439489910 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (12, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1548 for generator 18. -/
theorem ep_Q2_041_partial_18_1548_valid :
    mulPoly ep_Q2_041_coefficient_18_1548
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1548 := by
  native_decide

/-- Coefficient term 1549 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1549 : Poly :=
[
  term ((1214102277757739899592489868610211105762579929593977416351680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (12, 1), (13, 3), (14, 1), (15, 2)]
]

/-- Partial product 1549 for generator 18. -/
def ep_Q2_041_partial_18_1549 : Poly :=
[
  term ((2428204555515479799184979737220422211525159859187954832703360 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (12, 1), (13, 3), (14, 1), (15, 2)],
  term ((-1214102277757739899592489868610211105762579929593977416351680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (12, 1), (13, 3), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1549 for generator 18. -/
theorem ep_Q2_041_partial_18_1549_valid :
    mulPoly ep_Q2_041_coefficient_18_1549
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1549 := by
  native_decide

/-- Coefficient term 1550 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1550 : Poly :=
[
  term ((-590461684678738888415173463428346595464493579119338207041480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (12, 1), (13, 3), (15, 2)]
]

/-- Partial product 1550 for generator 18. -/
def ep_Q2_041_partial_18_1550 : Poly :=
[
  term ((-1180923369357477776830346926856693190928987158238676414082960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (12, 1), (13, 3), (15, 2)],
  term ((590461684678738888415173463428346595464493579119338207041480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (12, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1550 for generator 18. -/
theorem ep_Q2_041_partial_18_1550_valid :
    mulPoly ep_Q2_041_coefficient_18_1550
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1550 := by
  native_decide

/-- Coefficient term 1551 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1551 : Poly :=
[
  term ((-2487248895380486086584148003565818682775096023502699234602126850753344011 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1551 for generator 18. -/
def ep_Q2_041_partial_18_1551 : Poly :=
[
  term ((-2487248895380486086584148003565818682775096023502699234602126850753344011 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((2487248895380486086584148003565818682775096023502699234602126850753344011 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1551 for generator 18. -/
theorem ep_Q2_041_partial_18_1551_valid :
    mulPoly ep_Q2_041_coefficient_18_1551
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1551 := by
  native_decide

/-- Coefficient term 1552 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1552 : Poly :=
[
  term ((-58221042284076 : Rat) / 275754830051) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1552 for generator 18. -/
def ep_Q2_041_partial_18_1552 : Poly :=
[
  term ((-116442084568152 : Rat) / 275754830051) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((58221042284076 : Rat) / 275754830051) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1552 for generator 18. -/
theorem ep_Q2_041_partial_18_1552_valid :
    mulPoly ep_Q2_041_coefficient_18_1552
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1552 := by
  native_decide

/-- Coefficient term 1553 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1553 : Poly :=
[
  term ((-1310688424775090342971560438414898139981971534672112656639030968604762261 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (12, 1), (14, 2), (15, 1)]
]

/-- Partial product 1553 for generator 18. -/
def ep_Q2_041_partial_18_1553 : Poly :=
[
  term ((-1310688424775090342971560438414898139981971534672112656639030968604762261 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((1310688424775090342971560438414898139981971534672112656639030968604762261 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1553 for generator 18. -/
theorem ep_Q2_041_partial_18_1553_valid :
    mulPoly ep_Q2_041_coefficient_18_1553
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1553 := by
  native_decide

/-- Coefficient term 1554 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1554 : Poly :=
[
  term ((-7317018634752 : Rat) / 275754830051) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1554 for generator 18. -/
def ep_Q2_041_partial_18_1554 : Poly :=
[
  term ((-14634037269504 : Rat) / 275754830051) [(1, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((7317018634752 : Rat) / 275754830051) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1554 for generator 18. -/
theorem ep_Q2_041_partial_18_1554_valid :
    mulPoly ep_Q2_041_coefficient_18_1554
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1554 := by
  native_decide

/-- Coefficient term 1555 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1555 : Poly :=
[
  term ((-29751260409178842115854907572546548170789774551224938595534824671732399851 : Rat) / 99009189796665831163873705324727335097147946492745135927273200983291024) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 1555 for generator 18. -/
def ep_Q2_041_partial_18_1555 : Poly :=
[
  term ((-29751260409178842115854907572546548170789774551224938595534824671732399851 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (8, 1), (12, 1), (15, 1)],
  term ((29751260409178842115854907572546548170789774551224938595534824671732399851 : Rat) / 99009189796665831163873705324727335097147946492745135927273200983291024) [(1, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1555 for generator 18. -/
theorem ep_Q2_041_partial_18_1555_valid :
    mulPoly ep_Q2_041_coefficient_18_1555
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1555 := by
  native_decide

/-- Coefficient term 1556 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1556 : Poly :=
[
  term ((21330863250365 : Rat) / 275754830051) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1556 for generator 18. -/
def ep_Q2_041_partial_18_1556 : Poly :=
[
  term ((42661726500730 : Rat) / 275754830051) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21330863250365 : Rat) / 275754830051) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1556 for generator 18. -/
theorem ep_Q2_041_partial_18_1556_valid :
    mulPoly ep_Q2_041_coefficient_18_1556
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1556 := by
  native_decide

/-- Coefficient term 1557 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1557 : Poly :=
[
  term ((-318749461262385008012649061204207973554832967913113485513016869124740483 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (12, 1), (15, 3)]
]

/-- Partial product 1557 for generator 18. -/
def ep_Q2_041_partial_18_1557 : Poly :=
[
  term ((-318749461262385008012649061204207973554832967913113485513016869124740483 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (12, 1), (15, 3)],
  term ((318749461262385008012649061204207973554832967913113485513016869124740483 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1557 for generator 18. -/
theorem ep_Q2_041_partial_18_1557_valid :
    mulPoly ep_Q2_041_coefficient_18_1557
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1557 := by
  native_decide

/-- Coefficient term 1558 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1558 : Poly :=
[
  term ((36507633926280 : Rat) / 275754830051) [(1, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1558 for generator 18. -/
def ep_Q2_041_partial_18_1558 : Poly :=
[
  term ((73015267852560 : Rat) / 275754830051) [(1, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-36507633926280 : Rat) / 275754830051) [(1, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1558 for generator 18. -/
theorem ep_Q2_041_partial_18_1558_valid :
    mulPoly ep_Q2_041_coefficient_18_1558
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1558 := by
  native_decide

/-- Coefficient term 1559 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1559 : Poly :=
[
  term ((13017253464056641907 : Rat) / 259001945121800951) [(1, 1), (12, 2), (13, 1)]
]

/-- Partial product 1559 for generator 18. -/
def ep_Q2_041_partial_18_1559 : Poly :=
[
  term ((26034506928113283814 : Rat) / 259001945121800951) [(1, 1), (8, 1), (12, 2), (13, 1)],
  term ((-13017253464056641907 : Rat) / 259001945121800951) [(1, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1559 for generator 18. -/
theorem ep_Q2_041_partial_18_1559_valid :
    mulPoly ep_Q2_041_coefficient_18_1559
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1559 := by
  native_decide

/-- Coefficient term 1560 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1560 : Poly :=
[
  term ((4415620138551687264684779938408141237921478785963138383058810120565947314 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (12, 2), (13, 1), (15, 2)]
]

/-- Partial product 1560 for generator 18. -/
def ep_Q2_041_partial_18_1560 : Poly :=
[
  term ((8831240277103374529369559876816282475842957571926276766117620241131894628 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (12, 2), (13, 1), (15, 2)],
  term ((-4415620138551687264684779938408141237921478785963138383058810120565947314 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (12, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1560 for generator 18. -/
theorem ep_Q2_041_partial_18_1560_valid :
    mulPoly ep_Q2_041_coefficient_18_1560
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1560 := by
  native_decide

/-- Coefficient term 1561 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1561 : Poly :=
[
  term ((13219756160 : Rat) / 151763803) [(1, 1), (12, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1561 for generator 18. -/
def ep_Q2_041_partial_18_1561 : Poly :=
[
  term ((26439512320 : Rat) / 151763803) [(1, 1), (8, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-13219756160 : Rat) / 151763803) [(1, 1), (12, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1561 for generator 18. -/
theorem ep_Q2_041_partial_18_1561_valid :
    mulPoly ep_Q2_041_coefficient_18_1561
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1561 := by
  native_decide

/-- Coefficient term 1562 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1562 : Poly :=
[
  term ((-145318843495281814819633879039387476784293343418851190821693480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (12, 2), (13, 1), (15, 4)]
]

/-- Partial product 1562 for generator 18. -/
def ep_Q2_041_partial_18_1562 : Poly :=
[
  term ((-290637686990563629639267758078774953568586686837702381643386960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (12, 2), (13, 1), (15, 4)],
  term ((145318843495281814819633879039387476784293343418851190821693480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (12, 2), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1562 for generator 18. -/
theorem ep_Q2_041_partial_18_1562_valid :
    mulPoly ep_Q2_041_coefficient_18_1562
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1562 := by
  native_decide

/-- Coefficient term 1563 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1563 : Poly :=
[
  term ((916551920 : Rat) / 151763803) [(1, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 1563 for generator 18. -/
def ep_Q2_041_partial_18_1563 : Poly :=
[
  term ((1833103840 : Rat) / 151763803) [(1, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((-916551920 : Rat) / 151763803) [(1, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1563 for generator 18. -/
theorem ep_Q2_041_partial_18_1563_valid :
    mulPoly ep_Q2_041_coefficient_18_1563
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1563 := by
  native_decide

/-- Coefficient term 1564 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1564 : Poly :=
[
  term ((-42088059729962137207533176113258836409279719219224419544580 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (12, 2), (13, 2), (15, 1)]
]

/-- Partial product 1564 for generator 18. -/
def ep_Q2_041_partial_18_1564 : Poly :=
[
  term ((-84176119459924274415066352226517672818559438438448839089160 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (12, 2), (13, 2), (15, 1)],
  term ((42088059729962137207533176113258836409279719219224419544580 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (12, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1564 for generator 18. -/
theorem ep_Q2_041_partial_18_1564_valid :
    mulPoly ep_Q2_041_coefficient_18_1564
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1564 := by
  native_decide

/-- Coefficient term 1565 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1565 : Poly :=
[
  term ((-607051138878869949796244934305105552881289964796988708175840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (12, 2), (13, 2), (15, 3)]
]

/-- Partial product 1565 for generator 18. -/
def ep_Q2_041_partial_18_1565 : Poly :=
[
  term ((-1214102277757739899592489868610211105762579929593977416351680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (12, 2), (13, 2), (15, 3)],
  term ((607051138878869949796244934305105552881289964796988708175840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (12, 2), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1565 for generator 18. -/
theorem ep_Q2_041_partial_18_1565_valid :
    mulPoly ep_Q2_041_coefficient_18_1565
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1565 := by
  native_decide

/-- Coefficient term 1566 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1566 : Poly :=
[
  term ((201471385811814737034578874853085447007032092467242590596872913592617289 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 1), (12, 2), (15, 1)]
]

/-- Partial product 1566 for generator 18. -/
def ep_Q2_041_partial_18_1566 : Poly :=
[
  term ((201471385811814737034578874853085447007032092467242590596872913592617289 : Rat) / 1768021246369032699354887595084416698163356187370448855844164303273054) [(1, 1), (8, 1), (12, 2), (15, 1)],
  term ((-201471385811814737034578874853085447007032092467242590596872913592617289 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1566 for generator 18. -/
theorem ep_Q2_041_partial_18_1566_valid :
    mulPoly ep_Q2_041_coefficient_18_1566
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1566 := by
  native_decide

/-- Coefficient term 1567 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1567 : Poly :=
[
  term ((24592019787924 : Rat) / 275754830051) [(1, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1567 for generator 18. -/
def ep_Q2_041_partial_18_1567 : Poly :=
[
  term ((49184039575848 : Rat) / 275754830051) [(1, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-24592019787924 : Rat) / 275754830051) [(1, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1567 for generator 18. -/
theorem ep_Q2_041_partial_18_1567_valid :
    mulPoly ep_Q2_041_coefficient_18_1567
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1567 := by
  native_decide

/-- Coefficient term 1568 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1568 : Poly :=
[
  term ((14997105462506511390078102866122788255007952787771030870137641064432675 : Rat) / 1768021246369032699354887595084416698163356187370448855844164303273054) [(1, 1), (12, 2), (15, 3)]
]

/-- Partial product 1568 for generator 18. -/
def ep_Q2_041_partial_18_1568 : Poly :=
[
  term ((14997105462506511390078102866122788255007952787771030870137641064432675 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (8, 1), (12, 2), (15, 3)],
  term ((-14997105462506511390078102866122788255007952787771030870137641064432675 : Rat) / 1768021246369032699354887595084416698163356187370448855844164303273054) [(1, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1568 for generator 18. -/
theorem ep_Q2_041_partial_18_1568_valid :
    mulPoly ep_Q2_041_coefficient_18_1568
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1568 := by
  native_decide

/-- Coefficient term 1569 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1569 : Poly :=
[
  term ((25666712568672 : Rat) / 275754830051) [(1, 1), (12, 2), (15, 3), (16, 1)]
]

/-- Partial product 1569 for generator 18. -/
def ep_Q2_041_partial_18_1569 : Poly :=
[
  term ((51333425137344 : Rat) / 275754830051) [(1, 1), (8, 1), (12, 2), (15, 3), (16, 1)],
  term ((-25666712568672 : Rat) / 275754830051) [(1, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1569 for generator 18. -/
theorem ep_Q2_041_partial_18_1569_valid :
    mulPoly ep_Q2_041_coefficient_18_1569
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1569 := by
  native_decide

/-- Coefficient term 1570 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1570 : Poly :=
[
  term ((-48634906947848518841 : Rat) / 259001945121800951) [(1, 1), (13, 1)]
]

/-- Partial product 1570 for generator 18. -/
def ep_Q2_041_partial_18_1570 : Poly :=
[
  term ((-97269813895697037682 : Rat) / 259001945121800951) [(1, 1), (8, 1), (13, 1)],
  term ((48634906947848518841 : Rat) / 259001945121800951) [(1, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1570 for generator 18. -/
theorem ep_Q2_041_partial_18_1570_valid :
    mulPoly ep_Q2_041_coefficient_18_1570
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1570 := by
  native_decide

/-- Coefficient term 1571 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1571 : Poly :=
[
  term ((223050112242421389271 : Rat) / 518003890243601902) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 1571 for generator 18. -/
def ep_Q2_041_partial_18_1571 : Poly :=
[
  term ((223050112242421389271 : Rat) / 259001945121800951) [(1, 1), (8, 1), (13, 1), (14, 1)],
  term ((-223050112242421389271 : Rat) / 518003890243601902) [(1, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1571 for generator 18. -/
theorem ep_Q2_041_partial_18_1571_valid :
    mulPoly ep_Q2_041_coefficient_18_1571
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1571 := by
  native_decide

/-- Coefficient term 1572 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1572 : Poly :=
[
  term ((-18215598351330834771216619204664568207105559247460596042655461335885215181 : Rat) / 148513784694998746745810557987091002645721919739117703890909801474936536) [(1, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1572 for generator 18. -/
def ep_Q2_041_partial_18_1572 : Poly :=
[
  term ((-18215598351330834771216619204664568207105559247460596042655461335885215181 : Rat) / 74256892347499373372905278993545501322860959869558851945454900737468268) [(1, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((18215598351330834771216619204664568207105559247460596042655461335885215181 : Rat) / 148513784694998746745810557987091002645721919739117703890909801474936536) [(1, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1572 for generator 18. -/
theorem ep_Q2_041_partial_18_1572_valid :
    mulPoly ep_Q2_041_coefficient_18_1572
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1572 := by
  native_decide

/-- Coefficient term 1573 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1573 : Poly :=
[
  term ((-137549583165184 : Rat) / 827264490153) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1573 for generator 18. -/
def ep_Q2_041_partial_18_1573 : Poly :=
[
  term ((-275099166330368 : Rat) / 827264490153) [(1, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((137549583165184 : Rat) / 827264490153) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1573 for generator 18. -/
theorem ep_Q2_041_partial_18_1573_valid :
    mulPoly ep_Q2_041_coefficient_18_1573
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1573 := by
  native_decide

/-- Coefficient term 1574 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1574 : Poly :=
[
  term ((1982838492180278650451812222264748941290563310983914844727437780 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (13, 1), (14, 1), (15, 4)]
]

/-- Partial product 1574 for generator 18. -/
def ep_Q2_041_partial_18_1574 : Poly :=
[
  term ((3965676984360557300903624444529497882581126621967829689454875560 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (8, 1), (13, 1), (14, 1), (15, 4)],
  term ((-1982838492180278650451812222264748941290563310983914844727437780 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (13, 1), (14, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1574 for generator 18. -/
theorem ep_Q2_041_partial_18_1574_valid :
    mulPoly ep_Q2_041_coefficient_18_1574
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1574 := by
  native_decide

/-- Coefficient term 1575 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1575 : Poly :=
[
  term ((4075355809 : Rat) / 151763803) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1575 for generator 18. -/
def ep_Q2_041_partial_18_1575 : Poly :=
[
  term ((8150711618 : Rat) / 151763803) [(1, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4075355809 : Rat) / 151763803) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1575 for generator 18. -/
theorem ep_Q2_041_partial_18_1575_valid :
    mulPoly ep_Q2_041_coefficient_18_1575
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1575 := by
  native_decide

/-- Coefficient term 1576 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1576 : Poly :=
[
  term ((-136804249563975418419 : Rat) / 259001945121800951) [(1, 1), (13, 1), (14, 2)]
]

/-- Partial product 1576 for generator 18. -/
def ep_Q2_041_partial_18_1576 : Poly :=
[
  term ((-273608499127950836838 : Rat) / 259001945121800951) [(1, 1), (8, 1), (13, 1), (14, 2)],
  term ((136804249563975418419 : Rat) / 259001945121800951) [(1, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1576 for generator 18. -/
theorem ep_Q2_041_partial_18_1576_valid :
    mulPoly ep_Q2_041_coefficient_18_1576
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1576 := by
  native_decide

/-- Coefficient term 1577 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1577 : Poly :=
[
  term ((1341902978584676574285015311652795950457365500527187897677436270 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (13, 1), (14, 2), (15, 2)]
]

/-- Partial product 1577 for generator 18. -/
def ep_Q2_041_partial_18_1577 : Poly :=
[
  term ((2683805957169353148570030623305591900914731001054375795354872540 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (13, 1), (14, 2), (15, 2)],
  term ((-1341902978584676574285015311652795950457365500527187897677436270 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1577 for generator 18. -/
theorem ep_Q2_041_partial_18_1577_valid :
    mulPoly ep_Q2_041_coefficient_18_1577
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1577 := by
  native_decide

/-- Coefficient term 1578 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1578 : Poly :=
[
  term ((-7901817838 : Rat) / 151763803) [(1, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 1578 for generator 18. -/
def ep_Q2_041_partial_18_1578 : Poly :=
[
  term ((-15803635676 : Rat) / 151763803) [(1, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((7901817838 : Rat) / 151763803) [(1, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1578 for generator 18. -/
theorem ep_Q2_041_partial_18_1578_valid :
    mulPoly ep_Q2_041_coefficient_18_1578
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1578 := by
  native_decide

/-- Coefficient term 1579 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1579 : Poly :=
[
  term ((177221761614347365210 : Rat) / 777005835365402853) [(1, 1), (13, 1), (14, 3)]
]

/-- Partial product 1579 for generator 18. -/
def ep_Q2_041_partial_18_1579 : Poly :=
[
  term ((354443523228694730420 : Rat) / 777005835365402853) [(1, 1), (8, 1), (13, 1), (14, 3)],
  term ((-177221761614347365210 : Rat) / 777005835365402853) [(1, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1579 for generator 18. -/
theorem ep_Q2_041_partial_18_1579_valid :
    mulPoly ep_Q2_041_coefficient_18_1579
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1579 := by
  native_decide

/-- Coefficient term 1580 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1580 : Poly :=
[
  term ((451061558904336948427913513023752541112467545066945137860379840 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (13, 1), (14, 3), (15, 2)]
]

/-- Partial product 1580 for generator 18. -/
def ep_Q2_041_partial_18_1580 : Poly :=
[
  term ((902123117808673896855827026047505082224935090133890275720759680 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (8, 1), (13, 1), (14, 3), (15, 2)],
  term ((-451061558904336948427913513023752541112467545066945137860379840 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (13, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1580 for generator 18. -/
theorem ep_Q2_041_partial_18_1580_valid :
    mulPoly ep_Q2_041_coefficient_18_1580
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1580 := by
  native_decide

/-- Coefficient term 1581 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1581 : Poly :=
[
  term ((12632334616 : Rat) / 455291409) [(1, 1), (13, 1), (14, 3), (16, 1)]
]

/-- Partial product 1581 for generator 18. -/
def ep_Q2_041_partial_18_1581 : Poly :=
[
  term ((25264669232 : Rat) / 455291409) [(1, 1), (8, 1), (13, 1), (14, 3), (16, 1)],
  term ((-12632334616 : Rat) / 455291409) [(1, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1581 for generator 18. -/
theorem ep_Q2_041_partial_18_1581_valid :
    mulPoly ep_Q2_041_coefficient_18_1581
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1581 := by
  native_decide

/-- Coefficient term 1582 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1582 : Poly :=
[
  term ((252947480982172091089165873564149436266828920945512491116297055608060141 : Rat) / 2152373691231865894866819680972333371677129271581415998418982630071544) [(1, 1), (13, 1), (15, 2)]
]

/-- Partial product 1582 for generator 18. -/
def ep_Q2_041_partial_18_1582 : Poly :=
[
  term ((252947480982172091089165873564149436266828920945512491116297055608060141 : Rat) / 1076186845615932947433409840486166685838564635790707999209491315035772) [(1, 1), (8, 1), (13, 1), (15, 2)],
  term ((-252947480982172091089165873564149436266828920945512491116297055608060141 : Rat) / 2152373691231865894866819680972333371677129271581415998418982630071544) [(1, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1582 for generator 18. -/
theorem ep_Q2_041_partial_18_1582_valid :
    mulPoly ep_Q2_041_coefficient_18_1582
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1582 := by
  native_decide

/-- Coefficient term 1583 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1583 : Poly :=
[
  term ((734441140210 : Rat) / 11989340437) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1583 for generator 18. -/
def ep_Q2_041_partial_18_1583 : Poly :=
[
  term ((1468882280420 : Rat) / 11989340437) [(1, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-734441140210 : Rat) / 11989340437) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1583 for generator 18. -/
theorem ep_Q2_041_partial_18_1583_valid :
    mulPoly ep_Q2_041_coefficient_18_1583
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1583 := by
  native_decide

/-- Coefficient term 1584 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1584 : Poly :=
[
  term ((-23210522262675337964076343932712924867117932372418646442007690 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (13, 1), (15, 4)]
]

/-- Partial product 1584 for generator 18. -/
def ep_Q2_041_partial_18_1584 : Poly :=
[
  term ((-46421044525350675928152687865425849734235864744837292884015380 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (13, 1), (15, 4)],
  term ((23210522262675337964076343932712924867117932372418646442007690 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1584 for generator 18. -/
theorem ep_Q2_041_partial_18_1584_valid :
    mulPoly ep_Q2_041_coefficient_18_1584
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1584 := by
  native_decide

/-- Coefficient term 1585 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1585 : Poly :=
[
  term ((-2588495227 : Rat) / 151763803) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 1585 for generator 18. -/
def ep_Q2_041_partial_18_1585 : Poly :=
[
  term ((-5176990454 : Rat) / 151763803) [(1, 1), (8, 1), (13, 1), (16, 1)],
  term ((2588495227 : Rat) / 151763803) [(1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1585 for generator 18. -/
theorem ep_Q2_041_partial_18_1585_valid :
    mulPoly ep_Q2_041_coefficient_18_1585
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1585 := by
  native_decide

/-- Coefficient term 1586 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1586 : Poly :=
[
  term ((15488742608945510876361695833325969460628306200058905427466905341995869635 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 1586 for generator 18. -/
def ep_Q2_041_partial_18_1586 : Poly :=
[
  term ((15488742608945510876361695833325969460628306200058905427466905341995869635 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (13, 2), (14, 1), (15, 1)],
  term ((-15488742608945510876361695833325969460628306200058905427466905341995869635 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1586 for generator 18. -/
theorem ep_Q2_041_partial_18_1586_valid :
    mulPoly ep_Q2_041_coefficient_18_1586
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1586 := by
  native_decide

/-- Coefficient term 1587 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1587 : Poly :=
[
  term ((84714737916936 : Rat) / 275754830051) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1587 for generator 18. -/
def ep_Q2_041_partial_18_1587 : Poly :=
[
  term ((169429475833872 : Rat) / 275754830051) [(1, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-84714737916936 : Rat) / 275754830051) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1587 for generator 18. -/
theorem ep_Q2_041_partial_18_1587_valid :
    mulPoly ep_Q2_041_coefficient_18_1587
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1587 := by
  native_decide

/-- Coefficient term 1588 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1588 : Poly :=
[
  term ((307535457087500232026889234519342905463930588092161931352641830 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (13, 2), (14, 1), (15, 3)]
]

/-- Partial product 1588 for generator 18. -/
def ep_Q2_041_partial_18_1588 : Poly :=
[
  term ((615070914175000464053778469038685810927861176184323862705283660 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (13, 2), (14, 1), (15, 3)],
  term ((-307535457087500232026889234519342905463930588092161931352641830 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (13, 2), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1588 for generator 18. -/
theorem ep_Q2_041_partial_18_1588_valid :
    mulPoly ep_Q2_041_coefficient_18_1588
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1588 := by
  native_decide

/-- Coefficient term 1589 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1589 : Poly :=
[
  term ((426933734233631056702984093149257270231118419279856342946903358965104005 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (13, 2), (14, 2), (15, 1)]
]

/-- Partial product 1589 for generator 18. -/
def ep_Q2_041_partial_18_1589 : Poly :=
[
  term ((426933734233631056702984093149257270231118419279856342946903358965104005 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (13, 2), (14, 2), (15, 1)],
  term ((-426933734233631056702984093149257270231118419279856342946903358965104005 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1589 for generator 18. -/
theorem ep_Q2_041_partial_18_1589_valid :
    mulPoly ep_Q2_041_coefficient_18_1589
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1589 := by
  native_decide

/-- Coefficient term 1590 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1590 : Poly :=
[
  term ((25666712568672 : Rat) / 275754830051) [(1, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1590 for generator 18. -/
def ep_Q2_041_partial_18_1590 : Poly :=
[
  term ((51333425137344 : Rat) / 275754830051) [(1, 1), (8, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-25666712568672 : Rat) / 275754830051) [(1, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1590 for generator 18. -/
theorem ep_Q2_041_partial_18_1590_valid :
    mulPoly ep_Q2_041_coefficient_18_1590
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1590 := by
  native_decide

/-- Coefficient term 1591 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1591 : Poly :=
[
  term ((-211843726813321396489073558948325888398163671472430557968040 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (13, 2), (14, 3), (15, 1)]
]

/-- Partial product 1591 for generator 18. -/
def ep_Q2_041_partial_18_1591 : Poly :=
[
  term ((-423687453626642792978147117896651776796327342944861115936080 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (13, 2), (14, 3), (15, 1)],
  term ((211843726813321396489073558948325888398163671472430557968040 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (13, 2), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1591 for generator 18. -/
theorem ep_Q2_041_partial_18_1591_valid :
    mulPoly ep_Q2_041_coefficient_18_1591
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1591 := by
  native_decide

/-- Coefficient term 1592 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1592 : Poly :=
[
  term ((-11547821057752654770769230352090303499176237518417207882965351020982403383 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (13, 2), (15, 1)]
]

/-- Partial product 1592 for generator 18. -/
def ep_Q2_041_partial_18_1592 : Poly :=
[
  term ((-11547821057752654770769230352090303499176237518417207882965351020982403383 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (13, 2), (15, 1)],
  term ((11547821057752654770769230352090303499176237518417207882965351020982403383 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1592 for generator 18. -/
theorem ep_Q2_041_partial_18_1592_valid :
    mulPoly ep_Q2_041_coefficient_18_1592
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1592 := by
  native_decide

/-- Coefficient term 1593 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1593 : Poly :=
[
  term ((-35674313988336 : Rat) / 275754830051) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1593 for generator 18. -/
def ep_Q2_041_partial_18_1593 : Poly :=
[
  term ((-71348627976672 : Rat) / 275754830051) [(1, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((35674313988336 : Rat) / 275754830051) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1593 for generator 18. -/
theorem ep_Q2_041_partial_18_1593_valid :
    mulPoly ep_Q2_041_coefficient_18_1593
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1593 := by
  native_decide

/-- Coefficient term 1594 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1594 : Poly :=
[
  term ((-10122831444040979079952152943467650537150255002619056268413430 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (13, 2), (15, 3)]
]

/-- Partial product 1594 for generator 18. -/
def ep_Q2_041_partial_18_1594 : Poly :=
[
  term ((-20245662888081958159904305886935301074300510005238112536826860 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (13, 2), (15, 3)],
  term ((10122831444040979079952152943467650537150255002619056268413430 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1594 for generator 18. -/
theorem ep_Q2_041_partial_18_1594_valid :
    mulPoly ep_Q2_041_coefficient_18_1594
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1594 := by
  native_decide

/-- Coefficient term 1595 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1595 : Poly :=
[
  term ((4845838880780209761 : Rat) / 37000277874542993) [(1, 1), (13, 3)]
]

/-- Partial product 1595 for generator 18. -/
def ep_Q2_041_partial_18_1595 : Poly :=
[
  term ((9691677761560419522 : Rat) / 37000277874542993) [(1, 1), (8, 1), (13, 3)],
  term ((-4845838880780209761 : Rat) / 37000277874542993) [(1, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1595 for generator 18. -/
theorem ep_Q2_041_partial_18_1595_valid :
    mulPoly ep_Q2_041_coefficient_18_1595
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1595 := by
  native_decide

/-- Coefficient term 1596 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1596 : Poly :=
[
  term ((-182621614291363983542 : Rat) / 259001945121800951) [(1, 1), (13, 3), (14, 1)]
]

/-- Partial product 1596 for generator 18. -/
def ep_Q2_041_partial_18_1596 : Poly :=
[
  term ((-365243228582727967084 : Rat) / 259001945121800951) [(1, 1), (8, 1), (13, 3), (14, 1)],
  term ((182621614291363983542 : Rat) / 259001945121800951) [(1, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1596 for generator 18. -/
theorem ep_Q2_041_partial_18_1596_valid :
    mulPoly ep_Q2_041_coefficient_18_1596
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1596 := by
  native_decide

/-- Coefficient term 1597 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1597 : Poly :=
[
  term ((-905395285252635287200075529262345998063550630052734635750614590 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (13, 3), (14, 1), (15, 2)]
]

/-- Partial product 1597 for generator 18. -/
def ep_Q2_041_partial_18_1597 : Poly :=
[
  term ((-1810790570505270574400151058524691996127101260105469271501229180 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (13, 3), (14, 1), (15, 2)],
  term ((905395285252635287200075529262345998063550630052734635750614590 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (13, 3), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1597 for generator 18. -/
theorem ep_Q2_041_partial_18_1597_valid :
    mulPoly ep_Q2_041_coefficient_18_1597
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1597 := by
  native_decide

/-- Coefficient term 1598 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1598 : Poly :=
[
  term ((-12858487520 : Rat) / 151763803) [(1, 1), (13, 3), (14, 1), (16, 1)]
]

/-- Partial product 1598 for generator 18. -/
def ep_Q2_041_partial_18_1598 : Poly :=
[
  term ((-25716975040 : Rat) / 151763803) [(1, 1), (8, 1), (13, 3), (14, 1), (16, 1)],
  term ((12858487520 : Rat) / 151763803) [(1, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1598 for generator 18. -/
theorem ep_Q2_041_partial_18_1598_valid :
    mulPoly ep_Q2_041_coefficient_18_1598
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1598 := by
  native_decide

/-- Coefficient term 1599 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1599 : Poly :=
[
  term ((187752502518072440936 : Rat) / 259001945121800951) [(1, 1), (13, 3), (14, 2)]
]

/-- Partial product 1599 for generator 18. -/
def ep_Q2_041_partial_18_1599 : Poly :=
[
  term ((375505005036144881872 : Rat) / 259001945121800951) [(1, 1), (8, 1), (13, 3), (14, 2)],
  term ((-187752502518072440936 : Rat) / 259001945121800951) [(1, 1), (13, 3), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1599 for generator 18. -/
theorem ep_Q2_041_partial_18_1599_valid :
    mulPoly ep_Q2_041_coefficient_18_1599
        ep_Q2_041_generator_18_1500_1599 =
      ep_Q2_041_partial_18_1599 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_041_partials_18_1500_1599 : List Poly :=
[
  ep_Q2_041_partial_18_1500,
  ep_Q2_041_partial_18_1501,
  ep_Q2_041_partial_18_1502,
  ep_Q2_041_partial_18_1503,
  ep_Q2_041_partial_18_1504,
  ep_Q2_041_partial_18_1505,
  ep_Q2_041_partial_18_1506,
  ep_Q2_041_partial_18_1507,
  ep_Q2_041_partial_18_1508,
  ep_Q2_041_partial_18_1509,
  ep_Q2_041_partial_18_1510,
  ep_Q2_041_partial_18_1511,
  ep_Q2_041_partial_18_1512,
  ep_Q2_041_partial_18_1513,
  ep_Q2_041_partial_18_1514,
  ep_Q2_041_partial_18_1515,
  ep_Q2_041_partial_18_1516,
  ep_Q2_041_partial_18_1517,
  ep_Q2_041_partial_18_1518,
  ep_Q2_041_partial_18_1519,
  ep_Q2_041_partial_18_1520,
  ep_Q2_041_partial_18_1521,
  ep_Q2_041_partial_18_1522,
  ep_Q2_041_partial_18_1523,
  ep_Q2_041_partial_18_1524,
  ep_Q2_041_partial_18_1525,
  ep_Q2_041_partial_18_1526,
  ep_Q2_041_partial_18_1527,
  ep_Q2_041_partial_18_1528,
  ep_Q2_041_partial_18_1529,
  ep_Q2_041_partial_18_1530,
  ep_Q2_041_partial_18_1531,
  ep_Q2_041_partial_18_1532,
  ep_Q2_041_partial_18_1533,
  ep_Q2_041_partial_18_1534,
  ep_Q2_041_partial_18_1535,
  ep_Q2_041_partial_18_1536,
  ep_Q2_041_partial_18_1537,
  ep_Q2_041_partial_18_1538,
  ep_Q2_041_partial_18_1539,
  ep_Q2_041_partial_18_1540,
  ep_Q2_041_partial_18_1541,
  ep_Q2_041_partial_18_1542,
  ep_Q2_041_partial_18_1543,
  ep_Q2_041_partial_18_1544,
  ep_Q2_041_partial_18_1545,
  ep_Q2_041_partial_18_1546,
  ep_Q2_041_partial_18_1547,
  ep_Q2_041_partial_18_1548,
  ep_Q2_041_partial_18_1549,
  ep_Q2_041_partial_18_1550,
  ep_Q2_041_partial_18_1551,
  ep_Q2_041_partial_18_1552,
  ep_Q2_041_partial_18_1553,
  ep_Q2_041_partial_18_1554,
  ep_Q2_041_partial_18_1555,
  ep_Q2_041_partial_18_1556,
  ep_Q2_041_partial_18_1557,
  ep_Q2_041_partial_18_1558,
  ep_Q2_041_partial_18_1559,
  ep_Q2_041_partial_18_1560,
  ep_Q2_041_partial_18_1561,
  ep_Q2_041_partial_18_1562,
  ep_Q2_041_partial_18_1563,
  ep_Q2_041_partial_18_1564,
  ep_Q2_041_partial_18_1565,
  ep_Q2_041_partial_18_1566,
  ep_Q2_041_partial_18_1567,
  ep_Q2_041_partial_18_1568,
  ep_Q2_041_partial_18_1569,
  ep_Q2_041_partial_18_1570,
  ep_Q2_041_partial_18_1571,
  ep_Q2_041_partial_18_1572,
  ep_Q2_041_partial_18_1573,
  ep_Q2_041_partial_18_1574,
  ep_Q2_041_partial_18_1575,
  ep_Q2_041_partial_18_1576,
  ep_Q2_041_partial_18_1577,
  ep_Q2_041_partial_18_1578,
  ep_Q2_041_partial_18_1579,
  ep_Q2_041_partial_18_1580,
  ep_Q2_041_partial_18_1581,
  ep_Q2_041_partial_18_1582,
  ep_Q2_041_partial_18_1583,
  ep_Q2_041_partial_18_1584,
  ep_Q2_041_partial_18_1585,
  ep_Q2_041_partial_18_1586,
  ep_Q2_041_partial_18_1587,
  ep_Q2_041_partial_18_1588,
  ep_Q2_041_partial_18_1589,
  ep_Q2_041_partial_18_1590,
  ep_Q2_041_partial_18_1591,
  ep_Q2_041_partial_18_1592,
  ep_Q2_041_partial_18_1593,
  ep_Q2_041_partial_18_1594,
  ep_Q2_041_partial_18_1595,
  ep_Q2_041_partial_18_1596,
  ep_Q2_041_partial_18_1597,
  ep_Q2_041_partial_18_1598,
  ep_Q2_041_partial_18_1599
]

/-- Sum of partial products in this block. -/
def ep_Q2_041_block_18_1500_1599 : Poly :=
[
  term ((-2427479312580066729159209335086718456190702318210401174825522092197120895 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((-7265669363232 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-740325841700226912254661611136101077219570440366813977632516820 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 3)],
  term ((168139035969051983125921522091073848997047427845518204822880 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (11, 2), (12, 2), (15, 1)],
  term ((-4750822432137460550 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 2), (13, 1)],
  term ((15527440561230799464235988420333353132365750984416014634805562060 : Rat) / 17474732558945884144932315597195630681744541424384794072182327) [(1, 1), (8, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-82094211627335318304 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 2), (13, 1), (14, 2)],
  term ((-49652809723509487154432052120892448549547610585957123335932605040 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 2), (13, 1), (14, 2), (15, 2)],
  term ((-5780298240 : Rat) / 151763803) [(1, 1), (8, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((-1198827534716140116491354875326456702923944804494347268256617240 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 1), (11, 2), (13, 1), (15, 2)],
  term ((-334508000 : Rat) / 151763803) [(1, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((808136723431009456798906502189492657053318534494121021426880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-30574813421570480126012477576554657539690332713095399610357120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (13, 2), (14, 2), (15, 1)],
  term ((-508836187836008905133333636494283489649663417017381089424760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (13, 2), (15, 1)],
  term ((-24707161753878613579769888701221781336866730784615039165567384136078029919 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 2), (14, 1), (15, 1)],
  term ((7257138456752 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-567749716691982719110765635103392542987934907143496253517721820 : Rat) / 759770980823734093257926765095462203554110496712382350964449) [(1, 1), (8, 1), (11, 2), (14, 1), (15, 3)],
  term ((3698108914481995037772151545566291255280454637876631576682164940161737155 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 2), (14, 2), (15, 1)],
  term ((-114285937176768 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((1966773939729882857929454708744825158271752629605517767323275200 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 2), (14, 2), (15, 3)],
  term ((-1425386526128727688854623247127481718669412713957772913606880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (14, 3), (15, 1)],
  term ((894728263354175887616311818352871700792566536592300877167781201724279344 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((-3657639684080 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((590340281785744531255476363866189677393075443757949957710062540 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 2), (15, 3)],
  term ((130396324635349441390754255125646626119491426161960292454951400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 3), (12, 1), (15, 2)],
  term ((-2358885571095919495521132492877438025993470316901758657137920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 3), (13, 1), (14, 2), (15, 1)],
  term ((-136509581660643489324139611856333219096844347042925848214000 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 3), (13, 1), (15, 1)],
  term ((-20048198687264784959314806905183581880741117346220739472069520 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (8, 1), (11, 3), (14, 1), (15, 2)],
  term ((293011370525829836042092952149188094656976615823100890526774800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (8, 1), (11, 3), (14, 2), (15, 2)],
  term ((133676261920204998742149039273158358008878312933385009662628640 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 3), (15, 2)],
  term ((-89519161290291812362 : Rat) / 259001945121800951) [(1, 1), (8, 1), (12, 1), (13, 1)],
  term ((239823932772832685824 : Rat) / 259001945121800951) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-111640141602184390778215902155722399411293995115653696951985747513615890 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-102666850274688 : Rat) / 275754830051) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((21696607720 : Rat) / 151763803) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-93876251259036220468 : Rat) / 259001945121800951) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 2)],
  term ((222520490700718284596890091461412131726783224145167375229097780 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((-6609878080 : Rat) / 151763803) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3560798019505834622466641843545926672565039434824942827162777209891979229 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-181439624305232 : Rat) / 275754830051) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-273729101818189976171964556864951572508525101209687483033481480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 4)],
  term ((-8047872736 : Rat) / 151763803) [(1, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-9959168950804560036961871149252696061132961864890022401479001249760088 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-52879024640 : Rat) / 151763803) [(1, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((581275373981127259278535516157549907137173373675404763286773920 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 3)],
  term ((303525569439434974898122467152552776440644982398494354087920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (12, 1), (13, 2), (14, 2), (15, 1)],
  term ((4840715869884190588685569110519286933790739111340394269337392662383168 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((25716975040 : Rat) / 151763803) [(1, 1), (8, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((2362296530176723923790039581340880390919753193123533512878979820 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (12, 1), (13, 2), (15, 3)],
  term ((2428204555515479799184979737220422211525159859187954832703360 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (12, 1), (13, 3), (14, 1), (15, 2)],
  term ((-1180923369357477776830346926856693190928987158238676414082960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (12, 1), (13, 3), (15, 2)],
  term ((-2487248895380486086584148003565818682775096023502699234602126850753344011 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-116442084568152 : Rat) / 275754830051) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1310688424775090342971560438414898139981971534672112656639030968604762261 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-14634037269504 : Rat) / 275754830051) [(1, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-29751260409178842115854907572546548170789774551224938595534824671732399851 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (8, 1), (12, 1), (15, 1)],
  term ((42661726500730 : Rat) / 275754830051) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-318749461262385008012649061204207973554832967913113485513016869124740483 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (12, 1), (15, 3)],
  term ((73015267852560 : Rat) / 275754830051) [(1, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((26034506928113283814 : Rat) / 259001945121800951) [(1, 1), (8, 1), (12, 2), (13, 1)],
  term ((8831240277103374529369559876816282475842957571926276766117620241131894628 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (12, 2), (13, 1), (15, 2)],
  term ((26439512320 : Rat) / 151763803) [(1, 1), (8, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-290637686990563629639267758078774953568586686837702381643386960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (12, 2), (13, 1), (15, 4)],
  term ((1833103840 : Rat) / 151763803) [(1, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((-84176119459924274415066352226517672818559438438448839089160 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (12, 2), (13, 2), (15, 1)],
  term ((-1214102277757739899592489868610211105762579929593977416351680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (12, 2), (13, 2), (15, 3)],
  term ((201471385811814737034578874853085447007032092467242590596872913592617289 : Rat) / 1768021246369032699354887595084416698163356187370448855844164303273054) [(1, 1), (8, 1), (12, 2), (15, 1)],
  term ((49184039575848 : Rat) / 275754830051) [(1, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((14997105462506511390078102866122788255007952787771030870137641064432675 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (8, 1), (12, 2), (15, 3)],
  term ((51333425137344 : Rat) / 275754830051) [(1, 1), (8, 1), (12, 2), (15, 3), (16, 1)],
  term ((-97269813895697037682 : Rat) / 259001945121800951) [(1, 1), (8, 1), (13, 1)],
  term ((223050112242421389271 : Rat) / 259001945121800951) [(1, 1), (8, 1), (13, 1), (14, 1)],
  term ((-18215598351330834771216619204664568207105559247460596042655461335885215181 : Rat) / 74256892347499373372905278993545501322860959869558851945454900737468268) [(1, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-275099166330368 : Rat) / 827264490153) [(1, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3965676984360557300903624444529497882581126621967829689454875560 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (8, 1), (13, 1), (14, 1), (15, 4)],
  term ((8150711618 : Rat) / 151763803) [(1, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-273608499127950836838 : Rat) / 259001945121800951) [(1, 1), (8, 1), (13, 1), (14, 2)],
  term ((2683805957169353148570030623305591900914731001054375795354872540 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (13, 1), (14, 2), (15, 2)],
  term ((-15803635676 : Rat) / 151763803) [(1, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((354443523228694730420 : Rat) / 777005835365402853) [(1, 1), (8, 1), (13, 1), (14, 3)],
  term ((902123117808673896855827026047505082224935090133890275720759680 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (8, 1), (13, 1), (14, 3), (15, 2)],
  term ((25264669232 : Rat) / 455291409) [(1, 1), (8, 1), (13, 1), (14, 3), (16, 1)],
  term ((252947480982172091089165873564149436266828920945512491116297055608060141 : Rat) / 1076186845615932947433409840486166685838564635790707999209491315035772) [(1, 1), (8, 1), (13, 1), (15, 2)],
  term ((1468882280420 : Rat) / 11989340437) [(1, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-46421044525350675928152687865425849734235864744837292884015380 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (13, 1), (15, 4)],
  term ((-5176990454 : Rat) / 151763803) [(1, 1), (8, 1), (13, 1), (16, 1)],
  term ((15488742608945510876361695833325969460628306200058905427466905341995869635 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (13, 2), (14, 1), (15, 1)],
  term ((169429475833872 : Rat) / 275754830051) [(1, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((615070914175000464053778469038685810927861176184323862705283660 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (13, 2), (14, 1), (15, 3)],
  term ((426933734233631056702984093149257270231118419279856342946903358965104005 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (13, 2), (14, 2), (15, 1)],
  term ((51333425137344 : Rat) / 275754830051) [(1, 1), (8, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-423687453626642792978147117896651776796327342944861115936080 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (13, 2), (14, 3), (15, 1)],
  term ((-11547821057752654770769230352090303499176237518417207882965351020982403383 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (13, 2), (15, 1)],
  term ((-71348627976672 : Rat) / 275754830051) [(1, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-20245662888081958159904305886935301074300510005238112536826860 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (13, 2), (15, 3)],
  term ((9691677761560419522 : Rat) / 37000277874542993) [(1, 1), (8, 1), (13, 3)],
  term ((-365243228582727967084 : Rat) / 259001945121800951) [(1, 1), (8, 1), (13, 3), (14, 1)],
  term ((-1810790570505270574400151058524691996127101260105469271501229180 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (13, 3), (14, 1), (15, 2)],
  term ((-25716975040 : Rat) / 151763803) [(1, 1), (8, 1), (13, 3), (14, 1), (16, 1)],
  term ((375505005036144881872 : Rat) / 259001945121800951) [(1, 1), (8, 1), (13, 3), (14, 2)],
  term ((2427479312580066729159209335086718456190702318210401174825522092197120895 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((3632834681616 : Rat) / 275754830051) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((370162920850113456127330805568050538609785220183406988816258410 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 2), (12, 1), (15, 3)],
  term ((-84069517984525991562960761045536924498523713922759102411440 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (11, 2), (12, 2), (15, 1)],
  term ((2375411216068730275 : Rat) / 259001945121800951) [(1, 1), (11, 2), (13, 1)],
  term ((-7763720280615399732117994210166676566182875492208007317402781030 : Rat) / 17474732558945884144932315597195630681744541424384794072182327) [(1, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((41047105813667659152 : Rat) / 259001945121800951) [(1, 1), (11, 2), (13, 1), (14, 2)],
  term ((24826404861754743577216026060446224274773805292978561667966302520 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (11, 2), (13, 1), (14, 2), (15, 2)],
  term ((2890149120 : Rat) / 151763803) [(1, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((599413767358070058245677437663228351461972402247173634128308620 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((167254000 : Rat) / 151763803) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-404068361715504728399453251094746328526659267247060510713440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((15287406710785240063006238788277328769845166356547699805178560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 2), (13, 2), (14, 2), (15, 1)],
  term ((254418093918004452566666818247141744824831708508690544712380 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((24707161753878613579769888701221781336866730784615039165567384136078029919 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((-3628569228376 : Rat) / 275754830051) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((283874858345991359555382817551696271493967453571748126758860910 : Rat) / 759770980823734093257926765095462203554110496712382350964449) [(1, 1), (11, 2), (14, 1), (15, 3)],
  term ((-3698108914481995037772151545566291255280454637876631576682164940161737155 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (11, 2), (14, 2), (15, 1)],
  term ((57142968588384 : Rat) / 275754830051) [(1, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((-983386969864941428964727354372412579135876314802758883661637600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 2), (14, 2), (15, 3)],
  term ((712693263064363844427311623563740859334706356978886456803440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 2), (14, 3), (15, 1)],
  term ((-447364131677087943808155909176435850396283268296150438583890600862139672 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (11, 2), (15, 1)],
  term ((1828819842040 : Rat) / 275754830051) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-295170140892872265627738181933094838696537721878974978855031270 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 2), (15, 3)],
  term ((-65198162317674720695377127562823313059745713080980146227475700 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 3), (12, 1), (15, 2)],
  term ((1179442785547959747760566246438719012996735158450879328568960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 3), (13, 1), (14, 2), (15, 1)],
  term ((68254790830321744662069805928166609548422173521462924107000 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (11, 3), (13, 1), (15, 1)],
  term ((10024099343632392479657403452591790940370558673110369736034760 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (11, 3), (14, 1), (15, 2)],
  term ((-146505685262914918021046476074594047328488307911550445263387400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (11, 3), (14, 2), (15, 2)],
  term ((-66838130960102499371074519636579179004439156466692504831314320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (11, 3), (15, 2)],
  term ((44759580645145906181 : Rat) / 259001945121800951) [(1, 1), (12, 1), (13, 1)],
  term ((-119911966386416342912 : Rat) / 259001945121800951) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((55820070801092195389107951077861199705646997557826848475992873756807945 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((51333425137344 : Rat) / 275754830051) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10848303860 : Rat) / 151763803) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((46938125629518110234 : Rat) / 259001945121800951) [(1, 1), (12, 1), (13, 1), (14, 2)],
  term ((-111260245350359142298445045730706065863391612072583687614548890 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((3304939040 : Rat) / 151763803) [(1, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((3560798019505834622466641843545926672565039434824942827162777209891979229 : Rat) / 7072084985476130797419550380337666792653424749481795423376657213092216) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((90719812152616 : Rat) / 275754830051) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((136864550909094988085982278432475786254262550604843741516740740 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (12, 1), (13, 1), (15, 4)],
  term ((4023936368 : Rat) / 151763803) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((4979584475402280018480935574626348030566480932445011200739500624880044 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((26439512320 : Rat) / 151763803) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-290637686990563629639267758078774953568586686837702381643386960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 3)],
  term ((-151762784719717487449061233576276388220322491199247177043960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (12, 1), (13, 2), (14, 2), (15, 1)],
  term ((-2420357934942095294342784555259643466895369555670197134668696331191584 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((-12858487520 : Rat) / 151763803) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1181148265088361961895019790670440195459876596561766756439489910 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (12, 1), (13, 2), (15, 3)],
  term ((-1214102277757739899592489868610211105762579929593977416351680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (12, 1), (13, 3), (14, 1), (15, 2)],
  term ((590461684678738888415173463428346595464493579119338207041480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (12, 1), (13, 3), (15, 2)],
  term ((2487248895380486086584148003565818682775096023502699234602126850753344011 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (12, 1), (14, 1), (15, 1)],
  term ((58221042284076 : Rat) / 275754830051) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1310688424775090342971560438414898139981971534672112656639030968604762261 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (12, 1), (14, 2), (15, 1)],
  term ((7317018634752 : Rat) / 275754830051) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((29751260409178842115854907572546548170789774551224938595534824671732399851 : Rat) / 99009189796665831163873705324727335097147946492745135927273200983291024) [(1, 1), (12, 1), (15, 1)],
  term ((-21330863250365 : Rat) / 275754830051) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((318749461262385008012649061204207973554832967913113485513016869124740483 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (12, 1), (15, 3)],
  term ((-36507633926280 : Rat) / 275754830051) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((-13017253464056641907 : Rat) / 259001945121800951) [(1, 1), (12, 2), (13, 1)],
  term ((-4415620138551687264684779938408141237921478785963138383058810120565947314 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (12, 2), (13, 1), (15, 2)],
  term ((-13219756160 : Rat) / 151763803) [(1, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((145318843495281814819633879039387476784293343418851190821693480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (12, 2), (13, 1), (15, 4)],
  term ((-916551920 : Rat) / 151763803) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((42088059729962137207533176113258836409279719219224419544580 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (12, 2), (13, 2), (15, 1)],
  term ((607051138878869949796244934305105552881289964796988708175840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (12, 2), (13, 2), (15, 3)],
  term ((-201471385811814737034578874853085447007032092467242590596872913592617289 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 1), (12, 2), (15, 1)],
  term ((-24592019787924 : Rat) / 275754830051) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-14997105462506511390078102866122788255007952787771030870137641064432675 : Rat) / 1768021246369032699354887595084416698163356187370448855844164303273054) [(1, 1), (12, 2), (15, 3)],
  term ((-25666712568672 : Rat) / 275754830051) [(1, 1), (12, 2), (15, 3), (16, 1)],
  term ((48634906947848518841 : Rat) / 259001945121800951) [(1, 1), (13, 1)],
  term ((-223050112242421389271 : Rat) / 518003890243601902) [(1, 1), (13, 1), (14, 1)],
  term ((18215598351330834771216619204664568207105559247460596042655461335885215181 : Rat) / 148513784694998746745810557987091002645721919739117703890909801474936536) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((137549583165184 : Rat) / 827264490153) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1982838492180278650451812222264748941290563310983914844727437780 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (13, 1), (14, 1), (15, 4)],
  term ((-4075355809 : Rat) / 151763803) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((136804249563975418419 : Rat) / 259001945121800951) [(1, 1), (13, 1), (14, 2)],
  term ((-1341902978584676574285015311652795950457365500527187897677436270 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (13, 1), (14, 2), (15, 2)],
  term ((7901817838 : Rat) / 151763803) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-177221761614347365210 : Rat) / 777005835365402853) [(1, 1), (13, 1), (14, 3)],
  term ((-451061558904336948427913513023752541112467545066945137860379840 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (13, 1), (14, 3), (15, 2)],
  term ((-12632334616 : Rat) / 455291409) [(1, 1), (13, 1), (14, 3), (16, 1)],
  term ((-252947480982172091089165873564149436266828920945512491116297055608060141 : Rat) / 2152373691231865894866819680972333371677129271581415998418982630071544) [(1, 1), (13, 1), (15, 2)],
  term ((-734441140210 : Rat) / 11989340437) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((23210522262675337964076343932712924867117932372418646442007690 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (13, 1), (15, 4)],
  term ((2588495227 : Rat) / 151763803) [(1, 1), (13, 1), (16, 1)],
  term ((-15488742608945510876361695833325969460628306200058905427466905341995869635 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((-84714737916936 : Rat) / 275754830051) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-307535457087500232026889234519342905463930588092161931352641830 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (13, 2), (14, 1), (15, 3)],
  term ((-426933734233631056702984093149257270231118419279856342946903358965104005 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (13, 2), (14, 2), (15, 1)],
  term ((-25666712568672 : Rat) / 275754830051) [(1, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((211843726813321396489073558948325888398163671472430557968040 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (13, 2), (14, 3), (15, 1)],
  term ((11547821057752654770769230352090303499176237518417207882965351020982403383 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (13, 2), (15, 1)],
  term ((35674313988336 : Rat) / 275754830051) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((10122831444040979079952152943467650537150255002619056268413430 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (13, 2), (15, 3)],
  term ((-4845838880780209761 : Rat) / 37000277874542993) [(1, 1), (13, 3)],
  term ((182621614291363983542 : Rat) / 259001945121800951) [(1, 1), (13, 3), (14, 1)],
  term ((905395285252635287200075529262345998063550630052734635750614590 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (13, 3), (14, 1), (15, 2)],
  term ((12858487520 : Rat) / 151763803) [(1, 1), (13, 3), (14, 1), (16, 1)],
  term ((-187752502518072440936 : Rat) / 259001945121800951) [(1, 1), (13, 3), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 1500 through 1599. -/
theorem ep_Q2_041_block_18_1500_1599_valid :
    checkProductSumEq ep_Q2_041_partials_18_1500_1599
      ep_Q2_041_block_18_1500_1599 = true := by
  native_decide

end EpQ2041TermShards

end Patterns

end EndpointCertificate

end Problem97
