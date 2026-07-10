/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_041, term block 18:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_041`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2041TermShards

/-- Generator polynomial 18 for endpoint certificate `ep_Q2_041`. -/
def ep_Q2_041_generator_18_0000_0099 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0000 : Poly :=
[
  term ((-5291111385166541646203651355551475572193686891383805876774640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (1, 1), (2, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 0 for generator 18. -/
def ep_Q2_041_partial_18_0000 : Poly :=
[
  term ((-10582222770333083292407302711102951144387373782767611753549280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((5291111385166541646203651355551475572193686891383805876774640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (1, 1), (2, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 18. -/
theorem ep_Q2_041_partial_18_0000_valid :
    mulPoly ep_Q2_041_coefficient_18_0000
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0001 : Poly :=
[
  term ((248509261792180206850910691777720843567122729989858093393470350 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (1, 1), (2, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 1 for generator 18. -/
def ep_Q2_041_partial_18_0001 : Poly :=
[
  term ((497018523584360413701821383555441687134245459979716186786940700 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (1, 1), (2, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-248509261792180206850910691777720843567122729989858093393470350 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (1, 1), (2, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 18. -/
theorem ep_Q2_041_partial_18_0001_valid :
    mulPoly ep_Q2_041_coefficient_18_0001
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0002 : Poly :=
[
  term ((-184141877469647970918 : Rat) / 259001945121800951) [(0, 1), (1, 1), (2, 1), (13, 1), (14, 1)]
]

/-- Partial product 2 for generator 18. -/
def ep_Q2_041_partial_18_0002 : Poly :=
[
  term ((-368283754939295941836 : Rat) / 259001945121800951) [(0, 1), (1, 1), (2, 1), (8, 1), (13, 1), (14, 1)],
  term ((184141877469647970918 : Rat) / 259001945121800951) [(0, 1), (1, 1), (2, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 18. -/
theorem ep_Q2_041_partial_18_0002_valid :
    mulPoly ep_Q2_041_coefficient_18_0002
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0003 : Poly :=
[
  term ((78397920861768754478418180225882878601279685513560334974574970 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (1, 1), (2, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 3 for generator 18. -/
def ep_Q2_041_partial_18_0003 : Poly :=
[
  term ((156795841723537508956836360451765757202559371027120669949149940 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (1, 1), (2, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-78397920861768754478418180225882878601279685513560334974574970 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (1, 1), (2, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 18. -/
theorem ep_Q2_041_partial_18_0003_valid :
    mulPoly ep_Q2_041_coefficient_18_0003
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0004 : Poly :=
[
  term ((-12965530080 : Rat) / 151763803) [(0, 1), (1, 1), (2, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 4 for generator 18. -/
def ep_Q2_041_partial_18_0004 : Poly :=
[
  term ((-25931060160 : Rat) / 151763803) [(0, 1), (1, 1), (2, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((12965530080 : Rat) / 151763803) [(0, 1), (1, 1), (2, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 18. -/
theorem ep_Q2_041_partial_18_0004_valid :
    mulPoly ep_Q2_041_coefficient_18_0004
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0005 : Poly :=
[
  term ((595377078515814758454009454799238138402803619320123540710920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (1, 1), (2, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 5 for generator 18. -/
def ep_Q2_041_partial_18_0005 : Poly :=
[
  term ((1190754157031629516908018909598476276805607238640247081421840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (1, 1), (2, 1), (8, 1), (13, 2), (14, 1), (15, 1)],
  term ((-595377078515814758454009454799238138402803619320123540710920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (1, 1), (2, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 18. -/
theorem ep_Q2_041_partial_18_0005_valid :
    mulPoly ep_Q2_041_coefficient_18_0005
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0006 : Poly :=
[
  term ((-294646250950017878360345213745923955152152911724983466265355794307761645 : Rat) / 7072084985476130797419550380337666792653424749481795423376657213092216) [(0, 1), (1, 1), (2, 1), (14, 1), (15, 1)]
]

/-- Partial product 6 for generator 18. -/
def ep_Q2_041_partial_18_0006 : Poly :=
[
  term ((-294646250950017878360345213745923955152152911724983466265355794307761645 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(0, 1), (1, 1), (2, 1), (8, 1), (14, 1), (15, 1)],
  term ((294646250950017878360345213745923955152152911724983466265355794307761645 : Rat) / 7072084985476130797419550380337666792653424749481795423376657213092216) [(0, 1), (1, 1), (2, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 18. -/
theorem ep_Q2_041_partial_18_0006_valid :
    mulPoly ep_Q2_041_coefficient_18_0006
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0007 : Poly :=
[
  term ((-96928367762856 : Rat) / 275754830051) [(0, 1), (1, 1), (2, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 18. -/
def ep_Q2_041_partial_18_0007 : Poly :=
[
  term ((-193856735525712 : Rat) / 275754830051) [(0, 1), (1, 1), (2, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((96928367762856 : Rat) / 275754830051) [(0, 1), (1, 1), (2, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 18. -/
theorem ep_Q2_041_partial_18_0007_valid :
    mulPoly ep_Q2_041_coefficient_18_0007
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0008 : Poly :=
[
  term ((-197144904821693621566554190076996291644877649573154551014139900 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (1, 1), (3, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 8 for generator 18. -/
def ep_Q2_041_partial_18_0008 : Poly :=
[
  term ((-394289809643387243133108380153992583289755299146309102028279800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (1, 1), (3, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((197144904821693621566554190076996291644877649573154551014139900 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (1, 1), (3, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 18. -/
theorem ep_Q2_041_partial_18_0008_valid :
    mulPoly ep_Q2_041_coefficient_18_0008
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0009 : Poly :=
[
  term ((5596682765420803280228739305347794816196495603646575779110805 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (1, 1), (3, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 9 for generator 18. -/
def ep_Q2_041_partial_18_0009 : Poly :=
[
  term ((11193365530841606560457478610695589632392991207293151558221610 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (1, 1), (3, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5596682765420803280228739305347794816196495603646575779110805 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (1, 1), (3, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 18. -/
theorem ep_Q2_041_partial_18_0009_valid :
    mulPoly ep_Q2_041_coefficient_18_0009
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0010 : Poly :=
[
  term ((-3142453237728519 : Rat) / 3100914216589) [(0, 1), (1, 1), (3, 1), (14, 1)]
]

/-- Partial product 10 for generator 18. -/
def ep_Q2_041_partial_18_0010 : Poly :=
[
  term ((-6284906475457038 : Rat) / 3100914216589) [(0, 1), (1, 1), (3, 1), (8, 1), (14, 1)],
  term ((3142453237728519 : Rat) / 3100914216589) [(0, 1), (1, 1), (3, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 18. -/
theorem ep_Q2_041_partial_18_0010_valid :
    mulPoly ep_Q2_041_coefficient_18_0010
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0011 : Poly :=
[
  term ((2947834630286193758509229498904246677904311734685301604483886145 : Rat) / 23299643411927845526576420796260840908992721899179725429576436) [(0, 1), (1, 1), (3, 1), (14, 1), (15, 2)]
]

/-- Partial product 11 for generator 18. -/
def ep_Q2_041_partial_18_0011 : Poly :=
[
  term ((2947834630286193758509229498904246677904311734685301604483886145 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (1, 1), (3, 1), (8, 1), (14, 1), (15, 2)],
  term ((-2947834630286193758509229498904246677904311734685301604483886145 : Rat) / 23299643411927845526576420796260840908992721899179725429576436) [(0, 1), (1, 1), (3, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 18. -/
theorem ep_Q2_041_partial_18_0011_valid :
    mulPoly ep_Q2_041_coefficient_18_0011
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0012 : Poly :=
[
  term ((3494645290512473326697974063522130408879215284298901714278400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 12 for generator 18. -/
def ep_Q2_041_partial_18_0012 : Poly :=
[
  term ((6989290581024946653395948127044260817758430568597803428556800 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3494645290512473326697974063522130408879215284298901714278400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 18. -/
theorem ep_Q2_041_partial_18_0012_valid :
    mulPoly ep_Q2_041_coefficient_18_0012
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0013 : Poly :=
[
  term ((-689614879531698778748426158456190856255141512897038458141131100 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (1, 1), (10, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 13 for generator 18. -/
def ep_Q2_041_partial_18_0013 : Poly :=
[
  term ((-1379229759063397557496852316912381712510283025794076916282262200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((689614879531698778748426158456190856255141512897038458141131100 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (1, 1), (10, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 18. -/
theorem ep_Q2_041_partial_18_0013_valid :
    mulPoly ep_Q2_041_coefficient_18_0013
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0014 : Poly :=
[
  term ((121621054262718990080 : Rat) / 259001945121800951) [(0, 1), (1, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 14 for generator 18. -/
def ep_Q2_041_partial_18_0014 : Poly :=
[
  term ((243242108525437980160 : Rat) / 259001945121800951) [(0, 1), (1, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-121621054262718990080 : Rat) / 259001945121800951) [(0, 1), (1, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 18. -/
theorem ep_Q2_041_partial_18_0014_valid :
    mulPoly ep_Q2_041_coefficient_18_0014
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0015 : Poly :=
[
  term ((-217554759773245390342469177178550651323367467984060200286877620 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (1, 1), (10, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 15 for generator 18. -/
def ep_Q2_041_partial_18_0015 : Poly :=
[
  term ((-435109519546490780684938354357101302646734935968120400573755240 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((217554759773245390342469177178550651323367467984060200286877620 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (1, 1), (10, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 18. -/
theorem ep_Q2_041_partial_18_0015_valid :
    mulPoly ep_Q2_041_coefficient_18_0015
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0016 : Poly :=
[
  term ((8563404800 : Rat) / 151763803) [(0, 1), (1, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 16 for generator 18. -/
def ep_Q2_041_partial_18_0016 : Poly :=
[
  term ((17126809600 : Rat) / 151763803) [(0, 1), (1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8563404800 : Rat) / 151763803) [(0, 1), (1, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 18. -/
theorem ep_Q2_041_partial_18_0016_valid :
    mulPoly ep_Q2_041_coefficient_18_0016
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0017 : Poly :=
[
  term ((-393231506966069603106879309671323435064803216062826693555200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (1, 1), (10, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 17 for generator 18. -/
def ep_Q2_041_partial_18_0017 : Poly :=
[
  term ((-786463013932139206213758619342646870129606432125653387110400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (1, 1), (8, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((393231506966069603106879309671323435064803216062826693555200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (1, 1), (10, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 18. -/
theorem ep_Q2_041_partial_18_0017_valid :
    mulPoly ep_Q2_041_coefficient_18_0017
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0018 : Poly :=
[
  term ((408822667992322456415889086975640053376233773529640784965823187726381085 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 18 for generator 18. -/
def ep_Q2_041_partial_18_0018 : Poly :=
[
  term ((408822667992322456415889086975640053376233773529640784965823187726381085 : Rat) / 1768021246369032699354887595084416698163356187370448855844164303273054) [(0, 1), (1, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-408822667992322456415889086975640053376233773529640784965823187726381085 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 18. -/
theorem ep_Q2_041_partial_18_0018_valid :
    mulPoly ep_Q2_041_coefficient_18_0018
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0019 : Poly :=
[
  term ((268976875050576 : Rat) / 275754830051) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 18. -/
def ep_Q2_041_partial_18_0019 : Poly :=
[
  term ((537953750101152 : Rat) / 275754830051) [(0, 1), (1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-268976875050576 : Rat) / 275754830051) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 18. -/
theorem ep_Q2_041_partial_18_0019_valid :
    mulPoly ep_Q2_041_coefficient_18_0019
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0020 : Poly :=
[
  term ((-1900001366511374507477184581471778347898900102237911625564560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (1, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 20 for generator 18. -/
def ep_Q2_041_partial_18_0020 : Poly :=
[
  term ((-3800002733022749014954369162943556695797800204475823251129120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((1900001366511374507477184581471778347898900102237911625564560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (1, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 18. -/
theorem ep_Q2_041_partial_18_0020_valid :
    mulPoly ep_Q2_041_coefficient_18_0020
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0021 : Poly :=
[
  term ((7094273389426652 : Rat) / 3100914216589) [(0, 1), (1, 1), (11, 1), (14, 1)]
]

/-- Partial product 21 for generator 18. -/
def ep_Q2_041_partial_18_0021 : Poly :=
[
  term ((14188546778853304 : Rat) / 3100914216589) [(0, 1), (1, 1), (8, 1), (11, 1), (14, 1)],
  term ((-7094273389426652 : Rat) / 3100914216589) [(0, 1), (1, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 18. -/
theorem ep_Q2_041_partial_18_0021_valid :
    mulPoly ep_Q2_041_coefficient_18_0021
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0022 : Poly :=
[
  term ((16200727913871412242607064145015207551040297511233206382542824915 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (1, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 22 for generator 18. -/
def ep_Q2_041_partial_18_0022 : Poly :=
[
  term ((16200727913871412242607064145015207551040297511233206382542824915 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (1, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-16200727913871412242607064145015207551040297511233206382542824915 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (1, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 18. -/
theorem ep_Q2_041_partial_18_0022_valid :
    mulPoly ep_Q2_041_coefficient_18_0022
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0023 : Poly :=
[
  term ((3119813938397535411700033067462748372500143137148030096285312960 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (1, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 23 for generator 18. -/
def ep_Q2_041_partial_18_0023 : Poly :=
[
  term ((6239627876795070823400066134925496745000286274296060192570625920 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (1, 1), (8, 1), (11, 2), (14, 1), (15, 1)],
  term ((-3119813938397535411700033067462748372500143137148030096285312960 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (1, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 18. -/
theorem ep_Q2_041_partial_18_0023_valid :
    mulPoly ep_Q2_041_coefficient_18_0023
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0024 : Poly :=
[
  term ((8931546172418425834 : Rat) / 37000277874542993) [(0, 1), (1, 1), (13, 1), (14, 1)]
]

/-- Partial product 24 for generator 18. -/
def ep_Q2_041_partial_18_0024 : Poly :=
[
  term ((17863092344836851668 : Rat) / 37000277874542993) [(0, 1), (1, 1), (8, 1), (13, 1), (14, 1)],
  term ((-8931546172418425834 : Rat) / 37000277874542993) [(0, 1), (1, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 18. -/
theorem ep_Q2_041_partial_18_0024_valid :
    mulPoly ep_Q2_041_coefficient_18_0024
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0025 : Poly :=
[
  term ((139156838911476635864050996952667772722087782470499865312302650 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (1, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 25 for generator 18. -/
def ep_Q2_041_partial_18_0025 : Poly :=
[
  term ((278313677822953271728101993905335545444175564940999730624605300 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (1, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-139156838911476635864050996952667772722087782470499865312302650 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (1, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 18. -/
theorem ep_Q2_041_partial_18_0025_valid :
    mulPoly ep_Q2_041_coefficient_18_0025
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0026 : Poly :=
[
  term ((4402125280 : Rat) / 151763803) [(0, 1), (1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 26 for generator 18. -/
def ep_Q2_041_partial_18_0026 : Poly :=
[
  term ((8804250560 : Rat) / 151763803) [(0, 1), (1, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4402125280 : Rat) / 151763803) [(0, 1), (1, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 18. -/
theorem ep_Q2_041_partial_18_0026_valid :
    mulPoly ep_Q2_041_coefficient_18_0026
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0027 : Poly :=
[
  term ((-28877938792820736478161449303987814762571486179613835307960 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (1, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 27 for generator 18. -/
def ep_Q2_041_partial_18_0027 : Poly :=
[
  term ((-57755877585641472956322898607975629525142972359227670615920 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (1, 1), (8, 1), (13, 2), (14, 1), (15, 1)],
  term ((28877938792820736478161449303987814762571486179613835307960 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (1, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 18. -/
theorem ep_Q2_041_partial_18_0027_valid :
    mulPoly ep_Q2_041_coefficient_18_0027
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0028 : Poly :=
[
  term ((-522999085034627034471432960205356151600314635334298103666290581145000525 : Rat) / 7072084985476130797419550380337666792653424749481795423376657213092216) [(0, 1), (1, 1), (14, 1), (15, 1)]
]

/-- Partial product 28 for generator 18. -/
def ep_Q2_041_partial_18_0028 : Poly :=
[
  term ((-522999085034627034471432960205356151600314635334298103666290581145000525 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(0, 1), (1, 1), (8, 1), (14, 1), (15, 1)],
  term ((522999085034627034471432960205356151600314635334298103666290581145000525 : Rat) / 7072084985476130797419550380337666792653424749481795423376657213092216) [(0, 1), (1, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 18. -/
theorem ep_Q2_041_partial_18_0028_valid :
    mulPoly ep_Q2_041_coefficient_18_0028
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0029 : Poly :=
[
  term ((-172048507287720 : Rat) / 275754830051) [(0, 1), (1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 18. -/
def ep_Q2_041_partial_18_0029 : Poly :=
[
  term ((-344097014575440 : Rat) / 275754830051) [(0, 1), (1, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((172048507287720 : Rat) / 275754830051) [(0, 1), (1, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 18. -/
theorem ep_Q2_041_partial_18_0029_valid :
    mulPoly ep_Q2_041_coefficient_18_0029
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0030 : Poly :=
[
  term ((-49831447102476812732899514684939676580619591777164394779752000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (2, 1), (6, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 30 for generator 18. -/
def ep_Q2_041_partial_18_0030 : Poly :=
[
  term ((-99662894204953625465799029369879353161239183554328789559504000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (2, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((49831447102476812732899514684939676580619591777164394779752000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (2, 1), (6, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 18. -/
theorem ep_Q2_041_partial_18_0030_valid :
    mulPoly ep_Q2_041_coefficient_18_0030
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0031 : Poly :=
[
  term ((-822211156475280 : Rat) / 3100914216589) [(0, 1), (2, 1), (6, 1), (14, 1)]
]

/-- Partial product 31 for generator 18. -/
def ep_Q2_041_partial_18_0031 : Poly :=
[
  term ((-1644422312950560 : Rat) / 3100914216589) [(0, 1), (2, 1), (6, 1), (8, 1), (14, 1)],
  term ((822211156475280 : Rat) / 3100914216589) [(0, 1), (2, 1), (6, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 18. -/
theorem ep_Q2_041_partial_18_0031_valid :
    mulPoly ep_Q2_041_coefficient_18_0031
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0032 : Poly :=
[
  term ((1433177906144363581160514926990450352091769457756426457568469000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (2, 1), (6, 1), (14, 1), (15, 2)]
]

/-- Partial product 32 for generator 18. -/
def ep_Q2_041_partial_18_0032 : Poly :=
[
  term ((2866355812288727162321029853980900704183538915512852915136938000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (2, 1), (6, 1), (8, 1), (14, 1), (15, 2)],
  term ((-1433177906144363581160514926990450352091769457756426457568469000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (2, 1), (6, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 18. -/
theorem ep_Q2_041_partial_18_0032_valid :
    mulPoly ep_Q2_041_coefficient_18_0032
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0033 : Poly :=
[
  term ((-852110566949251536095207864239702484578909720915619713647022108569600 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(0, 1), (2, 1), (10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 33 for generator 18. -/
def ep_Q2_041_partial_18_0033 : Poly :=
[
  term ((-1704221133898503072190415728479404969157819441831239427294044217139200 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(0, 1), (2, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((852110566949251536095207864239702484578909720915619713647022108569600 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(0, 1), (2, 1), (10, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 18. -/
theorem ep_Q2_041_partial_18_0033_valid :
    mulPoly ep_Q2_041_coefficient_18_0033
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0034 : Poly :=
[
  term ((-1556674107600391157890705456580262514706414079246265410524575621006911600 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(0, 1), (2, 1), (10, 1), (14, 1), (15, 2)]
]

/-- Partial product 34 for generator 18. -/
def ep_Q2_041_partial_18_0034 : Poly :=
[
  term ((-3113348215200782315781410913160525029412828158492530821049151242013823200 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(0, 1), (2, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((1556674107600391157890705456580262514706414079246265410524575621006911600 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(0, 1), (2, 1), (10, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 18. -/
theorem ep_Q2_041_partial_18_0034_valid :
    mulPoly ep_Q2_041_coefficient_18_0034
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0035 : Poly :=
[
  term ((1050681916976091912057568655753088742594656698576805661710330520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 35 for generator 18. -/
def ep_Q2_041_partial_18_0035 : Poly :=
[
  term ((2101363833952183824115137311506177485189313397153611323420661040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (2, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1050681916976091912057568655753088742594656698576805661710330520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 18. -/
theorem ep_Q2_041_partial_18_0035_valid :
    mulPoly ep_Q2_041_coefficient_18_0035
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0036 : Poly :=
[
  term ((1299467560595309391573186213672113025603281327075552008785756256444559871421983917 : Rat) / 429849035476684881762157618267932201883232761491405201937585956232214509243776) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 36 for generator 18. -/
def ep_Q2_041_partial_18_0036 : Poly :=
[
  term ((1299467560595309391573186213672113025603281327075552008785756256444559871421983917 : Rat) / 214924517738342440881078809133966100941616380745702600968792978116107254621888) [(0, 1), (2, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1299467560595309391573186213672113025603281327075552008785756256444559871421983917 : Rat) / 429849035476684881762157618267932201883232761491405201937585956232214509243776) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 18. -/
theorem ep_Q2_041_partial_18_0036_valid :
    mulPoly ep_Q2_041_coefficient_18_0036
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0037 : Poly :=
[
  term ((28158263285665 : Rat) / 38520673498) [(0, 1), (2, 1), (14, 1)]
]

/-- Partial product 37 for generator 18. -/
def ep_Q2_041_partial_18_0037 : Poly :=
[
  term ((28158263285665 : Rat) / 19260336749) [(0, 1), (2, 1), (8, 1), (14, 1)],
  term ((-28158263285665 : Rat) / 38520673498) [(0, 1), (2, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 18. -/
theorem ep_Q2_041_partial_18_0037_valid :
    mulPoly ep_Q2_041_coefficient_18_0037
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0038 : Poly :=
[
  term ((1021733037672842161741182518686332602599517092057744136946726433717279185395499289919 : Rat) / 111576528208733775737405770341833258688833418232840464560084811781990537613705856) [(0, 1), (2, 1), (14, 1), (15, 2)]
]

/-- Partial product 38 for generator 18. -/
def ep_Q2_041_partial_18_0038 : Poly :=
[
  term ((1021733037672842161741182518686332602599517092057744136946726433717279185395499289919 : Rat) / 55788264104366887868702885170916629344416709116420232280042405890995268806852928) [(0, 1), (2, 1), (8, 1), (14, 1), (15, 2)],
  term ((-1021733037672842161741182518686332602599517092057744136946726433717279185395499289919 : Rat) / 111576528208733775737405770341833258688833418232840464560084811781990537613705856) [(0, 1), (2, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 18. -/
theorem ep_Q2_041_partial_18_0038_valid :
    mulPoly ep_Q2_041_coefficient_18_0038
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0039 : Poly :=
[
  term ((1290148655271601153869150656950424543057755499323805472693694411256160 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(0, 1), (2, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 39 for generator 18. -/
def ep_Q2_041_partial_18_0039 : Poly :=
[
  term ((2580297310543202307738301313900849086115510998647610945387388822512320 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(0, 1), (2, 2), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1290148655271601153869150656950424543057755499323805472693694411256160 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(0, 1), (2, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 18. -/
theorem ep_Q2_041_partial_18_0039_valid :
    mulPoly ep_Q2_041_coefficient_18_0039
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0040 : Poly :=
[
  term ((560962277370629569485823940894068384622806475186174482989308332441884600 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(0, 1), (2, 2), (14, 1), (15, 2)]
]

/-- Partial product 40 for generator 18. -/
def ep_Q2_041_partial_18_0040 : Poly :=
[
  term ((1121924554741259138971647881788136769245612950372348965978616664883769200 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(0, 1), (2, 2), (8, 1), (14, 1), (15, 2)],
  term ((-560962277370629569485823940894068384622806475186174482989308332441884600 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(0, 1), (2, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 18. -/
theorem ep_Q2_041_partial_18_0040_valid :
    mulPoly ep_Q2_041_coefficient_18_0040
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0041 : Poly :=
[
  term ((-29898868261486087639739708810963805948371755066298636867851200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (3, 1), (6, 1), (11, 1), (15, 2)]
]

/-- Partial product 41 for generator 18. -/
def ep_Q2_041_partial_18_0041 : Poly :=
[
  term ((-59797736522972175279479417621927611896743510132597273735702400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (3, 1), (6, 1), (8, 1), (11, 1), (15, 2)],
  term ((29898868261486087639739708810963805948371755066298636867851200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (3, 1), (6, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 18. -/
theorem ep_Q2_041_partial_18_0041_valid :
    mulPoly ep_Q2_041_coefficient_18_0041
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0042 : Poly :=
[
  term ((-493326693885168 : Rat) / 3100914216589) [(0, 1), (3, 1), (6, 1), (15, 1)]
]

/-- Partial product 42 for generator 18. -/
def ep_Q2_041_partial_18_0042 : Poly :=
[
  term ((-986653387770336 : Rat) / 3100914216589) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1)],
  term ((493326693885168 : Rat) / 3100914216589) [(0, 1), (3, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 18. -/
theorem ep_Q2_041_partial_18_0042_valid :
    mulPoly ep_Q2_041_coefficient_18_0042
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0043 : Poly :=
[
  term ((859906743686618148696308956194270211255061674653855874541081400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (3, 1), (6, 1), (15, 3)]
]

/-- Partial product 43 for generator 18. -/
def ep_Q2_041_partial_18_0043 : Poly :=
[
  term ((1719813487373236297392617912388540422510123349307711749082162800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 3)],
  term ((-859906743686618148696308956194270211255061674653855874541081400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (3, 1), (6, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 18. -/
theorem ep_Q2_041_partial_18_0043_valid :
    mulPoly ep_Q2_041_coefficient_18_0043
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0044 : Poly :=
[
  term ((-19932578840990725093159805873975870632247836710865757911900800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (3, 1), (7, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 44 for generator 18. -/
def ep_Q2_041_partial_18_0044 : Poly :=
[
  term ((-39865157681981450186319611747951741264495673421731515823801600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (3, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((19932578840990725093159805873975870632247836710865757911900800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (3, 1), (7, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 18. -/
theorem ep_Q2_041_partial_18_0044_valid :
    mulPoly ep_Q2_041_coefficient_18_0044
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0045 : Poly :=
[
  term ((-328884462590112 : Rat) / 3100914216589) [(0, 1), (3, 1), (7, 1), (14, 1)]
]

/-- Partial product 45 for generator 18. -/
def ep_Q2_041_partial_18_0045 : Poly :=
[
  term ((-657768925180224 : Rat) / 3100914216589) [(0, 1), (3, 1), (7, 1), (8, 1), (14, 1)],
  term ((328884462590112 : Rat) / 3100914216589) [(0, 1), (3, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 18. -/
theorem ep_Q2_041_partial_18_0045_valid :
    mulPoly ep_Q2_041_coefficient_18_0045
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0046 : Poly :=
[
  term ((573271162457745432464205970796180140836707783102570583027387600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (3, 1), (7, 1), (14, 1), (15, 2)]
]

/-- Partial product 46 for generator 18. -/
def ep_Q2_041_partial_18_0046 : Poly :=
[
  term ((1146542324915490864928411941592360281673415566205141166054775200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (3, 1), (7, 1), (8, 1), (14, 1), (15, 2)],
  term ((-573271162457745432464205970796180140836707783102570583027387600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (3, 1), (7, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 18. -/
theorem ep_Q2_041_partial_18_0046_valid :
    mulPoly ep_Q2_041_coefficient_18_0046
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0047 : Poly :=
[
  term ((123331673471292 : Rat) / 3100914216589) [(0, 1), (5, 1), (6, 1), (7, 1)]
]

/-- Partial product 47 for generator 18. -/
def ep_Q2_041_partial_18_0047 : Poly :=
[
  term ((-123331673471292 : Rat) / 3100914216589) [(0, 1), (5, 1), (6, 1), (7, 1)],
  term ((246663346942584 : Rat) / 3100914216589) [(0, 1), (5, 1), (6, 1), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 18. -/
theorem ep_Q2_041_partial_18_0047_valid :
    mulPoly ep_Q2_041_coefficient_18_0047
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0048 : Poly :=
[
  term ((7474717065371521909934927202740951487092938766574659216962800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (5, 1), (6, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 48 for generator 18. -/
def ep_Q2_041_partial_18_0048 : Poly :=
[
  term ((14949434130743043819869854405481902974185877533149318433925600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (5, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-7474717065371521909934927202740951487092938766574659216962800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (5, 1), (6, 1), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 18. -/
theorem ep_Q2_041_partial_18_0048_valid :
    mulPoly ep_Q2_041_coefficient_18_0048
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0049 : Poly :=
[
  term ((-214976685921654537174077239048567552813765418663463968635270350 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (6, 1), (7, 1), (15, 2)]
]

/-- Partial product 49 for generator 18. -/
def ep_Q2_041_partial_18_0049 : Poly :=
[
  term ((-429953371843309074348154478097135105627530837326927937270540700 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (6, 1), (7, 1), (8, 1), (15, 2)],
  term ((214976685921654537174077239048567552813765418663463968635270350 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (6, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 18. -/
theorem ep_Q2_041_partial_18_0049_valid :
    mulPoly ep_Q2_041_coefficient_18_0049
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0050 : Poly :=
[
  term ((1245786177561920318322487867123491914515489794429109869493800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (5, 1), (6, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 50 for generator 18. -/
def ep_Q2_041_partial_18_0050 : Poly :=
[
  term ((2491572355123840636644975734246983829030979588858219738987600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (5, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-1245786177561920318322487867123491914515489794429109869493800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (5, 1), (6, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 18. -/
theorem ep_Q2_041_partial_18_0050_valid :
    mulPoly ep_Q2_041_coefficient_18_0050
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0051 : Poly :=
[
  term ((-21178365018552645411482293741099362546763326505294867781394600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (5, 1), (6, 1), (11, 1), (15, 2)]
]

/-- Partial product 51 for generator 18. -/
def ep_Q2_041_partial_18_0051 : Poly :=
[
  term ((-42356730037105290822964587482198725093526653010589735562789200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (5, 1), (6, 1), (8, 1), (11, 1), (15, 2)],
  term ((21178365018552645411482293741099362546763326505294867781394600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (5, 1), (6, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 18. -/
theorem ep_Q2_041_partial_18_0051_valid :
    mulPoly ep_Q2_041_coefficient_18_0051
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0052 : Poly :=
[
  term ((1125277506647625931807946897797610173447247146806906809039269063 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 52 for generator 18. -/
def ep_Q2_041_partial_18_0052 : Poly :=
[
  term ((1125277506647625931807946897797610173447247146806906809039269063 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-1125277506647625931807946897797610173447247146806906809039269063 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 18. -/
theorem ep_Q2_041_partial_18_0052_valid :
    mulPoly ep_Q2_041_coefficient_18_0052
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0053 : Poly :=
[
  term ((-35829447653609089529012873174761258802294236443910661439211725 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 3)]
]

/-- Partial product 53 for generator 18. -/
def ep_Q2_041_partial_18_0053 : Poly :=
[
  term ((-71658895307218179058025746349522517604588472887821322878423450 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 3)],
  term ((35829447653609089529012873174761258802294236443910661439211725 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 18. -/
theorem ep_Q2_041_partial_18_0053_valid :
    mulPoly ep_Q2_041_coefficient_18_0053
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0054 : Poly :=
[
  term ((49945656414809640789968036653966091588270367061404449465055 : Rat) / 6411569458428135808083770169581959523663379719091834185354) [(0, 1), (5, 1), (6, 1), (14, 2), (15, 1)]
]

/-- Partial product 54 for generator 18. -/
def ep_Q2_041_partial_18_0054 : Poly :=
[
  term ((49945656414809640789968036653966091588270367061404449465055 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (5, 1), (6, 1), (8, 1), (14, 2), (15, 1)],
  term ((-49945656414809640789968036653966091588270367061404449465055 : Rat) / 6411569458428135808083770169581959523663379719091834185354) [(0, 1), (5, 1), (6, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 18. -/
theorem ep_Q2_041_partial_18_0054_valid :
    mulPoly ep_Q2_041_coefficient_18_0054
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0055 : Poly :=
[
  term ((-4273049158899691816252253354928879317744810883429629976965530513 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (6, 1), (15, 1)]
]

/-- Partial product 55 for generator 18. -/
def ep_Q2_041_partial_18_0055 : Poly :=
[
  term ((-8546098317799383632504506709857758635489621766859259953931061026 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (6, 1), (8, 1), (15, 1)],
  term ((4273049158899691816252253354928879317744810883429629976965530513 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 18. -/
theorem ep_Q2_041_partial_18_0055_valid :
    mulPoly ep_Q2_041_coefficient_18_0055
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0056 : Poly :=
[
  term ((609100610111354521993218843970941399639002019546481244466599325 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (6, 1), (15, 3)]
]

/-- Partial product 56 for generator 18. -/
def ep_Q2_041_partial_18_0056 : Poly :=
[
  term ((1218201220222709043986437687941882799278004039092962488933198650 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (6, 1), (8, 1), (15, 3)],
  term ((-609100610111354521993218843970941399639002019546481244466599325 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (6, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 18. -/
theorem ep_Q2_041_partial_18_0056_valid :
    mulPoly ep_Q2_041_coefficient_18_0056
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0057 : Poly :=
[
  term ((-18686792663428804774837318006852378717732346916436648042407000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (5, 1), (7, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 57 for generator 18. -/
def ep_Q2_041_partial_18_0057 : Poly :=
[
  term ((-37373585326857609549674636013704757435464693832873296084814000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (5, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((18686792663428804774837318006852378717732346916436648042407000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (5, 1), (7, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 18. -/
theorem ep_Q2_041_partial_18_0057_valid :
    mulPoly ep_Q2_041_coefficient_18_0057
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0058 : Poly :=
[
  term ((-308329183678230 : Rat) / 3100914216589) [(0, 1), (5, 1), (7, 1), (14, 1)]
]

/-- Partial product 58 for generator 18. -/
def ep_Q2_041_partial_18_0058 : Poly :=
[
  term ((-616658367356460 : Rat) / 3100914216589) [(0, 1), (5, 1), (7, 1), (8, 1), (14, 1)],
  term ((308329183678230 : Rat) / 3100914216589) [(0, 1), (5, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 18. -/
theorem ep_Q2_041_partial_18_0058_valid :
    mulPoly ep_Q2_041_coefficient_18_0058
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0059 : Poly :=
[
  term ((537441714804136342935193097621418882034413546658659921588175875 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (7, 1), (14, 1), (15, 2)]
]

/-- Partial product 59 for generator 18. -/
def ep_Q2_041_partial_18_0059 : Poly :=
[
  term ((1074883429608272685870386195242837764068827093317319843176351750 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (7, 1), (8, 1), (14, 1), (15, 2)],
  term ((-537441714804136342935193097621418882034413546658659921588175875 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (7, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 18. -/
theorem ep_Q2_041_partial_18_0059_valid :
    mulPoly ep_Q2_041_coefficient_18_0059
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0060 : Poly :=
[
  term ((519493846413294464484450127117557866789224058137274930023253200 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (5, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 60 for generator 18. -/
def ep_Q2_041_partial_18_0060 : Poly :=
[
  term ((1038987692826588928968900254235115733578448116274549860046506400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (5, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-519493846413294464484450127117557866789224058137274930023253200 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (5, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 18. -/
theorem ep_Q2_041_partial_18_0060_valid :
    mulPoly ep_Q2_041_coefficient_18_0060
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0061 : Poly :=
[
  term ((-1674961818340591280976609286430196591018559055786900903965050 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (5, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 61 for generator 18. -/
def ep_Q2_041_partial_18_0061 : Poly :=
[
  term ((-3349923636681182561953218572860393182037118111573801807930100 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((1674961818340591280976609286430196591018559055786900903965050 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (5, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 18. -/
theorem ep_Q2_041_partial_18_0061_valid :
    mulPoly ep_Q2_041_coefficient_18_0061
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0062 : Poly :=
[
  term ((66593126361149200764893424193414365513300102934120942011677645709 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (5, 1), (14, 1), (15, 1)]
]

/-- Partial product 62 for generator 18. -/
def ep_Q2_041_partial_18_0062 : Poly :=
[
  term ((66593126361149200764893424193414365513300102934120942011677645709 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((-66593126361149200764893424193414365513300102934120942011677645709 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 18. -/
theorem ep_Q2_041_partial_18_0062_valid :
    mulPoly ep_Q2_041_coefficient_18_0062
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0063 : Poly :=
[
  term ((-2139946936526296954610598491911852072021469840350012319884178805 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (14, 1), (15, 3)]
]

/-- Partial product 63 for generator 18. -/
def ep_Q2_041_partial_18_0063 : Poly :=
[
  term ((-4279893873052593909221196983823704144042939680700024639768357610 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (8, 1), (14, 1), (15, 3)],
  term ((2139946936526296954610598491911852072021469840350012319884178805 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 18. -/
theorem ep_Q2_041_partial_18_0063_valid :
    mulPoly ep_Q2_041_coefficient_18_0063
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0064 : Poly :=
[
  term ((-2215249355826730355885930991307455433506878179557381244690205 : Rat) / 89761972417993901313172782374147433331287316067285678594956) [(0, 1), (5, 1), (14, 2), (15, 1)]
]

/-- Partial product 64 for generator 18. -/
def ep_Q2_041_partial_18_0064 : Poly :=
[
  term ((-2215249355826730355885930991307455433506878179557381244690205 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (5, 1), (8, 1), (14, 2), (15, 1)],
  term ((2215249355826730355885930991307455433506878179557381244690205 : Rat) / 89761972417993901313172782374147433331287316067285678594956) [(0, 1), (5, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 18. -/
theorem ep_Q2_041_partial_18_0064_valid :
    mulPoly ep_Q2_041_coefficient_18_0064
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0065 : Poly :=
[
  term ((-390550299325758 : Rat) / 3100914216589) [(0, 1), (6, 1)]
]

/-- Partial product 65 for generator 18. -/
def ep_Q2_041_partial_18_0065 : Poly :=
[
  term ((390550299325758 : Rat) / 3100914216589) [(0, 1), (6, 1)],
  term ((-781100598651516 : Rat) / 3100914216589) [(0, 1), (6, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 18. -/
theorem ep_Q2_041_partial_18_0065_valid :
    mulPoly ep_Q2_041_coefficient_18_0065
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0066 : Poly :=
[
  term ((14949434130743043819869854405481902974185877533149318433925600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 66 for generator 18. -/
def ep_Q2_041_partial_18_0066 : Poly :=
[
  term ((-14949434130743043819869854405481902974185877533149318433925600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 2)],
  term ((29898868261486087639739708810963805948371755066298636867851200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (7, 1), (8, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 18. -/
theorem ep_Q2_041_partial_18_0066_valid :
    mulPoly ep_Q2_041_coefficient_18_0066
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0067 : Poly :=
[
  term ((-4520499623748443137964651810696840167574334130164081652975555 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (6, 1), (7, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 67 for generator 18. -/
def ep_Q2_041_partial_18_0067 : Poly :=
[
  term ((4520499623748443137964651810696840167574334130164081652975555 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (6, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-4520499623748443137964651810696840167574334130164081652975555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (7, 1), (8, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 18. -/
theorem ep_Q2_041_partial_18_0067_valid :
    mulPoly ep_Q2_041_coefficient_18_0067
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0068 : Poly :=
[
  term ((3461333030754051033270590310503357157006789999396833504879475043 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 68 for generator 18. -/
def ep_Q2_041_partial_18_0068 : Poly :=
[
  term ((-3461333030754051033270590310503357157006789999396833504879475043 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((6922666061508102066541180621006714314013579998793667009758950086 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (7, 1), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 18. -/
theorem ep_Q2_041_partial_18_0068_valid :
    mulPoly ep_Q2_041_coefficient_18_0068
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0069 : Poly :=
[
  term ((-429953371843309074348154478097135105627530837326927937270540700 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (7, 1), (8, 1), (15, 3)]
]

/-- Partial product 69 for generator 18. -/
def ep_Q2_041_partial_18_0069 : Poly :=
[
  term ((429953371843309074348154478097135105627530837326927937270540700 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (7, 1), (8, 1), (15, 3)],
  term ((-859906743686618148696308956194270211255061674653855874541081400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (7, 1), (8, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 18. -/
theorem ep_Q2_041_partial_18_0069_valid :
    mulPoly ep_Q2_041_coefficient_18_0069
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0070 : Poly :=
[
  term ((-164442231295056 : Rat) / 3100914216589) [(0, 1), (6, 1), (7, 1), (9, 1)]
]

/-- Partial product 70 for generator 18. -/
def ep_Q2_041_partial_18_0070 : Poly :=
[
  term ((-328884462590112 : Rat) / 3100914216589) [(0, 1), (6, 1), (7, 1), (8, 1), (9, 1)],
  term ((164442231295056 : Rat) / 3100914216589) [(0, 1), (6, 1), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 18. -/
theorem ep_Q2_041_partial_18_0070_valid :
    mulPoly ep_Q2_041_coefficient_18_0070
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0071 : Poly :=
[
  term ((14949434130743043819869854405481902974185877533149318433925600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 71 for generator 18. -/
def ep_Q2_041_partial_18_0071 : Poly :=
[
  term ((29898868261486087639739708810963805948371755066298636867851200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-14949434130743043819869854405481902974185877533149318433925600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 18. -/
theorem ep_Q2_041_partial_18_0071_valid :
    mulPoly ep_Q2_041_coefficient_18_0071
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0072 : Poly :=
[
  term ((-9966289420495362546579902936987935316123918355432878955950400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (7, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 72 for generator 18. -/
def ep_Q2_041_partial_18_0072 : Poly :=
[
  term ((-19932578840990725093159805873975870632247836710865757911900800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((9966289420495362546579902936987935316123918355432878955950400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (7, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 18. -/
theorem ep_Q2_041_partial_18_0072_valid :
    mulPoly ep_Q2_041_coefficient_18_0072
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0073 : Poly :=
[
  term ((246663346942584 : Rat) / 3100914216589) [(0, 1), (6, 1), (7, 1), (9, 1), (14, 1)]
]

/-- Partial product 73 for generator 18. -/
def ep_Q2_041_partial_18_0073 : Poly :=
[
  term ((493326693885168 : Rat) / 3100914216589) [(0, 1), (6, 1), (7, 1), (8, 1), (9, 1), (14, 1)],
  term ((-246663346942584 : Rat) / 3100914216589) [(0, 1), (6, 1), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 18. -/
theorem ep_Q2_041_partial_18_0073_valid :
    mulPoly ep_Q2_041_coefficient_18_0073
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0074 : Poly :=
[
  term ((-429953371843309074348154478097135105627530837326927937270540700 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (7, 1), (9, 1), (14, 1), (15, 2)]
]

/-- Partial product 74 for generator 18. -/
def ep_Q2_041_partial_18_0074 : Poly :=
[
  term ((-859906743686618148696308956194270211255061674653855874541081400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 2)],
  term ((429953371843309074348154478097135105627530837326927937270540700 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (7, 1), (9, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 18. -/
theorem ep_Q2_041_partial_18_0074_valid :
    mulPoly ep_Q2_041_coefficient_18_0074
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0075 : Poly :=
[
  term ((3167957412695895840047614616255189345815304850661874310543486645 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (7, 1), (9, 1), (15, 2)]
]

/-- Partial product 75 for generator 18. -/
def ep_Q2_041_partial_18_0075 : Poly :=
[
  term ((6335914825391791680095229232510378691630609701323748621086973290 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (7, 1), (8, 1), (9, 1), (15, 2)],
  term ((-3167957412695895840047614616255189345815304850661874310543486645 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 18. -/
theorem ep_Q2_041_partial_18_0075_valid :
    mulPoly ep_Q2_041_coefficient_18_0075
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0076 : Poly :=
[
  term ((9040999247496886275929303621393680335148668260328163305951110 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (7, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 76 for generator 18. -/
def ep_Q2_041_partial_18_0076 : Poly :=
[
  term ((18081998494993772551858607242787360670297336520656326611902220 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-9040999247496886275929303621393680335148668260328163305951110 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (7, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 18. -/
theorem ep_Q2_041_partial_18_0076_valid :
    mulPoly ep_Q2_041_coefficient_18_0076
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0077 : Poly :=
[
  term ((-14520972701433954149928854127215420019408577146593116786259425 : Rat) / 89761972417993901313172782374147433331287316067285678594956) [(0, 1), (6, 1), (7, 1), (10, 1), (15, 1)]
]

/-- Partial product 77 for generator 18. -/
def ep_Q2_041_partial_18_0077 : Poly :=
[
  term ((-14520972701433954149928854127215420019408577146593116786259425 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (6, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((14520972701433954149928854127215420019408577146593116786259425 : Rat) / 89761972417993901313172782374147433331287316067285678594956) [(0, 1), (6, 1), (7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 18. -/
theorem ep_Q2_041_partial_18_0077_valid :
    mulPoly ep_Q2_041_coefficient_18_0077
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0078 : Poly :=
[
  term ((-4520499623748443137964651810696840167574334130164081652975555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (7, 1), (10, 2), (15, 1)]
]

/-- Partial product 78 for generator 18. -/
def ep_Q2_041_partial_18_0078 : Poly :=
[
  term ((-9040999247496886275929303621393680335148668260328163305951110 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (7, 1), (8, 1), (10, 2), (15, 1)],
  term ((4520499623748443137964651810696840167574334130164081652975555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (7, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 18. -/
theorem ep_Q2_041_partial_18_0078_valid :
    mulPoly ep_Q2_041_coefficient_18_0078
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0079 : Poly :=
[
  term ((-164442231295056 : Rat) / 3100914216589) [(0, 1), (6, 1), (7, 1), (11, 1)]
]

/-- Partial product 79 for generator 18. -/
def ep_Q2_041_partial_18_0079 : Poly :=
[
  term ((-328884462590112 : Rat) / 3100914216589) [(0, 1), (6, 1), (7, 1), (8, 1), (11, 1)],
  term ((164442231295056 : Rat) / 3100914216589) [(0, 1), (6, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 18. -/
theorem ep_Q2_041_partial_18_0079_valid :
    mulPoly ep_Q2_041_coefficient_18_0079
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0080 : Poly :=
[
  term ((-59797736522972175279479417621927611896743510132597273735702400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 80 for generator 18. -/
def ep_Q2_041_partial_18_0080 : Poly :=
[
  term ((-119595473045944350558958835243855223793487020265194547471404800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((59797736522972175279479417621927611896743510132597273735702400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 18. -/
theorem ep_Q2_041_partial_18_0080_valid :
    mulPoly ep_Q2_041_coefficient_18_0080
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0081 : Poly :=
[
  term ((-9328032276139625653532776869731489051939372690081862124251390 : Rat) / 574286985505263798190263892865584106911792441176965063405053) [(0, 1), (6, 1), (7, 1), (11, 1), (15, 2)]
]

/-- Partial product 81 for generator 18. -/
def ep_Q2_041_partial_18_0081 : Poly :=
[
  term ((-18656064552279251307065553739462978103878745380163724248502780 : Rat) / 574286985505263798190263892865584106911792441176965063405053) [(0, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 2)],
  term ((9328032276139625653532776869731489051939372690081862124251390 : Rat) / 574286985505263798190263892865584106911792441176965063405053) [(0, 1), (6, 1), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 18. -/
theorem ep_Q2_041_partial_18_0081_valid :
    mulPoly ep_Q2_041_coefficient_18_0081
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0082 : Poly :=
[
  term ((-9966289420495362546579902936987935316123918355432878955950400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 82 for generator 18. -/
def ep_Q2_041_partial_18_0082 : Poly :=
[
  term ((-19932578840990725093159805873975870632247836710865757911900800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (7, 1), (8, 1), (11, 2), (15, 1)],
  term ((9966289420495362546579902936987935316123918355432878955950400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 18. -/
theorem ep_Q2_041_partial_18_0082_valid :
    mulPoly ep_Q2_041_coefficient_18_0082
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0083 : Poly :=
[
  term ((-34161048112930598302471083895021073418719195777847520292228758859 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 83 for generator 18. -/
def ep_Q2_041_partial_18_0083 : Poly :=
[
  term ((-34161048112930598302471083895021073418719195777847520292228758859 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((34161048112930598302471083895021073418719195777847520292228758859 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 18. -/
theorem ep_Q2_041_partial_18_0083_valid :
    mulPoly ep_Q2_041_coefficient_18_0083
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0084 : Poly :=
[
  term ((1719813487373236297392617912388540422510123349307711749082162800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 3)]
]

/-- Partial product 84 for generator 18. -/
def ep_Q2_041_partial_18_0084 : Poly :=
[
  term ((3439626974746472594785235824777080845020246698615423498164325600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (7, 1), (8, 1), (14, 1), (15, 3)],
  term ((-1719813487373236297392617912388540422510123349307711749082162800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 18. -/
theorem ep_Q2_041_partial_18_0084_valid :
    mulPoly ep_Q2_041_coefficient_18_0084
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0085 : Poly :=
[
  term ((62522810121872863441776195706130259755734768786756487906565366583 : Rat) / 326195007766989837372069891147651772725898106588516156014070104) [(0, 1), (6, 1), (7, 1), (15, 1)]
]

/-- Partial product 85 for generator 18. -/
def ep_Q2_041_partial_18_0085 : Poly :=
[
  term ((62522810121872863441776195706130259755734768786756487906565366583 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-62522810121872863441776195706130259755734768786756487906565366583 : Rat) / 326195007766989837372069891147651772725898106588516156014070104) [(0, 1), (6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 18. -/
theorem ep_Q2_041_partial_18_0085_valid :
    mulPoly ep_Q2_041_coefficient_18_0085
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0086 : Poly :=
[
  term ((-859906743686618148696308956194270211255061674653855874541081400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (7, 1), (15, 3)]
]

/-- Partial product 86 for generator 18. -/
def ep_Q2_041_partial_18_0086 : Poly :=
[
  term ((-1719813487373236297392617912388540422510123349307711749082162800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (7, 1), (8, 1), (15, 3)],
  term ((859906743686618148696308956194270211255061674653855874541081400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 18. -/
theorem ep_Q2_041_partial_18_0086_valid :
    mulPoly ep_Q2_041_coefficient_18_0086
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0087 : Poly :=
[
  term ((-4520499623748443137964651810696840167574334130164081652975555 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (6, 1), (8, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 87 for generator 18. -/
def ep_Q2_041_partial_18_0087 : Poly :=
[
  term ((4520499623748443137964651810696840167574334130164081652975555 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (6, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-4520499623748443137964651810696840167574334130164081652975555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (8, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 18. -/
theorem ep_Q2_041_partial_18_0087_valid :
    mulPoly ep_Q2_041_coefficient_18_0087
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0088 : Poly :=
[
  term ((4520499623748443137964651810696840167574334130164081652975555 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (6, 1), (8, 1), (10, 1), (15, 2)]
]

/-- Partial product 88 for generator 18. -/
def ep_Q2_041_partial_18_0088 : Poly :=
[
  term ((-4520499623748443137964651810696840167574334130164081652975555 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (6, 1), (8, 1), (10, 1), (15, 2)],
  term ((4520499623748443137964651810696840167574334130164081652975555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (8, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 18. -/
theorem ep_Q2_041_partial_18_0088_valid :
    mulPoly ep_Q2_041_coefficient_18_0088
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0089 : Poly :=
[
  term ((4520499623748443137964651810696840167574334130164081652975555 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 89 for generator 18. -/
def ep_Q2_041_partial_18_0089 : Poly :=
[
  term ((-4520499623748443137964651810696840167574334130164081652975555 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((4520499623748443137964651810696840167574334130164081652975555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (8, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 18. -/
theorem ep_Q2_041_partial_18_0089_valid :
    mulPoly ep_Q2_041_coefficient_18_0089
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0090 : Poly :=
[
  term ((-17756551653993409844646246684270770342510198814894820737819746541 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 90 for generator 18. -/
def ep_Q2_041_partial_18_0090 : Poly :=
[
  term ((17756551653993409844646246684270770342510198814894820737819746541 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-17756551653993409844646246684270770342510198814894820737819746541 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 18. -/
theorem ep_Q2_041_partial_18_0090_valid :
    mulPoly ep_Q2_041_coefficient_18_0090
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0091 : Poly :=
[
  term ((5358545391252343461176743420336886444650286561169961634813313000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 3)]
]

/-- Partial product 91 for generator 18. -/
def ep_Q2_041_partial_18_0091 : Poly :=
[
  term ((-5358545391252343461176743420336886444650286561169961634813313000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 3)],
  term ((10717090782504686922353486840673772889300573122339923269626626000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 18. -/
theorem ep_Q2_041_partial_18_0091_valid :
    mulPoly ep_Q2_041_coefficient_18_0091
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0092 : Poly :=
[
  term ((-39865157681981450186319611747951741264495673421731515823801600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (8, 1), (11, 2), (15, 2)]
]

/-- Partial product 92 for generator 18. -/
def ep_Q2_041_partial_18_0092 : Poly :=
[
  term ((39865157681981450186319611747951741264495673421731515823801600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (8, 1), (11, 2), (15, 2)],
  term ((-79730315363962900372639223495903482528991346843463031647603200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (8, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 18. -/
theorem ep_Q2_041_partial_18_0092_valid :
    mulPoly ep_Q2_041_coefficient_18_0092
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0093 : Poly :=
[
  term ((49945656414809640789968036653966091588270367061404449465055 : Rat) / 6411569458428135808083770169581959523663379719091834185354) [(0, 1), (6, 1), (8, 1), (14, 1), (15, 2)]
]

/-- Partial product 93 for generator 18. -/
def ep_Q2_041_partial_18_0093 : Poly :=
[
  term ((-49945656414809640789968036653966091588270367061404449465055 : Rat) / 6411569458428135808083770169581959523663379719091834185354) [(0, 1), (6, 1), (8, 1), (14, 1), (15, 2)],
  term ((49945656414809640789968036653966091588270367061404449465055 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (6, 1), (8, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 18. -/
theorem ep_Q2_041_partial_18_0093_valid :
    mulPoly ep_Q2_041_coefficient_18_0093
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0094 : Poly :=
[
  term ((14434060774035018595729046665683584381582745213999978325251478511 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (6, 1), (8, 1), (15, 2)]
]

/-- Partial product 94 for generator 18. -/
def ep_Q2_041_partial_18_0094 : Poly :=
[
  term ((-14434060774035018595729046665683584381582745213999978325251478511 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (6, 1), (8, 1), (15, 2)],
  term ((14434060774035018595729046665683584381582745213999978325251478511 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (6, 1), (8, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 18. -/
theorem ep_Q2_041_partial_18_0094_valid :
    mulPoly ep_Q2_041_coefficient_18_0094
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0095 : Poly :=
[
  term ((-107488342960827268587038619524283776406882709331731984317635175 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (6, 1), (8, 1), (15, 4)]
]

/-- Partial product 95 for generator 18. -/
def ep_Q2_041_partial_18_0095 : Poly :=
[
  term ((107488342960827268587038619524283776406882709331731984317635175 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (6, 1), (8, 1), (15, 4)],
  term ((-214976685921654537174077239048567552813765418663463968635270350 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (6, 1), (8, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 18. -/
theorem ep_Q2_041_partial_18_0095_valid :
    mulPoly ep_Q2_041_coefficient_18_0095
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0096 : Poly :=
[
  term ((39865157681981450186319611747951741264495673421731515823801600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 96 for generator 18. -/
def ep_Q2_041_partial_18_0096 : Poly :=
[
  term ((79730315363962900372639223495903482528991346843463031647603200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-39865157681981450186319611747951741264495673421731515823801600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 18. -/
theorem ep_Q2_041_partial_18_0096_valid :
    mulPoly ep_Q2_041_coefficient_18_0096
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0097 : Poly :=
[
  term ((-4520499623748443137964651810696840167574334130164081652975555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 97 for generator 18. -/
def ep_Q2_041_partial_18_0097 : Poly :=
[
  term ((-9040999247496886275929303621393680335148668260328163305951110 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((4520499623748443137964651810696840167574334130164081652975555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (9, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 18. -/
theorem ep_Q2_041_partial_18_0097_valid :
    mulPoly ep_Q2_041_coefficient_18_0097
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0098 : Poly :=
[
  term ((17756551653993409844646246684270770342510198814894820737819746541 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 98 for generator 18. -/
def ep_Q2_041_partial_18_0098 : Poly :=
[
  term ((17756551653993409844646246684270770342510198814894820737819746541 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-17756551653993409844646246684270770342510198814894820737819746541 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 18. -/
theorem ep_Q2_041_partial_18_0098_valid :
    mulPoly ep_Q2_041_coefficient_18_0098
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0099 : Poly :=
[
  term ((-1146542324915490864928411941592360281673415566205141166054775200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 3)]
]

/-- Partial product 99 for generator 18. -/
def ep_Q2_041_partial_18_0099 : Poly :=
[
  term ((-2293084649830981729856823883184720563346831132410282332109550400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 1), (9, 1), (10, 1), (15, 3)],
  term ((1146542324915490864928411941592360281673415566205141166054775200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 18. -/
theorem ep_Q2_041_partial_18_0099_valid :
    mulPoly ep_Q2_041_coefficient_18_0099
        ep_Q2_041_generator_18_0000_0099 =
      ep_Q2_041_partial_18_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_041_partials_18_0000_0099 : List Poly :=
[
  ep_Q2_041_partial_18_0000,
  ep_Q2_041_partial_18_0001,
  ep_Q2_041_partial_18_0002,
  ep_Q2_041_partial_18_0003,
  ep_Q2_041_partial_18_0004,
  ep_Q2_041_partial_18_0005,
  ep_Q2_041_partial_18_0006,
  ep_Q2_041_partial_18_0007,
  ep_Q2_041_partial_18_0008,
  ep_Q2_041_partial_18_0009,
  ep_Q2_041_partial_18_0010,
  ep_Q2_041_partial_18_0011,
  ep_Q2_041_partial_18_0012,
  ep_Q2_041_partial_18_0013,
  ep_Q2_041_partial_18_0014,
  ep_Q2_041_partial_18_0015,
  ep_Q2_041_partial_18_0016,
  ep_Q2_041_partial_18_0017,
  ep_Q2_041_partial_18_0018,
  ep_Q2_041_partial_18_0019,
  ep_Q2_041_partial_18_0020,
  ep_Q2_041_partial_18_0021,
  ep_Q2_041_partial_18_0022,
  ep_Q2_041_partial_18_0023,
  ep_Q2_041_partial_18_0024,
  ep_Q2_041_partial_18_0025,
  ep_Q2_041_partial_18_0026,
  ep_Q2_041_partial_18_0027,
  ep_Q2_041_partial_18_0028,
  ep_Q2_041_partial_18_0029,
  ep_Q2_041_partial_18_0030,
  ep_Q2_041_partial_18_0031,
  ep_Q2_041_partial_18_0032,
  ep_Q2_041_partial_18_0033,
  ep_Q2_041_partial_18_0034,
  ep_Q2_041_partial_18_0035,
  ep_Q2_041_partial_18_0036,
  ep_Q2_041_partial_18_0037,
  ep_Q2_041_partial_18_0038,
  ep_Q2_041_partial_18_0039,
  ep_Q2_041_partial_18_0040,
  ep_Q2_041_partial_18_0041,
  ep_Q2_041_partial_18_0042,
  ep_Q2_041_partial_18_0043,
  ep_Q2_041_partial_18_0044,
  ep_Q2_041_partial_18_0045,
  ep_Q2_041_partial_18_0046,
  ep_Q2_041_partial_18_0047,
  ep_Q2_041_partial_18_0048,
  ep_Q2_041_partial_18_0049,
  ep_Q2_041_partial_18_0050,
  ep_Q2_041_partial_18_0051,
  ep_Q2_041_partial_18_0052,
  ep_Q2_041_partial_18_0053,
  ep_Q2_041_partial_18_0054,
  ep_Q2_041_partial_18_0055,
  ep_Q2_041_partial_18_0056,
  ep_Q2_041_partial_18_0057,
  ep_Q2_041_partial_18_0058,
  ep_Q2_041_partial_18_0059,
  ep_Q2_041_partial_18_0060,
  ep_Q2_041_partial_18_0061,
  ep_Q2_041_partial_18_0062,
  ep_Q2_041_partial_18_0063,
  ep_Q2_041_partial_18_0064,
  ep_Q2_041_partial_18_0065,
  ep_Q2_041_partial_18_0066,
  ep_Q2_041_partial_18_0067,
  ep_Q2_041_partial_18_0068,
  ep_Q2_041_partial_18_0069,
  ep_Q2_041_partial_18_0070,
  ep_Q2_041_partial_18_0071,
  ep_Q2_041_partial_18_0072,
  ep_Q2_041_partial_18_0073,
  ep_Q2_041_partial_18_0074,
  ep_Q2_041_partial_18_0075,
  ep_Q2_041_partial_18_0076,
  ep_Q2_041_partial_18_0077,
  ep_Q2_041_partial_18_0078,
  ep_Q2_041_partial_18_0079,
  ep_Q2_041_partial_18_0080,
  ep_Q2_041_partial_18_0081,
  ep_Q2_041_partial_18_0082,
  ep_Q2_041_partial_18_0083,
  ep_Q2_041_partial_18_0084,
  ep_Q2_041_partial_18_0085,
  ep_Q2_041_partial_18_0086,
  ep_Q2_041_partial_18_0087,
  ep_Q2_041_partial_18_0088,
  ep_Q2_041_partial_18_0089,
  ep_Q2_041_partial_18_0090,
  ep_Q2_041_partial_18_0091,
  ep_Q2_041_partial_18_0092,
  ep_Q2_041_partial_18_0093,
  ep_Q2_041_partial_18_0094,
  ep_Q2_041_partial_18_0095,
  ep_Q2_041_partial_18_0096,
  ep_Q2_041_partial_18_0097,
  ep_Q2_041_partial_18_0098,
  ep_Q2_041_partial_18_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_041_block_18_0000_0099 : Poly :=
[
  term ((-10582222770333083292407302711102951144387373782767611753549280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((497018523584360413701821383555441687134245459979716186786940700 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (1, 1), (2, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-368283754939295941836 : Rat) / 259001945121800951) [(0, 1), (1, 1), (2, 1), (8, 1), (13, 1), (14, 1)],
  term ((156795841723537508956836360451765757202559371027120669949149940 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (1, 1), (2, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-25931060160 : Rat) / 151763803) [(0, 1), (1, 1), (2, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((1190754157031629516908018909598476276805607238640247081421840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (1, 1), (2, 1), (8, 1), (13, 2), (14, 1), (15, 1)],
  term ((-294646250950017878360345213745923955152152911724983466265355794307761645 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(0, 1), (1, 1), (2, 1), (8, 1), (14, 1), (15, 1)],
  term ((-193856735525712 : Rat) / 275754830051) [(0, 1), (1, 1), (2, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((5291111385166541646203651355551475572193686891383805876774640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (1, 1), (2, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-248509261792180206850910691777720843567122729989858093393470350 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (1, 1), (2, 1), (11, 1), (14, 1), (15, 2)],
  term ((184141877469647970918 : Rat) / 259001945121800951) [(0, 1), (1, 1), (2, 1), (13, 1), (14, 1)],
  term ((-78397920861768754478418180225882878601279685513560334974574970 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (1, 1), (2, 1), (13, 1), (14, 1), (15, 2)],
  term ((12965530080 : Rat) / 151763803) [(0, 1), (1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((-595377078515814758454009454799238138402803619320123540710920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (1, 1), (2, 1), (13, 2), (14, 1), (15, 1)],
  term ((294646250950017878360345213745923955152152911724983466265355794307761645 : Rat) / 7072084985476130797419550380337666792653424749481795423376657213092216) [(0, 1), (1, 1), (2, 1), (14, 1), (15, 1)],
  term ((96928367762856 : Rat) / 275754830051) [(0, 1), (1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-394289809643387243133108380153992583289755299146309102028279800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (1, 1), (3, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((11193365530841606560457478610695589632392991207293151558221610 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (1, 1), (3, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6284906475457038 : Rat) / 3100914216589) [(0, 1), (1, 1), (3, 1), (8, 1), (14, 1)],
  term ((2947834630286193758509229498904246677904311734685301604483886145 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (1, 1), (3, 1), (8, 1), (14, 1), (15, 2)],
  term ((197144904821693621566554190076996291644877649573154551014139900 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((-5596682765420803280228739305347794816196495603646575779110805 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((3142453237728519 : Rat) / 3100914216589) [(0, 1), (1, 1), (3, 1), (14, 1)],
  term ((-2947834630286193758509229498904246677904311734685301604483886145 : Rat) / 23299643411927845526576420796260840908992721899179725429576436) [(0, 1), (1, 1), (3, 1), (14, 1), (15, 2)],
  term ((6989290581024946653395948127044260817758430568597803428556800 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1379229759063397557496852316912381712510283025794076916282262200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((243242108525437980160 : Rat) / 259001945121800951) [(0, 1), (1, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-435109519546490780684938354357101302646734935968120400573755240 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((17126809600 : Rat) / 151763803) [(0, 1), (1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-786463013932139206213758619342646870129606432125653387110400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (1, 1), (8, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((408822667992322456415889086975640053376233773529640784965823187726381085 : Rat) / 1768021246369032699354887595084416698163356187370448855844164303273054) [(0, 1), (1, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((537953750101152 : Rat) / 275754830051) [(0, 1), (1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3800002733022749014954369162943556695797800204475823251129120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((14188546778853304 : Rat) / 3100914216589) [(0, 1), (1, 1), (8, 1), (11, 1), (14, 1)],
  term ((16200727913871412242607064145015207551040297511233206382542824915 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (1, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((6239627876795070823400066134925496745000286274296060192570625920 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (1, 1), (8, 1), (11, 2), (14, 1), (15, 1)],
  term ((17863092344836851668 : Rat) / 37000277874542993) [(0, 1), (1, 1), (8, 1), (13, 1), (14, 1)],
  term ((278313677822953271728101993905335545444175564940999730624605300 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (1, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((8804250560 : Rat) / 151763803) [(0, 1), (1, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-57755877585641472956322898607975629525142972359227670615920 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (1, 1), (8, 1), (13, 2), (14, 1), (15, 1)],
  term ((-522999085034627034471432960205356151600314635334298103666290581145000525 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(0, 1), (1, 1), (8, 1), (14, 1), (15, 1)],
  term ((-344097014575440 : Rat) / 275754830051) [(0, 1), (1, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3494645290512473326697974063522130408879215284298901714278400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((689614879531698778748426158456190856255141512897038458141131100 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (1, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-121621054262718990080 : Rat) / 259001945121800951) [(0, 1), (1, 1), (10, 1), (13, 1), (14, 1)],
  term ((217554759773245390342469177178550651323367467984060200286877620 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (1, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-8563404800 : Rat) / 151763803) [(0, 1), (1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((393231506966069603106879309671323435064803216062826693555200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (1, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-408822667992322456415889086975640053376233773529640784965823187726381085 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1)],
  term ((-268976875050576 : Rat) / 275754830051) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1900001366511374507477184581471778347898900102237911625564560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7094273389426652 : Rat) / 3100914216589) [(0, 1), (1, 1), (11, 1), (14, 1)],
  term ((-16200727913871412242607064145015207551040297511233206382542824915 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (1, 1), (11, 1), (14, 1), (15, 2)],
  term ((-3119813938397535411700033067462748372500143137148030096285312960 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (1, 1), (11, 2), (14, 1), (15, 1)],
  term ((-8931546172418425834 : Rat) / 37000277874542993) [(0, 1), (1, 1), (13, 1), (14, 1)],
  term ((-139156838911476635864050996952667772722087782470499865312302650 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-4402125280 : Rat) / 151763803) [(0, 1), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((28877938792820736478161449303987814762571486179613835307960 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (1, 1), (13, 2), (14, 1), (15, 1)],
  term ((522999085034627034471432960205356151600314635334298103666290581145000525 : Rat) / 7072084985476130797419550380337666792653424749481795423376657213092216) [(0, 1), (1, 1), (14, 1), (15, 1)],
  term ((172048507287720 : Rat) / 275754830051) [(0, 1), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-99662894204953625465799029369879353161239183554328789559504000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (2, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1644422312950560 : Rat) / 3100914216589) [(0, 1), (2, 1), (6, 1), (8, 1), (14, 1)],
  term ((2866355812288727162321029853980900704183538915512852915136938000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (2, 1), (6, 1), (8, 1), (14, 1), (15, 2)],
  term ((49831447102476812732899514684939676580619591777164394779752000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (2, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((822211156475280 : Rat) / 3100914216589) [(0, 1), (2, 1), (6, 1), (14, 1)],
  term ((-1433177906144363581160514926990450352091769457756426457568469000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (2, 1), (6, 1), (14, 1), (15, 2)],
  term ((-1704221133898503072190415728479404969157819441831239427294044217139200 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(0, 1), (2, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3113348215200782315781410913160525029412828158492530821049151242013823200 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(0, 1), (2, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((2101363833952183824115137311506177485189313397153611323420661040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (2, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((1299467560595309391573186213672113025603281327075552008785756256444559871421983917 : Rat) / 214924517738342440881078809133966100941616380745702600968792978116107254621888) [(0, 1), (2, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((28158263285665 : Rat) / 19260336749) [(0, 1), (2, 1), (8, 1), (14, 1)],
  term ((1021733037672842161741182518686332602599517092057744136946726433717279185395499289919 : Rat) / 55788264104366887868702885170916629344416709116420232280042405890995268806852928) [(0, 1), (2, 1), (8, 1), (14, 1), (15, 2)],
  term ((852110566949251536095207864239702484578909720915619713647022108569600 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(0, 1), (2, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((1556674107600391157890705456580262514706414079246265410524575621006911600 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(0, 1), (2, 1), (10, 1), (14, 1), (15, 2)],
  term ((-1050681916976091912057568655753088742594656698576805661710330520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1299467560595309391573186213672113025603281327075552008785756256444559871421983917 : Rat) / 429849035476684881762157618267932201883232761491405201937585956232214509243776) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-28158263285665 : Rat) / 38520673498) [(0, 1), (2, 1), (14, 1)],
  term ((-1021733037672842161741182518686332602599517092057744136946726433717279185395499289919 : Rat) / 111576528208733775737405770341833258688833418232840464560084811781990537613705856) [(0, 1), (2, 1), (14, 1), (15, 2)],
  term ((2580297310543202307738301313900849086115510998647610945387388822512320 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(0, 1), (2, 2), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((1121924554741259138971647881788136769245612950372348965978616664883769200 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(0, 1), (2, 2), (8, 1), (14, 1), (15, 2)],
  term ((-1290148655271601153869150656950424543057755499323805472693694411256160 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(0, 1), (2, 2), (13, 1), (14, 1), (15, 1)],
  term ((-560962277370629569485823940894068384622806475186174482989308332441884600 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(0, 1), (2, 2), (14, 1), (15, 2)],
  term ((-59797736522972175279479417621927611896743510132597273735702400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (3, 1), (6, 1), (8, 1), (11, 1), (15, 2)],
  term ((-986653387770336 : Rat) / 3100914216589) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1)],
  term ((1719813487373236297392617912388540422510123349307711749082162800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 3)],
  term ((29898868261486087639739708810963805948371755066298636867851200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (3, 1), (6, 1), (11, 1), (15, 2)],
  term ((493326693885168 : Rat) / 3100914216589) [(0, 1), (3, 1), (6, 1), (15, 1)],
  term ((-859906743686618148696308956194270211255061674653855874541081400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (3, 1), (6, 1), (15, 3)],
  term ((-39865157681981450186319611747951741264495673421731515823801600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (3, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-657768925180224 : Rat) / 3100914216589) [(0, 1), (3, 1), (7, 1), (8, 1), (14, 1)],
  term ((1146542324915490864928411941592360281673415566205141166054775200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (3, 1), (7, 1), (8, 1), (14, 1), (15, 2)],
  term ((19932578840990725093159805873975870632247836710865757911900800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((328884462590112 : Rat) / 3100914216589) [(0, 1), (3, 1), (7, 1), (14, 1)],
  term ((-573271162457745432464205970796180140836707783102570583027387600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (3, 1), (7, 1), (14, 1), (15, 2)],
  term ((-123331673471292 : Rat) / 3100914216589) [(0, 1), (5, 1), (6, 1), (7, 1)],
  term ((246663346942584 : Rat) / 3100914216589) [(0, 1), (5, 1), (6, 1), (7, 1), (8, 1)],
  term ((14949434130743043819869854405481902974185877533149318433925600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (5, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-429953371843309074348154478097135105627530837326927937270540700 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (6, 1), (7, 1), (8, 1), (15, 2)],
  term ((-7474717065371521909934927202740951487092938766574659216962800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (5, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((214976685921654537174077239048567552813765418663463968635270350 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (6, 1), (7, 1), (15, 2)],
  term ((2491572355123840636644975734246983829030979588858219738987600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (5, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-42356730037105290822964587482198725093526653010589735562789200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (5, 1), (6, 1), (8, 1), (11, 1), (15, 2)],
  term ((1125277506647625931807946897797610173447247146806906809039269063 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-71658895307218179058025746349522517604588472887821322878423450 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 3)],
  term ((49945656414809640789968036653966091588270367061404449465055 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (5, 1), (6, 1), (8, 1), (14, 2), (15, 1)],
  term ((-8546098317799383632504506709857758635489621766859259953931061026 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (6, 1), (8, 1), (15, 1)],
  term ((1218201220222709043986437687941882799278004039092962488933198650 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (6, 1), (8, 1), (15, 3)],
  term ((-1245786177561920318322487867123491914515489794429109869493800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (5, 1), (6, 1), (11, 1), (14, 1), (15, 2)],
  term ((21178365018552645411482293741099362546763326505294867781394600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (5, 1), (6, 1), (11, 1), (15, 2)],
  term ((-1125277506647625931807946897797610173447247146806906809039269063 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((35829447653609089529012873174761258802294236443910661439211725 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 3)],
  term ((-49945656414809640789968036653966091588270367061404449465055 : Rat) / 6411569458428135808083770169581959523663379719091834185354) [(0, 1), (5, 1), (6, 1), (14, 2), (15, 1)],
  term ((4273049158899691816252253354928879317744810883429629976965530513 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (6, 1), (15, 1)],
  term ((-609100610111354521993218843970941399639002019546481244466599325 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (6, 1), (15, 3)],
  term ((-37373585326857609549674636013704757435464693832873296084814000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (5, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-616658367356460 : Rat) / 3100914216589) [(0, 1), (5, 1), (7, 1), (8, 1), (14, 1)],
  term ((1074883429608272685870386195242837764068827093317319843176351750 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (7, 1), (8, 1), (14, 1), (15, 2)],
  term ((18686792663428804774837318006852378717732346916436648042407000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (5, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((308329183678230 : Rat) / 3100914216589) [(0, 1), (5, 1), (7, 1), (14, 1)],
  term ((-537441714804136342935193097621418882034413546658659921588175875 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (7, 1), (14, 1), (15, 2)],
  term ((1038987692826588928968900254235115733578448116274549860046506400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (5, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-3349923636681182561953218572860393182037118111573801807930100 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((66593126361149200764893424193414365513300102934120942011677645709 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((-4279893873052593909221196983823704144042939680700024639768357610 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (8, 1), (14, 1), (15, 3)],
  term ((-2215249355826730355885930991307455433506878179557381244690205 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (5, 1), (8, 1), (14, 2), (15, 1)],
  term ((-519493846413294464484450127117557866789224058137274930023253200 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (5, 1), (11, 1), (14, 1), (15, 2)],
  term ((1674961818340591280976609286430196591018559055786900903965050 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (5, 1), (13, 1), (14, 1), (15, 2)],
  term ((-66593126361149200764893424193414365513300102934120942011677645709 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (5, 1), (14, 1), (15, 1)],
  term ((2139946936526296954610598491911852072021469840350012319884178805 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (5, 1), (14, 1), (15, 3)],
  term ((2215249355826730355885930991307455433506878179557381244690205 : Rat) / 89761972417993901313172782374147433331287316067285678594956) [(0, 1), (5, 1), (14, 2), (15, 1)],
  term ((390550299325758 : Rat) / 3100914216589) [(0, 1), (6, 1)],
  term ((-328884462590112 : Rat) / 3100914216589) [(0, 1), (6, 1), (7, 1), (8, 1), (9, 1)],
  term ((29898868261486087639739708810963805948371755066298636867851200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-19932578840990725093159805873975870632247836710865757911900800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((493326693885168 : Rat) / 3100914216589) [(0, 1), (6, 1), (7, 1), (8, 1), (9, 1), (14, 1)],
  term ((-859906743686618148696308956194270211255061674653855874541081400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 2)],
  term ((6335914825391791680095229232510378691630609701323748621086973290 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (7, 1), (8, 1), (9, 1), (15, 2)],
  term ((18081998494993772551858607242787360670297336520656326611902220 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-14520972701433954149928854127215420019408577146593116786259425 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (6, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-9040999247496886275929303621393680335148668260328163305951110 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (7, 1), (8, 1), (10, 2), (15, 1)],
  term ((-328884462590112 : Rat) / 3100914216589) [(0, 1), (6, 1), (7, 1), (8, 1), (11, 1)],
  term ((-119595473045944350558958835243855223793487020265194547471404800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-3731439478261456897800700874784457824219317204828664689505718980 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 2)],
  term ((-19932578840990725093159805873975870632247836710865757911900800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (7, 1), (8, 1), (11, 2), (15, 1)],
  term ((-60108348409510275423260395450005988252955826441186904221000934283 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (6, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((3439626974746472594785235824777080845020246698615423498164325600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (7, 1), (8, 1), (14, 1), (15, 3)],
  term ((6953925428408094186956262066302404446815372684167021983863923773 : Rat) / 23299643411927845526576420796260840908992721899179725429576436) [(0, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-1289860115529927223044463434291405316882592511980783811811622100 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (7, 1), (8, 1), (15, 3)],
  term ((29898868261486087639739708810963805948371755066298636867851200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (7, 1), (8, 2), (11, 1), (15, 2)],
  term ((-4520499623748443137964651810696840167574334130164081652975555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (7, 1), (8, 2), (14, 1), (15, 1)],
  term ((6922666061508102066541180621006714314013579998793667009758950086 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (7, 1), (8, 2), (15, 1)],
  term ((-859906743686618148696308956194270211255061674653855874541081400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (7, 1), (8, 2), (15, 3)],
  term ((164442231295056 : Rat) / 3100914216589) [(0, 1), (6, 1), (7, 1), (9, 1)],
  term ((-14949434130743043819869854405481902974185877533149318433925600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((9966289420495362546579902936987935316123918355432878955950400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-246663346942584 : Rat) / 3100914216589) [(0, 1), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((429953371843309074348154478097135105627530837326927937270540700 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (7, 1), (9, 1), (14, 1), (15, 2)],
  term ((-3167957412695895840047614616255189345815304850661874310543486645 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (7, 1), (9, 1), (15, 2)],
  term ((-9040999247496886275929303621393680335148668260328163305951110 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((14520972701433954149928854127215420019408577146593116786259425 : Rat) / 89761972417993901313172782374147433331287316067285678594956) [(0, 1), (6, 1), (7, 1), (10, 1), (15, 1)],
  term ((4520499623748443137964651810696840167574334130164081652975555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (7, 1), (10, 2), (15, 1)],
  term ((164442231295056 : Rat) / 3100914216589) [(0, 1), (6, 1), (7, 1), (11, 1)],
  term ((59797736522972175279479417621927611896743510132597273735702400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 2)],
  term ((9328032276139625653532776869731489051939372690081862124251390 : Rat) / 574286985505263798190263892865584106911792441176965063405053) [(0, 1), (6, 1), (7, 1), (11, 1), (15, 2)],
  term ((9966289420495362546579902936987935316123918355432878955950400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (7, 1), (11, 2), (15, 1)],
  term ((34161048112930598302471083895021073418719195777847520292228758859 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-1719813487373236297392617912388540422510123349307711749082162800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 3)],
  term ((-62522810121872863441776195706130259755734768786756487906565366583 : Rat) / 326195007766989837372069891147651772725898106588516156014070104) [(0, 1), (6, 1), (7, 1), (15, 1)],
  term ((859906743686618148696308956194270211255061674653855874541081400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (7, 1), (15, 3)],
  term ((-781100598651516 : Rat) / 3100914216589) [(0, 1), (6, 1), (8, 1)],
  term ((79730315363962900372639223495903482528991346843463031647603200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-9040999247496886275929303621393680335148668260328163305951110 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((17756551653993409844646246684270770342510198814894820737819746541 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-2293084649830981729856823883184720563346831132410282332109550400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 1), (9, 1), (10, 1), (15, 3)],
  term ((4520499623748443137964651810696840167574334130164081652975555 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (6, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-4520499623748443137964651810696840167574334130164081652975555 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (6, 1), (8, 1), (10, 1), (15, 2)],
  term ((-4520499623748443137964651810696840167574334130164081652975555 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((17756551653993409844646246684270770342510198814894820737819746541 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-5358545391252343461176743420336886444650286561169961634813313000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 3)],
  term ((39865157681981450186319611747951741264495673421731515823801600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (8, 1), (11, 2), (15, 2)],
  term ((-49945656414809640789968036653966091588270367061404449465055 : Rat) / 6411569458428135808083770169581959523663379719091834185354) [(0, 1), (6, 1), (8, 1), (14, 1), (15, 2)],
  term ((-14434060774035018595729046665683584381582745213999978325251478511 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (6, 1), (8, 1), (15, 2)],
  term ((107488342960827268587038619524283776406882709331731984317635175 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (6, 1), (8, 1), (15, 4)],
  term ((-4520499623748443137964651810696840167574334130164081652975555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (8, 2), (10, 1), (11, 1), (15, 1)],
  term ((4520499623748443137964651810696840167574334130164081652975555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (8, 2), (10, 1), (15, 2)],
  term ((4520499623748443137964651810696840167574334130164081652975555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (8, 2), (11, 1), (14, 1), (15, 1)],
  term ((-17756551653993409844646246684270770342510198814894820737819746541 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 2), (11, 1), (15, 1)],
  term ((10717090782504686922353486840673772889300573122339923269626626000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 2), (11, 1), (15, 3)],
  term ((-79730315363962900372639223495903482528991346843463031647603200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (8, 2), (11, 2), (15, 2)],
  term ((49945656414809640789968036653966091588270367061404449465055 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (6, 1), (8, 2), (14, 1), (15, 2)],
  term ((14434060774035018595729046665683584381582745213999978325251478511 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (6, 1), (8, 2), (15, 2)],
  term ((-214976685921654537174077239048567552813765418663463968635270350 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (6, 1), (8, 2), (15, 4)],
  term ((-39865157681981450186319611747951741264495673421731515823801600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((4520499623748443137964651810696840167574334130164081652975555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-17756551653993409844646246684270770342510198814894820737819746541 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((1146542324915490864928411941592360281673415566205141166054775200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 0 through 99. -/
theorem ep_Q2_041_block_18_0000_0099_valid :
    checkProductSumEq ep_Q2_041_partials_18_0000_0099
      ep_Q2_041_block_18_0000_0099 = true := by
  native_decide

end EpQ2041TermShards

end Patterns

end EndpointCertificate

end Problem97
