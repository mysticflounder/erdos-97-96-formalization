/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 11:500-599

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 11 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_11_0500_0599 : Poly :=
[
  term (2 : Rat) [(2, 1), (14, 1)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 500 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0500 : Poly :=
[
  term ((67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 500 for generator 11. -/
def ep_Q2_002_partial_11_0500 : Poly :=
[
  term ((135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (11, 1), (15, 2)],
  term ((-67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (11, 1), (14, 2), (15, 1)],
  term ((-67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 11. -/
theorem ep_Q2_002_partial_11_0500_valid :
    mulPoly ep_Q2_002_coefficient_11_0500
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0501 : Poly :=
[
  term ((-127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 501 for generator 11. -/
def ep_Q2_002_partial_11_0501 : Poly :=
[
  term ((-255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2)],
  term ((127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 11. -/
theorem ep_Q2_002_partial_11_0501_valid :
    mulPoly ep_Q2_002_coefficient_11_0501
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0502 : Poly :=
[
  term ((532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (15, 2)]
]

/-- Partial product 502 for generator 11. -/
def ep_Q2_002_partial_11_0502 : Poly :=
[
  term ((1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (7, 1), (14, 1), (15, 2)],
  term ((1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (7, 1), (15, 3)],
  term ((-532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (14, 2), (15, 2)],
  term ((-532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 11. -/
theorem ep_Q2_002_partial_11_0502_valid :
    mulPoly ep_Q2_002_coefficient_11_0502
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0503 : Poly :=
[
  term ((-88171245013 : Rat) / 22203951735) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 503 for generator 11. -/
def ep_Q2_002_partial_11_0503 : Poly :=
[
  term ((-176342490026 : Rat) / 22203951735) [(2, 1), (5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-176342490026 : Rat) / 22203951735) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((88171245013 : Rat) / 22203951735) [(5, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((88171245013 : Rat) / 22203951735) [(5, 1), (7, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 11. -/
theorem ep_Q2_002_partial_11_0503_valid :
    mulPoly ep_Q2_002_coefficient_11_0503
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0504 : Poly :=
[
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 2), (11, 1)]
]

/-- Partial product 504 for generator 11. -/
def ep_Q2_002_partial_11_0504 : Poly :=
[
  term ((-407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 2), (11, 1), (14, 1)],
  term ((-407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 2), (11, 1), (15, 1)],
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 2), (11, 1), (14, 2)],
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 11. -/
theorem ep_Q2_002_partial_11_0504_valid :
    mulPoly ep_Q2_002_coefficient_11_0504
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0505 : Poly :=
[
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 2), (13, 1)]
]

/-- Partial product 505 for generator 11. -/
def ep_Q2_002_partial_11_0505 : Poly :=
[
  term ((767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 2), (13, 1), (14, 1)],
  term ((767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1)],
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 2), (13, 1), (14, 2)],
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 11. -/
theorem ep_Q2_002_partial_11_0505_valid :
    mulPoly ep_Q2_002_coefficient_11_0505
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0506 : Poly :=
[
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 2), (15, 1)]
]

/-- Partial product 506 for generator 11. -/
def ep_Q2_002_partial_11_0506 : Poly :=
[
  term ((-3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (7, 2), (14, 1), (15, 1)],
  term ((-3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (7, 2), (15, 2)],
  term ((1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 2), (14, 2), (15, 1)],
  term ((1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 11. -/
theorem ep_Q2_002_partial_11_0506_valid :
    mulPoly ep_Q2_002_coefficient_11_0506
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0507 : Poly :=
[
  term ((88171245013 : Rat) / 7401317245) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 507 for generator 11. -/
def ep_Q2_002_partial_11_0507 : Poly :=
[
  term ((176342490026 : Rat) / 7401317245) [(2, 1), (5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((176342490026 : Rat) / 7401317245) [(3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((-88171245013 : Rat) / 7401317245) [(5, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((-88171245013 : Rat) / 7401317245) [(5, 1), (7, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 11. -/
theorem ep_Q2_002_partial_11_0507_valid :
    mulPoly ep_Q2_002_coefficient_11_0507
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0508 : Poly :=
[
  term ((-7081285784076479664174605771232 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 1)]
]

/-- Partial product 508 for generator 11. -/
def ep_Q2_002_partial_11_0508 : Poly :=
[
  term ((-14162571568152959328349211542464 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (8, 1), (11, 1), (14, 1)],
  term ((-14162571568152959328349211542464 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1)],
  term ((7081285784076479664174605771232 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 1), (14, 2)],
  term ((7081285784076479664174605771232 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 11. -/
theorem ep_Q2_002_partial_11_0508_valid :
    mulPoly ep_Q2_002_coefficient_11_0508
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0509 : Poly :=
[
  term ((-35004866596728496010090223722928 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 1), (12, 1)]
]

/-- Partial product 509 for generator 11. -/
def ep_Q2_002_partial_11_0509 : Poly :=
[
  term ((-70009733193456992020180447445856 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((-70009733193456992020180447445856 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((35004866596728496010090223722928 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 2)],
  term ((35004866596728496010090223722928 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 11. -/
theorem ep_Q2_002_partial_11_0509_valid :
    mulPoly ep_Q2_002_coefficient_11_0509
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0510 : Poly :=
[
  term ((65920719226070524523814635933376 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 510 for generator 11. -/
def ep_Q2_002_partial_11_0510 : Poly :=
[
  term ((131841438452141049047629271866752 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((131841438452141049047629271866752 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-65920719226070524523814635933376 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 2)],
  term ((-65920719226070524523814635933376 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 11. -/
theorem ep_Q2_002_partial_11_0510_valid :
    mulPoly ep_Q2_002_coefficient_11_0510
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0511 : Poly :=
[
  term ((13108039484509659383314935709224289555368 : Rat) / 103601401347717117429703636119532782115) [(5, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 511 for generator 11. -/
def ep_Q2_002_partial_11_0511 : Poly :=
[
  term ((26216078969019318766629871418448579110736 : Rat) / 103601401347717117429703636119532782115) [(2, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((26216078969019318766629871418448579110736 : Rat) / 103601401347717117429703636119532782115) [(3, 1), (5, 1), (8, 1), (12, 1), (15, 2)],
  term ((-13108039484509659383314935709224289555368 : Rat) / 103601401347717117429703636119532782115) [(5, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-13108039484509659383314935709224289555368 : Rat) / 103601401347717117429703636119532782115) [(5, 1), (8, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 11. -/
theorem ep_Q2_002_partial_11_0511_valid :
    mulPoly ep_Q2_002_coefficient_11_0511
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0512 : Poly :=
[
  term ((26206208982 : Rat) / 7401317245) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 512 for generator 11. -/
def ep_Q2_002_partial_11_0512 : Poly :=
[
  term ((52412417964 : Rat) / 7401317245) [(2, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((52412417964 : Rat) / 7401317245) [(3, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-26206208982 : Rat) / 7401317245) [(5, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-26206208982 : Rat) / 7401317245) [(5, 1), (8, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 11. -/
theorem ep_Q2_002_partial_11_0512_valid :
    mulPoly ep_Q2_002_coefficient_11_0512
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0513 : Poly :=
[
  term ((13335387256562121981556280809344 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (13, 1)]
]

/-- Partial product 513 for generator 11. -/
def ep_Q2_002_partial_11_0513 : Poly :=
[
  term ((26670774513124243963112561618688 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (8, 1), (13, 1), (14, 1)],
  term ((26670774513124243963112561618688 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1)],
  term ((-13335387256562121981556280809344 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (13, 1), (14, 2)],
  term ((-13335387256562121981556280809344 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 11. -/
theorem ep_Q2_002_partial_11_0513_valid :
    mulPoly ep_Q2_002_coefficient_11_0513
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0514 : Poly :=
[
  term ((121462905126247074560364894673728687784152 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 514 for generator 11. -/
def ep_Q2_002_partial_11_0514 : Poly :=
[
  term ((242925810252494149120729789347457375568304 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((242925810252494149120729789347457375568304 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (8, 1), (15, 2)],
  term ((-121462905126247074560364894673728687784152 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (14, 2), (15, 1)],
  term ((-121462905126247074560364894673728687784152 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 11. -/
theorem ep_Q2_002_partial_11_0514_valid :
    mulPoly ep_Q2_002_coefficient_11_0514
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0515 : Poly :=
[
  term ((7906522146 : Rat) / 7401317245) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 515 for generator 11. -/
def ep_Q2_002_partial_11_0515 : Poly :=
[
  term ((15813044292 : Rat) / 7401317245) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((15813044292 : Rat) / 7401317245) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-7906522146 : Rat) / 7401317245) [(5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7906522146 : Rat) / 7401317245) [(5, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 11. -/
theorem ep_Q2_002_partial_11_0515_valid :
    mulPoly ep_Q2_002_coefficient_11_0515
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0516 : Poly :=
[
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 516 for generator 11. -/
def ep_Q2_002_partial_11_0516 : Poly :=
[
  term ((75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2)],
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 11. -/
theorem ep_Q2_002_partial_11_0516_valid :
    mulPoly ep_Q2_002_coefficient_11_0516
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0517 : Poly :=
[
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 517 for generator 11. -/
def ep_Q2_002_partial_11_0517 : Poly :=
[
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2)],
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 11. -/
theorem ep_Q2_002_partial_11_0517_valid :
    mulPoly ep_Q2_002_coefficient_11_0517
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0518 : Poly :=
[
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (9, 1), (15, 2)]
]

/-- Partial product 518 for generator 11. -/
def ep_Q2_002_partial_11_0518 : Poly :=
[
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (9, 1), (14, 1), (15, 2)],
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (9, 1), (15, 3)],
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (9, 1), (14, 2), (15, 2)],
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (9, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 11. -/
theorem ep_Q2_002_partial_11_0518_valid :
    mulPoly ep_Q2_002_coefficient_11_0518
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0519 : Poly :=
[
  term ((-32504690856 : Rat) / 7401317245) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 519 for generator 11. -/
def ep_Q2_002_partial_11_0519 : Poly :=
[
  term ((-65009381712 : Rat) / 7401317245) [(2, 1), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-65009381712 : Rat) / 7401317245) [(3, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((32504690856 : Rat) / 7401317245) [(5, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((32504690856 : Rat) / 7401317245) [(5, 1), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 11. -/
theorem ep_Q2_002_partial_11_0519_valid :
    mulPoly ep_Q2_002_coefficient_11_0519
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0520 : Poly :=
[
  term ((-90292554118856861769092384136897 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1)]
]

/-- Partial product 520 for generator 11. -/
def ep_Q2_002_partial_11_0520 : Poly :=
[
  term ((-180585108237713723538184768273794 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1), (14, 1)],
  term ((-180585108237713723538184768273794 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 1), (15, 1)],
  term ((90292554118856861769092384136897 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (14, 2)],
  term ((90292554118856861769092384136897 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 11. -/
theorem ep_Q2_002_partial_11_0520_valid :
    mulPoly ep_Q2_002_coefficient_11_0520
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0521 : Poly :=
[
  term ((-92292791277305319115579912227060 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 521 for generator 11. -/
def ep_Q2_002_partial_11_0521 : Poly :=
[
  term ((-184585582554610638231159824454120 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-184585582554610638231159824454120 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((92292791277305319115579912227060 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 1), (14, 2)],
  term ((92292791277305319115579912227060 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 11. -/
theorem ep_Q2_002_partial_11_0521_valid :
    mulPoly ep_Q2_002_coefficient_11_0521
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0522 : Poly :=
[
  term ((-62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 522 for generator 11. -/
def ep_Q2_002_partial_11_0522 : Poly :=
[
  term ((-125046845046648233984822864079168 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 2)],
  term ((-125046845046648233984822864079168 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 11. -/
theorem ep_Q2_002_partial_11_0522_valid :
    mulPoly ep_Q2_002_coefficient_11_0522
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0523 : Poly :=
[
  term ((71685926962549405106214114287892 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 2)]
]

/-- Partial product 523 for generator 11. -/
def ep_Q2_002_partial_11_0523 : Poly :=
[
  term ((143371853925098810212428228575784 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1), (12, 2), (14, 1)],
  term ((143371853925098810212428228575784 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 1), (12, 2), (15, 1)],
  term ((-71685926962549405106214114287892 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 2), (14, 2)],
  term ((-71685926962549405106214114287892 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 11. -/
theorem ep_Q2_002_partial_11_0523_valid :
    mulPoly ep_Q2_002_coefficient_11_0523
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0524 : Poly :=
[
  term ((-12560803613244251051422675223088 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 524 for generator 11. -/
def ep_Q2_002_partial_11_0524 : Poly :=
[
  term ((-25121607226488502102845350446176 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-25121607226488502102845350446176 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2)],
  term ((12560803613244251051422675223088 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((12560803613244251051422675223088 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 11. -/
theorem ep_Q2_002_partial_11_0524_valid :
    mulPoly ep_Q2_002_coefficient_11_0524
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0525 : Poly :=
[
  term ((-42377910276003010513791122562930 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (14, 1)]
]

/-- Partial product 525 for generator 11. -/
def ep_Q2_002_partial_11_0525 : Poly :=
[
  term ((-84755820552006021027582245125860 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1), (14, 2)],
  term ((-84755820552006021027582245125860 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((42377910276003010513791122562930 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (14, 1), (15, 2)],
  term ((42377910276003010513791122562930 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 11. -/
theorem ep_Q2_002_partial_11_0525_valid :
    mulPoly ep_Q2_002_coefficient_11_0525
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0526 : Poly :=
[
  term ((-15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (15, 2)]
]

/-- Partial product 526 for generator 11. -/
def ep_Q2_002_partial_11_0526 : Poly :=
[
  term ((-30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1), (14, 1), (15, 2)],
  term ((-30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 1), (15, 3)],
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (14, 2), (15, 2)],
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 11. -/
theorem ep_Q2_002_partial_11_0526_valid :
    mulPoly ep_Q2_002_coefficient_11_0526
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0527 : Poly :=
[
  term ((173804609812458968974245453869520 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 527 for generator 11. -/
def ep_Q2_002_partial_11_0527 : Poly :=
[
  term ((347609219624917937948490907739040 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((347609219624917937948490907739040 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((-173804609812458968974245453869520 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 1), (13, 1), (14, 2)],
  term ((-173804609812458968974245453869520 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 11. -/
theorem ep_Q2_002_partial_11_0527_valid :
    mulPoly ep_Q2_002_coefficient_11_0527
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0528 : Poly :=
[
  term ((117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 528 for generator 11. -/
def ep_Q2_002_partial_11_0528 : Poly :=
[
  term ((235486626970789296303418248627456 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 2)],
  term ((235486626970789296303418248627456 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 11. -/
theorem ep_Q2_002_partial_11_0528_valid :
    mulPoly ep_Q2_002_coefficient_11_0528
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0529 : Poly :=
[
  term ((27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 529 for generator 11. -/
def ep_Q2_002_partial_11_0529 : Poly :=
[
  term ((54596813688829660254282311535600859116288 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (5, 1), (12, 1), (14, 2), (15, 1)],
  term ((54596813688829660254282311535600859116288 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 1), (12, 1), (14, 1), (15, 2)],
  term ((-27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (12, 1), (14, 1), (15, 3)],
  term ((-27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 11. -/
theorem ep_Q2_002_partial_11_0529_valid :
    mulPoly ep_Q2_002_coefficient_11_0529
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0530 : Poly :=
[
  term ((1243661576 : Rat) / 211466207) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 530 for generator 11. -/
def ep_Q2_002_partial_11_0530 : Poly :=
[
  term ((2487323152 : Rat) / 211466207) [(2, 1), (5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((2487323152 : Rat) / 211466207) [(3, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1243661576 : Rat) / 211466207) [(5, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1243661576 : Rat) / 211466207) [(5, 1), (12, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 11. -/
theorem ep_Q2_002_partial_11_0530_valid :
    mulPoly ep_Q2_002_coefficient_11_0530
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0531 : Poly :=
[
  term ((-145690426332023888643084354701007375811326 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 531 for generator 11. -/
def ep_Q2_002_partial_11_0531 : Poly :=
[
  term ((-291380852664047777286168709402014751622652 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-291380852664047777286168709402014751622652 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 1), (12, 1), (15, 2)],
  term ((145690426332023888643084354701007375811326 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term ((145690426332023888643084354701007375811326 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 11. -/
theorem ep_Q2_002_partial_11_0531_valid :
    mulPoly ep_Q2_002_coefficient_11_0531
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0532 : Poly :=
[
  term ((15544740935 : Rat) / 2960526898) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 532 for generator 11. -/
def ep_Q2_002_partial_11_0532 : Poly :=
[
  term ((15544740935 : Rat) / 1480263449) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((15544740935 : Rat) / 1480263449) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-15544740935 : Rat) / 2960526898) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-15544740935 : Rat) / 2960526898) [(5, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 11. -/
theorem ep_Q2_002_partial_11_0532_valid :
    mulPoly ep_Q2_002_coefficient_11_0532
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0533 : Poly :=
[
  term ((-134998025223168956317943910122064 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 2), (13, 1)]
]

/-- Partial product 533 for generator 11. -/
def ep_Q2_002_partial_11_0533 : Poly :=
[
  term ((-269996050446337912635887820244128 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (12, 2), (13, 1), (14, 1)],
  term ((-269996050446337912635887820244128 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (12, 2), (13, 1), (15, 1)],
  term ((134998025223168956317943910122064 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 2), (13, 1), (14, 2)],
  term ((134998025223168956317943910122064 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 11. -/
theorem ep_Q2_002_partial_11_0533_valid :
    mulPoly ep_Q2_002_coefficient_11_0533
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0534 : Poly :=
[
  term ((698891826454987324004970808285554302653128 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (12, 2), (15, 1)]
]

/-- Partial product 534 for generator 11. -/
def ep_Q2_002_partial_11_0534 : Poly :=
[
  term ((1397783652909974648009941616571108605306256 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (12, 2), (14, 1), (15, 1)],
  term ((1397783652909974648009941616571108605306256 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (12, 2), (15, 2)],
  term ((-698891826454987324004970808285554302653128 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (12, 2), (14, 2), (15, 1)],
  term ((-698891826454987324004970808285554302653128 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 11. -/
theorem ep_Q2_002_partial_11_0534_valid :
    mulPoly ep_Q2_002_coefficient_11_0534
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0535 : Poly :=
[
  term ((-26874136301 : Rat) / 7401317245) [(5, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 535 for generator 11. -/
def ep_Q2_002_partial_11_0535 : Poly :=
[
  term ((-53748272602 : Rat) / 7401317245) [(2, 1), (5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-53748272602 : Rat) / 7401317245) [(3, 1), (5, 1), (12, 2), (15, 2), (16, 1)],
  term ((26874136301 : Rat) / 7401317245) [(5, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((26874136301 : Rat) / 7401317245) [(5, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 11. -/
theorem ep_Q2_002_partial_11_0535_valid :
    mulPoly ep_Q2_002_coefficient_11_0535
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0536 : Poly :=
[
  term ((170037788655084323622807806395524 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1)]
]

/-- Partial product 536 for generator 11. -/
def ep_Q2_002_partial_11_0536 : Poly :=
[
  term ((340075577310168647245615612791048 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (13, 1), (14, 1)],
  term ((340075577310168647245615612791048 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-170037788655084323622807806395524 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1), (14, 2)],
  term ((-170037788655084323622807806395524 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 11. -/
theorem ep_Q2_002_partial_11_0536_valid :
    mulPoly ep_Q2_002_coefficient_11_0536
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0537 : Poly :=
[
  term ((79805541237317197778654510479560 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 537 for generator 11. -/
def ep_Q2_002_partial_11_0537 : Poly :=
[
  term ((159611082474634395557309020959120 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (13, 1), (14, 2)],
  term ((159611082474634395557309020959120 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-79805541237317197778654510479560 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((-79805541237317197778654510479560 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 11. -/
theorem ep_Q2_002_partial_11_0537_valid :
    mulPoly ep_Q2_002_coefficient_11_0537
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0538 : Poly :=
[
  term ((-64764928401245218024564956001674732496224 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (13, 1), (15, 2)]
]

/-- Partial product 538 for generator 11. -/
def ep_Q2_002_partial_11_0538 : Poly :=
[
  term ((-129529856802490436049129912003349464992448 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (5, 1), (13, 1), (14, 1), (15, 2)],
  term ((-129529856802490436049129912003349464992448 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 1), (13, 1), (15, 3)],
  term ((64764928401245218024564956001674732496224 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (13, 1), (14, 2), (15, 2)],
  term ((64764928401245218024564956001674732496224 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 11. -/
theorem ep_Q2_002_partial_11_0538_valid :
    mulPoly ep_Q2_002_coefficient_11_0538
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0539 : Poly :=
[
  term ((-12535010052 : Rat) / 7401317245) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 539 for generator 11. -/
def ep_Q2_002_partial_11_0539 : Poly :=
[
  term ((-25070020104 : Rat) / 7401317245) [(2, 1), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-25070020104 : Rat) / 7401317245) [(3, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((12535010052 : Rat) / 7401317245) [(5, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((12535010052 : Rat) / 7401317245) [(5, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 11. -/
theorem ep_Q2_002_partial_11_0539_valid :
    mulPoly ep_Q2_002_coefficient_11_0539
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0540 : Poly :=
[
  term ((23654345488060557238516575228096 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 2), (15, 1)]
]

/-- Partial product 540 for generator 11. -/
def ep_Q2_002_partial_11_0540 : Poly :=
[
  term ((47308690976121114477033150456192 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (13, 2), (14, 1), (15, 1)],
  term ((47308690976121114477033150456192 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (13, 2), (15, 2)],
  term ((-23654345488060557238516575228096 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 2), (14, 2), (15, 1)],
  term ((-23654345488060557238516575228096 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 11. -/
theorem ep_Q2_002_partial_11_0540_valid :
    mulPoly ep_Q2_002_coefficient_11_0540
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0541 : Poly :=
[
  term ((172583401433934646206165887131169537334909 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 541 for generator 11. -/
def ep_Q2_002_partial_11_0541 : Poly :=
[
  term ((345166802867869292412331774262339074669818 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (14, 2), (15, 1)],
  term ((345166802867869292412331774262339074669818 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((-172583401433934646206165887131169537334909 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (14, 1), (15, 3)],
  term ((-172583401433934646206165887131169537334909 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 11. -/
theorem ep_Q2_002_partial_11_0541_valid :
    mulPoly ep_Q2_002_coefficient_11_0541
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0542 : Poly :=
[
  term ((18130035309 : Rat) / 4229324140) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 542 for generator 11. -/
def ep_Q2_002_partial_11_0542 : Poly :=
[
  term ((18130035309 : Rat) / 2114662070) [(2, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((18130035309 : Rat) / 2114662070) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-18130035309 : Rat) / 4229324140) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((-18130035309 : Rat) / 4229324140) [(5, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 11. -/
theorem ep_Q2_002_partial_11_0542_valid :
    mulPoly ep_Q2_002_coefficient_11_0542
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0543 : Poly :=
[
  term ((-1044961440097287627747046260506150748034047 : Rat) / 538727287008129010634458907821570466998) [(5, 1), (15, 1)]
]

/-- Partial product 543 for generator 11. -/
def ep_Q2_002_partial_11_0543 : Poly :=
[
  term ((-1044961440097287627747046260506150748034047 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (5, 1), (14, 1), (15, 1)],
  term ((-1044961440097287627747046260506150748034047 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 1), (15, 2)],
  term ((1044961440097287627747046260506150748034047 : Rat) / 538727287008129010634458907821570466998) [(5, 1), (14, 2), (15, 1)],
  term ((1044961440097287627747046260506150748034047 : Rat) / 538727287008129010634458907821570466998) [(5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 11. -/
theorem ep_Q2_002_partial_11_0543_valid :
    mulPoly ep_Q2_002_coefficient_11_0543
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0544 : Poly :=
[
  term ((-2871744143 : Rat) / 1691729656) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 544 for generator 11. -/
def ep_Q2_002_partial_11_0544 : Poly :=
[
  term ((-2871744143 : Rat) / 845864828) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2871744143 : Rat) / 845864828) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((2871744143 : Rat) / 1691729656) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((2871744143 : Rat) / 1691729656) [(5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 11. -/
theorem ep_Q2_002_partial_11_0544_valid :
    mulPoly ep_Q2_002_coefficient_11_0544
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0545 : Poly :=
[
  term ((1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (15, 3)]
]

/-- Partial product 545 for generator 11. -/
def ep_Q2_002_partial_11_0545 : Poly :=
[
  term ((3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (14, 1), (15, 3)],
  term ((3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (15, 4)],
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (14, 2), (15, 3)],
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 11. -/
theorem ep_Q2_002_partial_11_0545_valid :
    mulPoly ep_Q2_002_coefficient_11_0545
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0546 : Poly :=
[
  term ((158475703364 : Rat) / 22203951735) [(5, 1), (15, 3), (16, 1)]
]

/-- Partial product 546 for generator 11. -/
def ep_Q2_002_partial_11_0546 : Poly :=
[
  term ((316951406728 : Rat) / 22203951735) [(2, 1), (5, 1), (14, 1), (15, 3), (16, 1)],
  term ((316951406728 : Rat) / 22203951735) [(3, 1), (5, 1), (15, 4), (16, 1)],
  term ((-158475703364 : Rat) / 22203951735) [(5, 1), (14, 2), (15, 3), (16, 1)],
  term ((-158475703364 : Rat) / 22203951735) [(5, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 11. -/
theorem ep_Q2_002_partial_11_0546_valid :
    mulPoly ep_Q2_002_coefficient_11_0546
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0547 : Poly :=
[
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(5, 2), (7, 1), (11, 1)]
]

/-- Partial product 547 for generator 11. -/
def ep_Q2_002_partial_11_0547 : Poly :=
[
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(2, 1), (5, 2), (7, 1), (11, 1), (14, 1)],
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 2), (7, 1), (11, 1), (15, 1)],
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(5, 2), (7, 1), (11, 1), (14, 2)],
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(5, 2), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 11. -/
theorem ep_Q2_002_partial_11_0547_valid :
    mulPoly ep_Q2_002_coefficient_11_0547
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0548 : Poly :=
[
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(5, 2), (7, 1), (13, 1)]
]

/-- Partial product 548 for generator 11. -/
def ep_Q2_002_partial_11_0548 : Poly :=
[
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(2, 1), (5, 2), (7, 1), (13, 1), (14, 1)],
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 2), (7, 1), (13, 1), (15, 1)],
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(5, 2), (7, 1), (13, 1), (14, 2)],
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(5, 2), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 11. -/
theorem ep_Q2_002_partial_11_0548_valid :
    mulPoly ep_Q2_002_coefficient_11_0548
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0549 : Poly :=
[
  term ((449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(5, 2), (7, 1), (15, 1)]
]

/-- Partial product 549 for generator 11. -/
def ep_Q2_002_partial_11_0549 : Poly :=
[
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (5, 2), (7, 1), (14, 1), (15, 1)],
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 2), (7, 1), (15, 2)],
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(5, 2), (7, 1), (14, 2), (15, 1)],
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(5, 2), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 11. -/
theorem ep_Q2_002_partial_11_0549_valid :
    mulPoly ep_Q2_002_coefficient_11_0549
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0550 : Poly :=
[
  term ((190895317587 : Rat) / 7401317245) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 550 for generator 11. -/
def ep_Q2_002_partial_11_0550 : Poly :=
[
  term ((381790635174 : Rat) / 7401317245) [(2, 1), (5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((381790635174 : Rat) / 7401317245) [(3, 1), (5, 2), (7, 1), (15, 2), (16, 1)],
  term ((-190895317587 : Rat) / 7401317245) [(5, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-190895317587 : Rat) / 7401317245) [(5, 2), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 11. -/
theorem ep_Q2_002_partial_11_0550_valid :
    mulPoly ep_Q2_002_coefficient_11_0550
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0551 : Poly :=
[
  term ((-29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(5, 2), (11, 1), (15, 1)]
]

/-- Partial product 551 for generator 11. -/
def ep_Q2_002_partial_11_0551 : Poly :=
[
  term ((-58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 2), (11, 1), (14, 1), (15, 1)],
  term ((-58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (11, 1), (15, 2)],
  term ((29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(5, 2), (11, 1), (14, 2), (15, 1)],
  term ((29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(5, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 11. -/
theorem ep_Q2_002_partial_11_0551_valid :
    mulPoly ep_Q2_002_coefficient_11_0551
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0552 : Poly :=
[
  term ((55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(5, 2), (13, 1), (15, 1)]
]

/-- Partial product 552 for generator 11. -/
def ep_Q2_002_partial_11_0552 : Poly :=
[
  term ((110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 2), (13, 1), (14, 1), (15, 1)],
  term ((110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (13, 1), (15, 2)],
  term ((-55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(5, 2), (13, 1), (14, 2), (15, 1)],
  term ((-55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(5, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 11. -/
theorem ep_Q2_002_partial_11_0552_valid :
    mulPoly ep_Q2_002_coefficient_11_0552
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0553 : Poly :=
[
  term ((-238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(5, 2), (15, 2)]
]

/-- Partial product 553 for generator 11. -/
def ep_Q2_002_partial_11_0553 : Poly :=
[
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (5, 2), (14, 1), (15, 2)],
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 2), (15, 3)],
  term ((238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(5, 2), (14, 2), (15, 2)],
  term ((238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(5, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 11. -/
theorem ep_Q2_002_partial_11_0553_valid :
    mulPoly ep_Q2_002_coefficient_11_0553
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0554 : Poly :=
[
  term ((-7782778567 : Rat) / 4440790347) [(5, 2), (15, 2), (16, 1)]
]

/-- Partial product 554 for generator 11. -/
def ep_Q2_002_partial_11_0554 : Poly :=
[
  term ((-15565557134 : Rat) / 4440790347) [(2, 1), (5, 2), (14, 1), (15, 2), (16, 1)],
  term ((-15565557134 : Rat) / 4440790347) [(3, 1), (5, 2), (15, 3), (16, 1)],
  term ((7782778567 : Rat) / 4440790347) [(5, 2), (14, 2), (15, 2), (16, 1)],
  term ((7782778567 : Rat) / 4440790347) [(5, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 11. -/
theorem ep_Q2_002_partial_11_0554_valid :
    mulPoly ep_Q2_002_coefficient_11_0554
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0555 : Poly :=
[
  term ((-10290773182623778944336 : Rat) / 253528477699481291099) [(6, 1)]
]

/-- Partial product 555 for generator 11. -/
def ep_Q2_002_partial_11_0555 : Poly :=
[
  term ((-20581546365247557888672 : Rat) / 253528477699481291099) [(2, 1), (6, 1), (14, 1)],
  term ((-20581546365247557888672 : Rat) / 253528477699481291099) [(3, 1), (6, 1), (15, 1)],
  term ((10290773182623778944336 : Rat) / 253528477699481291099) [(6, 1), (14, 2)],
  term ((10290773182623778944336 : Rat) / 253528477699481291099) [(6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 11. -/
theorem ep_Q2_002_partial_11_0555_valid :
    mulPoly ep_Q2_002_coefficient_11_0555
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0556 : Poly :=
[
  term ((-50927189676155065028444663861586 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (11, 1)]
]

/-- Partial product 556 for generator 11. -/
def ep_Q2_002_partial_11_0556 : Poly :=
[
  term ((-101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (7, 1), (11, 1), (14, 1)],
  term ((-101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((50927189676155065028444663861586 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (11, 1), (14, 2)],
  term ((50927189676155065028444663861586 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 11. -/
theorem ep_Q2_002_partial_11_0556_valid :
    mulPoly ep_Q2_002_coefficient_11_0556
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0557 : Poly :=
[
  term ((90530033541226850933426808254952 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 557 for generator 11. -/
def ep_Q2_002_partial_11_0557 : Poly :=
[
  term ((181060067082453701866853616509904 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((181060067082453701866853616509904 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((-90530033541226850933426808254952 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (13, 1), (14, 2)],
  term ((-90530033541226850933426808254952 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 11. -/
theorem ep_Q2_002_partial_11_0557_valid :
    mulPoly ep_Q2_002_coefficient_11_0557
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0558 : Poly :=
[
  term ((-403231179408457713301544070568761984059721 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 558 for generator 11. -/
def ep_Q2_002_partial_11_0558 : Poly :=
[
  term ((-806462358816915426603088141137523968119442 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-806462358816915426603088141137523968119442 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (7, 1), (15, 2)],
  term ((403231179408457713301544070568761984059721 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 1), (14, 2), (15, 1)],
  term ((403231179408457713301544070568761984059721 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 11. -/
theorem ep_Q2_002_partial_11_0558_valid :
    mulPoly ep_Q2_002_coefficient_11_0558
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0559 : Poly :=
[
  term ((88171245013 : Rat) / 29605268980) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 559 for generator 11. -/
def ep_Q2_002_partial_11_0559 : Poly :=
[
  term ((88171245013 : Rat) / 14802634490) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((88171245013 : Rat) / 14802634490) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-88171245013 : Rat) / 29605268980) [(6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-88171245013 : Rat) / 29605268980) [(6, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 11. -/
theorem ep_Q2_002_partial_11_0559_valid :
    mulPoly ep_Q2_002_coefficient_11_0559
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0560 : Poly :=
[
  term ((-9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 560 for generator 11. -/
def ep_Q2_002_partial_11_0560 : Poly :=
[
  term ((-18883428757537279104465615389952 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-18883428757537279104465615389952 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (11, 1), (15, 2)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 11. -/
theorem ep_Q2_002_partial_11_0560_valid :
    mulPoly ep_Q2_002_coefficient_11_0560
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0561 : Poly :=
[
  term ((17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 561 for generator 11. -/
def ep_Q2_002_partial_11_0561 : Poly :=
[
  term ((35561032684165658617483415491584 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((35561032684165658617483415491584 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 11. -/
theorem ep_Q2_002_partial_11_0561_valid :
    mulPoly ep_Q2_002_coefficient_11_0561
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0562 : Poly :=
[
  term ((161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (8, 1), (15, 2)]
]

/-- Partial product 562 for generator 11. -/
def ep_Q2_002_partial_11_0562 : Poly :=
[
  term ((323901080336658865494306385796609834091072 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (8, 1), (14, 1), (15, 2)],
  term ((323901080336658865494306385796609834091072 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (8, 1), (15, 3)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (8, 1), (14, 2), (15, 2)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (8, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 11. -/
theorem ep_Q2_002_partial_11_0562_valid :
    mulPoly ep_Q2_002_coefficient_11_0562
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0563 : Poly :=
[
  term ((10542029528 : Rat) / 7401317245) [(6, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 563 for generator 11. -/
def ep_Q2_002_partial_11_0563 : Poly :=
[
  term ((21084059056 : Rat) / 7401317245) [(2, 1), (6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((21084059056 : Rat) / 7401317245) [(3, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((-10542029528 : Rat) / 7401317245) [(6, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-10542029528 : Rat) / 7401317245) [(6, 1), (8, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 11. -/
theorem ep_Q2_002_partial_11_0563_valid :
    mulPoly ep_Q2_002_coefficient_11_0563
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0564 : Poly :=
[
  term ((-188937057560267703591053155562976 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 564 for generator 11. -/
def ep_Q2_002_partial_11_0564 : Poly :=
[
  term ((-377874115120535407182106311125952 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (9, 1), (11, 1), (14, 1)],
  term ((-377874115120535407182106311125952 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((188937057560267703591053155562976 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1), (14, 2)],
  term ((188937057560267703591053155562976 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 11. -/
theorem ep_Q2_002_partial_11_0564_valid :
    mulPoly ep_Q2_002_coefficient_11_0564
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0565 : Poly :=
[
  term ((355803861969133923564054155601792 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 565 for generator 11. -/
def ep_Q2_002_partial_11_0565 : Poly :=
[
  term ((711607723938267847128108311203584 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((711607723938267847128108311203584 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-355803861969133923564054155601792 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (13, 1), (14, 2)],
  term ((-355803861969133923564054155601792 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 11. -/
theorem ep_Q2_002_partial_11_0565_valid :
    mulPoly ep_Q2_002_coefficient_11_0565
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0566 : Poly :=
[
  term ((832183026394600344402822184261169753264112 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 566 for generator 11. -/
def ep_Q2_002_partial_11_0566 : Poly :=
[
  term ((1664366052789200688805644368522339506528224 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((1664366052789200688805644368522339506528224 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (9, 1), (15, 2)],
  term ((-832183026394600344402822184261169753264112 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (9, 1), (14, 2), (15, 1)],
  term ((-832183026394600344402822184261169753264112 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 11. -/
theorem ep_Q2_002_partial_11_0566_valid :
    mulPoly ep_Q2_002_coefficient_11_0566
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0567 : Poly :=
[
  term ((143921819616 : Rat) / 7401317245) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 567 for generator 11. -/
def ep_Q2_002_partial_11_0567 : Poly :=
[
  term ((287843639232 : Rat) / 7401317245) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((287843639232 : Rat) / 7401317245) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-143921819616 : Rat) / 7401317245) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-143921819616 : Rat) / 7401317245) [(6, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 11. -/
theorem ep_Q2_002_partial_11_0567_valid :
    mulPoly ep_Q2_002_coefficient_11_0567
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0568 : Poly :=
[
  term ((-80268767477586301014018391828320 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 568 for generator 11. -/
def ep_Q2_002_partial_11_0568 : Poly :=
[
  term ((-160537534955172602028036783656640 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-160537534955172602028036783656640 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((80268767477586301014018391828320 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((80268767477586301014018391828320 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 11. -/
theorem ep_Q2_002_partial_11_0568_valid :
    mulPoly ep_Q2_002_coefficient_11_0568
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0569 : Poly :=
[
  term ((-889171237112947234807130254072585866500352 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 569 for generator 11. -/
def ep_Q2_002_partial_11_0569 : Poly :=
[
  term ((-1778342474225894469614260508145171733000704 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1778342474225894469614260508145171733000704 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (11, 1), (12, 1), (15, 2)],
  term ((889171237112947234807130254072585866500352 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((889171237112947234807130254072585866500352 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 11. -/
theorem ep_Q2_002_partial_11_0569_valid :
    mulPoly ep_Q2_002_coefficient_11_0569
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0570 : Poly :=
[
  term ((-40787556556 : Rat) / 7401317245) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 570 for generator 11. -/
def ep_Q2_002_partial_11_0570 : Poly :=
[
  term ((-81575113112 : Rat) / 7401317245) [(2, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-81575113112 : Rat) / 7401317245) [(3, 1), (6, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((40787556556 : Rat) / 7401317245) [(6, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((40787556556 : Rat) / 7401317245) [(6, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 11. -/
theorem ep_Q2_002_partial_11_0570_valid :
    mulPoly ep_Q2_002_coefficient_11_0570
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0570 := by
  native_decide

/-- Coefficient term 571 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0571 : Poly :=
[
  term ((-123848572934248105879597730318208 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1)]
]

/-- Partial product 571 for generator 11. -/
def ep_Q2_002_partial_11_0571 : Poly :=
[
  term ((-247697145868496211759195460636416 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-247697145868496211759195460636416 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((123848572934248105879597730318208 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1), (14, 2)],
  term ((123848572934248105879597730318208 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 571 for generator 11. -/
theorem ep_Q2_002_partial_11_0571_valid :
    mulPoly ep_Q2_002_coefficient_11_0571
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0571 := by
  native_decide

/-- Coefficient term 572 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0572 : Poly :=
[
  term ((-75099285836184157510578549003504 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 572 for generator 11. -/
def ep_Q2_002_partial_11_0572 : Poly :=
[
  term ((-150198571672368315021157098007008 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 2)],
  term ((-150198571672368315021157098007008 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((75099285836184157510578549003504 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((75099285836184157510578549003504 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 572 for generator 11. -/
theorem ep_Q2_002_partial_11_0572_valid :
    mulPoly ep_Q2_002_coefficient_11_0572
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0572 := by
  native_decide

/-- Coefficient term 573 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0573 : Poly :=
[
  term ((63302606702715650254139669234877382768416 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 573 for generator 11. -/
def ep_Q2_002_partial_11_0573 : Poly :=
[
  term ((126605213405431300508279338469754765536832 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((126605213405431300508279338469754765536832 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (11, 1), (15, 2)],
  term ((-63302606702715650254139669234877382768416 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (14, 2), (15, 1)],
  term ((-63302606702715650254139669234877382768416 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 573 for generator 11. -/
theorem ep_Q2_002_partial_11_0573_valid :
    mulPoly ep_Q2_002_coefficient_11_0573
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0573 := by
  native_decide

/-- Coefficient term 574 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0574 : Poly :=
[
  term ((-914211696 : Rat) / 1057331035) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 574 for generator 11. -/
def ep_Q2_002_partial_11_0574 : Poly :=
[
  term ((-1828423392 : Rat) / 1057331035) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1828423392 : Rat) / 1057331035) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((914211696 : Rat) / 1057331035) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((914211696 : Rat) / 1057331035) [(6, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 574 for generator 11. -/
theorem ep_Q2_002_partial_11_0574_valid :
    mulPoly ep_Q2_002_coefficient_11_0574
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0574 := by
  native_decide

/-- Coefficient term 575 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0575 : Poly :=
[
  term ((17341617585377006096152289814432 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2)]
]

/-- Partial product 575 for generator 11. -/
def ep_Q2_002_partial_11_0575 : Poly :=
[
  term ((34683235170754012192304579628864 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (11, 2), (14, 1)],
  term ((34683235170754012192304579628864 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 2), (15, 1)],
  term ((-17341617585377006096152289814432 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2), (14, 2)],
  term ((-17341617585377006096152289814432 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 575 for generator 11. -/
theorem ep_Q2_002_partial_11_0575_valid :
    mulPoly ep_Q2_002_coefficient_11_0575
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0575 := by
  native_decide

/-- Coefficient term 576 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0576 : Poly :=
[
  term ((25136666926104291569589792187008 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2), (12, 1)]
]

/-- Partial product 576 for generator 11. -/
def ep_Q2_002_partial_11_0576 : Poly :=
[
  term ((50273333852208583139179584374016 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (11, 2), (12, 1), (14, 1)],
  term ((50273333852208583139179584374016 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((-25136666926104291569589792187008 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2), (12, 1), (14, 2)],
  term ((-25136666926104291569589792187008 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 576 for generator 11. -/
theorem ep_Q2_002_partial_11_0576_valid :
    mulPoly ep_Q2_002_coefficient_11_0576
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0576 := by
  native_decide

/-- Coefficient term 577 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0577 : Poly :=
[
  term ((11498780042081900136576 : Rat) / 253528477699481291099) [(6, 1), (12, 1)]
]

/-- Partial product 577 for generator 11. -/
def ep_Q2_002_partial_11_0577 : Poly :=
[
  term ((22997560084163800273152 : Rat) / 253528477699481291099) [(2, 1), (6, 1), (12, 1), (14, 1)],
  term ((22997560084163800273152 : Rat) / 253528477699481291099) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-11498780042081900136576 : Rat) / 253528477699481291099) [(6, 1), (12, 1), (14, 2)],
  term ((-11498780042081900136576 : Rat) / 253528477699481291099) [(6, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 577 for generator 11. -/
theorem ep_Q2_002_partial_11_0577_valid :
    mulPoly ep_Q2_002_coefficient_11_0577
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0577 := by
  native_decide

/-- Coefficient term 578 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0578 : Poly :=
[
  term ((890420281792533454896960287657664579347232 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 578 for generator 11. -/
def ep_Q2_002_partial_11_0578 : Poly :=
[
  term ((1780840563585066909793920575315329158694464 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1780840563585066909793920575315329158694464 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((-890420281792533454896960287657664579347232 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-890420281792533454896960287657664579347232 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 578 for generator 11. -/
theorem ep_Q2_002_partial_11_0578_valid :
    mulPoly ep_Q2_002_coefficient_11_0578
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0578 := by
  native_decide

/-- Coefficient term 579 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0579 : Poly :=
[
  term ((46941632816 : Rat) / 7401317245) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 579 for generator 11. -/
def ep_Q2_002_partial_11_0579 : Poly :=
[
  term ((93883265632 : Rat) / 7401317245) [(2, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((93883265632 : Rat) / 7401317245) [(3, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-46941632816 : Rat) / 7401317245) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-46941632816 : Rat) / 7401317245) [(6, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 579 for generator 11. -/
theorem ep_Q2_002_partial_11_0579_valid :
    mulPoly ep_Q2_002_coefficient_11_0579
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0579 := by
  native_decide

/-- Coefficient term 580 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0580 : Poly :=
[
  term ((62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(6, 1), (12, 1), (13, 2)]
]

/-- Partial product 580 for generator 11. -/
def ep_Q2_002_partial_11_0580 : Poly :=
[
  term ((124033177824554903377887272307456 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (12, 1), (13, 2), (14, 1)],
  term ((124033177824554903377887272307456 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (12, 1), (13, 2), (15, 1)],
  term ((-62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(6, 1), (12, 1), (13, 2), (14, 2)],
  term ((-62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(6, 1), (12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 580 for generator 11. -/
theorem ep_Q2_002_partial_11_0580_valid :
    mulPoly ep_Q2_002_coefficient_11_0580
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0580 := by
  native_decide

/-- Coefficient term 581 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0581 : Poly :=
[
  term ((-456765211820565639494823990551841343406736 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (12, 1), (15, 2)]
]

/-- Partial product 581 for generator 11. -/
def ep_Q2_002_partial_11_0581 : Poly :=
[
  term ((-913530423641131278989647981103682686813472 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-913530423641131278989647981103682686813472 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (12, 1), (15, 3)],
  term ((456765211820565639494823990551841343406736 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (12, 1), (14, 2), (15, 2)],
  term ((456765211820565639494823990551841343406736 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 581 for generator 11. -/
theorem ep_Q2_002_partial_11_0581_valid :
    mulPoly ep_Q2_002_coefficient_11_0581
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0581 := by
  native_decide

/-- Coefficient term 582 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0582 : Poly :=
[
  term ((-22585865648 : Rat) / 7401317245) [(6, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 582 for generator 11. -/
def ep_Q2_002_partial_11_0582 : Poly :=
[
  term ((-45171731296 : Rat) / 7401317245) [(2, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-45171731296 : Rat) / 7401317245) [(3, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((22585865648 : Rat) / 7401317245) [(6, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((22585865648 : Rat) / 7401317245) [(6, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 582 for generator 11. -/
theorem ep_Q2_002_partial_11_0582_valid :
    mulPoly ep_Q2_002_coefficient_11_0582
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0582 := by
  native_decide

/-- Coefficient term 583 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0583 : Poly :=
[
  term ((1315003558913313363322957670623466069175408 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 583 for generator 11. -/
def ep_Q2_002_partial_11_0583 : Poly :=
[
  term ((2630007117826626726645915341246932138350816 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (13, 1), (14, 2), (15, 1)],
  term ((2630007117826626726645915341246932138350816 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1315003558913313363322957670623466069175408 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (13, 1), (14, 1), (15, 3)],
  term ((-1315003558913313363322957670623466069175408 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 583 for generator 11. -/
theorem ep_Q2_002_partial_11_0583_valid :
    mulPoly ep_Q2_002_coefficient_11_0583
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0583 := by
  native_decide

/-- Coefficient term 584 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0584 : Poly :=
[
  term ((84302278024 : Rat) / 7401317245) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 584 for generator 11. -/
def ep_Q2_002_partial_11_0584 : Poly :=
[
  term ((168604556048 : Rat) / 7401317245) [(2, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((168604556048 : Rat) / 7401317245) [(3, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-84302278024 : Rat) / 7401317245) [(6, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-84302278024 : Rat) / 7401317245) [(6, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 584 for generator 11. -/
theorem ep_Q2_002_partial_11_0584_valid :
    mulPoly ep_Q2_002_coefficient_11_0584
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0584 := by
  native_decide

/-- Coefficient term 585 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0585 : Poly :=
[
  term ((483005964041192642682014178510456003513336 : Rat) / 269363643504064505317229453910785233499) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 585 for generator 11. -/
def ep_Q2_002_partial_11_0585 : Poly :=
[
  term ((966011928082385285364028357020912007026672 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((966011928082385285364028357020912007026672 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((-483005964041192642682014178510456003513336 : Rat) / 269363643504064505317229453910785233499) [(6, 1), (13, 1), (14, 2), (15, 1)],
  term ((-483005964041192642682014178510456003513336 : Rat) / 269363643504064505317229453910785233499) [(6, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 585 for generator 11. -/
theorem ep_Q2_002_partial_11_0585_valid :
    mulPoly ep_Q2_002_coefficient_11_0585
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0585 := by
  native_decide

/-- Coefficient term 586 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0586 : Poly :=
[
  term ((23291744062 : Rat) / 1480263449) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 586 for generator 11. -/
def ep_Q2_002_partial_11_0586 : Poly :=
[
  term ((46583488124 : Rat) / 1480263449) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((46583488124 : Rat) / 1480263449) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-23291744062 : Rat) / 1480263449) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-23291744062 : Rat) / 1480263449) [(6, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 586 for generator 11. -/
theorem ep_Q2_002_partial_11_0586_valid :
    mulPoly ep_Q2_002_coefficient_11_0586
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0586 := by
  native_decide

/-- Coefficient term 587 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0587 : Poly :=
[
  term ((171729842411289578629517053682688 : Rat) / 1273790490336191187829975377157) [(6, 1), (13, 2)]
]

/-- Partial product 587 for generator 11. -/
def ep_Q2_002_partial_11_0587 : Poly :=
[
  term ((343459684822579157259034107365376 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (13, 2), (14, 1)],
  term ((343459684822579157259034107365376 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 2), (15, 1)],
  term ((-171729842411289578629517053682688 : Rat) / 1273790490336191187829975377157) [(6, 1), (13, 2), (14, 2)],
  term ((-171729842411289578629517053682688 : Rat) / 1273790490336191187829975377157) [(6, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 587 for generator 11. -/
theorem ep_Q2_002_partial_11_0587_valid :
    mulPoly ep_Q2_002_coefficient_11_0587
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0587 := by
  native_decide

/-- Coefficient term 588 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0588 : Poly :=
[
  term ((141426019208088814884183646354368 : Rat) / 1273790490336191187829975377157) [(6, 1), (13, 2), (14, 1)]
]

/-- Partial product 588 for generator 11. -/
def ep_Q2_002_partial_11_0588 : Poly :=
[
  term ((282852038416177629768367292708736 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (13, 2), (14, 2)],
  term ((282852038416177629768367292708736 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 2), (14, 1), (15, 1)],
  term ((-141426019208088814884183646354368 : Rat) / 1273790490336191187829975377157) [(6, 1), (13, 2), (14, 1), (15, 2)],
  term ((-141426019208088814884183646354368 : Rat) / 1273790490336191187829975377157) [(6, 1), (13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 588 for generator 11. -/
theorem ep_Q2_002_partial_11_0588_valid :
    mulPoly ep_Q2_002_coefficient_11_0588
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0588 := by
  native_decide

/-- Coefficient term 589 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0589 : Poly :=
[
  term ((811682167338558965020912945126896575859848 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (15, 2)]
]

/-- Partial product 589 for generator 11. -/
def ep_Q2_002_partial_11_0589 : Poly :=
[
  term ((1623364334677117930041825890253793151719696 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (14, 1), (15, 2)],
  term ((1623364334677117930041825890253793151719696 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (15, 3)],
  term ((-811682167338558965020912945126896575859848 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (14, 2), (15, 2)],
  term ((-811682167338558965020912945126896575859848 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 589 for generator 11. -/
theorem ep_Q2_002_partial_11_0589_valid :
    mulPoly ep_Q2_002_coefficient_11_0589
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0589 := by
  native_decide

/-- Coefficient term 590 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0590 : Poly :=
[
  term ((114371466834 : Rat) / 7401317245) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 590 for generator 11. -/
def ep_Q2_002_partial_11_0590 : Poly :=
[
  term ((228742933668 : Rat) / 7401317245) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((228742933668 : Rat) / 7401317245) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-114371466834 : Rat) / 7401317245) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-114371466834 : Rat) / 7401317245) [(6, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 590 for generator 11. -/
theorem ep_Q2_002_partial_11_0590_valid :
    mulPoly ep_Q2_002_coefficient_11_0590
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0590 := by
  native_decide

/-- Coefficient term 591 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0591 : Poly :=
[
  term ((5749390021040950068288 : Rat) / 253528477699481291099) [(6, 2)]
]

/-- Partial product 591 for generator 11. -/
def ep_Q2_002_partial_11_0591 : Poly :=
[
  term ((11498780042081900136576 : Rat) / 253528477699481291099) [(2, 1), (6, 2), (14, 1)],
  term ((11498780042081900136576 : Rat) / 253528477699481291099) [(3, 1), (6, 2), (15, 1)],
  term ((-5749390021040950068288 : Rat) / 253528477699481291099) [(6, 2), (14, 2)],
  term ((-5749390021040950068288 : Rat) / 253528477699481291099) [(6, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 591 for generator 11. -/
theorem ep_Q2_002_partial_11_0591_valid :
    mulPoly ep_Q2_002_coefficient_11_0591
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0591 := by
  native_decide

/-- Coefficient term 592 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0592 : Poly :=
[
  term ((-5749390021040950068288 : Rat) / 253528477699481291099) [(6, 2), (12, 1)]
]

/-- Partial product 592 for generator 11. -/
def ep_Q2_002_partial_11_0592 : Poly :=
[
  term ((-11498780042081900136576 : Rat) / 253528477699481291099) [(2, 1), (6, 2), (12, 1), (14, 1)],
  term ((-11498780042081900136576 : Rat) / 253528477699481291099) [(3, 1), (6, 2), (12, 1), (15, 1)],
  term ((5749390021040950068288 : Rat) / 253528477699481291099) [(6, 2), (12, 1), (14, 2)],
  term ((5749390021040950068288 : Rat) / 253528477699481291099) [(6, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 592 for generator 11. -/
theorem ep_Q2_002_partial_11_0592_valid :
    mulPoly ep_Q2_002_coefficient_11_0592
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0592 := by
  native_decide

/-- Coefficient term 593 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0593 : Poly :=
[
  term ((295587533989113802567154471616840 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (11, 1)]
]

/-- Partial product 593 for generator 11. -/
def ep_Q2_002_partial_11_0593 : Poly :=
[
  term ((591175067978227605134308943233680 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 1)],
  term ((591175067978227605134308943233680 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-295587533989113802567154471616840 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (11, 1), (14, 2)],
  term ((-295587533989113802567154471616840 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 593 for generator 11. -/
theorem ep_Q2_002_partial_11_0593_valid :
    mulPoly ep_Q2_002_coefficient_11_0593
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0593 := by
  native_decide

/-- Coefficient term 594 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0594 : Poly :=
[
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 594 for generator 11. -/
def ep_Q2_002_partial_11_0594 : Poly :=
[
  term ((18883428757537279104465615389952 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 2)],
  term ((18883428757537279104465615389952 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 594 for generator 11. -/
theorem ep_Q2_002_partial_11_0594_valid :
    mulPoly ep_Q2_002_coefficient_11_0594
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0594 := by
  native_decide

/-- Coefficient term 595 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0595 : Poly :=
[
  term ((-556646681711508671478838048469280 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 595 for generator 11. -/
def ep_Q2_002_partial_11_0595 : Poly :=
[
  term ((-1113293363423017342957676096938560 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term ((-1113293363423017342957676096938560 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((556646681711508671478838048469280 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (13, 1), (14, 2)],
  term ((556646681711508671478838048469280 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 595 for generator 11. -/
theorem ep_Q2_002_partial_11_0595_valid :
    mulPoly ep_Q2_002_coefficient_11_0595
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0595 := by
  native_decide

/-- Coefficient term 596 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0596 : Poly :=
[
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 596 for generator 11. -/
def ep_Q2_002_partial_11_0596 : Poly :=
[
  term ((-35561032684165658617483415491584 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 2)],
  term ((-35561032684165658617483415491584 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 596 for generator 11. -/
theorem ep_Q2_002_partial_11_0596_valid :
    mulPoly ep_Q2_002_coefficient_11_0596
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0596 := by
  native_decide

/-- Coefficient term 597 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0597 : Poly :=
[
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 597 for generator 11. -/
def ep_Q2_002_partial_11_0597 : Poly :=
[
  term ((-323901080336658865494306385796609834091072 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (8, 1), (14, 2), (15, 1)],
  term ((-323901080336658865494306385796609834091072 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (8, 1), (14, 1), (15, 2)],
  term ((161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (14, 1), (15, 3)],
  term ((161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 597 for generator 11. -/
theorem ep_Q2_002_partial_11_0597_valid :
    mulPoly ep_Q2_002_coefficient_11_0597
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0597 := by
  native_decide

/-- Coefficient term 598 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0598 : Poly :=
[
  term ((-10542029528 : Rat) / 7401317245) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 598 for generator 11. -/
def ep_Q2_002_partial_11_0598 : Poly :=
[
  term ((-21084059056 : Rat) / 7401317245) [(2, 1), (7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-21084059056 : Rat) / 7401317245) [(3, 1), (7, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((10542029528 : Rat) / 7401317245) [(7, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((10542029528 : Rat) / 7401317245) [(7, 1), (8, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 598 for generator 11. -/
theorem ep_Q2_002_partial_11_0598_valid :
    mulPoly ep_Q2_002_coefficient_11_0598
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0598 := by
  native_decide

/-- Coefficient term 599 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0599 : Poly :=
[
  term ((723397275157324975907918344420235392319904 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 599 for generator 11. -/
def ep_Q2_002_partial_11_0599 : Poly :=
[
  term ((1446794550314649951815836688840470784639808 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((1446794550314649951815836688840470784639808 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (8, 1), (15, 2)],
  term ((-723397275157324975907918344420235392319904 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (14, 2), (15, 1)],
  term ((-723397275157324975907918344420235392319904 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 599 for generator 11. -/
theorem ep_Q2_002_partial_11_0599_valid :
    mulPoly ep_Q2_002_coefficient_11_0599
        ep_Q2_002_generator_11_0500_0599 =
      ep_Q2_002_partial_11_0599 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_11_0500_0599 : List Poly :=
[
  ep_Q2_002_partial_11_0500,
  ep_Q2_002_partial_11_0501,
  ep_Q2_002_partial_11_0502,
  ep_Q2_002_partial_11_0503,
  ep_Q2_002_partial_11_0504,
  ep_Q2_002_partial_11_0505,
  ep_Q2_002_partial_11_0506,
  ep_Q2_002_partial_11_0507,
  ep_Q2_002_partial_11_0508,
  ep_Q2_002_partial_11_0509,
  ep_Q2_002_partial_11_0510,
  ep_Q2_002_partial_11_0511,
  ep_Q2_002_partial_11_0512,
  ep_Q2_002_partial_11_0513,
  ep_Q2_002_partial_11_0514,
  ep_Q2_002_partial_11_0515,
  ep_Q2_002_partial_11_0516,
  ep_Q2_002_partial_11_0517,
  ep_Q2_002_partial_11_0518,
  ep_Q2_002_partial_11_0519,
  ep_Q2_002_partial_11_0520,
  ep_Q2_002_partial_11_0521,
  ep_Q2_002_partial_11_0522,
  ep_Q2_002_partial_11_0523,
  ep_Q2_002_partial_11_0524,
  ep_Q2_002_partial_11_0525,
  ep_Q2_002_partial_11_0526,
  ep_Q2_002_partial_11_0527,
  ep_Q2_002_partial_11_0528,
  ep_Q2_002_partial_11_0529,
  ep_Q2_002_partial_11_0530,
  ep_Q2_002_partial_11_0531,
  ep_Q2_002_partial_11_0532,
  ep_Q2_002_partial_11_0533,
  ep_Q2_002_partial_11_0534,
  ep_Q2_002_partial_11_0535,
  ep_Q2_002_partial_11_0536,
  ep_Q2_002_partial_11_0537,
  ep_Q2_002_partial_11_0538,
  ep_Q2_002_partial_11_0539,
  ep_Q2_002_partial_11_0540,
  ep_Q2_002_partial_11_0541,
  ep_Q2_002_partial_11_0542,
  ep_Q2_002_partial_11_0543,
  ep_Q2_002_partial_11_0544,
  ep_Q2_002_partial_11_0545,
  ep_Q2_002_partial_11_0546,
  ep_Q2_002_partial_11_0547,
  ep_Q2_002_partial_11_0548,
  ep_Q2_002_partial_11_0549,
  ep_Q2_002_partial_11_0550,
  ep_Q2_002_partial_11_0551,
  ep_Q2_002_partial_11_0552,
  ep_Q2_002_partial_11_0553,
  ep_Q2_002_partial_11_0554,
  ep_Q2_002_partial_11_0555,
  ep_Q2_002_partial_11_0556,
  ep_Q2_002_partial_11_0557,
  ep_Q2_002_partial_11_0558,
  ep_Q2_002_partial_11_0559,
  ep_Q2_002_partial_11_0560,
  ep_Q2_002_partial_11_0561,
  ep_Q2_002_partial_11_0562,
  ep_Q2_002_partial_11_0563,
  ep_Q2_002_partial_11_0564,
  ep_Q2_002_partial_11_0565,
  ep_Q2_002_partial_11_0566,
  ep_Q2_002_partial_11_0567,
  ep_Q2_002_partial_11_0568,
  ep_Q2_002_partial_11_0569,
  ep_Q2_002_partial_11_0570,
  ep_Q2_002_partial_11_0571,
  ep_Q2_002_partial_11_0572,
  ep_Q2_002_partial_11_0573,
  ep_Q2_002_partial_11_0574,
  ep_Q2_002_partial_11_0575,
  ep_Q2_002_partial_11_0576,
  ep_Q2_002_partial_11_0577,
  ep_Q2_002_partial_11_0578,
  ep_Q2_002_partial_11_0579,
  ep_Q2_002_partial_11_0580,
  ep_Q2_002_partial_11_0581,
  ep_Q2_002_partial_11_0582,
  ep_Q2_002_partial_11_0583,
  ep_Q2_002_partial_11_0584,
  ep_Q2_002_partial_11_0585,
  ep_Q2_002_partial_11_0586,
  ep_Q2_002_partial_11_0587,
  ep_Q2_002_partial_11_0588,
  ep_Q2_002_partial_11_0589,
  ep_Q2_002_partial_11_0590,
  ep_Q2_002_partial_11_0591,
  ep_Q2_002_partial_11_0592,
  ep_Q2_002_partial_11_0593,
  ep_Q2_002_partial_11_0594,
  ep_Q2_002_partial_11_0595,
  ep_Q2_002_partial_11_0596,
  ep_Q2_002_partial_11_0597,
  ep_Q2_002_partial_11_0598,
  ep_Q2_002_partial_11_0599
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_11_0500_0599 : Poly :=
[
  term ((135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((-255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (7, 1), (14, 1), (15, 2)],
  term ((-176342490026 : Rat) / 22203951735) [(2, 1), (5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 2), (11, 1), (14, 1)],
  term ((767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 2), (13, 1), (14, 1)],
  term ((-3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (7, 2), (14, 1), (15, 1)],
  term ((176342490026 : Rat) / 7401317245) [(2, 1), (5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-70009733193456992020180447445856 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((-14162571568152959328349211542464 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (8, 1), (11, 1), (14, 1)],
  term ((131841438452141049047629271866752 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((26216078969019318766629871418448579110736 : Rat) / 103601401347717117429703636119532782115) [(2, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((52412417964 : Rat) / 7401317245) [(2, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((26670774513124243963112561618688 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (8, 1), (13, 1), (14, 1)],
  term ((242925810252494149120729789347457375568304 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((15813044292 : Rat) / 7401317245) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (9, 1), (14, 1), (15, 2)],
  term ((-65009381712 : Rat) / 7401317245) [(2, 1), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-184585582554610638231159824454120 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-125046845046648233984822864079168 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 2)],
  term ((143371853925098810212428228575784 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1), (12, 2), (14, 1)],
  term ((-25121607226488502102845350446176 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-180585108237713723538184768273794 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1), (14, 1)],
  term ((-30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1), (14, 1), (15, 2)],
  term ((-84755820552006021027582245125860 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1), (14, 2)],
  term ((347609219624917937948490907739040 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((235486626970789296303418248627456 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 2)],
  term ((-291380852664047777286168709402014751622652 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((15544740935 : Rat) / 1480263449) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((54596813688829660254282311535600859116288 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (5, 1), (12, 1), (14, 2), (15, 1)],
  term ((2487323152 : Rat) / 211466207) [(2, 1), (5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-269996050446337912635887820244128 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (12, 2), (13, 1), (14, 1)],
  term ((1397783652909974648009941616571108605306256 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (12, 2), (14, 1), (15, 1)],
  term ((-53748272602 : Rat) / 7401317245) [(2, 1), (5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((340075577310168647245615612791048 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (13, 1), (14, 1)],
  term ((-129529856802490436049129912003349464992448 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (5, 1), (13, 1), (14, 1), (15, 2)],
  term ((-25070020104 : Rat) / 7401317245) [(2, 1), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((159611082474634395557309020959120 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (13, 1), (14, 2)],
  term ((47308690976121114477033150456192 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1044961440097287627747046260506150748034047 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (5, 1), (14, 1), (15, 1)],
  term ((-2871744143 : Rat) / 845864828) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (14, 1), (15, 3)],
  term ((316951406728 : Rat) / 22203951735) [(2, 1), (5, 1), (14, 1), (15, 3), (16, 1)],
  term ((345166802867869292412331774262339074669818 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (14, 2), (15, 1)],
  term ((18130035309 : Rat) / 2114662070) [(2, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(2, 1), (5, 2), (7, 1), (11, 1), (14, 1)],
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(2, 1), (5, 2), (7, 1), (13, 1), (14, 1)],
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (5, 2), (7, 1), (14, 1), (15, 1)],
  term ((381790635174 : Rat) / 7401317245) [(2, 1), (5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 2), (11, 1), (14, 1), (15, 1)],
  term ((110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 2), (13, 1), (14, 1), (15, 1)],
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (5, 2), (14, 1), (15, 2)],
  term ((-15565557134 : Rat) / 4440790347) [(2, 1), (5, 2), (14, 1), (15, 2), (16, 1)],
  term ((-101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (7, 1), (11, 1), (14, 1)],
  term ((181060067082453701866853616509904 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-806462358816915426603088141137523968119442 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((88171245013 : Rat) / 14802634490) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18883428757537279104465615389952 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((35561032684165658617483415491584 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((323901080336658865494306385796609834091072 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (8, 1), (14, 1), (15, 2)],
  term ((21084059056 : Rat) / 7401317245) [(2, 1), (6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-377874115120535407182106311125952 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (9, 1), (11, 1), (14, 1)],
  term ((711607723938267847128108311203584 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((1664366052789200688805644368522339506528224 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((287843639232 : Rat) / 7401317245) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-160537534955172602028036783656640 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1778342474225894469614260508145171733000704 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-81575113112 : Rat) / 7401317245) [(2, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-247697145868496211759195460636416 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-150198571672368315021157098007008 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 2)],
  term ((126605213405431300508279338469754765536832 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1828423392 : Rat) / 1057331035) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((50273333852208583139179584374016 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (11, 2), (12, 1), (14, 1)],
  term ((34683235170754012192304579628864 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (11, 2), (14, 1)],
  term ((1780840563585066909793920575315329158694464 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((93883265632 : Rat) / 7401317245) [(2, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((124033177824554903377887272307456 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (12, 1), (13, 2), (14, 1)],
  term ((22997560084163800273152 : Rat) / 253528477699481291099) [(2, 1), (6, 1), (12, 1), (14, 1)],
  term ((-913530423641131278989647981103682686813472 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-45171731296 : Rat) / 7401317245) [(2, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((966011928082385285364028357020912007026672 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((46583488124 : Rat) / 1480263449) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2630007117826626726645915341246932138350816 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (13, 1), (14, 2), (15, 1)],
  term ((168604556048 : Rat) / 7401317245) [(2, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((343459684822579157259034107365376 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (13, 2), (14, 1)],
  term ((282852038416177629768367292708736 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (13, 2), (14, 2)],
  term ((-20581546365247557888672 : Rat) / 253528477699481291099) [(2, 1), (6, 1), (14, 1)],
  term ((1623364334677117930041825890253793151719696 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (14, 1), (15, 2)],
  term ((228742933668 : Rat) / 7401317245) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11498780042081900136576 : Rat) / 253528477699481291099) [(2, 1), (6, 2), (12, 1), (14, 1)],
  term ((11498780042081900136576 : Rat) / 253528477699481291099) [(2, 1), (6, 2), (14, 1)],
  term ((591175067978227605134308943233680 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 1)],
  term ((18883428757537279104465615389952 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 2)],
  term ((-1113293363423017342957676096938560 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term ((-35561032684165658617483415491584 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 2)],
  term ((1446794550314649951815836688840470784639808 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-323901080336658865494306385796609834091072 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (8, 1), (14, 2), (15, 1)],
  term ((-21084059056 : Rat) / 7401317245) [(2, 1), (7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (11, 1), (15, 2)],
  term ((-255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2)],
  term ((1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (7, 1), (15, 3)],
  term ((-176342490026 : Rat) / 22203951735) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((-407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 2), (11, 1), (15, 1)],
  term ((767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1)],
  term ((-3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (7, 2), (15, 2)],
  term ((176342490026 : Rat) / 7401317245) [(3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((-70009733193456992020180447445856 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-14162571568152959328349211542464 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1)],
  term ((131841438452141049047629271866752 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((26216078969019318766629871418448579110736 : Rat) / 103601401347717117429703636119532782115) [(3, 1), (5, 1), (8, 1), (12, 1), (15, 2)],
  term ((52412417964 : Rat) / 7401317245) [(3, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((26670774513124243963112561618688 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1)],
  term ((242925810252494149120729789347457375568304 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (8, 1), (15, 2)],
  term ((15813044292 : Rat) / 7401317245) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2)],
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2)],
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (9, 1), (15, 3)],
  term ((-65009381712 : Rat) / 7401317245) [(3, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((-125046845046648233984822864079168 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-184585582554610638231159824454120 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((143371853925098810212428228575784 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 1), (12, 2), (15, 1)],
  term ((-25121607226488502102845350446176 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2)],
  term ((-84755820552006021027582245125860 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((-180585108237713723538184768273794 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 1), (15, 1)],
  term ((-30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 1), (15, 3)],
  term ((235486626970789296303418248627456 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((347609219624917937948490907739040 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((54596813688829660254282311535600859116288 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 1), (12, 1), (14, 1), (15, 2)],
  term ((2487323152 : Rat) / 211466207) [(3, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-291380852664047777286168709402014751622652 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 1), (12, 1), (15, 2)],
  term ((15544740935 : Rat) / 1480263449) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-269996050446337912635887820244128 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (12, 2), (13, 1), (15, 1)],
  term ((1397783652909974648009941616571108605306256 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (12, 2), (15, 2)],
  term ((-53748272602 : Rat) / 7401317245) [(3, 1), (5, 1), (12, 2), (15, 2), (16, 1)],
  term ((159611082474634395557309020959120 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((340075577310168647245615612791048 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-129529856802490436049129912003349464992448 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 1), (13, 1), (15, 3)],
  term ((-25070020104 : Rat) / 7401317245) [(3, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((47308690976121114477033150456192 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (13, 2), (15, 2)],
  term ((345166802867869292412331774262339074669818 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((18130035309 : Rat) / 2114662070) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1044961440097287627747046260506150748034047 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 1), (15, 2)],
  term ((-2871744143 : Rat) / 845864828) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (15, 4)],
  term ((316951406728 : Rat) / 22203951735) [(3, 1), (5, 1), (15, 4), (16, 1)],
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 2), (7, 1), (11, 1), (15, 1)],
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 2), (7, 1), (13, 1), (15, 1)],
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 2), (7, 1), (15, 2)],
  term ((381790635174 : Rat) / 7401317245) [(3, 1), (5, 2), (7, 1), (15, 2), (16, 1)],
  term ((-58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (11, 1), (15, 2)],
  term ((110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (13, 1), (15, 2)],
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 2), (15, 3)],
  term ((-15565557134 : Rat) / 4440790347) [(3, 1), (5, 2), (15, 3), (16, 1)],
  term ((-101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((181060067082453701866853616509904 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((-806462358816915426603088141137523968119442 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (7, 1), (15, 2)],
  term ((88171245013 : Rat) / 14802634490) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-18883428757537279104465615389952 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (11, 1), (15, 2)],
  term ((35561032684165658617483415491584 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((323901080336658865494306385796609834091072 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (8, 1), (15, 3)],
  term ((21084059056 : Rat) / 7401317245) [(3, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((-377874115120535407182106311125952 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((711607723938267847128108311203584 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((1664366052789200688805644368522339506528224 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (9, 1), (15, 2)],
  term ((287843639232 : Rat) / 7401317245) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-160537534955172602028036783656640 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1778342474225894469614260508145171733000704 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (11, 1), (12, 1), (15, 2)],
  term ((-81575113112 : Rat) / 7401317245) [(3, 1), (6, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-150198571672368315021157098007008 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-247697145868496211759195460636416 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((126605213405431300508279338469754765536832 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (11, 1), (15, 2)],
  term ((-1828423392 : Rat) / 1057331035) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((50273333852208583139179584374016 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((34683235170754012192304579628864 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 2), (15, 1)],
  term ((1780840563585066909793920575315329158694464 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((93883265632 : Rat) / 7401317245) [(3, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((124033177824554903377887272307456 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (12, 1), (13, 2), (15, 1)],
  term ((22997560084163800273152 : Rat) / 253528477699481291099) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-913530423641131278989647981103682686813472 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (12, 1), (15, 3)],
  term ((-45171731296 : Rat) / 7401317245) [(3, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((2630007117826626726645915341246932138350816 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((168604556048 : Rat) / 7401317245) [(3, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((966011928082385285364028357020912007026672 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((46583488124 : Rat) / 1480263449) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((282852038416177629768367292708736 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 2), (14, 1), (15, 1)],
  term ((343459684822579157259034107365376 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 2), (15, 1)],
  term ((-20581546365247557888672 : Rat) / 253528477699481291099) [(3, 1), (6, 1), (15, 1)],
  term ((1623364334677117930041825890253793151719696 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (15, 3)],
  term ((228742933668 : Rat) / 7401317245) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-11498780042081900136576 : Rat) / 253528477699481291099) [(3, 1), (6, 2), (12, 1), (15, 1)],
  term ((11498780042081900136576 : Rat) / 253528477699481291099) [(3, 1), (6, 2), (15, 1)],
  term ((18883428757537279104465615389952 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((591175067978227605134308943233680 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-35561032684165658617483415491584 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1113293363423017342957676096938560 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-323901080336658865494306385796609834091072 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (8, 1), (14, 1), (15, 2)],
  term ((-21084059056 : Rat) / 7401317245) [(3, 1), (7, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((1446794550314649951815836688840470784639808 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (8, 1), (15, 2)],
  term ((-67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (11, 1), (14, 2), (15, 1)],
  term ((-67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (11, 1), (15, 3)],
  term ((127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (13, 1), (15, 3)],
  term ((-532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (14, 2), (15, 2)],
  term ((88171245013 : Rat) / 22203951735) [(5, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((-532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (15, 4)],
  term ((88171245013 : Rat) / 22203951735) [(5, 1), (7, 1), (15, 4), (16, 1)],
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 2), (11, 1), (14, 2)],
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 2), (11, 1), (15, 2)],
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 2), (13, 1), (14, 2)],
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 2), (13, 1), (15, 2)],
  term ((1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 2), (14, 2), (15, 1)],
  term ((-88171245013 : Rat) / 7401317245) [(5, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 2), (15, 3)],
  term ((-88171245013 : Rat) / 7401317245) [(5, 1), (7, 2), (15, 3), (16, 1)],
  term ((35004866596728496010090223722928 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 2)],
  term ((35004866596728496010090223722928 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((7081285784076479664174605771232 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 1), (14, 2)],
  term ((7081285784076479664174605771232 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 1), (15, 2)],
  term ((-65920719226070524523814635933376 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 2)],
  term ((-65920719226070524523814635933376 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-13108039484509659383314935709224289555368 : Rat) / 103601401347717117429703636119532782115) [(5, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-26206208982 : Rat) / 7401317245) [(5, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-13108039484509659383314935709224289555368 : Rat) / 103601401347717117429703636119532782115) [(5, 1), (8, 1), (12, 1), (15, 3)],
  term ((-26206208982 : Rat) / 7401317245) [(5, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-13335387256562121981556280809344 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (13, 1), (14, 2)],
  term ((-13335387256562121981556280809344 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (13, 1), (15, 2)],
  term ((-121462905126247074560364894673728687784152 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (14, 2), (15, 1)],
  term ((-7906522146 : Rat) / 7401317245) [(5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-121462905126247074560364894673728687784152 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (15, 3)],
  term ((-7906522146 : Rat) / 7401317245) [(5, 1), (8, 1), (15, 3), (16, 1)],
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (11, 1), (15, 3)],
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (13, 1), (15, 3)],
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (9, 1), (14, 2), (15, 2)],
  term ((32504690856 : Rat) / 7401317245) [(5, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (9, 1), (15, 4)],
  term ((32504690856 : Rat) / 7401317245) [(5, 1), (9, 1), (15, 4), (16, 1)],
  term ((62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((92292791277305319115579912227060 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 1), (14, 2)],
  term ((62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 1), (14, 3)],
  term ((92292791277305319115579912227060 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((-71685926962549405106214114287892 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 2), (14, 2)],
  term ((-71685926962549405106214114287892 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 2), (15, 2)],
  term ((12560803613244251051422675223088 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((12560803613244251051422675223088 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (13, 1), (15, 3)],
  term ((42377910276003010513791122562930 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (14, 1), (15, 2)],
  term ((90292554118856861769092384136897 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (14, 2)],
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (14, 2), (15, 2)],
  term ((42377910276003010513791122562930 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (14, 3)],
  term ((90292554118856861769092384136897 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (15, 2)],
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (15, 4)],
  term ((-117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-173804609812458968974245453869520 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 1), (13, 1), (14, 2)],
  term ((-117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 1), (13, 1), (14, 3)],
  term ((-173804609812458968974245453869520 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 1), (13, 1), (15, 2)],
  term ((-27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (12, 1), (14, 1), (15, 3)],
  term ((-1243661576 : Rat) / 211466207) [(5, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((145690426332023888643084354701007375811326 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term ((-15544740935 : Rat) / 2960526898) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (12, 1), (14, 3), (15, 1)],
  term ((-1243661576 : Rat) / 211466207) [(5, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((145690426332023888643084354701007375811326 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (12, 1), (15, 3)],
  term ((-15544740935 : Rat) / 2960526898) [(5, 1), (12, 1), (15, 3), (16, 1)],
  term ((134998025223168956317943910122064 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 2), (13, 1), (14, 2)],
  term ((134998025223168956317943910122064 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 2), (13, 1), (15, 2)],
  term ((-698891826454987324004970808285554302653128 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (12, 2), (14, 2), (15, 1)],
  term ((26874136301 : Rat) / 7401317245) [(5, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-698891826454987324004970808285554302653128 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (12, 2), (15, 3)],
  term ((26874136301 : Rat) / 7401317245) [(5, 1), (12, 2), (15, 3), (16, 1)],
  term ((-79805541237317197778654510479560 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((-170037788655084323622807806395524 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1), (14, 2)],
  term ((64764928401245218024564956001674732496224 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (13, 1), (14, 2), (15, 2)],
  term ((12535010052 : Rat) / 7401317245) [(5, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-79805541237317197778654510479560 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1), (14, 3)],
  term ((-170037788655084323622807806395524 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1), (15, 2)],
  term ((64764928401245218024564956001674732496224 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (13, 1), (15, 4)],
  term ((12535010052 : Rat) / 7401317245) [(5, 1), (13, 1), (15, 4), (16, 1)],
  term ((-23654345488060557238516575228096 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 2), (14, 2), (15, 1)],
  term ((-23654345488060557238516575228096 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 2), (15, 3)],
  term ((-172583401433934646206165887131169537334909 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (14, 1), (15, 3)],
  term ((-18130035309 : Rat) / 4229324140) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((1044961440097287627747046260506150748034047 : Rat) / 538727287008129010634458907821570466998) [(5, 1), (14, 2), (15, 1)],
  term ((2871744143 : Rat) / 1691729656) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (14, 2), (15, 3)],
  term ((-158475703364 : Rat) / 22203951735) [(5, 1), (14, 2), (15, 3), (16, 1)],
  term ((-172583401433934646206165887131169537334909 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (14, 3), (15, 1)],
  term ((-18130035309 : Rat) / 4229324140) [(5, 1), (14, 3), (15, 1), (16, 1)],
  term ((1044961440097287627747046260506150748034047 : Rat) / 538727287008129010634458907821570466998) [(5, 1), (15, 3)],
  term ((2871744143 : Rat) / 1691729656) [(5, 1), (15, 3), (16, 1)],
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (15, 5)],
  term ((-158475703364 : Rat) / 22203951735) [(5, 1), (15, 5), (16, 1)],
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(5, 2), (7, 1), (11, 1), (14, 2)],
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(5, 2), (7, 1), (11, 1), (15, 2)],
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(5, 2), (7, 1), (13, 1), (14, 2)],
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(5, 2), (7, 1), (13, 1), (15, 2)],
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(5, 2), (7, 1), (14, 2), (15, 1)],
  term ((-190895317587 : Rat) / 7401317245) [(5, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(5, 2), (7, 1), (15, 3)],
  term ((-190895317587 : Rat) / 7401317245) [(5, 2), (7, 1), (15, 3), (16, 1)],
  term ((29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(5, 2), (11, 1), (14, 2), (15, 1)],
  term ((29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(5, 2), (11, 1), (15, 3)],
  term ((-55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(5, 2), (13, 1), (14, 2), (15, 1)],
  term ((-55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(5, 2), (13, 1), (15, 3)],
  term ((238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(5, 2), (14, 2), (15, 2)],
  term ((7782778567 : Rat) / 4440790347) [(5, 2), (14, 2), (15, 2), (16, 1)],
  term ((238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(5, 2), (15, 4)],
  term ((7782778567 : Rat) / 4440790347) [(5, 2), (15, 4), (16, 1)],
  term ((50927189676155065028444663861586 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (11, 1), (14, 2)],
  term ((50927189676155065028444663861586 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (11, 1), (15, 2)],
  term ((-90530033541226850933426808254952 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (13, 1), (14, 2)],
  term ((-90530033541226850933426808254952 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (13, 1), (15, 2)],
  term ((403231179408457713301544070568761984059721 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 1), (14, 2), (15, 1)],
  term ((-88171245013 : Rat) / 29605268980) [(6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((403231179408457713301544070568761984059721 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 1), (15, 3)],
  term ((-88171245013 : Rat) / 29605268980) [(6, 1), (7, 1), (15, 3), (16, 1)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (11, 1), (15, 3)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (13, 1), (15, 3)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (8, 1), (14, 2), (15, 2)],
  term ((-10542029528 : Rat) / 7401317245) [(6, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (8, 1), (15, 4)],
  term ((-10542029528 : Rat) / 7401317245) [(6, 1), (8, 1), (15, 4), (16, 1)],
  term ((188937057560267703591053155562976 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1), (14, 2)],
  term ((188937057560267703591053155562976 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1), (15, 2)],
  term ((-355803861969133923564054155601792 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (13, 1), (14, 2)],
  term ((-355803861969133923564054155601792 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (13, 1), (15, 2)],
  term ((-832183026394600344402822184261169753264112 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (9, 1), (14, 2), (15, 1)],
  term ((-143921819616 : Rat) / 7401317245) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-832183026394600344402822184261169753264112 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (9, 1), (15, 3)],
  term ((-143921819616 : Rat) / 7401317245) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term ((80268767477586301014018391828320 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((80268767477586301014018391828320 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((889171237112947234807130254072585866500352 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((40787556556 : Rat) / 7401317245) [(6, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((889171237112947234807130254072585866500352 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (12, 1), (15, 3)],
  term ((40787556556 : Rat) / 7401317245) [(6, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((75099285836184157510578549003504 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((123848572934248105879597730318208 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1), (14, 2)],
  term ((75099285836184157510578549003504 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1), (14, 3)],
  term ((123848572934248105879597730318208 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1), (15, 2)],
  term ((-63302606702715650254139669234877382768416 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (14, 2), (15, 1)],
  term ((914211696 : Rat) / 1057331035) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-63302606702715650254139669234877382768416 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (15, 3)],
  term ((914211696 : Rat) / 1057331035) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-25136666926104291569589792187008 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2), (12, 1), (14, 2)],
  term ((-25136666926104291569589792187008 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2), (12, 1), (15, 2)],
  term ((-17341617585377006096152289814432 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2), (14, 2)],
  term ((-17341617585377006096152289814432 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2), (15, 2)],
  term ((-890420281792533454896960287657664579347232 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-46941632816 : Rat) / 7401317245) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-890420281792533454896960287657664579347232 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (12, 1), (13, 1), (15, 3)],
  term ((-46941632816 : Rat) / 7401317245) [(6, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(6, 1), (12, 1), (13, 2), (14, 2)],
  term ((-62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(6, 1), (12, 1), (13, 2), (15, 2)],
  term ((-11498780042081900136576 : Rat) / 253528477699481291099) [(6, 1), (12, 1), (14, 2)],
  term ((456765211820565639494823990551841343406736 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (12, 1), (14, 2), (15, 2)],
  term ((22585865648 : Rat) / 7401317245) [(6, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-11498780042081900136576 : Rat) / 253528477699481291099) [(6, 1), (12, 1), (15, 2)],
  term ((456765211820565639494823990551841343406736 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (12, 1), (15, 4)],
  term ((22585865648 : Rat) / 7401317245) [(6, 1), (12, 1), (15, 4), (16, 1)],
  term ((-1315003558913313363322957670623466069175408 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (13, 1), (14, 1), (15, 3)],
  term ((-84302278024 : Rat) / 7401317245) [(6, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-483005964041192642682014178510456003513336 : Rat) / 269363643504064505317229453910785233499) [(6, 1), (13, 1), (14, 2), (15, 1)],
  term ((-23291744062 : Rat) / 1480263449) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1315003558913313363322957670623466069175408 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (13, 1), (14, 3), (15, 1)],
  term ((-84302278024 : Rat) / 7401317245) [(6, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-483005964041192642682014178510456003513336 : Rat) / 269363643504064505317229453910785233499) [(6, 1), (13, 1), (15, 3)],
  term ((-23291744062 : Rat) / 1480263449) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-141426019208088814884183646354368 : Rat) / 1273790490336191187829975377157) [(6, 1), (13, 2), (14, 1), (15, 2)],
  term ((-171729842411289578629517053682688 : Rat) / 1273790490336191187829975377157) [(6, 1), (13, 2), (14, 2)],
  term ((-141426019208088814884183646354368 : Rat) / 1273790490336191187829975377157) [(6, 1), (13, 2), (14, 3)],
  term ((-171729842411289578629517053682688 : Rat) / 1273790490336191187829975377157) [(6, 1), (13, 2), (15, 2)],
  term ((10290773182623778944336 : Rat) / 253528477699481291099) [(6, 1), (14, 2)],
  term ((-811682167338558965020912945126896575859848 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (14, 2), (15, 2)],
  term ((-114371466834 : Rat) / 7401317245) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((10290773182623778944336 : Rat) / 253528477699481291099) [(6, 1), (15, 2)],
  term ((-811682167338558965020912945126896575859848 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (15, 4)],
  term ((-114371466834 : Rat) / 7401317245) [(6, 1), (15, 4), (16, 1)],
  term ((5749390021040950068288 : Rat) / 253528477699481291099) [(6, 2), (12, 1), (14, 2)],
  term ((5749390021040950068288 : Rat) / 253528477699481291099) [(6, 2), (12, 1), (15, 2)],
  term ((-5749390021040950068288 : Rat) / 253528477699481291099) [(6, 2), (14, 2)],
  term ((-5749390021040950068288 : Rat) / 253528477699481291099) [(6, 2), (15, 2)],
  term ((-9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-295587533989113802567154471616840 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (11, 1), (14, 2)],
  term ((-9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (11, 1), (14, 3)],
  term ((-295587533989113802567154471616840 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (11, 1), (15, 2)],
  term ((17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((556646681711508671478838048469280 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (13, 1), (14, 2)],
  term ((17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (13, 1), (14, 3)],
  term ((556646681711508671478838048469280 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (13, 1), (15, 2)],
  term ((161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (14, 1), (15, 3)],
  term ((10542029528 : Rat) / 7401317245) [(7, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((-723397275157324975907918344420235392319904 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (14, 2), (15, 1)],
  term ((161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (14, 3), (15, 1)],
  term ((10542029528 : Rat) / 7401317245) [(7, 1), (8, 1), (14, 3), (15, 1), (16, 1)],
  term ((-723397275157324975907918344420235392319904 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 11, terms 500 through 599. -/
theorem ep_Q2_002_block_11_0500_0599_valid :
    checkProductSumEq ep_Q2_002_partials_11_0500_0599
      ep_Q2_002_block_11_0500_0599 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
