/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_041, term block 18:300-399

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_041`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2041TermShards

/-- Generator polynomial 18 for endpoint certificate `ep_Q2_041`. -/
def ep_Q2_041_generator_18_0300_0399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0300 : Poly :=
[
  term ((117865553965874 : Rat) / 3100914216589) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 300 for generator 18. -/
def ep_Q2_041_partial_18_0300 : Poly :=
[
  term ((235731107931748 : Rat) / 3100914216589) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-117865553965874 : Rat) / 3100914216589) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 18. -/
theorem ep_Q2_041_partial_18_0300_valid :
    mulPoly ep_Q2_041_coefficient_18_0300
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0301 : Poly :=
[
  term ((-2863373301542185251173702787447829830568073775628936374565226115 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 301 for generator 18. -/
def ep_Q2_041_partial_18_0301 : Poly :=
[
  term ((-5726746603084370502347405574895659661136147551257872749130452230 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((2863373301542185251173702787447829830568073775628936374565226115 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 18. -/
theorem ep_Q2_041_partial_18_0301_valid :
    mulPoly ep_Q2_041_coefficient_18_0301
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0302 : Poly :=
[
  term ((-5925899398680850532006900440956488628913936521508139060234970 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 302 for generator 18. -/
def ep_Q2_041_partial_18_0302 : Poly :=
[
  term ((-11851798797361701064013800881912977257827873043016278120469940 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((5925899398680850532006900440956488628913936521508139060234970 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 18. -/
theorem ep_Q2_041_partial_18_0302_valid :
    mulPoly ep_Q2_041_coefficient_18_0302
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0303 : Poly :=
[
  term ((2605003018764343447581413793260601323088057327515489674796120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 303 for generator 18. -/
def ep_Q2_041_partial_18_0303 : Poly :=
[
  term ((5210006037528686895162827586521202646176114655030979349592240 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2605003018764343447581413793260601323088057327515489674796120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 18. -/
theorem ep_Q2_041_partial_18_0303_valid :
    mulPoly ep_Q2_041_coefficient_18_0303
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0304 : Poly :=
[
  term ((-2998073172495619700865640774972254779979554887450953136082059253 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 304 for generator 18. -/
def ep_Q2_041_partial_18_0304 : Poly :=
[
  term ((-5996146344991239401731281549944509559959109774901906272164118506 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((2998073172495619700865640774972254779979554887450953136082059253 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 18. -/
theorem ep_Q2_041_partial_18_0304_valid :
    mulPoly ep_Q2_041_coefficient_18_0304
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0305 : Poly :=
[
  term ((482768631717888398913143824480672072306468267344248097466119465 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 3)]
]

/-- Partial product 305 for generator 18. -/
def ep_Q2_041_partial_18_0305 : Poly :=
[
  term ((965537263435776797826287648961344144612936534688496194932238930 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 3)],
  term ((-482768631717888398913143824480672072306468267344248097466119465 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 18. -/
theorem ep_Q2_041_partial_18_0305_valid :
    mulPoly ep_Q2_041_coefficient_18_0305
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0306 : Poly :=
[
  term ((-1721167661605159316313895059848960634908726202153436101315810 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1)]
]

/-- Partial product 306 for generator 18. -/
def ep_Q2_041_partial_18_0306 : Poly :=
[
  term ((-3442335323210318632627790119697921269817452404306872202631620 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((1721167661605159316313895059848960634908726202153436101315810 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 18. -/
theorem ep_Q2_041_partial_18_0306_valid :
    mulPoly ep_Q2_041_coefficient_18_0306
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0307 : Poly :=
[
  term ((634658675614106 : Rat) / 3100914216589) [(0, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 307 for generator 18. -/
def ep_Q2_041_partial_18_0307 : Poly :=
[
  term ((1269317351228212 : Rat) / 3100914216589) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-634658675614106 : Rat) / 3100914216589) [(0, 1), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 18. -/
theorem ep_Q2_041_partial_18_0307_valid :
    mulPoly ep_Q2_041_coefficient_18_0307
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0308 : Poly :=
[
  term ((-413489564921862 : Rat) / 3100914216589) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 308 for generator 18. -/
def ep_Q2_041_partial_18_0308 : Poly :=
[
  term ((-826979129843724 : Rat) / 3100914216589) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((413489564921862 : Rat) / 3100914216589) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 18. -/
theorem ep_Q2_041_partial_18_0308_valid :
    mulPoly ep_Q2_041_coefficient_18_0308
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0309 : Poly :=
[
  term ((-3383987248484901574635980727137265471283495619285642011103757555 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 309 for generator 18. -/
def ep_Q2_041_partial_18_0309 : Poly :=
[
  term ((-3383987248484901574635980727137265471283495619285642011103757555 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((3383987248484901574635980727137265471283495619285642011103757555 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 18. -/
theorem ep_Q2_041_partial_18_0309_valid :
    mulPoly ep_Q2_041_coefficient_18_0309
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0310 : Poly :=
[
  term ((781372961032321853676453511419671068447958269528308690622619925 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (9, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 310 for generator 18. -/
def ep_Q2_041_partial_18_0310 : Poly :=
[
  term ((781372961032321853676453511419671068447958269528308690622619925 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-781372961032321853676453511419671068447958269528308690622619925 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (9, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 18. -/
theorem ep_Q2_041_partial_18_0310_valid :
    mulPoly ep_Q2_041_coefficient_18_0310
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0311 : Poly :=
[
  term ((14705009618948777246091197390521656968045694331149826556879370 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 311 for generator 18. -/
def ep_Q2_041_partial_18_0311 : Poly :=
[
  term ((29410019237897554492182394781043313936091388662299653113758740 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-14705009618948777246091197390521656968045694331149826556879370 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 18. -/
theorem ep_Q2_041_partial_18_0311_valid :
    mulPoly ep_Q2_041_coefficient_18_0311
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0312 : Poly :=
[
  term ((-1178249003246484901100787222178483119199262232346647532444380 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (10, 1), (13, 2), (15, 1)]
]

/-- Partial product 312 for generator 18. -/
def ep_Q2_041_partial_18_0312 : Poly :=
[
  term ((-2356498006492969802201574444356966238398524464693295064888760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((1178249003246484901100787222178483119199262232346647532444380 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 18. -/
theorem ep_Q2_041_partial_18_0312_valid :
    mulPoly ep_Q2_041_coefficient_18_0312
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0313 : Poly :=
[
  term ((-105502077709113038795938008670431746935735484842032566063087431909 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 313 for generator 18. -/
def ep_Q2_041_partial_18_0313 : Poly :=
[
  term ((-105502077709113038795938008670431746935735484842032566063087431909 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((105502077709113038795938008670431746935735484842032566063087431909 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 18. -/
theorem ep_Q2_041_partial_18_0313_valid :
    mulPoly ep_Q2_041_coefficient_18_0313
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0314 : Poly :=
[
  term ((314237526087949348165564754362350595717899081108075726992790240 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 3)]
]

/-- Partial product 314 for generator 18. -/
def ep_Q2_041_partial_18_0314 : Poly :=
[
  term ((628475052175898696331129508724701191435798162216151453985580480 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 3)],
  term ((-314237526087949348165564754362350595717899081108075726992790240 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 18. -/
theorem ep_Q2_041_partial_18_0314_valid :
    mulPoly ep_Q2_041_coefficient_18_0314
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0315 : Poly :=
[
  term ((1649278966427607291529790398999610893829886976670402520567020 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (10, 1), (14, 2), (15, 1)]
]

/-- Partial product 315 for generator 18. -/
def ep_Q2_041_partial_18_0315 : Poly :=
[
  term ((3298557932855214583059580797999221787659773953340805041134040 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-1649278966427607291529790398999610893829886976670402520567020 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (10, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 18. -/
theorem ep_Q2_041_partial_18_0315_valid :
    mulPoly ep_Q2_041_coefficient_18_0315
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0316 : Poly :=
[
  term ((-91463030052854915514683907313288109565230530540030130791514117445 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 316 for generator 18. -/
def ep_Q2_041_partial_18_0316 : Poly :=
[
  term ((-91463030052854915514683907313288109565230530540030130791514117445 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((91463030052854915514683907313288109565230530540030130791514117445 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 18. -/
theorem ep_Q2_041_partial_18_0316_valid :
    mulPoly ep_Q2_041_coefficient_18_0316
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0317 : Poly :=
[
  term ((251634022289916502850845581594497910910788996215474520987069335 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (9, 1), (10, 1), (15, 3)]
]

/-- Partial product 317 for generator 18. -/
def ep_Q2_041_partial_18_0317 : Poly :=
[
  term ((503268044579833005701691163188995821821577992430949041974138670 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 3)],
  term ((-251634022289916502850845581594497910910788996215474520987069335 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (9, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 18. -/
theorem ep_Q2_041_partial_18_0317_valid :
    mulPoly ep_Q2_041_coefficient_18_0317
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0318 : Poly :=
[
  term ((360496369281308959176251184130851800915032038028423728012861040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (10, 2), (11, 1), (15, 2)]
]

/-- Partial product 318 for generator 18. -/
def ep_Q2_041_partial_18_0318 : Poly :=
[
  term ((720992738562617918352502368261703601830064076056847456025722080 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (9, 1), (10, 2), (11, 1), (15, 2)],
  term ((-360496369281308959176251184130851800915032038028423728012861040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (10, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 18. -/
theorem ep_Q2_041_partial_18_0318_valid :
    mulPoly ep_Q2_041_coefficient_18_0318
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0319 : Poly :=
[
  term ((428649530245307439014368816899686054157279992208720619877370 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (10, 2), (12, 1), (15, 1)]
]

/-- Partial product 319 for generator 18. -/
def ep_Q2_041_partial_18_0319 : Poly :=
[
  term ((857299060490614878028737633799372108314559984417441239754740 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-428649530245307439014368816899686054157279992208720619877370 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (10, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 18. -/
theorem ep_Q2_041_partial_18_0319_valid :
    mulPoly ep_Q2_041_coefficient_18_0319
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0320 : Poly :=
[
  term ((-623778884071668477053357941153314592517256475948225164235260 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (10, 2), (13, 1), (15, 2)]
]

/-- Partial product 320 for generator 18. -/
def ep_Q2_041_partial_18_0320 : Poly :=
[
  term ((-1247557768143336954106715882306629185034512951896450328470520 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (9, 1), (10, 2), (13, 1), (15, 2)],
  term ((623778884071668477053357941153314592517256475948225164235260 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (10, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 18. -/
theorem ep_Q2_041_partial_18_0320_valid :
    mulPoly ep_Q2_041_coefficient_18_0320
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0321 : Poly :=
[
  term ((-31376263140655617780759316194366606961649176501183122375815 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (10, 2), (14, 1), (15, 1)]
]

/-- Partial product 321 for generator 18. -/
def ep_Q2_041_partial_18_0321 : Poly :=
[
  term ((-62752526281311235561518632388733213923298353002366244751630 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (9, 1), (10, 2), (14, 1), (15, 1)],
  term ((31376263140655617780759316194366606961649176501183122375815 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (10, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 18. -/
theorem ep_Q2_041_partial_18_0321_valid :
    mulPoly ep_Q2_041_coefficient_18_0321
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0322 : Poly :=
[
  term ((58323985339931372220453146497665189290287252264867156770065264801 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (9, 1), (10, 2), (15, 1)]
]

/-- Partial product 322 for generator 18. -/
def ep_Q2_041_partial_18_0322 : Poly :=
[
  term ((58323985339931372220453146497665189290287252264867156770065264801 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (9, 1), (10, 2), (15, 1)],
  term ((-58323985339931372220453146497665189290287252264867156770065264801 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (9, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 18. -/
theorem ep_Q2_041_partial_18_0322_valid :
    mulPoly ep_Q2_041_coefficient_18_0322
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0323 : Poly :=
[
  term ((-3814641860187581065188903897339582020484259706728355087894741655 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (9, 1), (10, 2), (15, 3)]
]

/-- Partial product 323 for generator 18. -/
def ep_Q2_041_partial_18_0323 : Poly :=
[
  term ((-3814641860187581065188903897339582020484259706728355087894741655 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (10, 2), (15, 3)],
  term ((3814641860187581065188903897339582020484259706728355087894741655 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (9, 1), (10, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 18. -/
theorem ep_Q2_041_partial_18_0323_valid :
    mulPoly ep_Q2_041_coefficient_18_0323
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0324 : Poly :=
[
  term ((-180320524903376 : Rat) / 442987745227) [(0, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 324 for generator 18. -/
def ep_Q2_041_partial_18_0324 : Poly :=
[
  term ((-360641049806752 : Rat) / 442987745227) [(0, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((180320524903376 : Rat) / 442987745227) [(0, 1), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 18. -/
theorem ep_Q2_041_partial_18_0324_valid :
    mulPoly ep_Q2_041_coefficient_18_0324
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0325 : Poly :=
[
  term ((79570111497346270522401310029556317985042054395488063638585780 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 325 for generator 18. -/
def ep_Q2_041_partial_18_0325 : Poly :=
[
  term ((159140222994692541044802620059112635970084108790976127277171560 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-79570111497346270522401310029556317985042054395488063638585780 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 18. -/
theorem ep_Q2_041_partial_18_0325_valid :
    mulPoly ep_Q2_041_coefficient_18_0325
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0326 : Poly :=
[
  term ((472683061609952977962861352663453041661868278805659106619529080 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 326 for generator 18. -/
def ep_Q2_041_partial_18_0326 : Poly :=
[
  term ((945366123219905955925722705326906083323736557611318213239058160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-472683061609952977962861352663453041661868278805659106619529080 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 18. -/
theorem ep_Q2_041_partial_18_0326_valid :
    mulPoly ep_Q2_041_coefficient_18_0326
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0327 : Poly :=
[
  term ((180320524903376 : Rat) / 442987745227) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 327 for generator 18. -/
def ep_Q2_041_partial_18_0327 : Poly :=
[
  term ((360641049806752 : Rat) / 442987745227) [(0, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-180320524903376 : Rat) / 442987745227) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 18. -/
theorem ep_Q2_041_partial_18_0327_valid :
    mulPoly ep_Q2_041_coefficient_18_0327
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0328 : Poly :=
[
  term ((-5247819766331944646349418824330032372576029164484781545463210655 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 328 for generator 18. -/
def ep_Q2_041_partial_18_0328 : Poly :=
[
  term ((-5247819766331944646349418824330032372576029164484781545463210655 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((5247819766331944646349418824330032372576029164484781545463210655 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 18. -/
theorem ep_Q2_041_partial_18_0328_valid :
    mulPoly ep_Q2_041_coefficient_18_0328
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0329 : Poly :=
[
  term ((17314499428272841652552378335347454016704486281251391946269596735 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (9, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 329 for generator 18. -/
def ep_Q2_041_partial_18_0329 : Poly :=
[
  term ((17314499428272841652552378335347454016704486281251391946269596735 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-17314499428272841652552378335347454016704486281251391946269596735 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (9, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 18. -/
theorem ep_Q2_041_partial_18_0329_valid :
    mulPoly ep_Q2_041_coefficient_18_0329
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0330 : Poly :=
[
  term ((-128848643339008080209616587380668170793905315995397851613171320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (11, 1), (12, 2), (15, 2)]
]

/-- Partial product 330 for generator 18. -/
def ep_Q2_041_partial_18_0330 : Poly :=
[
  term ((-257697286678016160419233174761336341587810631990795703226342640 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (9, 1), (11, 1), (12, 2), (15, 2)],
  term ((128848643339008080209616587380668170793905315995397851613171320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (11, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 18. -/
theorem ep_Q2_041_partial_18_0330_valid :
    mulPoly ep_Q2_041_coefficient_18_0330
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0331 : Poly :=
[
  term ((-597275287996618523322649702979760722649705528497268555441220765 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 331 for generator 18. -/
def ep_Q2_041_partial_18_0331 : Poly :=
[
  term ((-1194550575993237046645299405959521445299411056994537110882441530 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((597275287996618523322649702979760722649705528497268555441220765 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 18. -/
theorem ep_Q2_041_partial_18_0331_valid :
    mulPoly ep_Q2_041_coefficient_18_0331
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0332 : Poly :=
[
  term ((119918993511520446979013061209023871085480418344818392548624520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 332 for generator 18. -/
def ep_Q2_041_partial_18_0332 : Poly :=
[
  term ((239837987023040893958026122418047742170960836689636785097249040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-119918993511520446979013061209023871085480418344818392548624520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 18. -/
theorem ep_Q2_041_partial_18_0332_valid :
    mulPoly ep_Q2_041_coefficient_18_0332
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0333 : Poly :=
[
  term ((409797182666443 : Rat) / 442987745227) [(0, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 333 for generator 18. -/
def ep_Q2_041_partial_18_0333 : Poly :=
[
  term ((819594365332886 : Rat) / 442987745227) [(0, 1), (8, 1), (9, 1), (11, 1), (14, 1)],
  term ((-409797182666443 : Rat) / 442987745227) [(0, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 18. -/
theorem ep_Q2_041_partial_18_0333_valid :
    mulPoly ep_Q2_041_coefficient_18_0333
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0334 : Poly :=
[
  term ((-12638898086820420630795800222296464970443148010346510652232586675 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (9, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 334 for generator 18. -/
def ep_Q2_041_partial_18_0334 : Poly :=
[
  term ((-12638898086820420630795800222296464970443148010346510652232586675 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((12638898086820420630795800222296464970443148010346510652232586675 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (9, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 18. -/
theorem ep_Q2_041_partial_18_0334_valid :
    mulPoly ep_Q2_041_coefficient_18_0334
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0335 : Poly :=
[
  term ((-149306385144202 : Rat) / 3100914216589) [(0, 1), (9, 1), (11, 1), (14, 2)]
]

/-- Partial product 335 for generator 18. -/
def ep_Q2_041_partial_18_0335 : Poly :=
[
  term ((-298612770288404 : Rat) / 3100914216589) [(0, 1), (8, 1), (9, 1), (11, 1), (14, 2)],
  term ((149306385144202 : Rat) / 3100914216589) [(0, 1), (9, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 18. -/
theorem ep_Q2_041_partial_18_0335_valid :
    mulPoly ep_Q2_041_coefficient_18_0335
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0336 : Poly :=
[
  term ((7471793454421468704712779520057270689218911663493731708792566755 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (9, 1), (11, 1), (14, 2), (15, 2)]
]

/-- Partial product 336 for generator 18. -/
def ep_Q2_041_partial_18_0336 : Poly :=
[
  term ((14943586908842937409425559040114541378437823326987463417585133510 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (11, 1), (14, 2), (15, 2)],
  term ((-7471793454421468704712779520057270689218911663493731708792566755 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (9, 1), (11, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 18. -/
theorem ep_Q2_041_partial_18_0336_valid :
    mulPoly ep_Q2_041_coefficient_18_0336
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0337 : Poly :=
[
  term ((534906434139977803741399485528140668947200609248499109741993040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 337 for generator 18. -/
def ep_Q2_041_partial_18_0337 : Poly :=
[
  term ((1069812868279955607482798971056281337894401218496998219483986080 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-534906434139977803741399485528140668947200609248499109741993040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 18. -/
theorem ep_Q2_041_partial_18_0337_valid :
    mulPoly ep_Q2_041_coefficient_18_0337
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0338 : Poly :=
[
  term ((-534906434139977803741399485528140668947200609248499109741993040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 338 for generator 18. -/
def ep_Q2_041_partial_18_0338 : Poly :=
[
  term ((-1069812868279955607482798971056281337894401218496998219483986080 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((534906434139977803741399485528140668947200609248499109741993040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 18. -/
theorem ep_Q2_041_partial_18_0338_valid :
    mulPoly ep_Q2_041_coefficient_18_0338
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0339 : Poly :=
[
  term ((172958668391460654348384105273101604337763460847246982436733100 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (9, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 339 for generator 18. -/
def ep_Q2_041_partial_18_0339 : Poly :=
[
  term ((345917336782921308696768210546203208675526921694493964873466200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (8, 1), (9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-172958668391460654348384105273101604337763460847246982436733100 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (9, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 18. -/
theorem ep_Q2_041_partial_18_0339_valid :
    mulPoly ep_Q2_041_coefficient_18_0339
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0340 : Poly :=
[
  term ((-86528690768945168867257789483516724780417887501042681824307160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (11, 2), (14, 2), (15, 1)]
]

/-- Partial product 340 for generator 18. -/
def ep_Q2_041_partial_18_0340 : Poly :=
[
  term ((-173057381537890337734515578967033449560835775002085363648614320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (9, 1), (11, 2), (14, 2), (15, 1)],
  term ((86528690768945168867257789483516724780417887501042681824307160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (11, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 18. -/
theorem ep_Q2_041_partial_18_0340_valid :
    mulPoly ep_Q2_041_coefficient_18_0340
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0341 : Poly :=
[
  term ((1045734199873077 : Rat) / 3100914216589) [(0, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 341 for generator 18. -/
def ep_Q2_041_partial_18_0341 : Poly :=
[
  term ((2091468399746154 : Rat) / 3100914216589) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-1045734199873077 : Rat) / 3100914216589) [(0, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 18. -/
theorem ep_Q2_041_partial_18_0341_valid :
    mulPoly ep_Q2_041_coefficient_18_0341
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0342 : Poly :=
[
  term ((25394065284302 : Rat) / 442987745227) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 342 for generator 18. -/
def ep_Q2_041_partial_18_0342 : Poly :=
[
  term ((50788130568604 : Rat) / 442987745227) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-25394065284302 : Rat) / 442987745227) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 18. -/
theorem ep_Q2_041_partial_18_0342_valid :
    mulPoly ep_Q2_041_coefficient_18_0342
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0343 : Poly :=
[
  term ((-1366030867208340620783920431337008881891914333161542032797205545 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 343 for generator 18. -/
def ep_Q2_041_partial_18_0343 : Poly :=
[
  term ((-1366030867208340620783920431337008881891914333161542032797205545 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((1366030867208340620783920431337008881891914333161542032797205545 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 18. -/
theorem ep_Q2_041_partial_18_0343_valid :
    mulPoly ep_Q2_041_coefficient_18_0343
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0344 : Poly :=
[
  term ((-3382013836822505966590480037379212207408882686927113838135515165 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 344 for generator 18. -/
def ep_Q2_041_partial_18_0344 : Poly :=
[
  term ((-6764027673645011933180960074758424414817765373854227676271030330 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((3382013836822505966590480037379212207408882686927113838135515165 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 18. -/
theorem ep_Q2_041_partial_18_0344_valid :
    mulPoly ep_Q2_041_coefficient_18_0344
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0345 : Poly :=
[
  term ((-2853210821587076182077396508608679710217821288133548436409430 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 345 for generator 18. -/
def ep_Q2_041_partial_18_0345 : Poly :=
[
  term ((-5706421643174152364154793017217359420435642576267096872818860 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((2853210821587076182077396508608679710217821288133548436409430 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 18. -/
theorem ep_Q2_041_partial_18_0345_valid :
    mulPoly ep_Q2_041_coefficient_18_0345
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0346 : Poly :=
[
  term ((294562250811621225275196805544620779799815558086661883111095 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (9, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 346 for generator 18. -/
def ep_Q2_041_partial_18_0346 : Poly :=
[
  term ((589124501623242450550393611089241559599631116173323766222190 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-294562250811621225275196805544620779799815558086661883111095 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (9, 1), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 18. -/
theorem ep_Q2_041_partial_18_0346_valid :
    mulPoly ep_Q2_041_coefficient_18_0346
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0347 : Poly :=
[
  term ((129667064992938530638242045983043881960917494552398759444730 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 347 for generator 18. -/
def ep_Q2_041_partial_18_0347 : Poly :=
[
  term ((259334129985877061276484091966087763921834989104797518889460 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-129667064992938530638242045983043881960917494552398759444730 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 18. -/
theorem ep_Q2_041_partial_18_0347_valid :
    mulPoly ep_Q2_041_coefficient_18_0347
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0348 : Poly :=
[
  term ((-1870119298884424862643191854550968660474686940575375742326155 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1)]
]

/-- Partial product 348 for generator 18. -/
def ep_Q2_041_partial_18_0348 : Poly :=
[
  term ((-3740238597768849725286383709101937320949373881150751484652310 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((1870119298884424862643191854550968660474686940575375742326155 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 18. -/
theorem ep_Q2_041_partial_18_0348_valid :
    mulPoly ep_Q2_041_coefficient_18_0348
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0349 : Poly :=
[
  term ((2388753562303530884646079244966503756627596793022444220415400789 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 349 for generator 18. -/
def ep_Q2_041_partial_18_0349 : Poly :=
[
  term ((2388753562303530884646079244966503756627596793022444220415400789 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-2388753562303530884646079244966503756627596793022444220415400789 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 18. -/
theorem ep_Q2_041_partial_18_0349_valid :
    mulPoly ep_Q2_041_coefficient_18_0349
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0350 : Poly :=
[
  term ((-1056437712162161737710872459253367857240049072073502321339180970 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (9, 1), (12, 1), (15, 3)]
]

/-- Partial product 350 for generator 18. -/
def ep_Q2_041_partial_18_0350 : Poly :=
[
  term ((-2112875424324323475421744918506735714480098144147004642678361940 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 3)],
  term ((1056437712162161737710872459253367857240049072073502321339180970 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 18. -/
theorem ep_Q2_041_partial_18_0350_valid :
    mulPoly ep_Q2_041_coefficient_18_0350
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0351 : Poly :=
[
  term ((2853210821587076182077396508608679710217821288133548436409430 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (12, 2), (13, 1), (15, 2)]
]

/-- Partial product 351 for generator 18. -/
def ep_Q2_041_partial_18_0351 : Poly :=
[
  term ((5706421643174152364154793017217359420435642576267096872818860 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 2)],
  term ((-2853210821587076182077396508608679710217821288133548436409430 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (12, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 18. -/
theorem ep_Q2_041_partial_18_0351_valid :
    mulPoly ep_Q2_041_coefficient_18_0351
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0352 : Poly :=
[
  term ((1694342276540742127268075995941521381935893947594921270009166323 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (9, 1), (12, 2), (15, 1)]
]

/-- Partial product 352 for generator 18. -/
def ep_Q2_041_partial_18_0352 : Poly :=
[
  term ((1694342276540742127268075995941521381935893947594921270009166323 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-1694342276540742127268075995941521381935893947594921270009166323 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 18. -/
theorem ep_Q2_041_partial_18_0352_valid :
    mulPoly ep_Q2_041_coefficient_18_0352
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0353 : Poly :=
[
  term ((1366030867208340620783920431337008881891914333161542032797205545 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (9, 1), (12, 2), (15, 3)]
]

/-- Partial product 353 for generator 18. -/
def ep_Q2_041_partial_18_0353 : Poly :=
[
  term ((1366030867208340620783920431337008881891914333161542032797205545 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (12, 2), (15, 3)],
  term ((-1366030867208340620783920431337008881891914333161542032797205545 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (9, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 18. -/
theorem ep_Q2_041_partial_18_0353_valid :
    mulPoly ep_Q2_041_coefficient_18_0353
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0354 : Poly :=
[
  term ((-206243091644876 : Rat) / 442987745227) [(0, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 354 for generator 18. -/
def ep_Q2_041_partial_18_0354 : Poly :=
[
  term ((-412486183289752 : Rat) / 442987745227) [(0, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((206243091644876 : Rat) / 442987745227) [(0, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 18. -/
theorem ep_Q2_041_partial_18_0354_valid :
    mulPoly ep_Q2_041_coefficient_18_0354
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0355 : Poly :=
[
  term ((11030390445757237490514115002913231220111743392288827699575545405 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (9, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 355 for generator 18. -/
def ep_Q2_041_partial_18_0355 : Poly :=
[
  term ((11030390445757237490514115002913231220111743392288827699575545405 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-11030390445757237490514115002913231220111743392288827699575545405 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (9, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 18. -/
theorem ep_Q2_041_partial_18_0355_valid :
    mulPoly ep_Q2_041_coefficient_18_0355
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0356 : Poly :=
[
  term ((117865553965874 : Rat) / 3100914216589) [(0, 1), (9, 1), (13, 1), (14, 2)]
]

/-- Partial product 356 for generator 18. -/
def ep_Q2_041_partial_18_0356 : Poly :=
[
  term ((235731107931748 : Rat) / 3100914216589) [(0, 1), (8, 1), (9, 1), (13, 1), (14, 2)],
  term ((-117865553965874 : Rat) / 3100914216589) [(0, 1), (9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 18. -/
theorem ep_Q2_041_partial_18_0356_valid :
    mulPoly ep_Q2_041_coefficient_18_0356
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0357 : Poly :=
[
  term ((169643504131901506979282184231224084041978926873113715853605825 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (9, 1), (13, 1), (14, 2), (15, 2)]
]

/-- Partial product 357 for generator 18. -/
def ep_Q2_041_partial_18_0357 : Poly :=
[
  term ((339287008263803013958564368462448168083957853746227431707211650 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 1), (9, 1), (13, 1), (14, 2), (15, 2)],
  term ((-169643504131901506979282184231224084041978926873113715853605825 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (9, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 18. -/
theorem ep_Q2_041_partial_18_0357_valid :
    mulPoly ep_Q2_041_coefficient_18_0357
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0358 : Poly :=
[
  term ((-6699847273362365123906437145720786364074236223147603615860200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 358 for generator 18. -/
def ep_Q2_041_partial_18_0358 : Poly :=
[
  term ((-13399694546724730247812874291441572728148472446295207231720400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((6699847273362365123906437145720786364074236223147603615860200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 18. -/
theorem ep_Q2_041_partial_18_0358_valid :
    mulPoly ep_Q2_041_coefficient_18_0358
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0359 : Poly :=
[
  term ((-5925899398680850532006900440956488628913936521508139060234970 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (13, 2), (14, 2), (15, 1)]
]

/-- Partial product 359 for generator 18. -/
def ep_Q2_041_partial_18_0359 : Poly :=
[
  term ((-11851798797361701064013800881912977257827873043016278120469940 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (9, 1), (13, 2), (14, 2), (15, 1)],
  term ((5925899398680850532006900440956488628913936521508139060234970 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 18. -/
theorem ep_Q2_041_partial_18_0359_valid :
    mulPoly ep_Q2_041_coefficient_18_0359
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0360 : Poly :=
[
  term ((-10909710733814973590292897265632432224751243248950787078956371361 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 360 for generator 18. -/
def ep_Q2_041_partial_18_0360 : Poly :=
[
  term ((-10909710733814973590292897265632432224751243248950787078956371361 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((10909710733814973590292897265632432224751243248950787078956371361 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 18. -/
theorem ep_Q2_041_partial_18_0360_valid :
    mulPoly ep_Q2_041_coefficient_18_0360
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0361 : Poly :=
[
  term ((114615575566079661987532774267138142062813915519644900199521895 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (9, 1), (14, 1), (15, 3)]
]

/-- Partial product 361 for generator 18. -/
def ep_Q2_041_partial_18_0361 : Poly :=
[
  term ((114615575566079661987532774267138142062813915519644900199521895 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 1), (9, 1), (14, 1), (15, 3)],
  term ((-114615575566079661987532774267138142062813915519644900199521895 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (9, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 18. -/
theorem ep_Q2_041_partial_18_0361_valid :
    mulPoly ep_Q2_041_coefficient_18_0361
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0362 : Poly :=
[
  term ((5577824118149544680680619848531863911581400877416599174767342817 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (9, 1), (14, 2), (15, 1)]
]

/-- Partial product 362 for generator 18. -/
def ep_Q2_041_partial_18_0362 : Poly :=
[
  term ((5577824118149544680680619848531863911581400877416599174767342817 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 1), (9, 1), (14, 2), (15, 1)],
  term ((-5577824118149544680680619848531863911581400877416599174767342817 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 18. -/
theorem ep_Q2_041_partial_18_0362_valid :
    mulPoly ep_Q2_041_coefficient_18_0362
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0363 : Poly :=
[
  term ((-1493955265497522703398618245190600931837883384761282320306094815 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (9, 1), (14, 2), (15, 3)]
]

/-- Partial product 363 for generator 18. -/
def ep_Q2_041_partial_18_0363 : Poly :=
[
  term ((-2987910530995045406797236490381201863675766769522564640612189630 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (14, 2), (15, 3)],
  term ((1493955265497522703398618245190600931837883384761282320306094815 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (9, 1), (14, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 18. -/
theorem ep_Q2_041_partial_18_0363_valid :
    mulPoly ep_Q2_041_coefficient_18_0363
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0364 : Poly :=
[
  term ((-1770916988710369277245677300553442096342431384899404552190075 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (9, 1), (14, 3), (15, 1)]
]

/-- Partial product 364 for generator 18. -/
def ep_Q2_041_partial_18_0364 : Poly :=
[
  term ((-1770916988710369277245677300553442096342431384899404552190075 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (9, 1), (14, 3), (15, 1)],
  term ((1770916988710369277245677300553442096342431384899404552190075 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (9, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 18. -/
theorem ep_Q2_041_partial_18_0364_valid :
    mulPoly ep_Q2_041_coefficient_18_0364
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0365 : Poly :=
[
  term ((-1787177654199509 : Rat) / 3100914216589) [(0, 1), (10, 1)]
]

/-- Partial product 365 for generator 18. -/
def ep_Q2_041_partial_18_0365 : Poly :=
[
  term ((-3574355308399018 : Rat) / 3100914216589) [(0, 1), (8, 1), (10, 1)],
  term ((1787177654199509 : Rat) / 3100914216589) [(0, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 18. -/
theorem ep_Q2_041_partial_18_0365_valid :
    mulPoly ep_Q2_041_coefficient_18_0365
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0366 : Poly :=
[
  term ((-239837987023040893958026122418047742170960836689636785097249040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 366 for generator 18. -/
def ep_Q2_041_partial_18_0366 : Poly :=
[
  term ((-479675974046081787916052244836095484341921673379273570194498080 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((239837987023040893958026122418047742170960836689636785097249040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 18. -/
theorem ep_Q2_041_partial_18_0366_valid :
    mulPoly ep_Q2_041_coefficient_18_0366
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0367 : Poly :=
[
  term ((-64424321669504040104808293690334085396952657997698925806585660 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 367 for generator 18. -/
def ep_Q2_041_partial_18_0367 : Poly :=
[
  term ((-128848643339008080209616587380668170793905315995397851613171320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((64424321669504040104808293690334085396952657997698925806585660 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 18. -/
theorem ep_Q2_041_partial_18_0367_valid :
    mulPoly ep_Q2_041_coefficient_18_0367
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0368 : Poly :=
[
  term ((299390335324200795001114607927685449345697057092037563829222903 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 368 for generator 18. -/
def ep_Q2_041_partial_18_0368 : Poly :=
[
  term ((299390335324200795001114607927685449345697057092037563829222903 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-299390335324200795001114607927685449345697057092037563829222903 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 18. -/
theorem ep_Q2_041_partial_18_0368_valid :
    mulPoly ep_Q2_041_coefficient_18_0368
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0369 : Poly :=
[
  term ((4136214617176608215536295367882957933087747876461367834317669210 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 3)]
]

/-- Partial product 369 for generator 18. -/
def ep_Q2_041_partial_18_0369 : Poly :=
[
  term ((8272429234353216431072590735765915866175495752922735668635338420 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 3)],
  term ((-4136214617176608215536295367882957933087747876461367834317669210 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 18. -/
theorem ep_Q2_041_partial_18_0369_valid :
    mulPoly ep_Q2_041_coefficient_18_0369
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0370 : Poly :=
[
  term ((74653192572101 : Rat) / 3100914216589) [(0, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 370 for generator 18. -/
def ep_Q2_041_partial_18_0370 : Poly :=
[
  term ((149306385144202 : Rat) / 3100914216589) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-74653192572101 : Rat) / 3100914216589) [(0, 1), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 18. -/
theorem ep_Q2_041_partial_18_0370_valid :
    mulPoly ep_Q2_041_coefficient_18_0370
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0371 : Poly :=
[
  term ((-298612770288404 : Rat) / 3100914216589) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 371 for generator 18. -/
def ep_Q2_041_partial_18_0371 : Poly :=
[
  term ((-597225540576808 : Rat) / 3100914216589) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((298612770288404 : Rat) / 3100914216589) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 18. -/
theorem ep_Q2_041_partial_18_0371_valid :
    mulPoly ep_Q2_041_coefficient_18_0371
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0372 : Poly :=
[
  term ((-3153565845079554145725500068570150321571068699791422270742810970 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 372 for generator 18. -/
def ep_Q2_041_partial_18_0372 : Poly :=
[
  term ((-6307131690159108291451000137140300643142137399582844541485621940 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((3153565845079554145725500068570150321571068699791422270742810970 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 18. -/
theorem ep_Q2_041_partial_18_0372_valid :
    mulPoly ep_Q2_041_coefficient_18_0372
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0373 : Poly :=
[
  term ((-13393826411750027013473752850888566668091369645835508708707099775 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (10, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 373 for generator 18. -/
def ep_Q2_041_partial_18_0373 : Poly :=
[
  term ((-13393826411750027013473752850888566668091369645835508708707099775 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((13393826411750027013473752850888566668091369645835508708707099775 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (10, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 18. -/
theorem ep_Q2_041_partial_18_0373_valid :
    mulPoly ep_Q2_041_coefficient_18_0373
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0374 : Poly :=
[
  term ((239837987023040893958026122418047742170960836689636785097249040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 374 for generator 18. -/
def ep_Q2_041_partial_18_0374 : Poly :=
[
  term ((479675974046081787916052244836095484341921673379273570194498080 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-239837987023040893958026122418047742170960836689636785097249040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 18. -/
theorem ep_Q2_041_partial_18_0374_valid :
    mulPoly ep_Q2_041_coefficient_18_0374
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0375 : Poly :=
[
  term ((-59959496755760223489506530604511935542740209172409196274312260 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 1), (11, 1), (13, 2), (15, 1)]
]

/-- Partial product 375 for generator 18. -/
def ep_Q2_041_partial_18_0375 : Poly :=
[
  term ((-119918993511520446979013061209023871085480418344818392548624520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((59959496755760223489506530604511935542740209172409196274312260 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 18. -/
theorem ep_Q2_041_partial_18_0375_valid :
    mulPoly ep_Q2_041_coefficient_18_0375
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0376 : Poly :=
[
  term ((8306340552304661665972058923406085174654578518043260362279935298 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 376 for generator 18. -/
def ep_Q2_041_partial_18_0376 : Poly :=
[
  term ((16612681104609323331944117846812170349309157036086520724559870596 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-8306340552304661665972058923406085174654578518043260362279935298 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 18. -/
theorem ep_Q2_041_partial_18_0376_valid :
    mulPoly ep_Q2_041_coefficient_18_0376
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0377 : Poly :=
[
  term ((6913160039292836936547910152221612940995316199724579863818646600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 3)]
]

/-- Partial product 377 for generator 18. -/
def ep_Q2_041_partial_18_0377 : Poly :=
[
  term ((13826320078585673873095820304443225881990632399449159727637293200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 3)],
  term ((-6913160039292836936547910152221612940995316199724579863818646600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 18. -/
theorem ep_Q2_041_partial_18_0377_valid :
    mulPoly ep_Q2_041_coefficient_18_0377
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0378 : Poly :=
[
  term ((-15375994066235942713927930679385173529915256415607687613330570 : Rat) / 759770980823734093257926765095462203554110496712382350964449) [(0, 1), (10, 1), (11, 1), (14, 2), (15, 1)]
]

/-- Partial product 378 for generator 18. -/
def ep_Q2_041_partial_18_0378 : Poly :=
[
  term ((-30751988132471885427855861358770347059830512831215375226661140 : Rat) / 759770980823734093257926765095462203554110496712382350964449) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((15375994066235942713927930679385173529915256415607687613330570 : Rat) / 759770980823734093257926765095462203554110496712382350964449) [(0, 1), (10, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 18. -/
theorem ep_Q2_041_partial_18_0378_valid :
    mulPoly ep_Q2_041_coefficient_18_0378
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0379 : Poly :=
[
  term ((-197256330521687196810240175878585025351320759530063920594355949479 : Rat) / 326195007766989837372069891147651772725898106588516156014070104) [(0, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 379 for generator 18. -/
def ep_Q2_041_partial_18_0379 : Poly :=
[
  term ((-197256330521687196810240175878585025351320759530063920594355949479 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((197256330521687196810240175878585025351320759530063920594355949479 : Rat) / 326195007766989837372069891147651772725898106588516156014070104) [(0, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 18. -/
theorem ep_Q2_041_partial_18_0379_valid :
    mulPoly ep_Q2_041_coefficient_18_0379
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0380 : Poly :=
[
  term ((21067070843903138704543267369213690861561859609366310810713489515 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (10, 1), (11, 1), (15, 3)]
]

/-- Partial product 380 for generator 18. -/
def ep_Q2_041_partial_18_0380 : Poly :=
[
  term ((21067070843903138704543267369213690861561859609366310810713489515 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 3)],
  term ((-21067070843903138704543267369213690861561859609366310810713489515 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 18. -/
theorem ep_Q2_041_partial_18_0380_valid :
    mulPoly ep_Q2_041_coefficient_18_0380
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0381 : Poly :=
[
  term ((173057381537890337734515578967033449560835775002085363648614320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 1), (11, 2), (12, 1), (15, 2)]
]

/-- Partial product 381 for generator 18. -/
def ep_Q2_041_partial_18_0381 : Poly :=
[
  term ((346114763075780675469031157934066899121671550004170727297228640 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-173057381537890337734515578967033449560835775002085363648614320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 1), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 18. -/
theorem ep_Q2_041_partial_18_0381_valid :
    mulPoly ep_Q2_041_coefficient_18_0381
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0382 : Poly :=
[
  term ((-173057381537890337734515578967033449560835775002085363648614320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 382 for generator 18. -/
def ep_Q2_041_partial_18_0382 : Poly :=
[
  term ((-346114763075780675469031157934066899121671550004170727297228640 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((173057381537890337734515578967033449560835775002085363648614320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 18. -/
theorem ep_Q2_041_partial_18_0382_valid :
    mulPoly ep_Q2_041_coefficient_18_0382
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0383 : Poly :=
[
  term ((43264345384472584433628894741758362390208943750521340912153580 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 383 for generator 18. -/
def ep_Q2_041_partial_18_0383 : Poly :=
[
  term ((86528690768945168867257789483516724780417887501042681824307160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-43264345384472584433628894741758362390208943750521340912153580 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 18. -/
theorem ep_Q2_041_partial_18_0383_valid :
    mulPoly ep_Q2_041_coefficient_18_0383
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0384 : Poly :=
[
  term ((1268928095587345498970489157556373754099292377111609548402829840 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 1), (11, 2), (14, 1), (15, 2)]
]

/-- Partial product 384 for generator 18. -/
def ep_Q2_041_partial_18_0384 : Poly :=
[
  term ((2537856191174690997940978315112747508198584754223219096805659680 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((-1268928095587345498970489157556373754099292377111609548402829840 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 1), (11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 18. -/
theorem ep_Q2_041_partial_18_0384_valid :
    mulPoly ep_Q2_041_coefficient_18_0384
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0385 : Poly :=
[
  term ((-180924526301043733003441953280553609693182417123206873046689360 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 1), (11, 2), (15, 2)]
]

/-- Partial product 385 for generator 18. -/
def ep_Q2_041_partial_18_0385 : Poly :=
[
  term ((-361849052602087466006883906561107219386364834246413746093378720 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (10, 1), (11, 2), (15, 2)],
  term ((180924526301043733003441953280553609693182417123206873046689360 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 18. -/
theorem ep_Q2_041_partial_18_0385_valid :
    mulPoly ep_Q2_041_coefficient_18_0385
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0386 : Poly :=
[
  term ((-317329337807053 : Rat) / 3100914216589) [(0, 1), (10, 1), (12, 1)]
]

/-- Partial product 386 for generator 18. -/
def ep_Q2_041_partial_18_0386 : Poly :=
[
  term ((-634658675614106 : Rat) / 3100914216589) [(0, 1), (8, 1), (10, 1), (12, 1)],
  term ((317329337807053 : Rat) / 3100914216589) [(0, 1), (10, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 18. -/
theorem ep_Q2_041_partial_18_0386_valid :
    mulPoly ep_Q2_041_coefficient_18_0386
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0387 : Poly :=
[
  term ((-2015729912416780541589091865393581414708541760240097984426905 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 387 for generator 18. -/
def ep_Q2_041_partial_18_0387 : Poly :=
[
  term ((-4031459824833561083178183730787162829417083520480195968853810 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2015729912416780541589091865393581414708541760240097984426905 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 18. -/
theorem ep_Q2_041_partial_18_0387_valid :
    mulPoly ep_Q2_041_coefficient_18_0387
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0388 : Poly :=
[
  term ((-954561759150171724024541169247769394132279158538275196546893131 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 388 for generator 18. -/
def ep_Q2_041_partial_18_0388 : Poly :=
[
  term ((-1909123518300343448049082338495538788264558317076550393093786262 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((954561759150171724024541169247769394132279158538275196546893131 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 18. -/
theorem ep_Q2_041_partial_18_0388_valid :
    mulPoly ep_Q2_041_coefficient_18_0388
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0389 : Poly :=
[
  term ((5726746603084370502347405574895659661136147551257872749130452230 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 3)]
]

/-- Partial product 389 for generator 18. -/
def ep_Q2_041_partial_18_0389 : Poly :=
[
  term ((11453493206168741004694811149791319322272295102515745498260904460 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 3)],
  term ((-5726746603084370502347405574895659661136147551257872749130452230 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 18. -/
theorem ep_Q2_041_partial_18_0389_valid :
    mulPoly ep_Q2_041_coefficient_18_0389
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0390 : Poly :=
[
  term ((11851798797361701064013800881912977257827873043016278120469940 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (10, 1), (12, 1), (13, 2), (15, 2)]
]

/-- Partial product 390 for generator 18. -/
def ep_Q2_041_partial_18_0390 : Poly :=
[
  term ((23703597594723402128027601763825954515655746086032556240939880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 2), (15, 2)],
  term ((-11851798797361701064013800881912977257827873043016278120469940 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (10, 1), (12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 18. -/
theorem ep_Q2_041_partial_18_0390_valid :
    mulPoly ep_Q2_041_coefficient_18_0390
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0391 : Poly :=
[
  term ((-12697032642151 : Rat) / 442987745227) [(0, 1), (10, 1), (12, 1), (14, 1)]
]

/-- Partial product 391 for generator 18. -/
def ep_Q2_041_partial_18_0391 : Poly :=
[
  term ((-25394065284302 : Rat) / 442987745227) [(0, 1), (8, 1), (10, 1), (12, 1), (14, 1)],
  term ((12697032642151 : Rat) / 442987745227) [(0, 1), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 18. -/
theorem ep_Q2_041_partial_18_0391_valid :
    mulPoly ep_Q2_041_coefficient_18_0391
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0392 : Poly :=
[
  term ((-11481399884457559911320731877534600161482842905101268711312580615 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (10, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 392 for generator 18. -/
def ep_Q2_041_partial_18_0392 : Poly :=
[
  term ((-11481399884457559911320731877534600161482842905101268711312580615 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((11481399884457559911320731877534600161482842905101268711312580615 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (10, 1), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 18. -/
theorem ep_Q2_041_partial_18_0392_valid :
    mulPoly ep_Q2_041_coefficient_18_0392
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0393 : Poly :=
[
  term ((457351564350446974344270968016496263430311164337119783040461537 : Rat) / 23299643411927845526576420796260840908992721899179725429576436) [(0, 1), (10, 1), (12, 1), (15, 2)]
]

/-- Partial product 393 for generator 18. -/
def ep_Q2_041_partial_18_0393 : Poly :=
[
  term ((457351564350446974344270968016496263430311164337119783040461537 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-457351564350446974344270968016496263430311164337119783040461537 : Rat) / 23299643411927845526576420796260840908992721899179725429576436) [(0, 1), (10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 18. -/
theorem ep_Q2_041_partial_18_0393_valid :
    mulPoly ep_Q2_041_coefficient_18_0393
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0394 : Poly :=
[
  term ((-965537263435776797826287648961344144612936534688496194932238930 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (12, 1), (15, 4)]
]

/-- Partial product 394 for generator 18. -/
def ep_Q2_041_partial_18_0394 : Poly :=
[
  term ((-1931074526871553595652575297922688289225873069376992389864477860 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (10, 1), (12, 1), (15, 4)],
  term ((965537263435776797826287648961344144612936534688496194932238930 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 18. -/
theorem ep_Q2_041_partial_18_0394_valid :
    mulPoly ep_Q2_041_coefficient_18_0394
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0395 : Poly :=
[
  term ((3442335323210318632627790119697921269817452404306872202631620 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (10, 1), (12, 2), (15, 2)]
]

/-- Partial product 395 for generator 18. -/
def ep_Q2_041_partial_18_0395 : Poly :=
[
  term ((6884670646420637265255580239395842539634904808613744405263240 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (12, 2), (15, 2)],
  term ((-3442335323210318632627790119697921269817452404306872202631620 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (10, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 18. -/
theorem ep_Q2_041_partial_18_0395_valid :
    mulPoly ep_Q2_041_coefficient_18_0395
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0396 : Poly :=
[
  term ((-3572390478652225119721113553662669252056586480935472620105551417049281627254418685 : Rat) / 717863692519426865957573890066941921711244418777466224191722134626777355970534) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 396 for generator 18. -/
def ep_Q2_041_partial_18_0396 : Poly :=
[
  term ((-3572390478652225119721113553662669252056586480935472620105551417049281627254418685 : Rat) / 358931846259713432978786945033470960855622209388733112095861067313388677985267) [(0, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((3572390478652225119721113553662669252056586480935472620105551417049281627254418685 : Rat) / 717863692519426865957573890066941921711244418777466224191722134626777355970534) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 18. -/
theorem ep_Q2_041_partial_18_0396_valid :
    mulPoly ep_Q2_041_coefficient_18_0396
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0397 : Poly :=
[
  term ((3340546321282397895536238228198481321200641510912088216882720480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 3)]
]

/-- Partial product 397 for generator 18. -/
def ep_Q2_041_partial_18_0397 : Poly :=
[
  term ((6681092642564795791072476456396962642401283021824176433765440960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 3)],
  term ((-3340546321282397895536238228198481321200641510912088216882720480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 18. -/
theorem ep_Q2_041_partial_18_0397_valid :
    mulPoly ep_Q2_041_coefficient_18_0397
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0398 : Poly :=
[
  term ((-2966502976830498358064367401374251287221379954080478281602665 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 398 for generator 18. -/
def ep_Q2_041_partial_18_0398 : Poly :=
[
  term ((-5933005953660996716128734802748502574442759908160956563205330 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((2966502976830498358064367401374251287221379954080478281602665 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 18. -/
theorem ep_Q2_041_partial_18_0398_valid :
    mulPoly ep_Q2_041_coefficient_18_0398
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0399 : Poly :=
[
  term ((-17168928787971738967926772998637639685357763339978296964250682293 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 399 for generator 18. -/
def ep_Q2_041_partial_18_0399 : Poly :=
[
  term ((-34337857575943477935853545997275279370715526679956593928501364586 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((17168928787971738967926772998637639685357763339978296964250682293 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 18. -/
theorem ep_Q2_041_partial_18_0399_valid :
    mulPoly ep_Q2_041_coefficient_18_0399
        ep_Q2_041_generator_18_0300_0399 =
      ep_Q2_041_partial_18_0399 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_041_partials_18_0300_0399 : List Poly :=
[
  ep_Q2_041_partial_18_0300,
  ep_Q2_041_partial_18_0301,
  ep_Q2_041_partial_18_0302,
  ep_Q2_041_partial_18_0303,
  ep_Q2_041_partial_18_0304,
  ep_Q2_041_partial_18_0305,
  ep_Q2_041_partial_18_0306,
  ep_Q2_041_partial_18_0307,
  ep_Q2_041_partial_18_0308,
  ep_Q2_041_partial_18_0309,
  ep_Q2_041_partial_18_0310,
  ep_Q2_041_partial_18_0311,
  ep_Q2_041_partial_18_0312,
  ep_Q2_041_partial_18_0313,
  ep_Q2_041_partial_18_0314,
  ep_Q2_041_partial_18_0315,
  ep_Q2_041_partial_18_0316,
  ep_Q2_041_partial_18_0317,
  ep_Q2_041_partial_18_0318,
  ep_Q2_041_partial_18_0319,
  ep_Q2_041_partial_18_0320,
  ep_Q2_041_partial_18_0321,
  ep_Q2_041_partial_18_0322,
  ep_Q2_041_partial_18_0323,
  ep_Q2_041_partial_18_0324,
  ep_Q2_041_partial_18_0325,
  ep_Q2_041_partial_18_0326,
  ep_Q2_041_partial_18_0327,
  ep_Q2_041_partial_18_0328,
  ep_Q2_041_partial_18_0329,
  ep_Q2_041_partial_18_0330,
  ep_Q2_041_partial_18_0331,
  ep_Q2_041_partial_18_0332,
  ep_Q2_041_partial_18_0333,
  ep_Q2_041_partial_18_0334,
  ep_Q2_041_partial_18_0335,
  ep_Q2_041_partial_18_0336,
  ep_Q2_041_partial_18_0337,
  ep_Q2_041_partial_18_0338,
  ep_Q2_041_partial_18_0339,
  ep_Q2_041_partial_18_0340,
  ep_Q2_041_partial_18_0341,
  ep_Q2_041_partial_18_0342,
  ep_Q2_041_partial_18_0343,
  ep_Q2_041_partial_18_0344,
  ep_Q2_041_partial_18_0345,
  ep_Q2_041_partial_18_0346,
  ep_Q2_041_partial_18_0347,
  ep_Q2_041_partial_18_0348,
  ep_Q2_041_partial_18_0349,
  ep_Q2_041_partial_18_0350,
  ep_Q2_041_partial_18_0351,
  ep_Q2_041_partial_18_0352,
  ep_Q2_041_partial_18_0353,
  ep_Q2_041_partial_18_0354,
  ep_Q2_041_partial_18_0355,
  ep_Q2_041_partial_18_0356,
  ep_Q2_041_partial_18_0357,
  ep_Q2_041_partial_18_0358,
  ep_Q2_041_partial_18_0359,
  ep_Q2_041_partial_18_0360,
  ep_Q2_041_partial_18_0361,
  ep_Q2_041_partial_18_0362,
  ep_Q2_041_partial_18_0363,
  ep_Q2_041_partial_18_0364,
  ep_Q2_041_partial_18_0365,
  ep_Q2_041_partial_18_0366,
  ep_Q2_041_partial_18_0367,
  ep_Q2_041_partial_18_0368,
  ep_Q2_041_partial_18_0369,
  ep_Q2_041_partial_18_0370,
  ep_Q2_041_partial_18_0371,
  ep_Q2_041_partial_18_0372,
  ep_Q2_041_partial_18_0373,
  ep_Q2_041_partial_18_0374,
  ep_Q2_041_partial_18_0375,
  ep_Q2_041_partial_18_0376,
  ep_Q2_041_partial_18_0377,
  ep_Q2_041_partial_18_0378,
  ep_Q2_041_partial_18_0379,
  ep_Q2_041_partial_18_0380,
  ep_Q2_041_partial_18_0381,
  ep_Q2_041_partial_18_0382,
  ep_Q2_041_partial_18_0383,
  ep_Q2_041_partial_18_0384,
  ep_Q2_041_partial_18_0385,
  ep_Q2_041_partial_18_0386,
  ep_Q2_041_partial_18_0387,
  ep_Q2_041_partial_18_0388,
  ep_Q2_041_partial_18_0389,
  ep_Q2_041_partial_18_0390,
  ep_Q2_041_partial_18_0391,
  ep_Q2_041_partial_18_0392,
  ep_Q2_041_partial_18_0393,
  ep_Q2_041_partial_18_0394,
  ep_Q2_041_partial_18_0395,
  ep_Q2_041_partial_18_0396,
  ep_Q2_041_partial_18_0397,
  ep_Q2_041_partial_18_0398,
  ep_Q2_041_partial_18_0399
]

/-- Sum of partial products in this block. -/
def ep_Q2_041_block_18_0300_0399 : Poly :=
[
  term ((235731107931748 : Rat) / 3100914216589) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-5726746603084370502347405574895659661136147551257872749130452230 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-11851798797361701064013800881912977257827873043016278120469940 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((5210006037528686895162827586521202646176114655030979349592240 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5996146344991239401731281549944509559959109774901906272164118506 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((965537263435776797826287648961344144612936534688496194932238930 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 3)],
  term ((-3442335323210318632627790119697921269817452404306872202631620 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((1269317351228212 : Rat) / 3100914216589) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-826979129843724 : Rat) / 3100914216589) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-3383987248484901574635980727137265471283495619285642011103757555 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((781372961032321853676453511419671068447958269528308690622619925 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((29410019237897554492182394781043313936091388662299653113758740 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-2356498006492969802201574444356966238398524464693295064888760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-105502077709113038795938008670431746935735484842032566063087431909 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((628475052175898696331129508724701191435798162216151453985580480 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 3)],
  term ((3298557932855214583059580797999221787659773953340805041134040 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-91463030052854915514683907313288109565230530540030130791514117445 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((503268044579833005701691163188995821821577992430949041974138670 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 3)],
  term ((720992738562617918352502368261703601830064076056847456025722080 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (9, 1), (10, 2), (11, 1), (15, 2)],
  term ((857299060490614878028737633799372108314559984417441239754740 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-1247557768143336954106715882306629185034512951896450328470520 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (9, 1), (10, 2), (13, 1), (15, 2)],
  term ((-62752526281311235561518632388733213923298353002366244751630 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (9, 1), (10, 2), (14, 1), (15, 1)],
  term ((58323985339931372220453146497665189290287252264867156770065264801 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (9, 1), (10, 2), (15, 1)],
  term ((-3814641860187581065188903897339582020484259706728355087894741655 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (10, 2), (15, 3)],
  term ((-360641049806752 : Rat) / 442987745227) [(0, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((159140222994692541044802620059112635970084108790976127277171560 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((945366123219905955925722705326906083323736557611318213239058160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((360641049806752 : Rat) / 442987745227) [(0, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-5247819766331944646349418824330032372576029164484781545463210655 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((17314499428272841652552378335347454016704486281251391946269596735 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-257697286678016160419233174761336341587810631990795703226342640 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (9, 1), (11, 1), (12, 2), (15, 2)],
  term ((-1194550575993237046645299405959521445299411056994537110882441530 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((239837987023040893958026122418047742170960836689636785097249040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((819594365332886 : Rat) / 442987745227) [(0, 1), (8, 1), (9, 1), (11, 1), (14, 1)],
  term ((-12638898086820420630795800222296464970443148010346510652232586675 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-298612770288404 : Rat) / 3100914216589) [(0, 1), (8, 1), (9, 1), (11, 1), (14, 2)],
  term ((14943586908842937409425559040114541378437823326987463417585133510 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (11, 1), (14, 2), (15, 2)],
  term ((1069812868279955607482798971056281337894401218496998219483986080 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-1069812868279955607482798971056281337894401218496998219483986080 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((345917336782921308696768210546203208675526921694493964873466200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (8, 1), (9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-173057381537890337734515578967033449560835775002085363648614320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (9, 1), (11, 2), (14, 2), (15, 1)],
  term ((2091468399746154 : Rat) / 3100914216589) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((50788130568604 : Rat) / 442987745227) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1366030867208340620783920431337008881891914333161542032797205545 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-6764027673645011933180960074758424414817765373854227676271030330 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-5706421643174152364154793017217359420435642576267096872818860 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((589124501623242450550393611089241559599631116173323766222190 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((259334129985877061276484091966087763921834989104797518889460 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3740238597768849725286383709101937320949373881150751484652310 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((2388753562303530884646079244966503756627596793022444220415400789 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-2112875424324323475421744918506735714480098144147004642678361940 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 3)],
  term ((5706421643174152364154793017217359420435642576267096872818860 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 2)],
  term ((1694342276540742127268075995941521381935893947594921270009166323 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((1366030867208340620783920431337008881891914333161542032797205545 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (12, 2), (15, 3)],
  term ((-412486183289752 : Rat) / 442987745227) [(0, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((11030390445757237490514115002913231220111743392288827699575545405 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((235731107931748 : Rat) / 3100914216589) [(0, 1), (8, 1), (9, 1), (13, 1), (14, 2)],
  term ((339287008263803013958564368462448168083957853746227431707211650 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 1), (9, 1), (13, 1), (14, 2), (15, 2)],
  term ((-13399694546724730247812874291441572728148472446295207231720400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((-11851798797361701064013800881912977257827873043016278120469940 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (9, 1), (13, 2), (14, 2), (15, 1)],
  term ((-10909710733814973590292897265632432224751243248950787078956371361 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((114615575566079661987532774267138142062813915519644900199521895 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 1), (9, 1), (14, 1), (15, 3)],
  term ((5577824118149544680680619848531863911581400877416599174767342817 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 1), (9, 1), (14, 2), (15, 1)],
  term ((-2987910530995045406797236490381201863675766769522564640612189630 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (9, 1), (14, 2), (15, 3)],
  term ((-1770916988710369277245677300553442096342431384899404552190075 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (9, 1), (14, 3), (15, 1)],
  term ((-3574355308399018 : Rat) / 3100914216589) [(0, 1), (8, 1), (10, 1)],
  term ((-479675974046081787916052244836095484341921673379273570194498080 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-128848643339008080209616587380668170793905315995397851613171320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((299390335324200795001114607927685449345697057092037563829222903 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((8272429234353216431072590735765915866175495752922735668635338420 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 3)],
  term ((149306385144202 : Rat) / 3100914216589) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-597225540576808 : Rat) / 3100914216589) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-6307131690159108291451000137140300643142137399582844541485621940 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-13393826411750027013473752850888566668091369645835508708707099775 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((479675974046081787916052244836095484341921673379273570194498080 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-119918993511520446979013061209023871085480418344818392548624520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((16612681104609323331944117846812170349309157036086520724559870596 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((13826320078585673873095820304443225881990632399449159727637293200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 3)],
  term ((-30751988132471885427855861358770347059830512831215375226661140 : Rat) / 759770980823734093257926765095462203554110496712382350964449) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-197256330521687196810240175878585025351320759530063920594355949479 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((21067070843903138704543267369213690861561859609366310810713489515 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 3)],
  term ((346114763075780675469031157934066899121671550004170727297228640 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-346114763075780675469031157934066899121671550004170727297228640 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((86528690768945168867257789483516724780417887501042681824307160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((2537856191174690997940978315112747508198584754223219096805659680 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((-361849052602087466006883906561107219386364834246413746093378720 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (10, 1), (11, 2), (15, 2)],
  term ((-634658675614106 : Rat) / 3100914216589) [(0, 1), (8, 1), (10, 1), (12, 1)],
  term ((-4031459824833561083178183730787162829417083520480195968853810 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1909123518300343448049082338495538788264558317076550393093786262 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((11453493206168741004694811149791319322272295102515745498260904460 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 3)],
  term ((23703597594723402128027601763825954515655746086032556240939880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 2), (15, 2)],
  term ((-25394065284302 : Rat) / 442987745227) [(0, 1), (8, 1), (10, 1), (12, 1), (14, 1)],
  term ((-11481399884457559911320731877534600161482842905101268711312580615 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((457351564350446974344270968016496263430311164337119783040461537 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-1931074526871553595652575297922688289225873069376992389864477860 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (10, 1), (12, 1), (15, 4)],
  term ((6884670646420637265255580239395842539634904808613744405263240 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (12, 2), (15, 2)],
  term ((-3572390478652225119721113553662669252056586480935472620105551417049281627254418685 : Rat) / 358931846259713432978786945033470960855622209388733112095861067313388677985267) [(0, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((6681092642564795791072476456396962642401283021824176433765440960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 3)],
  term ((-5933005953660996716128734802748502574442759908160956563205330 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-34337857575943477935853545997275279370715526679956593928501364586 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-117865553965874 : Rat) / 3100914216589) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((2863373301542185251173702787447829830568073775628936374565226115 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((5925899398680850532006900440956488628913936521508139060234970 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((-2605003018764343447581413793260601323088057327515489674796120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((2998073172495619700865640774972254779979554887450953136082059253 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-482768631717888398913143824480672072306468267344248097466119465 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 3)],
  term ((1721167661605159316313895059848960634908726202153436101315810 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-634658675614106 : Rat) / 3100914216589) [(0, 1), (9, 1), (10, 1), (13, 1)],
  term ((413489564921862 : Rat) / 3100914216589) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((3383987248484901574635980727137265471283495619285642011103757555 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-781372961032321853676453511419671068447958269528308690622619925 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-14705009618948777246091197390521656968045694331149826556879370 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((1178249003246484901100787222178483119199262232346647532444380 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((105502077709113038795938008670431746935735484842032566063087431909 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-314237526087949348165564754362350595717899081108075726992790240 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 3)],
  term ((-1649278966427607291529790398999610893829886976670402520567020 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((91463030052854915514683907313288109565230530540030130791514117445 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((-251634022289916502850845581594497910910788996215474520987069335 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (9, 1), (10, 1), (15, 3)],
  term ((-360496369281308959176251184130851800915032038028423728012861040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (10, 2), (11, 1), (15, 2)],
  term ((-428649530245307439014368816899686054157279992208720619877370 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((623778884071668477053357941153314592517256475948225164235260 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (10, 2), (13, 1), (15, 2)],
  term ((31376263140655617780759316194366606961649176501183122375815 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (10, 2), (14, 1), (15, 1)],
  term ((-58323985339931372220453146497665189290287252264867156770065264801 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((3814641860187581065188903897339582020484259706728355087894741655 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (9, 1), (10, 2), (15, 3)],
  term ((180320524903376 : Rat) / 442987745227) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((-79570111497346270522401310029556317985042054395488063638585780 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-472683061609952977962861352663453041661868278805659106619529080 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-180320524903376 : Rat) / 442987745227) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((5247819766331944646349418824330032372576029164484781545463210655 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-17314499428272841652552378335347454016704486281251391946269596735 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((128848643339008080209616587380668170793905315995397851613171320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (11, 1), (12, 2), (15, 2)],
  term ((597275287996618523322649702979760722649705528497268555441220765 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-119918993511520446979013061209023871085480418344818392548624520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-409797182666443 : Rat) / 442987745227) [(0, 1), (9, 1), (11, 1), (14, 1)],
  term ((12638898086820420630795800222296464970443148010346510652232586675 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((149306385144202 : Rat) / 3100914216589) [(0, 1), (9, 1), (11, 1), (14, 2)],
  term ((-7471793454421468704712779520057270689218911663493731708792566755 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (9, 1), (11, 1), (14, 2), (15, 2)],
  term ((-534906434139977803741399485528140668947200609248499109741993040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((534906434139977803741399485528140668947200609248499109741993040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-172958668391460654348384105273101604337763460847246982436733100 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (9, 1), (11, 2), (14, 1), (15, 1)],
  term ((86528690768945168867257789483516724780417887501042681824307160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (9, 1), (11, 2), (14, 2), (15, 1)],
  term ((-1045734199873077 : Rat) / 3100914216589) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((-25394065284302 : Rat) / 442987745227) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((1366030867208340620783920431337008881891914333161542032797205545 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((3382013836822505966590480037379212207408882686927113838135515165 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((2853210821587076182077396508608679710217821288133548436409430 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-294562250811621225275196805544620779799815558086661883111095 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-129667064992938530638242045983043881960917494552398759444730 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((1870119298884424862643191854550968660474686940575375742326155 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-2388753562303530884646079244966503756627596793022444220415400789 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((1056437712162161737710872459253367857240049072073502321339180970 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (9, 1), (12, 1), (15, 3)],
  term ((-2853210821587076182077396508608679710217821288133548436409430 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (12, 2), (13, 1), (15, 2)],
  term ((-1694342276540742127268075995941521381935893947594921270009166323 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((-1366030867208340620783920431337008881891914333161542032797205545 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (9, 1), (12, 2), (15, 3)],
  term ((206243091644876 : Rat) / 442987745227) [(0, 1), (9, 1), (13, 1), (14, 1)],
  term ((-11030390445757237490514115002913231220111743392288827699575545405 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-117865553965874 : Rat) / 3100914216589) [(0, 1), (9, 1), (13, 1), (14, 2)],
  term ((-169643504131901506979282184231224084041978926873113715853605825 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (9, 1), (13, 1), (14, 2), (15, 2)],
  term ((6699847273362365123906437145720786364074236223147603615860200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((5925899398680850532006900440956488628913936521508139060234970 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (9, 1), (13, 2), (14, 2), (15, 1)],
  term ((10909710733814973590292897265632432224751243248950787078956371361 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term ((-114615575566079661987532774267138142062813915519644900199521895 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (9, 1), (14, 1), (15, 3)],
  term ((-5577824118149544680680619848531863911581400877416599174767342817 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((1493955265497522703398618245190600931837883384761282320306094815 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (9, 1), (14, 2), (15, 3)],
  term ((1770916988710369277245677300553442096342431384899404552190075 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (9, 1), (14, 3), (15, 1)],
  term ((1787177654199509 : Rat) / 3100914216589) [(0, 1), (10, 1)],
  term ((239837987023040893958026122418047742170960836689636785097249040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((64424321669504040104808293690334085396952657997698925806585660 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-299390335324200795001114607927685449345697057092037563829222903 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4136214617176608215536295367882957933087747876461367834317669210 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 3)],
  term ((-74653192572101 : Rat) / 3100914216589) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((298612770288404 : Rat) / 3100914216589) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((3153565845079554145725500068570150321571068699791422270742810970 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((13393826411750027013473752850888566668091369645835508708707099775 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-239837987023040893958026122418047742170960836689636785097249040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((59959496755760223489506530604511935542740209172409196274312260 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-8306340552304661665972058923406085174654578518043260362279935298 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-6913160039292836936547910152221612940995316199724579863818646600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 3)],
  term ((15375994066235942713927930679385173529915256415607687613330570 : Rat) / 759770980823734093257926765095462203554110496712382350964449) [(0, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((197256330521687196810240175878585025351320759530063920594355949479 : Rat) / 326195007766989837372069891147651772725898106588516156014070104) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((-21067070843903138704543267369213690861561859609366310810713489515 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (10, 1), (11, 1), (15, 3)],
  term ((-173057381537890337734515578967033449560835775002085363648614320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((173057381537890337734515578967033449560835775002085363648614320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-43264345384472584433628894741758362390208943750521340912153580 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1268928095587345498970489157556373754099292377111609548402829840 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((180924526301043733003441953280553609693182417123206873046689360 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 1), (11, 2), (15, 2)],
  term ((317329337807053 : Rat) / 3100914216589) [(0, 1), (10, 1), (12, 1)],
  term ((2015729912416780541589091865393581414708541760240097984426905 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((954561759150171724024541169247769394132279158538275196546893131 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-5726746603084370502347405574895659661136147551257872749130452230 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 3)],
  term ((-11851798797361701064013800881912977257827873043016278120469940 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (10, 1), (12, 1), (13, 2), (15, 2)],
  term ((12697032642151 : Rat) / 442987745227) [(0, 1), (10, 1), (12, 1), (14, 1)],
  term ((11481399884457559911320731877534600161482842905101268711312580615 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-457351564350446974344270968016496263430311164337119783040461537 : Rat) / 23299643411927845526576420796260840908992721899179725429576436) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((965537263435776797826287648961344144612936534688496194932238930 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (12, 1), (15, 4)],
  term ((-3442335323210318632627790119697921269817452404306872202631620 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (10, 1), (12, 2), (15, 2)],
  term ((3572390478652225119721113553662669252056586480935472620105551417049281627254418685 : Rat) / 717863692519426865957573890066941921711244418777466224191722134626777355970534) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3340546321282397895536238228198481321200641510912088216882720480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 3)],
  term ((2966502976830498358064367401374251287221379954080478281602665 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((17168928787971738967926772998637639685357763339978296964250682293 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 300 through 399. -/
theorem ep_Q2_041_block_18_0300_0399_valid :
    checkProductSumEq ep_Q2_041_partials_18_0300_0399
      ep_Q2_041_block_18_0300_0399 = true := by
  native_decide

end EpQ2041TermShards

end Patterns

end EndpointCertificate

end Problem97
