/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 21:500-599

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_21_0500_0599 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 500 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0500 : Poly :=
[
  term ((-88171245013 : Rat) / 7401317245) [(6, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 500 for generator 21. -/
def ep_Q2_002_partial_21_0500 : Poly :=
[
  term ((-176342490026 : Rat) / 7401317245) [(6, 1), (7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((88171245013 : Rat) / 7401317245) [(6, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 21. -/
theorem ep_Q2_002_partial_21_0500_valid :
    mulPoly ep_Q2_002_coefficient_21_0500
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0501 : Poly :=
[
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 2), (11, 2)]
]

/-- Partial product 501 for generator 21. -/
def ep_Q2_002_partial_21_0501 : Poly :=
[
  term ((407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 2), (10, 1), (11, 2)],
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 21. -/
theorem ep_Q2_002_partial_21_0501_valid :
    mulPoly ep_Q2_002_coefficient_21_0501
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0502 : Poly :=
[
  term ((-198082090546973013458830753975968 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 502 for generator 21. -/
def ep_Q2_002_partial_21_0502 : Poly :=
[
  term ((-396164181093946026917661507951936 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((198082090546973013458830753975968 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 21. -/
theorem ep_Q2_002_partial_21_0502_valid :
    mulPoly ep_Q2_002_coefficient_21_0502
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0503 : Poly :=
[
  term ((-80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 503 for generator 21. -/
def ep_Q2_002_partial_21_0503 : Poly :=
[
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 21. -/
theorem ep_Q2_002_partial_21_0503_valid :
    mulPoly ep_Q2_002_coefficient_21_0503
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0504 : Poly :=
[
  term ((-5271014764 : Rat) / 7401317245) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 504 for generator 21. -/
def ep_Q2_002_partial_21_0504 : Poly :=
[
  term ((-10542029528 : Rat) / 7401317245) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((5271014764 : Rat) / 7401317245) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 21. -/
theorem ep_Q2_002_partial_21_0504_valid :
    mulPoly ep_Q2_002_coefficient_21_0504
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0505 : Poly :=
[
  term ((4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (11, 2)]
]

/-- Partial product 505 for generator 21. -/
def ep_Q2_002_partial_21_0505 : Poly :=
[
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (10, 1), (11, 2)],
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 21. -/
theorem ep_Q2_002_partial_21_0505_valid :
    mulPoly ep_Q2_002_coefficient_21_0505
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0506 : Poly :=
[
  term ((-50923991106680379541655135603658572910384 : Rat) / 122438019774574775144195206323084197045) [(6, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 506 for generator 21. -/
def ep_Q2_002_partial_21_0506 : Poly :=
[
  term ((-101847982213360759083310271207317145820768 : Rat) / 122438019774574775144195206323084197045) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((50923991106680379541655135603658572910384 : Rat) / 122438019774574775144195206323084197045) [(6, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 21. -/
theorem ep_Q2_002_partial_21_0506_valid :
    mulPoly ep_Q2_002_coefficient_21_0506
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0507 : Poly :=
[
  term ((105612228228 : Rat) / 7401317245) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 507 for generator 21. -/
def ep_Q2_002_partial_21_0507 : Poly :=
[
  term ((211224456456 : Rat) / 7401317245) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-105612228228 : Rat) / 7401317245) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 21. -/
theorem ep_Q2_002_partial_21_0507_valid :
    mulPoly ep_Q2_002_coefficient_21_0507
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0508 : Poly :=
[
  term ((2491494060553620688854256042368 : Rat) / 8907625806546791523286541099) [(6, 1), (8, 1), (13, 2)]
]

/-- Partial product 508 for generator 21. -/
def ep_Q2_002_partial_21_0508 : Poly :=
[
  term ((4982988121107241377708512084736 : Rat) / 8907625806546791523286541099) [(6, 1), (8, 1), (10, 1), (13, 2)],
  term ((-2491494060553620688854256042368 : Rat) / 8907625806546791523286541099) [(6, 1), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 21. -/
theorem ep_Q2_002_partial_21_0508_valid :
    mulPoly ep_Q2_002_coefficient_21_0508
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0509 : Poly :=
[
  term ((87516987952133714817881732436792 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 509 for generator 21. -/
def ep_Q2_002_partial_21_0509 : Poly :=
[
  term ((175033975904267429635763464873584 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (10, 1), (11, 1)],
  term ((-87516987952133714817881732436792 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 21. -/
theorem ep_Q2_002_partial_21_0509_valid :
    mulPoly ep_Q2_002_coefficient_21_0509
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0510 : Poly :=
[
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 510 for generator 21. -/
def ep_Q2_002_partial_21_0510 : Poly :=
[
  term ((142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 21. -/
theorem ep_Q2_002_partial_21_0510_valid :
    mulPoly ep_Q2_002_coefficient_21_0510
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0511 : Poly :=
[
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 511 for generator 21. -/
def ep_Q2_002_partial_21_0511 : Poly :=
[
  term ((610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 21. -/
theorem ep_Q2_002_partial_21_0511_valid :
    mulPoly ep_Q2_002_coefficient_21_0511
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0512 : Poly :=
[
  term ((32504690856 : Rat) / 7401317245) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 512 for generator 21. -/
def ep_Q2_002_partial_21_0512 : Poly :=
[
  term ((65009381712 : Rat) / 7401317245) [(6, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-32504690856 : Rat) / 7401317245) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 21. -/
theorem ep_Q2_002_partial_21_0512_valid :
    mulPoly ep_Q2_002_coefficient_21_0512
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0513 : Poly :=
[
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 513 for generator 21. -/
def ep_Q2_002_partial_21_0513 : Poly :=
[
  term ((-75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 21. -/
theorem ep_Q2_002_partial_21_0513_valid :
    mulPoly ep_Q2_002_coefficient_21_0513
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0514 : Poly :=
[
  term ((-164810877777868260187850033520864 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 514 for generator 21. -/
def ep_Q2_002_partial_21_0514 : Poly :=
[
  term ((-329621755555736520375700067041728 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (10, 1), (13, 1)],
  term ((164810877777868260187850033520864 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 21. -/
theorem ep_Q2_002_partial_21_0514_valid :
    mulPoly ep_Q2_002_coefficient_21_0514
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0515 : Poly :=
[
  term ((315955259105478657634918042411100753185776 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 515 for generator 21. -/
def ep_Q2_002_partial_21_0515 : Poly :=
[
  term ((631910518210957315269836084822201506371552 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (9, 1), (10, 1), (15, 1)],
  term ((-315955259105478657634918042411100753185776 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 21. -/
theorem ep_Q2_002_partial_21_0515_valid :
    mulPoly ep_Q2_002_coefficient_21_0515
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0516 : Poly :=
[
  term ((-6759349826 : Rat) / 1057331035) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 516 for generator 21. -/
def ep_Q2_002_partial_21_0516 : Poly :=
[
  term ((-13518699652 : Rat) / 1057331035) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((6759349826 : Rat) / 1057331035) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 21. -/
theorem ep_Q2_002_partial_21_0516_valid :
    mulPoly ep_Q2_002_coefficient_21_0516
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0517 : Poly :=
[
  term ((4510263669443720691466530901824 : Rat) / 97983883872014706756151952089) [(6, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 517 for generator 21. -/
def ep_Q2_002_partial_21_0517 : Poly :=
[
  term ((-4510263669443720691466530901824 : Rat) / 97983883872014706756151952089) [(6, 1), (10, 1), (11, 1), (13, 1)],
  term ((9020527338887441382933061803648 : Rat) / 97983883872014706756151952089) [(6, 1), (10, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 21. -/
theorem ep_Q2_002_partial_21_0517_valid :
    mulPoly ep_Q2_002_coefficient_21_0517
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0518 : Poly :=
[
  term ((-854113760960604716368645297291189045685952 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 518 for generator 21. -/
def ep_Q2_002_partial_21_0518 : Poly :=
[
  term ((854113760960604716368645297291189045685952 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1708227521921209432737290594582378091371904 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 21. -/
theorem ep_Q2_002_partial_21_0518_valid :
    mulPoly ep_Q2_002_coefficient_21_0518
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0519 : Poly :=
[
  term ((-60831461616 : Rat) / 7401317245) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 519 for generator 21. -/
def ep_Q2_002_partial_21_0519 : Poly :=
[
  term ((60831461616 : Rat) / 7401317245) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-121662923232 : Rat) / 7401317245) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 21. -/
theorem ep_Q2_002_partial_21_0519_valid :
    mulPoly ep_Q2_002_coefficient_21_0519
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0520 : Poly :=
[
  term ((-8493671134765391464593217559808 : Rat) / 97983883872014706756151952089) [(6, 1), (10, 1), (13, 2)]
]

/-- Partial product 520 for generator 21. -/
def ep_Q2_002_partial_21_0520 : Poly :=
[
  term ((8493671134765391464593217559808 : Rat) / 97983883872014706756151952089) [(6, 1), (10, 1), (13, 2)],
  term ((-16987342269530782929186435119616 : Rat) / 97983883872014706756151952089) [(6, 1), (10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 21. -/
theorem ep_Q2_002_partial_21_0520_valid :
    mulPoly ep_Q2_002_coefficient_21_0520
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0521 : Poly :=
[
  term ((297106534395704799515397712675968 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 521 for generator 21. -/
def ep_Q2_002_partial_21_0521 : Poly :=
[
  term ((594213068791409599030795425351936 : Rat) / 1273790490336191187829975377157) [(6, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-297106534395704799515397712675968 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 21. -/
theorem ep_Q2_002_partial_21_0521_valid :
    mulPoly ep_Q2_002_coefficient_21_0521
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0522 : Poly :=
[
  term ((984588508957349580274127411948182905289404 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 522 for generator 21. -/
def ep_Q2_002_partial_21_0522 : Poly :=
[
  term ((1969177017914699160548254823896365810578808 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-984588508957349580274127411948182905289404 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 21. -/
theorem ep_Q2_002_partial_21_0522_valid :
    mulPoly ep_Q2_002_coefficient_21_0522
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0523 : Poly :=
[
  term ((118292250717 : Rat) / 7401317245) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 523 for generator 21. -/
def ep_Q2_002_partial_21_0523 : Poly :=
[
  term ((236584501434 : Rat) / 7401317245) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-118292250717 : Rat) / 7401317245) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 21. -/
theorem ep_Q2_002_partial_21_0523_valid :
    mulPoly ep_Q2_002_coefficient_21_0523
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0524 : Poly :=
[
  term ((123228283172381286773503204585080 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1)]
]

/-- Partial product 524 for generator 21. -/
def ep_Q2_002_partial_21_0524 : Poly :=
[
  term ((246456566344762573547006409170160 : Rat) / 1273790490336191187829975377157) [(6, 1), (10, 1), (11, 1), (13, 1)],
  term ((-123228283172381286773503204585080 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 21. -/
theorem ep_Q2_002_partial_21_0524_valid :
    mulPoly ep_Q2_002_coefficient_21_0524
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0525 : Poly :=
[
  term ((-28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 525 for generator 21. -/
def ep_Q2_002_partial_21_0525 : Poly :=
[
  term ((-56805481990332207609573858088320 : Rat) / 1273790490336191187829975377157) [(6, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 21. -/
theorem ep_Q2_002_partial_21_0525_valid :
    mulPoly ep_Q2_002_coefficient_21_0525
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0526 : Poly :=
[
  term ((491933471112142098613164707972865402076303 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 526 for generator 21. -/
def ep_Q2_002_partial_21_0526 : Poly :=
[
  term ((983866942224284197226329415945730804152606 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (10, 1), (11, 1), (15, 1)],
  term ((-491933471112142098613164707972865402076303 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 21. -/
theorem ep_Q2_002_partial_21_0526_valid :
    mulPoly ep_Q2_002_coefficient_21_0526
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0527 : Poly :=
[
  term ((235900555763 : Rat) / 88815806940) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 527 for generator 21. -/
def ep_Q2_002_partial_21_0527 : Poly :=
[
  term ((235900555763 : Rat) / 44407903470) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-235900555763 : Rat) / 88815806940) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 21. -/
theorem ep_Q2_002_partial_21_0527_valid :
    mulPoly ep_Q2_002_coefficient_21_0527
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0528 : Poly :=
[
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (15, 3)]
]

/-- Partial product 528 for generator 21. -/
def ep_Q2_002_partial_21_0528 : Poly :=
[
  term ((-3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (10, 1), (11, 1), (15, 3)],
  term ((1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 21. -/
theorem ep_Q2_002_partial_21_0528_valid :
    mulPoly ep_Q2_002_coefficient_21_0528
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0529 : Poly :=
[
  term ((-158475703364 : Rat) / 22203951735) [(6, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 529 for generator 21. -/
def ep_Q2_002_partial_21_0529 : Poly :=
[
  term ((-316951406728 : Rat) / 22203951735) [(6, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((158475703364 : Rat) / 22203951735) [(6, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 21. -/
theorem ep_Q2_002_partial_21_0529_valid :
    mulPoly ep_Q2_002_coefficient_21_0529
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0530 : Poly :=
[
  term ((-7904862845782590770519069654910 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2)]
]

/-- Partial product 530 for generator 21. -/
def ep_Q2_002_partial_21_0530 : Poly :=
[
  term ((-15809725691565181541038139309820 : Rat) / 1273790490336191187829975377157) [(6, 1), (10, 1), (11, 2)],
  term ((7904862845782590770519069654910 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 21. -/
theorem ep_Q2_002_partial_21_0530_valid :
    mulPoly ep_Q2_002_coefficient_21_0530
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0531 : Poly :=
[
  term ((-140280694376268705916377369329352 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2), (12, 1)]
]

/-- Partial product 531 for generator 21. -/
def ep_Q2_002_partial_21_0531 : Poly :=
[
  term ((-280561388752537411832754738658704 : Rat) / 1273790490336191187829975377157) [(6, 1), (10, 1), (11, 2), (12, 1)],
  term ((140280694376268705916377369329352 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 21. -/
theorem ep_Q2_002_partial_21_0531_valid :
    mulPoly ep_Q2_002_coefficient_21_0531
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0532 : Poly :=
[
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2), (15, 2)]
]

/-- Partial product 532 for generator 21. -/
def ep_Q2_002_partial_21_0532 : Poly :=
[
  term ((30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(6, 1), (10, 1), (11, 2), (15, 2)],
  term ((-15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 21. -/
theorem ep_Q2_002_partial_21_0532_valid :
    mulPoly ep_Q2_002_coefficient_21_0532
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0533 : Poly :=
[
  term ((-871728662554901998481237419813615738957152 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 533 for generator 21. -/
def ep_Q2_002_partial_21_0533 : Poly :=
[
  term ((-1743457325109803996962474839627231477914304 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((871728662554901998481237419813615738957152 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 21. -/
theorem ep_Q2_002_partial_21_0533_valid :
    mulPoly ep_Q2_002_coefficient_21_0533
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0534 : Poly :=
[
  term ((-46941632816 : Rat) / 7401317245) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 534 for generator 21. -/
def ep_Q2_002_partial_21_0534 : Poly :=
[
  term ((-93883265632 : Rat) / 7401317245) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((46941632816 : Rat) / 7401317245) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 21. -/
theorem ep_Q2_002_partial_21_0534_valid :
    mulPoly ep_Q2_002_coefficient_21_0534
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0535 : Poly :=
[
  term ((-62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(6, 1), (12, 1), (13, 2)]
]

/-- Partial product 535 for generator 21. -/
def ep_Q2_002_partial_21_0535 : Poly :=
[
  term ((-124033177824554903377887272307456 : Rat) / 1273790490336191187829975377157) [(6, 1), (10, 1), (12, 1), (13, 2)],
  term ((62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(6, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 21. -/
theorem ep_Q2_002_partial_21_0535_valid :
    mulPoly ep_Q2_002_coefficient_21_0535
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0536 : Poly :=
[
  term ((905823491820936995178503781486714018949392 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (12, 1), (15, 2)]
]

/-- Partial product 536 for generator 21. -/
def ep_Q2_002_partial_21_0536 : Poly :=
[
  term ((1811646983641873990357007562973428037898784 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (10, 1), (12, 1), (15, 2)],
  term ((-905823491820936995178503781486714018949392 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 21. -/
theorem ep_Q2_002_partial_21_0536_valid :
    mulPoly ep_Q2_002_coefficient_21_0536
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0537 : Poly :=
[
  term ((40787556556 : Rat) / 7401317245) [(6, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 537 for generator 21. -/
def ep_Q2_002_partial_21_0537 : Poly :=
[
  term ((81575113112 : Rat) / 7401317245) [(6, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-40787556556 : Rat) / 7401317245) [(6, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 21. -/
theorem ep_Q2_002_partial_21_0537_valid :
    mulPoly ep_Q2_002_coefficient_21_0537
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0538 : Poly :=
[
  term ((-523748906684113098936549105011982448818408 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 538 for generator 21. -/
def ep_Q2_002_partial_21_0538 : Poly :=
[
  term ((-1047497813368226197873098210023964897636816 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (10, 1), (13, 1), (15, 1)],
  term ((523748906684113098936549105011982448818408 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 21. -/
theorem ep_Q2_002_partial_21_0538_valid :
    mulPoly ep_Q2_002_coefficient_21_0538
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0539 : Poly :=
[
  term ((-82310855274 : Rat) / 7401317245) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 539 for generator 21. -/
def ep_Q2_002_partial_21_0539 : Poly :=
[
  term ((-164621710548 : Rat) / 7401317245) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((82310855274 : Rat) / 7401317245) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 21. -/
theorem ep_Q2_002_partial_21_0539_valid :
    mulPoly ep_Q2_002_coefficient_21_0539
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0540 : Poly :=
[
  term ((-15694474911714017080916088522240 : Rat) / 97983883872014706756151952089) [(6, 1), (13, 2)]
]

/-- Partial product 540 for generator 21. -/
def ep_Q2_002_partial_21_0540 : Poly :=
[
  term ((-31388949823428034161832177044480 : Rat) / 97983883872014706756151952089) [(6, 1), (10, 1), (13, 2)],
  term ((15694474911714017080916088522240 : Rat) / 97983883872014706756151952089) [(6, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 21. -/
theorem ep_Q2_002_partial_21_0540_valid :
    mulPoly ep_Q2_002_coefficient_21_0540
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0541 : Poly :=
[
  term ((23374496974993223744746739581344 : Rat) / 268063527727966972480841957465) [(6, 1), (15, 2)]
]

/-- Partial product 541 for generator 21. -/
def ep_Q2_002_partial_21_0541 : Poly :=
[
  term ((46748993949986447489493479162688 : Rat) / 268063527727966972480841957465) [(6, 1), (10, 1), (15, 2)],
  term ((-23374496974993223744746739581344 : Rat) / 268063527727966972480841957465) [(6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 21. -/
theorem ep_Q2_002_partial_21_0541_valid :
    mulPoly ep_Q2_002_coefficient_21_0541
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0542 : Poly :=
[
  term ((3137110936 : Rat) / 7401317245) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 542 for generator 21. -/
def ep_Q2_002_partial_21_0542 : Poly :=
[
  term ((6274221872 : Rat) / 7401317245) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3137110936 : Rat) / 7401317245) [(6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 21. -/
theorem ep_Q2_002_partial_21_0542_valid :
    mulPoly ep_Q2_002_coefficient_21_0542
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0543 : Poly :=
[
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (10, 1), (11, 1)]
]

/-- Partial product 543 for generator 21. -/
def ep_Q2_002_partial_21_0543 : Poly :=
[
  term ((4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((-9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (10, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 21. -/
theorem ep_Q2_002_partial_21_0543_valid :
    mulPoly ep_Q2_002_coefficient_21_0543
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0544 : Poly :=
[
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (10, 1), (13, 1)]
]

/-- Partial product 544 for generator 21. -/
def ep_Q2_002_partial_21_0544 : Poly :=
[
  term ((-8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 21. -/
theorem ep_Q2_002_partial_21_0544_valid :
    mulPoly ep_Q2_002_coefficient_21_0544
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0545 : Poly :=
[
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 545 for generator 21. -/
def ep_Q2_002_partial_21_0545 : Poly :=
[
  term ((-80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 21. -/
theorem ep_Q2_002_partial_21_0545_valid :
    mulPoly ep_Q2_002_coefficient_21_0545
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0546 : Poly :=
[
  term ((5271014764 : Rat) / 7401317245) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 546 for generator 21. -/
def ep_Q2_002_partial_21_0546 : Poly :=
[
  term ((-5271014764 : Rat) / 7401317245) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((10542029528 : Rat) / 7401317245) [(7, 1), (8, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 21. -/
theorem ep_Q2_002_partial_21_0546_valid :
    mulPoly ep_Q2_002_coefficient_21_0546
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0547 : Poly :=
[
  term ((-6913647426678913438918456489272 : Rat) / 97983883872014706756151952089) [(7, 1), (8, 1), (11, 1)]
]

/-- Partial product 547 for generator 21. -/
def ep_Q2_002_partial_21_0547 : Poly :=
[
  term ((-13827294853357826877836912978544 : Rat) / 97983883872014706756151952089) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((6913647426678913438918456489272 : Rat) / 97983883872014706756151952089) [(7, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 21. -/
theorem ep_Q2_002_partial_21_0547_valid :
    mulPoly ep_Q2_002_coefficient_21_0547
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0548 : Poly :=
[
  term ((1323019806824696495136083217504 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (11, 1), (12, 1)]
]

/-- Partial product 548 for generator 21. -/
def ep_Q2_002_partial_21_0548 : Poly :=
[
  term ((2646039613649392990272166435008 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((-1323019806824696495136083217504 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 21. -/
theorem ep_Q2_002_partial_21_0548_valid :
    mulPoly ep_Q2_002_coefficient_21_0548
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0549 : Poly :=
[
  term ((-2491494060553620688854256042368 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 549 for generator 21. -/
def ep_Q2_002_partial_21_0549 : Poly :=
[
  term ((-4982988121107241377708512084736 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((2491494060553620688854256042368 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 21. -/
theorem ep_Q2_002_partial_21_0549_valid :
    mulPoly ep_Q2_002_coefficient_21_0549
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0550 : Poly :=
[
  term ((50923991106680379541655135603658572910384 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 550 for generator 21. -/
def ep_Q2_002_partial_21_0550 : Poly :=
[
  term ((101847982213360759083310271207317145820768 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-50923991106680379541655135603658572910384 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 21. -/
theorem ep_Q2_002_partial_21_0550_valid :
    mulPoly ep_Q2_002_coefficient_21_0550
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0551 : Poly :=
[
  term ((-105612228228 : Rat) / 7401317245) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 551 for generator 21. -/
def ep_Q2_002_partial_21_0551 : Poly :=
[
  term ((-211224456456 : Rat) / 7401317245) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((105612228228 : Rat) / 7401317245) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 21. -/
theorem ep_Q2_002_partial_21_0551_valid :
    mulPoly ep_Q2_002_coefficient_21_0551
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0552 : Poly :=
[
  term ((13019692835645305193464266189024 : Rat) / 97983883872014706756151952089) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 552 for generator 21. -/
def ep_Q2_002_partial_21_0552 : Poly :=
[
  term ((26039385671290610386928532378048 : Rat) / 97983883872014706756151952089) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-13019692835645305193464266189024 : Rat) / 97983883872014706756151952089) [(7, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 21. -/
theorem ep_Q2_002_partial_21_0552_valid :
    mulPoly ep_Q2_002_coefficient_21_0552
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0553 : Poly :=
[
  term ((-275467624063396299448129744186524523924392 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 553 for generator 21. -/
def ep_Q2_002_partial_21_0553 : Poly :=
[
  term ((-550935248126792598896259488373049047848784 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((275467624063396299448129744186524523924392 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 21. -/
theorem ep_Q2_002_partial_21_0553_valid :
    mulPoly ep_Q2_002_coefficient_21_0553
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0554 : Poly :=
[
  term ((49950956164 : Rat) / 7401317245) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 554 for generator 21. -/
def ep_Q2_002_partial_21_0554 : Poly :=
[
  term ((99901912328 : Rat) / 7401317245) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-49950956164 : Rat) / 7401317245) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 21. -/
theorem ep_Q2_002_partial_21_0554_valid :
    mulPoly ep_Q2_002_coefficient_21_0554
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0555 : Poly :=
[
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 555 for generator 21. -/
def ep_Q2_002_partial_21_0555 : Poly :=
[
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (10, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 21. -/
theorem ep_Q2_002_partial_21_0555_valid :
    mulPoly ep_Q2_002_coefficient_21_0555
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0556 : Poly :=
[
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 556 for generator 21. -/
def ep_Q2_002_partial_21_0556 : Poly :=
[
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 21. -/
theorem ep_Q2_002_partial_21_0556_valid :
    mulPoly ep_Q2_002_coefficient_21_0556
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0557 : Poly :=
[
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (9, 1), (10, 1), (15, 2)]
]

/-- Partial product 557 for generator 21. -/
def ep_Q2_002_partial_21_0557 : Poly :=
[
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (9, 1), (10, 1), (15, 2)],
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (9, 1), (10, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 21. -/
theorem ep_Q2_002_partial_21_0557_valid :
    mulPoly ep_Q2_002_coefficient_21_0557
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0558 : Poly :=
[
  term ((-32504690856 : Rat) / 7401317245) [(7, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 558 for generator 21. -/
def ep_Q2_002_partial_21_0558 : Poly :=
[
  term ((32504690856 : Rat) / 7401317245) [(7, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-65009381712 : Rat) / 7401317245) [(7, 1), (9, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 21. -/
theorem ep_Q2_002_partial_21_0558_valid :
    mulPoly ep_Q2_002_coefficient_21_0558
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0559 : Poly :=
[
  term ((18878713661048488944812839076976 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 559 for generator 21. -/
def ep_Q2_002_partial_21_0559 : Poly :=
[
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-18878713661048488944812839076976 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 21. -/
theorem ep_Q2_002_partial_21_0559_valid :
    mulPoly ep_Q2_002_coefficient_21_0559
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0560 : Poly :=
[
  term ((-35552153274472652784829400889792 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 560 for generator 21. -/
def ep_Q2_002_partial_21_0560 : Poly :=
[
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((35552153274472652784829400889792 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 21. -/
theorem ep_Q2_002_partial_21_0560_valid :
    mulPoly ep_Q2_002_coefficient_21_0560
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0561 : Poly :=
[
  term ((-152721886121637856685206189631109662880096 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (9, 1), (15, 2)]
]

/-- Partial product 561 for generator 21. -/
def ep_Q2_002_partial_21_0561 : Poly :=
[
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (9, 1), (10, 1), (15, 2)],
  term ((152721886121637856685206189631109662880096 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 21. -/
theorem ep_Q2_002_partial_21_0561_valid :
    mulPoly ep_Q2_002_coefficient_21_0561
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0562 : Poly :=
[
  term ((-16252345428 : Rat) / 7401317245) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 562 for generator 21. -/
def ep_Q2_002_partial_21_0562 : Poly :=
[
  term ((-32504690856 : Rat) / 7401317245) [(7, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((16252345428 : Rat) / 7401317245) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 21. -/
theorem ep_Q2_002_partial_21_0562_valid :
    mulPoly ep_Q2_002_coefficient_21_0562
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0563 : Poly :=
[
  term ((7904862845782590770519069654910 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 563 for generator 21. -/
def ep_Q2_002_partial_21_0563 : Poly :=
[
  term ((-7904862845782590770519069654910 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 1), (11, 1)],
  term ((15809725691565181541038139309820 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 21. -/
theorem ep_Q2_002_partial_21_0563_valid :
    mulPoly ep_Q2_002_coefficient_21_0563
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0564 : Poly :=
[
  term ((7422478788500030629755678873240 : Rat) / 115799135485108289802725034287) [(7, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 564 for generator 21. -/
def ep_Q2_002_partial_21_0564 : Poly :=
[
  term ((-7422478788500030629755678873240 : Rat) / 115799135485108289802725034287) [(7, 1), (10, 1), (11, 1), (12, 1)],
  term ((14844957577000061259511357746480 : Rat) / 115799135485108289802725034287) [(7, 1), (10, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 21. -/
theorem ep_Q2_002_partial_21_0564_valid :
    mulPoly ep_Q2_002_coefficient_21_0564
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0565 : Poly :=
[
  term ((-15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 565 for generator 21. -/
def ep_Q2_002_partial_21_0565 : Poly :=
[
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 1), (11, 1), (15, 2)],
  term ((-30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 21. -/
theorem ep_Q2_002_partial_21_0565_valid :
    mulPoly ep_Q2_002_coefficient_21_0565
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0566 : Poly :=
[
  term ((-13977917579720284857514417258080 : Rat) / 115799135485108289802725034287) [(7, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 566 for generator 21. -/
def ep_Q2_002_partial_21_0566 : Poly :=
[
  term ((13977917579720284857514417258080 : Rat) / 115799135485108289802725034287) [(7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-27955835159440569715028834516160 : Rat) / 115799135485108289802725034287) [(7, 1), (10, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 21. -/
theorem ep_Q2_002_partial_21_0566_valid :
    mulPoly ep_Q2_002_coefficient_21_0566
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0567 : Poly :=
[
  term ((-14277502368561180275336205832319812890612 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 567 for generator 21. -/
def ep_Q2_002_partial_21_0567 : Poly :=
[
  term ((14277502368561180275336205832319812890612 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-28555004737122360550672411664639625781224 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (10, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 21. -/
theorem ep_Q2_002_partial_21_0567_valid :
    mulPoly ep_Q2_002_coefficient_21_0567
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0568 : Poly :=
[
  term ((-57460789101 : Rat) / 7401317245) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 568 for generator 21. -/
def ep_Q2_002_partial_21_0568 : Poly :=
[
  term ((57460789101 : Rat) / 7401317245) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-114921578202 : Rat) / 7401317245) [(7, 1), (10, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 21. -/
theorem ep_Q2_002_partial_21_0568_valid :
    mulPoly ep_Q2_002_coefficient_21_0568
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0569 : Poly :=
[
  term ((-17574038019280759474047481756200 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 1), (13, 1)]
]

/-- Partial product 569 for generator 21. -/
def ep_Q2_002_partial_21_0569 : Poly :=
[
  term ((17574038019280759474047481756200 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 1), (13, 1)],
  term ((-35148076038561518948094963512400 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 21. -/
theorem ep_Q2_002_partial_21_0569_valid :
    mulPoly ep_Q2_002_coefficient_21_0569
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0570 : Poly :=
[
  term ((28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 570 for generator 21. -/
def ep_Q2_002_partial_21_0570 : Poly :=
[
  term ((-28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 1), (13, 1), (15, 2)],
  term ((56805481990332207609573858088320 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 21. -/
theorem ep_Q2_002_partial_21_0570_valid :
    mulPoly ep_Q2_002_coefficient_21_0570
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0570 := by
  native_decide

/-- Coefficient term 571 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0571 : Poly :=
[
  term ((-491933471112142098613164707972865402076303 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 571 for generator 21. -/
def ep_Q2_002_partial_21_0571 : Poly :=
[
  term ((491933471112142098613164707972865402076303 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (10, 1), (15, 1)],
  term ((-983866942224284197226329415945730804152606 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 571 for generator 21. -/
theorem ep_Q2_002_partial_21_0571_valid :
    mulPoly ep_Q2_002_coefficient_21_0571
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0571 := by
  native_decide

/-- Coefficient term 572 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0572 : Poly :=
[
  term ((-235900555763 : Rat) / 88815806940) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 572 for generator 21. -/
def ep_Q2_002_partial_21_0572 : Poly :=
[
  term ((235900555763 : Rat) / 88815806940) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-235900555763 : Rat) / 44407903470) [(7, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 572 for generator 21. -/
theorem ep_Q2_002_partial_21_0572_valid :
    mulPoly ep_Q2_002_coefficient_21_0572
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0572 := by
  native_decide

/-- Coefficient term 573 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0573 : Poly :=
[
  term ((1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (10, 1), (15, 3)]
]

/-- Partial product 573 for generator 21. -/
def ep_Q2_002_partial_21_0573 : Poly :=
[
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (10, 1), (15, 3)],
  term ((3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (10, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 573 for generator 21. -/
theorem ep_Q2_002_partial_21_0573_valid :
    mulPoly ep_Q2_002_coefficient_21_0573
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0573 := by
  native_decide

/-- Coefficient term 574 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0574 : Poly :=
[
  term ((158475703364 : Rat) / 22203951735) [(7, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 574 for generator 21. -/
def ep_Q2_002_partial_21_0574 : Poly :=
[
  term ((-158475703364 : Rat) / 22203951735) [(7, 1), (10, 1), (15, 3), (16, 1)],
  term ((316951406728 : Rat) / 22203951735) [(7, 1), (10, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 574 for generator 21. -/
theorem ep_Q2_002_partial_21_0574_valid :
    mulPoly ep_Q2_002_coefficient_21_0574
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0574 := by
  native_decide

/-- Coefficient term 575 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0575 : Poly :=
[
  term ((3952431422891295385259534827455 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1)]
]

/-- Partial product 575 for generator 21. -/
def ep_Q2_002_partial_21_0575 : Poly :=
[
  term ((7904862845782590770519069654910 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 1), (11, 1)],
  term ((-3952431422891295385259534827455 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 575 for generator 21. -/
theorem ep_Q2_002_partial_21_0575_valid :
    mulPoly ep_Q2_002_coefficient_21_0575
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0575 := by
  native_decide

/-- Coefficient term 576 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0576 : Poly :=
[
  term ((-35513897964966174341267038164204 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 576 for generator 21. -/
def ep_Q2_002_partial_21_0576 : Poly :=
[
  term ((-71027795929932348682534076328408 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 1), (11, 1), (12, 1)],
  term ((35513897964966174341267038164204 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 576 for generator 21. -/
theorem ep_Q2_002_partial_21_0576_valid :
    mulPoly ep_Q2_002_coefficient_21_0576
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0576 := by
  native_decide

/-- Coefficient term 577 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0577 : Poly :=
[
  term ((-32931716266831577043027294559584 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 2)]
]

/-- Partial product 577 for generator 21. -/
def ep_Q2_002_partial_21_0577 : Poly :=
[
  term ((-65863432533663154086054589119168 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 1), (11, 1), (12, 2)],
  term ((32931716266831577043027294559584 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 577 for generator 21. -/
theorem ep_Q2_002_partial_21_0577_valid :
    mulPoly ep_Q2_002_coefficient_21_0577
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0577 := by
  native_decide

/-- Coefficient term 578 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0578 : Poly :=
[
  term ((-7541135557908311693894114865240 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (15, 2)]
]

/-- Partial product 578 for generator 21. -/
def ep_Q2_002_partial_21_0578 : Poly :=
[
  term ((-15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 1), (11, 1), (15, 2)],
  term ((7541135557908311693894114865240 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 578 for generator 21. -/
theorem ep_Q2_002_partial_21_0578_valid :
    mulPoly ep_Q2_002_coefficient_21_0578
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0578 := by
  native_decide

/-- Coefficient term 579 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0579 : Poly :=
[
  term ((71940764787845610815723941730928 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 579 for generator 21. -/
def ep_Q2_002_partial_21_0579 : Poly :=
[
  term ((143881529575691221631447883461856 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-71940764787845610815723941730928 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 579 for generator 21. -/
theorem ep_Q2_002_partial_21_0579_valid :
    mulPoly ep_Q2_002_coefficient_21_0579
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0579 := by
  native_decide

/-- Coefficient term 580 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0580 : Poly :=
[
  term ((21007552775162842169966360066828909563866 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 580 for generator 21. -/
def ep_Q2_002_partial_21_0580 : Poly :=
[
  term ((42015105550325684339932720133657819127732 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-21007552775162842169966360066828909563866 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 580 for generator 21. -/
theorem ep_Q2_002_partial_21_0580_valid :
    mulPoly ep_Q2_002_coefficient_21_0580
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0580 := by
  native_decide

/-- Coefficient term 581 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0581 : Poly :=
[
  term ((46329459831 : Rat) / 14802634490) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 581 for generator 21. -/
def ep_Q2_002_partial_21_0581 : Poly :=
[
  term ((46329459831 : Rat) / 7401317245) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-46329459831 : Rat) / 14802634490) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 581 for generator 21. -/
theorem ep_Q2_002_partial_21_0581_valid :
    mulPoly ep_Q2_002_coefficient_21_0581
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0581 := by
  native_decide

/-- Coefficient term 582 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0582 : Poly :=
[
  term ((62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 2), (13, 1)]
]

/-- Partial product 582 for generator 21. -/
def ep_Q2_002_partial_21_0582 : Poly :=
[
  term ((124033177824554903377887272307456 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 1), (12, 2), (13, 1)],
  term ((-62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 582 for generator 21. -/
theorem ep_Q2_002_partial_21_0582_valid :
    mulPoly ep_Q2_002_coefficient_21_0582
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0582 := by
  native_decide

/-- Coefficient term 583 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0583 : Poly :=
[
  term ((921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 2), (15, 1)]
]

/-- Partial product 583 for generator 21. -/
def ep_Q2_002_partial_21_0583 : Poly :=
[
  term ((1843559191810834587817249493329108093957824 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (10, 1), (12, 2), (15, 1)],
  term ((-921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 583 for generator 21. -/
theorem ep_Q2_002_partial_21_0583_valid :
    mulPoly ep_Q2_002_coefficient_21_0583
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0583 := by
  native_decide

/-- Coefficient term 584 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0584 : Poly :=
[
  term ((46941632816 : Rat) / 7401317245) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 584 for generator 21. -/
def ep_Q2_002_partial_21_0584 : Poly :=
[
  term ((93883265632 : Rat) / 7401317245) [(7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-46941632816 : Rat) / 7401317245) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 584 for generator 21. -/
theorem ep_Q2_002_partial_21_0584_valid :
    mulPoly ep_Q2_002_coefficient_21_0584
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0584 := by
  native_decide

/-- Coefficient term 585 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0585 : Poly :=
[
  term ((-8787019009640379737023740878100 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1)]
]

/-- Partial product 585 for generator 21. -/
def ep_Q2_002_partial_21_0585 : Poly :=
[
  term ((-17574038019280759474047481756200 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 1), (13, 1)],
  term ((8787019009640379737023740878100 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 585 for generator 21. -/
theorem ep_Q2_002_partial_21_0585_valid :
    mulPoly ep_Q2_002_coefficient_21_0585
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0585 := by
  native_decide

/-- Coefficient term 586 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0586 : Poly :=
[
  term ((14201370497583051902393464522080 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 586 for generator 21. -/
def ep_Q2_002_partial_21_0586 : Poly :=
[
  term ((28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 1), (13, 1), (15, 2)],
  term ((-14201370497583051902393464522080 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 586 for generator 21. -/
theorem ep_Q2_002_partial_21_0586_valid :
    mulPoly ep_Q2_002_coefficient_21_0586
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0586 := by
  native_decide

/-- Coefficient term 587 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0587 : Poly :=
[
  term ((-491933471112142098613164707972865402076303 : Rat) / 2693636435040645053172294539107852334990) [(7, 1), (15, 1)]
]

/-- Partial product 587 for generator 21. -/
def ep_Q2_002_partial_21_0587 : Poly :=
[
  term ((-491933471112142098613164707972865402076303 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (10, 1), (15, 1)],
  term ((491933471112142098613164707972865402076303 : Rat) / 2693636435040645053172294539107852334990) [(7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 587 for generator 21. -/
theorem ep_Q2_002_partial_21_0587_valid :
    mulPoly ep_Q2_002_coefficient_21_0587
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0587 := by
  native_decide

/-- Coefficient term 588 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0588 : Poly :=
[
  term ((-235900555763 : Rat) / 177631613880) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 588 for generator 21. -/
def ep_Q2_002_partial_21_0588 : Poly :=
[
  term ((-235900555763 : Rat) / 88815806940) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((235900555763 : Rat) / 177631613880) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 588 for generator 21. -/
theorem ep_Q2_002_partial_21_0588_valid :
    mulPoly ep_Q2_002_coefficient_21_0588
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0588 := by
  native_decide

/-- Coefficient term 589 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0589 : Poly :=
[
  term ((805609802875682775348978966241272190695888 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (15, 3)]
]

/-- Partial product 589 for generator 21. -/
def ep_Q2_002_partial_21_0589 : Poly :=
[
  term ((1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (10, 1), (15, 3)],
  term ((-805609802875682775348978966241272190695888 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 589 for generator 21. -/
theorem ep_Q2_002_partial_21_0589_valid :
    mulPoly ep_Q2_002_coefficient_21_0589
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0589 := by
  native_decide

/-- Coefficient term 590 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0590 : Poly :=
[
  term ((79237851682 : Rat) / 22203951735) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 590 for generator 21. -/
def ep_Q2_002_partial_21_0590 : Poly :=
[
  term ((158475703364 : Rat) / 22203951735) [(7, 1), (10, 1), (15, 3), (16, 1)],
  term ((-79237851682 : Rat) / 22203951735) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 590 for generator 21. -/
theorem ep_Q2_002_partial_21_0590_valid :
    mulPoly ep_Q2_002_coefficient_21_0590
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0590 := by
  native_decide

/-- Coefficient term 591 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0591 : Poly :=
[
  term ((178315227564228987120 : Rat) / 253528477699481291099) [(7, 2)]
]

/-- Partial product 591 for generator 21. -/
def ep_Q2_002_partial_21_0591 : Poly :=
[
  term ((-178315227564228987120 : Rat) / 253528477699481291099) [(7, 2)],
  term ((356630455128457974240 : Rat) / 253528477699481291099) [(7, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 591 for generator 21. -/
theorem ep_Q2_002_partial_21_0591_valid :
    mulPoly ep_Q2_002_coefficient_21_0591
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0591 := by
  native_decide

/-- Coefficient term 592 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0592 : Poly :=
[
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 592 for generator 21. -/
def ep_Q2_002_partial_21_0592 : Poly :=
[
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (10, 1), (11, 1)],
  term ((-226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (10, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 592 for generator 21. -/
theorem ep_Q2_002_partial_21_0592_valid :
    mulPoly ep_Q2_002_coefficient_21_0592
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0592 := by
  native_decide

/-- Coefficient term 593 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0593 : Poly :=
[
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 593 for generator 21. -/
def ep_Q2_002_partial_21_0593 : Poly :=
[
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (10, 1), (13, 1)],
  term ((426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 593 for generator 21. -/
theorem ep_Q2_002_partial_21_0593_valid :
    mulPoly ep_Q2_002_coefficient_21_0593
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0593 := by
  native_decide

/-- Coefficient term 594 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0594 : Poly :=
[
  term ((916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 594 for generator 21. -/
def ep_Q2_002_partial_21_0594 : Poly :=
[
  term ((-916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (9, 1), (10, 1), (15, 1)],
  term ((1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (9, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 594 for generator 21. -/
theorem ep_Q2_002_partial_21_0594_valid :
    mulPoly ep_Q2_002_coefficient_21_0594
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0594 := by
  native_decide

/-- Coefficient term 595 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0595 : Poly :=
[
  term ((97514072568 : Rat) / 7401317245) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 595 for generator 21. -/
def ep_Q2_002_partial_21_0595 : Poly :=
[
  term ((-97514072568 : Rat) / 7401317245) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((195028145136 : Rat) / 7401317245) [(7, 2), (9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 595 for generator 21. -/
theorem ep_Q2_002_partial_21_0595_valid :
    mulPoly ep_Q2_002_coefficient_21_0595
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0595 := by
  native_decide

/-- Coefficient term 596 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0596 : Poly :=
[
  term ((-56636140983145466834438517230928 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (11, 1)]
]

/-- Partial product 596 for generator 21. -/
def ep_Q2_002_partial_21_0596 : Poly :=
[
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (10, 1), (11, 1)],
  term ((56636140983145466834438517230928 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 596 for generator 21. -/
theorem ep_Q2_002_partial_21_0596_valid :
    mulPoly ep_Q2_002_coefficient_21_0596
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0596 := by
  native_decide

/-- Coefficient term 597 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0597 : Poly :=
[
  term ((106656459823417958354488202669376 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (13, 1)]
]

/-- Partial product 597 for generator 21. -/
def ep_Q2_002_partial_21_0597 : Poly :=
[
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (10, 1), (13, 1)],
  term ((-106656459823417958354488202669376 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 597 for generator 21. -/
theorem ep_Q2_002_partial_21_0597_valid :
    mulPoly ep_Q2_002_coefficient_21_0597
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0597 := by
  native_decide

/-- Coefficient term 598 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0598 : Poly :=
[
  term ((458165658364913570055618568893328988640288 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (9, 1), (15, 1)]
]

/-- Partial product 598 for generator 21. -/
def ep_Q2_002_partial_21_0598 : Poly :=
[
  term ((916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (9, 1), (10, 1), (15, 1)],
  term ((-458165658364913570055618568893328988640288 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 598 for generator 21. -/
theorem ep_Q2_002_partial_21_0598_valid :
    mulPoly ep_Q2_002_coefficient_21_0598
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0598 := by
  native_decide

/-- Coefficient term 599 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0599 : Poly :=
[
  term ((48757036284 : Rat) / 7401317245) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 599 for generator 21. -/
def ep_Q2_002_partial_21_0599 : Poly :=
[
  term ((97514072568 : Rat) / 7401317245) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-48757036284 : Rat) / 7401317245) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 599 for generator 21. -/
theorem ep_Q2_002_partial_21_0599_valid :
    mulPoly ep_Q2_002_coefficient_21_0599
        ep_Q2_002_generator_21_0500_0599 =
      ep_Q2_002_partial_21_0599 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_21_0500_0599 : List Poly :=
[
  ep_Q2_002_partial_21_0500,
  ep_Q2_002_partial_21_0501,
  ep_Q2_002_partial_21_0502,
  ep_Q2_002_partial_21_0503,
  ep_Q2_002_partial_21_0504,
  ep_Q2_002_partial_21_0505,
  ep_Q2_002_partial_21_0506,
  ep_Q2_002_partial_21_0507,
  ep_Q2_002_partial_21_0508,
  ep_Q2_002_partial_21_0509,
  ep_Q2_002_partial_21_0510,
  ep_Q2_002_partial_21_0511,
  ep_Q2_002_partial_21_0512,
  ep_Q2_002_partial_21_0513,
  ep_Q2_002_partial_21_0514,
  ep_Q2_002_partial_21_0515,
  ep_Q2_002_partial_21_0516,
  ep_Q2_002_partial_21_0517,
  ep_Q2_002_partial_21_0518,
  ep_Q2_002_partial_21_0519,
  ep_Q2_002_partial_21_0520,
  ep_Q2_002_partial_21_0521,
  ep_Q2_002_partial_21_0522,
  ep_Q2_002_partial_21_0523,
  ep_Q2_002_partial_21_0524,
  ep_Q2_002_partial_21_0525,
  ep_Q2_002_partial_21_0526,
  ep_Q2_002_partial_21_0527,
  ep_Q2_002_partial_21_0528,
  ep_Q2_002_partial_21_0529,
  ep_Q2_002_partial_21_0530,
  ep_Q2_002_partial_21_0531,
  ep_Q2_002_partial_21_0532,
  ep_Q2_002_partial_21_0533,
  ep_Q2_002_partial_21_0534,
  ep_Q2_002_partial_21_0535,
  ep_Q2_002_partial_21_0536,
  ep_Q2_002_partial_21_0537,
  ep_Q2_002_partial_21_0538,
  ep_Q2_002_partial_21_0539,
  ep_Q2_002_partial_21_0540,
  ep_Q2_002_partial_21_0541,
  ep_Q2_002_partial_21_0542,
  ep_Q2_002_partial_21_0543,
  ep_Q2_002_partial_21_0544,
  ep_Q2_002_partial_21_0545,
  ep_Q2_002_partial_21_0546,
  ep_Q2_002_partial_21_0547,
  ep_Q2_002_partial_21_0548,
  ep_Q2_002_partial_21_0549,
  ep_Q2_002_partial_21_0550,
  ep_Q2_002_partial_21_0551,
  ep_Q2_002_partial_21_0552,
  ep_Q2_002_partial_21_0553,
  ep_Q2_002_partial_21_0554,
  ep_Q2_002_partial_21_0555,
  ep_Q2_002_partial_21_0556,
  ep_Q2_002_partial_21_0557,
  ep_Q2_002_partial_21_0558,
  ep_Q2_002_partial_21_0559,
  ep_Q2_002_partial_21_0560,
  ep_Q2_002_partial_21_0561,
  ep_Q2_002_partial_21_0562,
  ep_Q2_002_partial_21_0563,
  ep_Q2_002_partial_21_0564,
  ep_Q2_002_partial_21_0565,
  ep_Q2_002_partial_21_0566,
  ep_Q2_002_partial_21_0567,
  ep_Q2_002_partial_21_0568,
  ep_Q2_002_partial_21_0569,
  ep_Q2_002_partial_21_0570,
  ep_Q2_002_partial_21_0571,
  ep_Q2_002_partial_21_0572,
  ep_Q2_002_partial_21_0573,
  ep_Q2_002_partial_21_0574,
  ep_Q2_002_partial_21_0575,
  ep_Q2_002_partial_21_0576,
  ep_Q2_002_partial_21_0577,
  ep_Q2_002_partial_21_0578,
  ep_Q2_002_partial_21_0579,
  ep_Q2_002_partial_21_0580,
  ep_Q2_002_partial_21_0581,
  ep_Q2_002_partial_21_0582,
  ep_Q2_002_partial_21_0583,
  ep_Q2_002_partial_21_0584,
  ep_Q2_002_partial_21_0585,
  ep_Q2_002_partial_21_0586,
  ep_Q2_002_partial_21_0587,
  ep_Q2_002_partial_21_0588,
  ep_Q2_002_partial_21_0589,
  ep_Q2_002_partial_21_0590,
  ep_Q2_002_partial_21_0591,
  ep_Q2_002_partial_21_0592,
  ep_Q2_002_partial_21_0593,
  ep_Q2_002_partial_21_0594,
  ep_Q2_002_partial_21_0595,
  ep_Q2_002_partial_21_0596,
  ep_Q2_002_partial_21_0597,
  ep_Q2_002_partial_21_0598,
  ep_Q2_002_partial_21_0599
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_21_0500_0599 : Poly :=
[
  term ((-176342490026 : Rat) / 7401317245) [(6, 1), (7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 2), (10, 1), (11, 2)],
  term ((88171245013 : Rat) / 7401317245) [(6, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 2), (11, 2)],
  term ((-396164181093946026917661507951936 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-10542029528 : Rat) / 7401317245) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (10, 1), (11, 2)],
  term ((-101847982213360759083310271207317145820768 : Rat) / 122438019774574775144195206323084197045) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((211224456456 : Rat) / 7401317245) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((4982988121107241377708512084736 : Rat) / 8907625806546791523286541099) [(6, 1), (8, 1), (10, 1), (13, 2)],
  term ((198082090546973013458830753975968 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (11, 1), (13, 1)],
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (8, 1), (11, 1), (15, 1)],
  term ((5271014764 : Rat) / 7401317245) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (11, 2)],
  term ((50923991106680379541655135603658572910384 : Rat) / 122438019774574775144195206323084197045) [(6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-105612228228 : Rat) / 7401317245) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2491494060553620688854256042368 : Rat) / 8907625806546791523286541099) [(6, 1), (8, 1), (13, 2)],
  term ((175033975904267429635763464873584 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (10, 1), (11, 1)],
  term ((142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((65009381712 : Rat) / 7401317245) [(6, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-329621755555736520375700067041728 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (10, 1), (13, 1)],
  term ((631910518210957315269836084822201506371552 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (9, 1), (10, 1), (15, 1)],
  term ((-13518699652 : Rat) / 1057331035) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-87516987952133714817881732436792 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1)],
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (9, 1), (11, 1), (15, 2)],
  term ((-32504690856 : Rat) / 7401317245) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term ((164810877777868260187850033520864 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (13, 1)],
  term ((-315955259105478657634918042411100753185776 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (9, 1), (15, 1)],
  term ((6759349826 : Rat) / 1057331035) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((594213068791409599030795425351936 : Rat) / 1273790490336191187829975377157) [(6, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((1969177017914699160548254823896365810578808 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((236584501434 : Rat) / 7401317245) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((187823138641994204557941507446448 : Rat) / 1273790490336191187829975377157) [(6, 1), (10, 1), (11, 1), (13, 1)],
  term ((-56805481990332207609573858088320 : Rat) / 1273790490336191187829975377157) [(6, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((983866942224284197226329415945730804152606 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (10, 1), (11, 1), (15, 1)],
  term ((235900555763 : Rat) / 44407903470) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (10, 1), (11, 1), (15, 3)],
  term ((-316951406728 : Rat) / 22203951735) [(6, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-15809725691565181541038139309820 : Rat) / 1273790490336191187829975377157) [(6, 1), (10, 1), (11, 2)],
  term ((-280561388752537411832754738658704 : Rat) / 1273790490336191187829975377157) [(6, 1), (10, 1), (11, 2), (12, 1)],
  term ((30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(6, 1), (10, 1), (11, 2), (15, 2)],
  term ((-1743457325109803996962474839627231477914304 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-93883265632 : Rat) / 7401317245) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-124033177824554903377887272307456 : Rat) / 1273790490336191187829975377157) [(6, 1), (10, 1), (12, 1), (13, 2)],
  term ((1811646983641873990357007562973428037898784 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (10, 1), (12, 1), (15, 2)],
  term ((81575113112 : Rat) / 7401317245) [(6, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-193384052407621481504452912732775851950864 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (10, 1), (13, 1), (15, 1)],
  term ((-103790248932 : Rat) / 7401317245) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-22895278688662642697238959484672 : Rat) / 97983883872014706756151952089) [(6, 1), (10, 1), (13, 2)],
  term ((46748993949986447489493479162688 : Rat) / 268063527727966972480841957465) [(6, 1), (10, 1), (15, 2)],
  term ((6274221872 : Rat) / 7401317245) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((9020527338887441382933061803648 : Rat) / 97983883872014706756151952089) [(6, 1), (10, 2), (11, 1), (13, 1)],
  term ((-1708227521921209432737290594582378091371904 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (10, 2), (13, 1), (15, 1)],
  term ((-121662923232 : Rat) / 7401317245) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16987342269530782929186435119616 : Rat) / 97983883872014706756151952089) [(6, 1), (10, 2), (13, 2)],
  term ((-297106534395704799515397712675968 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-984588508957349580274127411948182905289404 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-118292250717 : Rat) / 7401317245) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-123228283172381286773503204585080 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1)],
  term ((28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1), (15, 2)],
  term ((-491933471112142098613164707972865402076303 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (15, 1)],
  term ((-235900555763 : Rat) / 88815806940) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (15, 3)],
  term ((158475703364 : Rat) / 22203951735) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((7904862845782590770519069654910 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2)],
  term ((140280694376268705916377369329352 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2), (12, 1)],
  term ((-15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2), (15, 2)],
  term ((871728662554901998481237419813615738957152 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((46941632816 : Rat) / 7401317245) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(6, 1), (12, 1), (13, 2)],
  term ((-905823491820936995178503781486714018949392 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (12, 1), (15, 2)],
  term ((-40787556556 : Rat) / 7401317245) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((523748906684113098936549105011982448818408 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (13, 1), (15, 1)],
  term ((82310855274 : Rat) / 7401317245) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((15694474911714017080916088522240 : Rat) / 97983883872014706756151952089) [(6, 1), (13, 2)],
  term ((-23374496974993223744746739581344 : Rat) / 268063527727966972480841957465) [(6, 1), (15, 2)],
  term ((-3137110936 : Rat) / 7401317245) [(6, 1), (15, 2), (16, 1)],
  term ((-175033975904267429635763464873584 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((2646039613649392990272166435008 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((-4982988121107241377708512084736 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((101847982213360759083310271207317145820768 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-211224456456 : Rat) / 7401317245) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((329621755555736520375700067041728 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-631910518210957315269836084822201506371552 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((13518699652 : Rat) / 1057331035) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (10, 2), (11, 1)],
  term ((17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (10, 2), (13, 1)],
  term ((161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (10, 2), (15, 1)],
  term ((10542029528 : Rat) / 7401317245) [(7, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((6913647426678913438918456489272 : Rat) / 97983883872014706756151952089) [(7, 1), (8, 1), (11, 1)],
  term ((-1323019806824696495136083217504 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (11, 1), (12, 1)],
  term ((2491494060553620688854256042368 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-50923991106680379541655135603658572910384 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((105612228228 : Rat) / 7401317245) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13019692835645305193464266189024 : Rat) / 97983883872014706756151952089) [(7, 1), (8, 1), (13, 1)],
  term ((275467624063396299448129744186524523924392 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (15, 1)],
  term ((-49950956164 : Rat) / 7401317245) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (9, 1), (10, 2), (15, 2)],
  term ((-65009381712 : Rat) / 7401317245) [(7, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((-18878713661048488944812839076976 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((35552153274472652784829400889792 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((152721886121637856685206189631109662880096 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (9, 1), (15, 2)],
  term ((16252345428 : Rat) / 7401317245) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-152675062603432685609846543934048 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 1), (11, 1), (12, 1)],
  term ((-65863432533663154086054589119168 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 1), (11, 1), (12, 2)],
  term ((22895278688662642697238959484672 : Rat) / 97983883872014706756151952089) [(7, 1), (10, 1), (12, 1), (13, 1)],
  term ((199067631604498667368630984289175760924464 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (10, 1), (12, 1), (15, 1)],
  term ((103790248932 : Rat) / 7401317245) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((124033177824554903377887272307456 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 1), (12, 2), (13, 1)],
  term ((1843559191810834587817249493329108093957824 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (10, 1), (12, 2), (15, 1)],
  term ((93883265632 : Rat) / 7401317245) [(7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((15809725691565181541038139309820 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 2), (11, 1)],
  term ((14844957577000061259511357746480 : Rat) / 115799135485108289802725034287) [(7, 1), (10, 2), (11, 1), (12, 1)],
  term ((-30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 2), (11, 1), (15, 2)],
  term ((-27955835159440569715028834516160 : Rat) / 115799135485108289802725034287) [(7, 1), (10, 2), (12, 1), (13, 1)],
  term ((-28555004737122360550672411664639625781224 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (10, 2), (12, 1), (15, 1)],
  term ((-114921578202 : Rat) / 7401317245) [(7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-35148076038561518948094963512400 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 2), (13, 1)],
  term ((56805481990332207609573858088320 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 2), (13, 1), (15, 2)],
  term ((-983866942224284197226329415945730804152606 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (10, 2), (15, 1)],
  term ((-235900555763 : Rat) / 44407903470) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (10, 2), (15, 3)],
  term ((316951406728 : Rat) / 22203951735) [(7, 1), (10, 2), (15, 3), (16, 1)],
  term ((-3952431422891295385259534827455 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1)],
  term ((35513897964966174341267038164204 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1)],
  term ((32931716266831577043027294559584 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 2)],
  term ((7541135557908311693894114865240 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (15, 2)],
  term ((-71940764787845610815723941730928 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1)],
  term ((-21007552775162842169966360066828909563866 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (15, 1)],
  term ((-46329459831 : Rat) / 14802634490) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 2), (13, 1)],
  term ((-921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 2), (15, 1)],
  term ((-46941632816 : Rat) / 7401317245) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((8787019009640379737023740878100 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1)],
  term ((-14201370497583051902393464522080 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (15, 2)],
  term ((491933471112142098613164707972865402076303 : Rat) / 2693636435040645053172294539107852334990) [(7, 1), (15, 1)],
  term ((235900555763 : Rat) / 177631613880) [(7, 1), (15, 1), (16, 1)],
  term ((-805609802875682775348978966241272190695888 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (15, 3)],
  term ((-79237851682 : Rat) / 22203951735) [(7, 1), (15, 3), (16, 1)],
  term ((-178315227564228987120 : Rat) / 253528477699481291099) [(7, 2)],
  term ((-226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (10, 2), (11, 1)],
  term ((426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (10, 2), (13, 1)],
  term ((1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (9, 1), (10, 2), (15, 1)],
  term ((195028145136 : Rat) / 7401317245) [(7, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((56636140983145466834438517230928 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (11, 1)],
  term ((-106656459823417958354488202669376 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (13, 1)],
  term ((-458165658364913570055618568893328988640288 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (9, 1), (15, 1)],
  term ((-48757036284 : Rat) / 7401317245) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((356630455128457974240 : Rat) / 253528477699481291099) [(7, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 500 through 599. -/
theorem ep_Q2_002_block_21_0500_0599_valid :
    checkProductSumEq ep_Q2_002_partials_21_0500_0599
      ep_Q2_002_block_21_0500_0599 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
