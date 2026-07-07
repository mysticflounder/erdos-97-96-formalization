/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 15:0-43

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 15 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 : Poly :=
[
  term (2 : Rat) [(4, 1), (8, 1)],
  term (2 : Rat) [(5, 1), (9, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0000 : Poly :=
[
  term ((-21520414173735833419018397448320238195528232698598169600 : Rat) / 2155526510388634287214594206068266543338254015229673617) []
]

/-- Partial product 0 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0000 : Poly :=
[
  term ((-43040828347471666838036794896640476391056465397196339200 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(4, 1), (8, 1)],
  term ((-43040828347471666838036794896640476391056465397196339200 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (9, 1)],
  term ((21520414173735833419018397448320238195528232698598169600 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(8, 2)],
  term ((21520414173735833419018397448320238195528232698598169600 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0000_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0000
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0001 : Poly :=
[
  term ((-623849826989641377903961867836959224622133344160 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1)]
]

/-- Partial product 1 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0001 : Poly :=
[
  term ((-1247699653979282755807923735673918449244266688320 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (4, 1), (8, 1)],
  term ((-1247699653979282755807923735673918449244266688320 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (5, 1), (9, 1)],
  term ((623849826989641377903961867836959224622133344160 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (8, 2)],
  term ((623849826989641377903961867836959224622133344160 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0001_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0001
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0002 : Poly :=
[
  term ((124578781761285597906 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 2 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0002 : Poly :=
[
  term ((249157563522571195812 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (4, 1), (8, 1), (16, 1)],
  term ((249157563522571195812 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (5, 1), (9, 1), (16, 1)],
  term ((-124578781761285597906 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (8, 2), (16, 1)],
  term ((-124578781761285597906 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0002_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0002
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0003 : Poly :=
[
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 1), (7, 1)]
]

/-- Partial product 3 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0003 : Poly :=
[
  term ((6298299106979896 : Rat) / 3146696864482101) [(1, 1), (4, 1), (7, 1), (8, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(1, 1), (5, 1), (7, 1), (9, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(1, 1), (7, 1), (8, 2)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(1, 1), (7, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0003_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0003
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0004 : Poly :=
[
  term ((-3149149553489948 : Rat) / 3146696864482101) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 4 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0004 : Poly :=
[
  term ((-6298299106979896 : Rat) / 3146696864482101) [(1, 1), (4, 1), (7, 1), (8, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 1), (7, 1), (8, 2), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 1), (7, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0004_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0004
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0005 : Poly :=
[
  term ((260190556922457152788683148624117172324146410061194803200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1)]
]

/-- Partial product 5 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0005 : Poly :=
[
  term ((520381113844914305577366297248234344648292820122389606400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (4, 1), (8, 1)],
  term ((520381113844914305577366297248234344648292820122389606400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (9, 1)],
  term ((-260190556922457152788683148624117172324146410061194803200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 2)],
  term ((-260190556922457152788683148624117172324146410061194803200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0005_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0005
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0006 : Poly :=
[
  term ((-3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1)]
]

/-- Partial product 6 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0006 : Poly :=
[
  term ((-7313458303040173439497620183015128319750460004725555200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 1)],
  term ((3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 2), (9, 1)],
  term ((3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 3)],
  term ((-7313458303040173439497620183015128319750460004725555200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0006_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0006
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0007 : Poly :=
[
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (5, 1), (11, 1)]
]

/-- Partial product 7 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0007 : Poly :=
[
  term ((-155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (4, 1), (5, 1), (8, 1), (11, 1)],
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (5, 1), (8, 2), (11, 1)],
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (5, 1), (9, 2), (11, 1)],
  term ((-155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (5, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0007_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0007
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0008 : Poly :=
[
  term ((20243650099046036202053121446473739677054221586352537600 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 8 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0008 : Poly :=
[
  term ((40487300198092072404106242892947479354108443172705075200 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (4, 1), (5, 1), (8, 1), (15, 1)],
  term ((-20243650099046036202053121446473739677054221586352537600 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 1), (8, 2), (15, 1)],
  term ((-20243650099046036202053121446473739677054221586352537600 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 1), (9, 2), (15, 1)],
  term ((40487300198092072404106242892947479354108443172705075200 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0008_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0008
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0009 : Poly :=
[
  term ((-3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2)]
]

/-- Partial product 9 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0009 : Poly :=
[
  term ((-7313458303040173439497620183015128319750460004725555200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (4, 1), (5, 2), (8, 1)],
  term ((3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (8, 2)],
  term ((3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (9, 2)],
  term ((-7313458303040173439497620183015128319750460004725555200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0009_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0009
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0010 : Poly :=
[
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (9, 1), (11, 1)]
]

/-- Partial product 10 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0010 : Poly :=
[
  term ((-155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (4, 1), (8, 1), (9, 1), (11, 1)],
  term ((-155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (5, 1), (9, 2), (11, 1)],
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 2), (9, 1), (11, 1)],
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0010_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0010
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0011 : Poly :=
[
  term ((130735363238761993255125419850793485259753861097379430400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 11 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0011 : Poly :=
[
  term ((261470726477523986510250839701586970519507722194758860800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((261470726477523986510250839701586970519507722194758860800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (9, 2), (15, 1)],
  term ((-130735363238761993255125419850793485259753861097379430400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 2), (9, 1), (15, 1)],
  term ((-130735363238761993255125419850793485259753861097379430400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0011_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0011
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0012 : Poly :=
[
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 12 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0012 : Poly :=
[
  term ((155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (4, 1), (8, 1), (11, 1), (15, 1)],
  term ((155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 2), (11, 1), (15, 1)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0012_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0012
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0013 : Poly :=
[
  term ((-130735363238761993255125419850793485259753861097379430400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (15, 2)]
]

/-- Partial product 13 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0013 : Poly :=
[
  term ((-261470726477523986510250839701586970519507722194758860800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (4, 1), (8, 1), (15, 2)],
  term ((-261470726477523986510250839701586970519507722194758860800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (9, 1), (15, 2)],
  term ((130735363238761993255125419850793485259753861097379430400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 2), (15, 2)],
  term ((130735363238761993255125419850793485259753861097379430400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0013_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0013
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0014 : Poly :=
[
  term ((-1390600260626461913546860281869789427074304226573516800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1)]
]

/-- Partial product 14 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0014 : Poly :=
[
  term ((-2781200521252923827093720563739578854148608453147033600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (5, 1), (8, 1)],
  term ((1390600260626461913546860281869789427074304226573516800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (8, 2)],
  term ((1390600260626461913546860281869789427074304226573516800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (9, 2)],
  term ((-2781200521252923827093720563739578854148608453147033600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0014_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0014
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0015 : Poly :=
[
  term ((-61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(3, 1), (9, 1)]
]

/-- Partial product 15 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0015 : Poly :=
[
  term ((-61383100868391460691624219863627756944791 : Rat) / 1099088193767998560228135227121272202375) [(3, 1), (4, 1), (8, 1), (9, 1)],
  term ((-61383100868391460691624219863627756944791 : Rat) / 1099088193767998560228135227121272202375) [(3, 1), (5, 1), (9, 2)],
  term ((61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(3, 1), (8, 2), (9, 1)],
  term ((61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(3, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0015_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0015
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0016 : Poly :=
[
  term ((939888877435502900184 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 16 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0016 : Poly :=
[
  term ((1879777754871005800368 : Rat) / 4339258264657398321155) [(3, 1), (4, 1), (8, 1), (9, 1), (16, 1)],
  term ((1879777754871005800368 : Rat) / 4339258264657398321155) [(3, 1), (5, 1), (9, 2), (16, 1)],
  term ((-939888877435502900184 : Rat) / 4339258264657398321155) [(3, 1), (8, 2), (9, 1), (16, 1)],
  term ((-939888877435502900184 : Rat) / 4339258264657398321155) [(3, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0016_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0016
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0017 : Poly :=
[
  term ((2502556732612094063506249009383283149495643800177066594686841004 : Rat) / 34299406372393745792878136016423515156901497292566177210440875) [(3, 1), (11, 1)]
]

/-- Partial product 17 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0017 : Poly :=
[
  term ((5005113465224188127012498018766566298991287600354133189373682008 : Rat) / 34299406372393745792878136016423515156901497292566177210440875) [(3, 1), (4, 1), (8, 1), (11, 1)],
  term ((5005113465224188127012498018766566298991287600354133189373682008 : Rat) / 34299406372393745792878136016423515156901497292566177210440875) [(3, 1), (5, 1), (9, 1), (11, 1)],
  term ((-2502556732612094063506249009383283149495643800177066594686841004 : Rat) / 34299406372393745792878136016423515156901497292566177210440875) [(3, 1), (8, 2), (11, 1)],
  term ((-2502556732612094063506249009383283149495643800177066594686841004 : Rat) / 34299406372393745792878136016423515156901497292566177210440875) [(3, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0017_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0017
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0018 : Poly :=
[
  term ((-710404331989467160224 : Rat) / 619894037808199760165) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 18 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0018 : Poly :=
[
  term ((-1420808663978934320448 : Rat) / 619894037808199760165) [(3, 1), (4, 1), (8, 1), (11, 1), (16, 1)],
  term ((-1420808663978934320448 : Rat) / 619894037808199760165) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((710404331989467160224 : Rat) / 619894037808199760165) [(3, 1), (8, 2), (11, 1), (16, 1)],
  term ((710404331989467160224 : Rat) / 619894037808199760165) [(3, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0018_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0018
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0019 : Poly :=
[
  term ((16953416082580275643572419449435657933481 : Rat) / 263781166504319654454752454509105328570) [(3, 1), (13, 1)]
]

/-- Partial product 19 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0019 : Poly :=
[
  term ((16953416082580275643572419449435657933481 : Rat) / 131890583252159827227376227254552664285) [(3, 1), (4, 1), (8, 1), (13, 1)],
  term ((16953416082580275643572419449435657933481 : Rat) / 131890583252159827227376227254552664285) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-16953416082580275643572419449435657933481 : Rat) / 263781166504319654454752454509105328570) [(3, 1), (8, 2), (13, 1)],
  term ((-16953416082580275643572419449435657933481 : Rat) / 263781166504319654454752454509105328570) [(3, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0019_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0019
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0020 : Poly :=
[
  term ((4199234595364706163384 : Rat) / 4339258264657398321155) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 20 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0020 : Poly :=
[
  term ((8398469190729412326768 : Rat) / 4339258264657398321155) [(3, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((8398469190729412326768 : Rat) / 4339258264657398321155) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-4199234595364706163384 : Rat) / 4339258264657398321155) [(3, 1), (8, 2), (13, 1), (16, 1)],
  term ((-4199234595364706163384 : Rat) / 4339258264657398321155) [(3, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0020_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0020
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0021 : Poly :=
[
  term ((39273565470008579985603220731656813391704859449585692698542815375 : Rat) / 3199162443839859627796789139485084930598375156266482983471014308) [(3, 1), (15, 1)]
]

/-- Partial product 21 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0021 : Poly :=
[
  term ((39273565470008579985603220731656813391704859449585692698542815375 : Rat) / 1599581221919929813898394569742542465299187578133241491735507154) [(3, 1), (4, 1), (8, 1), (15, 1)],
  term ((39273565470008579985603220731656813391704859449585692698542815375 : Rat) / 1599581221919929813898394569742542465299187578133241491735507154) [(3, 1), (5, 1), (9, 1), (15, 1)],
  term ((-39273565470008579985603220731656813391704859449585692698542815375 : Rat) / 3199162443839859627796789139485084930598375156266482983471014308) [(3, 1), (8, 2), (15, 1)],
  term ((-39273565470008579985603220731656813391704859449585692698542815375 : Rat) / 3199162443839859627796789139485084930598375156266482983471014308) [(3, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0021_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0021
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0022 : Poly :=
[
  term ((-2166793211103048 : Rat) / 7342292683791569) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0022 : Poly :=
[
  term ((-4333586422206096 : Rat) / 7342292683791569) [(3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-4333586422206096 : Rat) / 7342292683791569) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((2166793211103048 : Rat) / 7342292683791569) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((2166793211103048 : Rat) / 7342292683791569) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0022_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0022
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0023 : Poly :=
[
  term ((3047274292933405599790675076256303466562691668635648000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1)]
]

/-- Partial product 23 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0023 : Poly :=
[
  term ((6094548585866811199581350152512606933125383337271296000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1), (5, 1), (8, 1), (9, 1)],
  term ((-3047274292933405599790675076256303466562691668635648000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 2), (9, 1)],
  term ((-3047274292933405599790675076256303466562691668635648000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 3)],
  term ((6094548585866811199581350152512606933125383337271296000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0023_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0023
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0024 : Poly :=
[
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(5, 1), (11, 1)]
]

/-- Partial product 24 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0024 : Poly :=
[
  term ((155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(4, 1), (5, 1), (8, 1), (11, 1)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(5, 1), (8, 2), (11, 1)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(5, 1), (9, 2), (11, 1)],
  term ((155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(5, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0024_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0024
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0025 : Poly :=
[
  term ((-1040762227689828611154732594496468689296585640244779212800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (13, 1)]
]

/-- Partial product 25 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0025 : Poly :=
[
  term ((-2081524455379657222309465188992937378593171280489558425600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (5, 1), (8, 1), (13, 1)],
  term ((1040762227689828611154732594496468689296585640244779212800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (8, 2), (13, 1)],
  term ((1040762227689828611154732594496468689296585640244779212800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 2), (13, 1)],
  term ((-2081524455379657222309465188992937378593171280489558425600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0025_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0025
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0026 : Poly :=
[
  term ((-46669207602519671886992850426976297941630574076788633600 : Rat) / 6466579531165902861643782618204799630014762045689020851) [(5, 1), (15, 1)]
]

/-- Partial product 26 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0026 : Poly :=
[
  term ((-93338415205039343773985700853952595883261148153577267200 : Rat) / 6466579531165902861643782618204799630014762045689020851) [(4, 1), (5, 1), (8, 1), (15, 1)],
  term ((46669207602519671886992850426976297941630574076788633600 : Rat) / 6466579531165902861643782618204799630014762045689020851) [(5, 1), (8, 2), (15, 1)],
  term ((46669207602519671886992850426976297941630574076788633600 : Rat) / 6466579531165902861643782618204799630014762045689020851) [(5, 1), (9, 2), (15, 1)],
  term ((-93338415205039343773985700853952595883261148153577267200 : Rat) / 6466579531165902861643782618204799630014762045689020851) [(5, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0026_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0026
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0027 : Poly :=
[
  term ((3047274292933405599790675076256303466562691668635648000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2)]
]

/-- Partial product 27 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0027 : Poly :=
[
  term ((6094548585866811199581350152512606933125383337271296000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1), (5, 2), (8, 1)],
  term ((-3047274292933405599790675076256303466562691668635648000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (8, 2)],
  term ((-3047274292933405599790675076256303466562691668635648000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (9, 2)],
  term ((6094548585866811199581350152512606933125383337271296000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0027_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0027
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0028 : Poly :=
[
  term ((-6298299106979896 : Rat) / 3146696864482101) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0028 : Poly :=
[
  term ((-12596598213959792 : Rat) / 3146696864482101) [(4, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(7, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(7, 1), (8, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0028_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0028
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0029 : Poly :=
[
  term ((-3149149553489948 : Rat) / 3146696864482101) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 29 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0029 : Poly :=
[
  term ((-6298299106979896 : Rat) / 3146696864482101) [(4, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(5, 1), (7, 1), (9, 2), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(7, 1), (8, 2), (9, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(7, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0029_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0029
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0030 : Poly :=
[
  term ((-3149149553489948 : Rat) / 3146696864482101) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0030 : Poly :=
[
  term ((-6298299106979896 : Rat) / 3146696864482101) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0030_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0030
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0031 : Poly :=
[
  term ((-1574574776744974 : Rat) / 3146696864482101) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 31 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0031 : Poly :=
[
  term ((-3149149553489948 : Rat) / 3146696864482101) [(4, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((1574574776744974 : Rat) / 3146696864482101) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((1574574776744974 : Rat) / 3146696864482101) [(7, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0031_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0031
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0032 : Poly :=
[
  term ((3149149553489948 : Rat) / 3146696864482101) [(7, 1), (15, 1)]
]

/-- Partial product 32 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0032 : Poly :=
[
  term ((6298299106979896 : Rat) / 3146696864482101) [(4, 1), (7, 1), (8, 1), (15, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(7, 1), (8, 2), (15, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0032_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0032
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0033 : Poly :=
[
  term ((12596598213959792 : Rat) / 3146696864482101) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0033 : Poly :=
[
  term ((25193196427919584 : Rat) / 3146696864482101) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((25193196427919584 : Rat) / 3146696864482101) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0033_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0033
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0034 : Poly :=
[
  term ((-3149149553489948 : Rat) / 1048898954827367) [(7, 2)]
]

/-- Partial product 34 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0034 : Poly :=
[
  term ((-6298299106979896 : Rat) / 1048898954827367) [(4, 1), (7, 2), (8, 1)],
  term ((-6298299106979896 : Rat) / 1048898954827367) [(5, 1), (7, 2), (9, 1)],
  term ((3149149553489948 : Rat) / 1048898954827367) [(7, 2), (8, 2)],
  term ((3149149553489948 : Rat) / 1048898954827367) [(7, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0034_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0034
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0035 : Poly :=
[
  term ((38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1)]
]

/-- Partial product 35 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0035 : Poly :=
[
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(4, 1), (8, 2)],
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(5, 1), (8, 1), (9, 1)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (9, 2)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0035_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0035
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0036 : Poly :=
[
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (11, 1)]
]

/-- Partial product 36 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0036 : Poly :=
[
  term ((155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(4, 1), (8, 1), (9, 1), (11, 1)],
  term ((155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(5, 1), (9, 2), (11, 1)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 2), (9, 1), (11, 1)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0036_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0036
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0037 : Poly :=
[
  term ((-1040762227689828611154732594496468689296585640244779212800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(9, 1), (13, 1)]
]

/-- Partial product 37 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0037 : Poly :=
[
  term ((-2081524455379657222309465188992937378593171280489558425600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (8, 1), (9, 1), (13, 1)],
  term ((-2081524455379657222309465188992937378593171280489558425600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 2), (13, 1)],
  term ((1040762227689828611154732594496468689296585640244779212800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(8, 2), (9, 1), (13, 1)],
  term ((1040762227689828611154732594496468689296585640244779212800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0037_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0037
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0038 : Poly :=
[
  term ((-282803703399396662571964231890743315672911258509167104000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(9, 1), (15, 1)]
]

/-- Partial product 38 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0038 : Poly :=
[
  term ((-565607406798793325143928463781486631345822517018334208000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-565607406798793325143928463781486631345822517018334208000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 2), (15, 1)],
  term ((282803703399396662571964231890743315672911258509167104000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(8, 2), (9, 1), (15, 1)],
  term ((282803703399396662571964231890743315672911258509167104000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0038_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0038
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0039 : Poly :=
[
  term ((-19404446592800596025157126058687617591458810931200 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 1)]
]

/-- Partial product 39 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0039 : Poly :=
[
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(4, 1), (8, 1), (10, 1)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(5, 1), (9, 1), (10, 1)],
  term ((19404446592800596025157126058687617591458810931200 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 2), (10, 1)],
  term ((19404446592800596025157126058687617591458810931200 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0039_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0039
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0040 : Poly :=
[
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 1354520779047503116208002444856180344466756464819) [(11, 1), (15, 1)]
]

/-- Partial product 40 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0040 : Poly :=
[
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 1354520779047503116208002444856180344466756464819) [(4, 1), (8, 1), (11, 1), (15, 1)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 1354520779047503116208002444856180344466756464819) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((38808893185601192050314252117375235182917621862400 : Rat) / 1354520779047503116208002444856180344466756464819) [(8, 2), (11, 1), (15, 1)],
  term ((38808893185601192050314252117375235182917621862400 : Rat) / 1354520779047503116208002444856180344466756464819) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0040_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0040
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0041 : Poly :=
[
  term ((-520381113844914305577366297248234344648292820122389606400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(12, 1)]
]

/-- Partial product 41 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0041 : Poly :=
[
  term ((-1040762227689828611154732594496468689296585640244779212800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (8, 1), (12, 1)],
  term ((-1040762227689828611154732594496468689296585640244779212800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (12, 1)],
  term ((520381113844914305577366297248234344648292820122389606400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(8, 2), (12, 1)],
  term ((520381113844914305577366297248234344648292820122389606400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0041_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0041
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0042 : Poly :=
[
  term ((1040762227689828611154732594496468689296585640244779212800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(13, 1), (15, 1)]
]

/-- Partial product 42 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0042 : Poly :=
[
  term ((2081524455379657222309465188992937378593171280489558425600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (8, 1), (13, 1), (15, 1)],
  term ((2081524455379657222309465188992937378593171280489558425600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1040762227689828611154732594496468689296585640244779212800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(8, 2), (13, 1), (15, 1)],
  term ((-1040762227689828611154732594496468689296585640244779212800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0042_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0042
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYNYN_coefficient_15_0043 : Poly :=
[
  term ((478906748257539652454652361666933543562542050155236249600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(15, 2)]
]

/-- Partial product 43 for generator 15. -/
def rs_R009_ueqv_R009NYNYN_partial_15_0043 : Poly :=
[
  term ((957813496515079304909304723333867087125084100310472499200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (8, 1), (15, 2)],
  term ((957813496515079304909304723333867087125084100310472499200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (15, 2)],
  term ((-478906748257539652454652361666933543562542050155236249600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(8, 2), (15, 2)],
  term ((-478906748257539652454652361666933543562542050155236249600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 15. -/
theorem rs_R009_ueqv_R009NYNYN_partial_15_0043_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_15_0043
        rs_R009_ueqv_R009NYNYN_generator_15_0000_0043 =
      rs_R009_ueqv_R009NYNYN_partial_15_0043 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_15_0000_0043 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_15_0000,
  rs_R009_ueqv_R009NYNYN_partial_15_0001,
  rs_R009_ueqv_R009NYNYN_partial_15_0002,
  rs_R009_ueqv_R009NYNYN_partial_15_0003,
  rs_R009_ueqv_R009NYNYN_partial_15_0004,
  rs_R009_ueqv_R009NYNYN_partial_15_0005,
  rs_R009_ueqv_R009NYNYN_partial_15_0006,
  rs_R009_ueqv_R009NYNYN_partial_15_0007,
  rs_R009_ueqv_R009NYNYN_partial_15_0008,
  rs_R009_ueqv_R009NYNYN_partial_15_0009,
  rs_R009_ueqv_R009NYNYN_partial_15_0010,
  rs_R009_ueqv_R009NYNYN_partial_15_0011,
  rs_R009_ueqv_R009NYNYN_partial_15_0012,
  rs_R009_ueqv_R009NYNYN_partial_15_0013,
  rs_R009_ueqv_R009NYNYN_partial_15_0014,
  rs_R009_ueqv_R009NYNYN_partial_15_0015,
  rs_R009_ueqv_R009NYNYN_partial_15_0016,
  rs_R009_ueqv_R009NYNYN_partial_15_0017,
  rs_R009_ueqv_R009NYNYN_partial_15_0018,
  rs_R009_ueqv_R009NYNYN_partial_15_0019,
  rs_R009_ueqv_R009NYNYN_partial_15_0020,
  rs_R009_ueqv_R009NYNYN_partial_15_0021,
  rs_R009_ueqv_R009NYNYN_partial_15_0022,
  rs_R009_ueqv_R009NYNYN_partial_15_0023,
  rs_R009_ueqv_R009NYNYN_partial_15_0024,
  rs_R009_ueqv_R009NYNYN_partial_15_0025,
  rs_R009_ueqv_R009NYNYN_partial_15_0026,
  rs_R009_ueqv_R009NYNYN_partial_15_0027,
  rs_R009_ueqv_R009NYNYN_partial_15_0028,
  rs_R009_ueqv_R009NYNYN_partial_15_0029,
  rs_R009_ueqv_R009NYNYN_partial_15_0030,
  rs_R009_ueqv_R009NYNYN_partial_15_0031,
  rs_R009_ueqv_R009NYNYN_partial_15_0032,
  rs_R009_ueqv_R009NYNYN_partial_15_0033,
  rs_R009_ueqv_R009NYNYN_partial_15_0034,
  rs_R009_ueqv_R009NYNYN_partial_15_0035,
  rs_R009_ueqv_R009NYNYN_partial_15_0036,
  rs_R009_ueqv_R009NYNYN_partial_15_0037,
  rs_R009_ueqv_R009NYNYN_partial_15_0038,
  rs_R009_ueqv_R009NYNYN_partial_15_0039,
  rs_R009_ueqv_R009NYNYN_partial_15_0040,
  rs_R009_ueqv_R009NYNYN_partial_15_0041,
  rs_R009_ueqv_R009NYNYN_partial_15_0042,
  rs_R009_ueqv_R009NYNYN_partial_15_0043
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_15_0000_0043 : Poly :=
[
  term ((-1247699653979282755807923735673918449244266688320 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (4, 1), (8, 1)],
  term ((249157563522571195812 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (4, 1), (8, 1), (16, 1)],
  term ((-1247699653979282755807923735673918449244266688320 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (5, 1), (9, 1)],
  term ((249157563522571195812 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (5, 1), (9, 1), (16, 1)],
  term ((623849826989641377903961867836959224622133344160 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (8, 2)],
  term ((-124578781761285597906 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (8, 2), (16, 1)],
  term ((623849826989641377903961867836959224622133344160 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (9, 2)],
  term ((-124578781761285597906 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (9, 2), (16, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(1, 1), (4, 1), (7, 1), (8, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(1, 1), (4, 1), (7, 1), (8, 1), (16, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(1, 1), (5, 1), (7, 1), (9, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(1, 1), (7, 1), (8, 2)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 1), (7, 1), (8, 2), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(1, 1), (7, 1), (9, 2)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 1), (7, 1), (9, 2), (16, 1)],
  term ((-7313458303040173439497620183015128319750460004725555200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 1)],
  term ((-155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (4, 1), (5, 1), (8, 1), (11, 1)],
  term ((40487300198092072404106242892947479354108443172705075200 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (4, 1), (5, 1), (8, 1), (15, 1)],
  term ((-7313458303040173439497620183015128319750460004725555200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (4, 1), (5, 2), (8, 1)],
  term ((520381113844914305577366297248234344648292820122389606400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (4, 1), (8, 1)],
  term ((-155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (4, 1), (8, 1), (9, 1), (11, 1)],
  term ((261470726477523986510250839701586970519507722194758860800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (4, 1), (8, 1), (11, 1), (15, 1)],
  term ((-261470726477523986510250839701586970519507722194758860800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (4, 1), (8, 1), (15, 2)],
  term ((3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 2), (9, 1)],
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (5, 1), (8, 2), (11, 1)],
  term ((-20243650099046036202053121446473739677054221586352537600 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 1), (8, 2), (15, 1)],
  term ((520381113844914305577366297248234344648292820122389606400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (9, 1)],
  term ((155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-261470726477523986510250839701586970519507722194758860800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (9, 1), (15, 2)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (5, 1), (9, 2), (11, 1)],
  term ((119765175784201733095878989576270792780128171090291097600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (9, 2), (15, 1)],
  term ((3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 3)],
  term ((3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (8, 2)],
  term ((-155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (5, 2), (9, 1), (11, 1)],
  term ((40487300198092072404106242892947479354108443172705075200 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 2), (9, 1), (15, 1)],
  term ((-3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (9, 2)],
  term ((-7313458303040173439497620183015128319750460004725555200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 3), (9, 1)],
  term ((-260190556922457152788683148624117172324146410061194803200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 2)],
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 2), (9, 1), (11, 1)],
  term ((-130735363238761993255125419850793485259753861097379430400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 2), (9, 1), (15, 1)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 2), (11, 1), (15, 1)],
  term ((130735363238761993255125419850793485259753861097379430400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 2), (15, 2)],
  term ((-260190556922457152788683148624117172324146410061194803200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (9, 2)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (9, 2), (11, 1), (15, 1)],
  term ((130735363238761993255125419850793485259753861097379430400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (9, 2), (15, 2)],
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (9, 3), (11, 1)],
  term ((-130735363238761993255125419850793485259753861097379430400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (9, 3), (15, 1)],
  term ((-2781200521252923827093720563739578854148608453147033600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (5, 1), (8, 1)],
  term ((-61383100868391460691624219863627756944791 : Rat) / 1099088193767998560228135227121272202375) [(3, 1), (4, 1), (8, 1), (9, 1)],
  term ((1879777754871005800368 : Rat) / 4339258264657398321155) [(3, 1), (4, 1), (8, 1), (9, 1), (16, 1)],
  term ((5005113465224188127012498018766566298991287600354133189373682008 : Rat) / 34299406372393745792878136016423515156901497292566177210440875) [(3, 1), (4, 1), (8, 1), (11, 1)],
  term ((-1420808663978934320448 : Rat) / 619894037808199760165) [(3, 1), (4, 1), (8, 1), (11, 1), (16, 1)],
  term ((16953416082580275643572419449435657933481 : Rat) / 131890583252159827227376227254552664285) [(3, 1), (4, 1), (8, 1), (13, 1)],
  term ((8398469190729412326768 : Rat) / 4339258264657398321155) [(3, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((39273565470008579985603220731656813391704859449585692698542815375 : Rat) / 1599581221919929813898394569742542465299187578133241491735507154) [(3, 1), (4, 1), (8, 1), (15, 1)],
  term ((-4333586422206096 : Rat) / 7342292683791569) [(3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((1390600260626461913546860281869789427074304226573516800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (8, 2)],
  term ((5005113465224188127012498018766566298991287600354133189373682008 : Rat) / 34299406372393745792878136016423515156901497292566177210440875) [(3, 1), (5, 1), (9, 1), (11, 1)],
  term ((-1420808663978934320448 : Rat) / 619894037808199760165) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((16953416082580275643572419449435657933481 : Rat) / 131890583252159827227376227254552664285) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((8398469190729412326768 : Rat) / 4339258264657398321155) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((39273565470008579985603220731656813391704859449585692698542815375 : Rat) / 1599581221919929813898394569742542465299187578133241491735507154) [(3, 1), (5, 1), (9, 1), (15, 1)],
  term ((-4333586422206096 : Rat) / 7342292683791569) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-63699280682845329599531324407540684567207008595991508561703834793180509 : Rat) / 1146234814754059510960535367099257290541458157976114670805650012510125) [(3, 1), (5, 1), (9, 2)],
  term ((1879777754871005800368 : Rat) / 4339258264657398321155) [(3, 1), (5, 1), (9, 2), (16, 1)],
  term ((-2781200521252923827093720563739578854148608453147033600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 2), (9, 1)],
  term ((61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(3, 1), (8, 2), (9, 1)],
  term ((-939888877435502900184 : Rat) / 4339258264657398321155) [(3, 1), (8, 2), (9, 1), (16, 1)],
  term ((-2502556732612094063506249009383283149495643800177066594686841004 : Rat) / 34299406372393745792878136016423515156901497292566177210440875) [(3, 1), (8, 2), (11, 1)],
  term ((710404331989467160224 : Rat) / 619894037808199760165) [(3, 1), (8, 2), (11, 1), (16, 1)],
  term ((-16953416082580275643572419449435657933481 : Rat) / 263781166504319654454752454509105328570) [(3, 1), (8, 2), (13, 1)],
  term ((-4199234595364706163384 : Rat) / 4339258264657398321155) [(3, 1), (8, 2), (13, 1), (16, 1)],
  term ((-39273565470008579985603220731656813391704859449585692698542815375 : Rat) / 3199162443839859627796789139485084930598375156266482983471014308) [(3, 1), (8, 2), (15, 1)],
  term ((2166793211103048 : Rat) / 7342292683791569) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-2502556732612094063506249009383283149495643800177066594686841004 : Rat) / 34299406372393745792878136016423515156901497292566177210440875) [(3, 1), (9, 2), (11, 1)],
  term ((710404331989467160224 : Rat) / 619894037808199760165) [(3, 1), (9, 2), (11, 1), (16, 1)],
  term ((-16953416082580275643572419449435657933481 : Rat) / 263781166504319654454752454509105328570) [(3, 1), (9, 2), (13, 1)],
  term ((-4199234595364706163384 : Rat) / 4339258264657398321155) [(3, 1), (9, 2), (13, 1), (16, 1)],
  term ((-39273565470008579985603220731656813391704859449585692698542815375 : Rat) / 3199162443839859627796789139485084930598375156266482983471014308) [(3, 1), (9, 2), (15, 1)],
  term ((2166793211103048 : Rat) / 7342292683791569) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(3, 1), (9, 3)],
  term ((-939888877435502900184 : Rat) / 4339258264657398321155) [(3, 1), (9, 3), (16, 1)],
  term ((6094548585866811199581350152512606933125383337271296000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1), (5, 1), (8, 1), (9, 1)],
  term ((155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(4, 1), (5, 1), (8, 1), (11, 1)],
  term ((-2081524455379657222309465188992937378593171280489558425600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (5, 1), (8, 1), (13, 1)],
  term ((-93338415205039343773985700853952595883261148153577267200 : Rat) / 6466579531165902861643782618204799630014762045689020851) [(4, 1), (5, 1), (8, 1), (15, 1)],
  term ((6094548585866811199581350152512606933125383337271296000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1), (5, 2), (8, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(4, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(4, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(4, 1), (7, 1), (8, 1), (15, 1)],
  term ((25193196427919584 : Rat) / 3146696864482101) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(4, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 1048898954827367) [(4, 1), (7, 2), (8, 1)],
  term ((-43040828347471666838036794896640476391056465397196339200 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(4, 1), (8, 1)],
  term ((155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(4, 1), (8, 1), (9, 1), (11, 1)],
  term ((-2081524455379657222309465188992937378593171280489558425600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (8, 1), (9, 1), (13, 1)],
  term ((-565607406798793325143928463781486631345822517018334208000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(4, 1), (8, 1), (10, 1)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 1354520779047503116208002444856180344466756464819) [(4, 1), (8, 1), (11, 1), (15, 1)],
  term ((-1040762227689828611154732594496468689296585640244779212800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (8, 1), (12, 1)],
  term ((2081524455379657222309465188992937378593171280489558425600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (8, 1), (13, 1), (15, 1)],
  term ((957813496515079304909304723333867087125084100310472499200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (8, 1), (15, 2)],
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(4, 1), (8, 2)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(5, 1), (7, 1), (9, 1), (15, 1)],
  term ((25193196427919584 : Rat) / 3146696864482101) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-6298299106979896 : Rat) / 1048898954827367) [(5, 1), (7, 2), (9, 1)],
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(5, 1), (8, 1), (9, 1)],
  term ((-3047274292933405599790675076256303466562691668635648000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 2), (9, 1)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(5, 1), (8, 2), (11, 1)],
  term ((1040762227689828611154732594496468689296585640244779212800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (8, 2), (13, 1)],
  term ((46669207602519671886992850426976297941630574076788633600 : Rat) / 6466579531165902861643782618204799630014762045689020851) [(5, 1), (8, 2), (15, 1)],
  term ((-43040828347471666838036794896640476391056465397196339200 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (9, 1)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(5, 1), (9, 1), (10, 1)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 1354520779047503116208002444856180344466756464819) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1040762227689828611154732594496468689296585640244779212800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (12, 1)],
  term ((2081524455379657222309465188992937378593171280489558425600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((957813496515079304909304723333867087125084100310472499200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (15, 2)],
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(5, 1), (9, 2), (11, 1)],
  term ((-1040762227689828611154732594496468689296585640244779212800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 2), (13, 1)],
  term ((-238922953581155621934978510792652545754408498480813772800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 2), (15, 1)],
  term ((-3047274292933405599790675076256303466562691668635648000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 3)],
  term ((-3047274292933405599790675076256303466562691668635648000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (8, 2)],
  term ((155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(5, 2), (9, 1), (11, 1)],
  term ((-2081524455379657222309465188992937378593171280489558425600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 2), (9, 1), (13, 1)],
  term ((-93338415205039343773985700853952595883261148153577267200 : Rat) / 6466579531165902861643782618204799630014762045689020851) [(5, 2), (9, 1), (15, 1)],
  term ((3047274292933405599790675076256303466562691668635648000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (9, 2)],
  term ((6094548585866811199581350152512606933125383337271296000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 3), (9, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(7, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(7, 1), (8, 2), (9, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((1574574776744974 : Rat) / 3146696864482101) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(7, 1), (8, 2), (15, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(7, 1), (8, 3), (15, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((1574574776744974 : Rat) / 3146696864482101) [(7, 1), (9, 2), (13, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(7, 1), (9, 2), (15, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(7, 1), (9, 3), (16, 1)],
  term ((3149149553489948 : Rat) / 1048898954827367) [(7, 2), (8, 2)],
  term ((3149149553489948 : Rat) / 1048898954827367) [(7, 2), (9, 2)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (9, 2)],
  term ((21520414173735833419018397448320238195528232698598169600 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(8, 2)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 2), (9, 1), (11, 1)],
  term ((1040762227689828611154732594496468689296585640244779212800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(8, 2), (9, 1), (13, 1)],
  term ((282803703399396662571964231890743315672911258509167104000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(8, 2), (9, 1), (15, 1)],
  term ((19404446592800596025157126058687617591458810931200 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 2), (10, 1)],
  term ((38808893185601192050314252117375235182917621862400 : Rat) / 1354520779047503116208002444856180344466756464819) [(8, 2), (11, 1), (15, 1)],
  term ((520381113844914305577366297248234344648292820122389606400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(8, 2), (12, 1)],
  term ((-1040762227689828611154732594496468689296585640244779212800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(8, 2), (13, 1), (15, 1)],
  term ((-478906748257539652454652361666933543562542050155236249600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(8, 2), (15, 2)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 3)],
  term ((21520414173735833419018397448320238195528232698598169600 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(9, 2)],
  term ((19404446592800596025157126058687617591458810931200 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 2), (10, 1)],
  term ((38808893185601192050314252117375235182917621862400 : Rat) / 1354520779047503116208002444856180344466756464819) [(9, 2), (11, 1), (15, 1)],
  term ((520381113844914305577366297248234344648292820122389606400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(9, 2), (12, 1)],
  term ((-1040762227689828611154732594496468689296585640244779212800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(9, 2), (13, 1), (15, 1)],
  term ((-478906748257539652454652361666933543562542050155236249600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(9, 2), (15, 2)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 3), (11, 1)],
  term ((1040762227689828611154732594496468689296585640244779212800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(9, 3), (13, 1)],
  term ((282803703399396662571964231890743315672911258509167104000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 0 through 43. -/
theorem rs_R009_ueqv_R009NYNYN_block_15_0000_0043_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_15_0000_0043
      rs_R009_ueqv_R009NYNYN_block_15_0000_0043 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
