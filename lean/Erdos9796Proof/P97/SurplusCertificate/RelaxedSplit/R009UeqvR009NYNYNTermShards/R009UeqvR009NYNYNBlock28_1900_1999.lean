/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 28:1900-1999

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 1900 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1900 : Poly :=
[
  term ((20756005610147729358403219 : Rat) / 1349908410627278368612200) [(8, 1), (16, 1)]
]

/-- Partial product 1900 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1900 : Poly :=
[
  term ((20756005610147729358403219 : Rat) / 674954205313639184306100) [(8, 1), (14, 1), (16, 1)],
  term ((-20756005610147729358403219 : Rat) / 1349908410627278368612200) [(8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1900 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1900_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1900
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1900 := by
  native_decide

/-- Coefficient term 1901 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1901 : Poly :=
[
  term ((39234344790765647654748325687558473678265820429700300571588742244606585635888639 : Rat) / 87055999896880187987549160301161551642315772214294656963202962730374841344000) [(8, 2)]
]

/-- Partial product 1901 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1901 : Poly :=
[
  term ((-39234344790765647654748325687558473678265820429700300571588742244606585635888639 : Rat) / 87055999896880187987549160301161551642315772214294656963202962730374841344000) [(8, 2)],
  term ((39234344790765647654748325687558473678265820429700300571588742244606585635888639 : Rat) / 43527999948440093993774580150580775821157886107147328481601481365187420672000) [(8, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1901 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1901_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1901
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1901 := by
  native_decide

/-- Coefficient term 1902 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1902 : Poly :=
[
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 1902 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1902 : Poly :=
[
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (10, 1), (13, 1)],
  term ((982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1902 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1902_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1902
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1902 := by
  native_decide

/-- Coefficient term 1903 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1903 : Poly :=
[
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1903 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1903 : Poly :=
[
  term ((-3341827119770676978432 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1903 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1903_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1903
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1903 := by
  native_decide

/-- Coefficient term 1904 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1904 : Poly :=
[
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 1904 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1904 : Poly :=
[
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1904 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1904_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1904
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1904 := by
  native_decide

/-- Coefficient term 1905 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1905 : Poly :=
[
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1905 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1905 : Poly :=
[
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-835456779942669244608 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1905 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1905_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1905
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1905 := by
  native_decide

/-- Coefficient term 1906 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1906 : Poly :=
[
  term ((472207042615048584508287322324383882378538 : Rat) / 1978358748782397408410643408818289964275) [(8, 2), (9, 1), (11, 1)]
]

/-- Partial product 1906 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1906 : Poly :=
[
  term ((-472207042615048584508287322324383882378538 : Rat) / 1978358748782397408410643408818289964275) [(8, 2), (9, 1), (11, 1)],
  term ((944414085230097169016574644648767764757076 : Rat) / 1978358748782397408410643408818289964275) [(8, 2), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1906 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1906_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1906
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1906 := by
  native_decide

/-- Coefficient term 1907 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1907 : Poly :=
[
  term ((-1134593969302891700024964936116971439430968 : Rat) / 1978358748782397408410643408818289964275) [(8, 2), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 1907 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1907 : Poly :=
[
  term ((1134593969302891700024964936116971439430968 : Rat) / 1978358748782397408410643408818289964275) [(8, 2), (9, 1), (11, 1), (12, 1)],
  term ((-2269187938605783400049929872233942878861936 : Rat) / 1978358748782397408410643408818289964275) [(8, 2), (9, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1907 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1907_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1907
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1907 := by
  native_decide

/-- Coefficient term 1908 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1908 : Poly :=
[
  term ((-10298541589752190570112 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1908 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1908 : Poly :=
[
  term ((-20597083179504381140224 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((10298541589752190570112 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1908 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1908_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1908
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1908 := by
  native_decide

/-- Coefficient term 1909 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1909 : Poly :=
[
  term ((567296984651445850012482468058485719715484 : Rat) / 1978358748782397408410643408818289964275) [(8, 2), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 1909 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1909 : Poly :=
[
  term ((-567296984651445850012482468058485719715484 : Rat) / 1978358748782397408410643408818289964275) [(8, 2), (9, 1), (11, 1), (14, 1)],
  term ((1134593969302891700024964936116971439430968 : Rat) / 1978358748782397408410643408818289964275) [(8, 2), (9, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1909 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1909_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1909
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1909 := by
  native_decide

/-- Coefficient term 1910 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1910 : Poly :=
[
  term ((5149270794876095285056 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1910 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1910 : Poly :=
[
  term ((-5149270794876095285056 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((10298541589752190570112 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1910 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1910_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1910
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1910 := by
  native_decide

/-- Coefficient term 1911 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1911 : Poly :=
[
  term ((6767051903494951371616 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 1911 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1911 : Poly :=
[
  term ((13534103806989902743232 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-6767051903494951371616 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1911 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1911_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1911
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1911 := by
  native_decide

/-- Coefficient term 1912 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1912 : Poly :=
[
  term ((-520308496359950540440778431075668216955327 : Rat) / 59350762463471922252319302264548698928250) [(8, 2), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 1912 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1912 : Poly :=
[
  term ((520308496359950540440778431075668216955327 : Rat) / 59350762463471922252319302264548698928250) [(8, 2), (9, 1), (12, 1), (13, 1)],
  term ((-520308496359950540440778431075668216955327 : Rat) / 29675381231735961126159651132274349464125) [(8, 2), (9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1912 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1912_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1912
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1912 := by
  native_decide

/-- Coefficient term 1913 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1913 : Poly :=
[
  term ((49626920722034290475608 : Rat) / 13017774793972194963465) [(8, 2), (9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1913 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1913 : Poly :=
[
  term ((99253841444068580951216 : Rat) / 13017774793972194963465) [(8, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-49626920722034290475608 : Rat) / 13017774793972194963465) [(8, 2), (9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1913 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1913_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1913
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1913 := by
  native_decide

/-- Coefficient term 1914 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1914 : Poly :=
[
  term ((6241829515678349399197998131350811576961893 : Rat) / 39567174975647948168212868176365799285500) [(8, 2), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1914 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1914 : Poly :=
[
  term ((6241829515678349399197998131350811576961893 : Rat) / 19783587487823974084106434088182899642750) [(8, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-6241829515678349399197998131350811576961893 : Rat) / 39567174975647948168212868176365799285500) [(8, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1914 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1914_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1914
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1914 := by
  native_decide

/-- Coefficient term 1915 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1915 : Poly :=
[
  term ((-5309664543605922194724 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1915 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1915 : Poly :=
[
  term ((-10619329087211844389448 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5309664543605922194724 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1915 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1915_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1915
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1915 := by
  native_decide

/-- Coefficient term 1916 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1916 : Poly :=
[
  term ((-93062460494473049980318336838847255825565668541520865878561286387249090029031191 : Rat) / 147957229656029639665552960100225185619776868672700548673221247005860465951200) [(8, 2), (9, 1), (13, 1)]
]

/-- Partial product 1916 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1916 : Poly :=
[
  term ((93062460494473049980318336838847255825565668541520865878561286387249090029031191 : Rat) / 147957229656029639665552960100225185619776868672700548673221247005860465951200) [(8, 2), (9, 1), (13, 1)],
  term ((-93062460494473049980318336838847255825565668541520865878561286387249090029031191 : Rat) / 73978614828014819832776480050112592809888434336350274336610623502930232975600) [(8, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1916 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1916_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1916
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1916 := by
  native_decide

/-- Coefficient term 1917 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1917 : Poly :=
[
  term ((-4551295012668774414288303990744191628482588 : Rat) / 29675381231735961126159651132274349464125) [(8, 2), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 1917 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1917 : Poly :=
[
  term ((4551295012668774414288303990744191628482588 : Rat) / 29675381231735961126159651132274349464125) [(8, 2), (9, 1), (13, 1), (14, 1)],
  term ((-9102590025337548828576607981488383256965176 : Rat) / 29675381231735961126159651132274349464125) [(8, 2), (9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1917 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1917_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1917
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1917 := by
  native_decide

/-- Coefficient term 1918 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1918 : Poly :=
[
  term ((-8884466730199378653632 : Rat) / 13017774793972194963465) [(8, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1918 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1918 : Poly :=
[
  term ((8884466730199378653632 : Rat) / 13017774793972194963465) [(8, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17768933460398757307264 : Rat) / 13017774793972194963465) [(8, 2), (9, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1918 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1918_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1918
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1918 := by
  native_decide

/-- Coefficient term 1919 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1919 : Poly :=
[
  term ((-1045997271071099352923605 : Rat) / 108233499001311678124809) [(8, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 1919 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1919 : Poly :=
[
  term ((-2091994542142198705847210 : Rat) / 108233499001311678124809) [(8, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1045997271071099352923605 : Rat) / 108233499001311678124809) [(8, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1919 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1919_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1919
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1919 := by
  native_decide

/-- Coefficient term 1920 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1920 : Poly :=
[
  term ((400537681318815016007953143616739593157503814900483561683948041696936605490364813 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 2), (9, 1), (15, 1)]
]

/-- Partial product 1920 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1920 : Poly :=
[
  term ((400537681318815016007953143616739593157503814900483561683948041696936605490364813 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 2), (9, 1), (14, 1), (15, 1)],
  term ((-400537681318815016007953143616739593157503814900483561683948041696936605490364813 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1920 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1920_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1920
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1920 := by
  native_decide

/-- Coefficient term 1921 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1921 : Poly :=
[
  term ((16045384249079127342133333 : Rat) / 3788172465045908734368315) [(8, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1921 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1921 : Poly :=
[
  term ((32090768498158254684266666 : Rat) / 3788172465045908734368315) [(8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16045384249079127342133333 : Rat) / 3788172465045908734368315) [(8, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1921 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1921_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1921
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1921 := by
  native_decide

/-- Coefficient term 1922 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1922 : Poly :=
[
  term ((352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 2)]
]

/-- Partial product 1922 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1922 : Poly :=
[
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 2)],
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1922 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1922_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1922
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1922 := by
  native_decide

/-- Coefficient term 1923 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1923 : Poly :=
[
  term ((-705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 2), (12, 1)]
]

/-- Partial product 1923 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1923 : Poly :=
[
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 2), (12, 1)],
  term ((-1410734033780813624550909155773014691180592 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1923 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1923_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1923
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1923 := by
  native_decide

/-- Coefficient term 1924 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1924 : Poly :=
[
  term ((2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 2), (9, 2), (12, 1), (16, 1)]
]

/-- Partial product 1924 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1924 : Poly :=
[
  term ((4800210874590085857024 : Rat) / 4339258264657398321155) [(8, 2), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 2), (9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1924 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1924_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1924
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1924 := by
  native_decide

/-- Coefficient term 1925 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1925 : Poly :=
[
  term ((352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 2), (14, 1)]
]

/-- Partial product 1925 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1925 : Poly :=
[
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 2), (14, 1)],
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1925 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1925_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1925
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1925 := by
  native_decide

/-- Coefficient term 1926 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1926 : Poly :=
[
  term ((-1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 2), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 1926 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1926 : Poly :=
[
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 2), (9, 2), (14, 1), (16, 1)],
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 2), (9, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1926 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1926_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1926
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1926 := by
  native_decide

/-- Coefficient term 1927 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1927 : Poly :=
[
  term ((-1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 2), (9, 2), (16, 1)]
]

/-- Partial product 1927 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1927 : Poly :=
[
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 2), (9, 2), (14, 1), (16, 1)],
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1927 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1927_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1927
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1927 := by
  native_decide

/-- Coefficient term 1928 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1928 : Poly :=
[
  term ((-137007524352949323249170167964575687366646469566051 : Rat) / 73144122068565168275232132022233738601204849100226) [(8, 2), (10, 1)]
]

/-- Partial product 1928 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1928 : Poly :=
[
  term ((137007524352949323249170167964575687366646469566051 : Rat) / 73144122068565168275232132022233738601204849100226) [(8, 2), (10, 1)],
  term ((-137007524352949323249170167964575687366646469566051 : Rat) / 36572061034282584137616066011116869300602424550113) [(8, 2), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1928 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1928_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1928
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1928 := by
  native_decide

/-- Coefficient term 1929 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1929 : Poly :=
[
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 1929 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1929 : Poly :=
[
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((-247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1929 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1929_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1929
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1929 := by
  native_decide

/-- Coefficient term 1930 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1930 : Poly :=
[
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(8, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1930 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1930 : Poly :=
[
  term ((2525882069295883236352 : Rat) / 619894037808199760165) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(8, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1930 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1930_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1930
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1930 := by
  native_decide

/-- Coefficient term 1931 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1931 : Poly :=
[
  term ((61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 1931 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1931 : Poly :=
[
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1931 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1931_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1931
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1931 := by
  native_decide

/-- Coefficient term 1932 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1932 : Poly :=
[
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1932 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1932 : Poly :=
[
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(8, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1932 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1932_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1932
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1932 := by
  native_decide

/-- Coefficient term 1933 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1933 : Poly :=
[
  term ((11937302793661292762942480447856697121547560263390568638583653989297054056 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(8, 2), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 1933 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1933 : Poly :=
[
  term ((23874605587322585525884960895713394243095120526781137277167307978594108112 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(8, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-11937302793661292762942480447856697121547560263390568638583653989297054056 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(8, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1933 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1933_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1933
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1933 := by
  native_decide

/-- Coefficient term 1934 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1934 : Poly :=
[
  term ((2575376191602437283392 : Rat) / 1859682113424599280495) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1934 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1934 : Poly :=
[
  term ((5150752383204874566784 : Rat) / 1859682113424599280495) [(8, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2575376191602437283392 : Rat) / 1859682113424599280495) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1934 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1934_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1934
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1934 := by
  native_decide

/-- Coefficient term 1935 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1935 : Poly :=
[
  term ((-135627328660642205148579355595485263467848 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (10, 1), (13, 2)]
]

/-- Partial product 1935 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1935 : Poly :=
[
  term ((135627328660642205148579355595485263467848 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (10, 1), (13, 2)],
  term ((-271254657321284410297158711190970526935696 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (10, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1935 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1935_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1935
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1935 := by
  native_decide

/-- Coefficient term 1936 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1936 : Poly :=
[
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(8, 2), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 1936 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1936 : Poly :=
[
  term ((-44791835683890199076096 : Rat) / 13017774793972194963465) [(8, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(8, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1936 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1936_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1936
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1936 := by
  native_decide

/-- Coefficient term 1937 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1937 : Poly :=
[
  term ((5284460321537091187395739702458132124184236660907251392412871270 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(8, 2), (10, 1), (15, 2)]
]

/-- Partial product 1937 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1937 : Poly :=
[
  term ((10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(8, 2), (10, 1), (14, 1), (15, 2)],
  term ((-5284460321537091187395739702458132124184236660907251392412871270 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(8, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1937 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1937_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1937
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1937 := by
  native_decide

/-- Coefficient term 1938 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1938 : Poly :=
[
  term ((-1926038409869376 : Rat) / 7342292683791569) [(8, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 1938 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1938 : Poly :=
[
  term ((-3852076819738752 : Rat) / 7342292683791569) [(8, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1926038409869376 : Rat) / 7342292683791569) [(8, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1938 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1938_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1938
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1938 := by
  native_decide

/-- Coefficient term 1939 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1939 : Poly :=
[
  term ((-9049482170876529896561167439601568380882764 : Rat) / 29675381231735961126159651132274349464125) [(8, 2), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1939 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1939 : Poly :=
[
  term ((9049482170876529896561167439601568380882764 : Rat) / 29675381231735961126159651132274349464125) [(8, 2), (11, 1), (12, 1), (13, 1)],
  term ((-18098964341753059793122334879203136761765528 : Rat) / 29675381231735961126159651132274349464125) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1939 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1939_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1939
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1939 := by
  native_decide

/-- Coefficient term 1940 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1940 : Poly :=
[
  term ((-60195036373496095075808 : Rat) / 13017774793972194963465) [(8, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1940 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1940 : Poly :=
[
  term ((-120390072746992190151616 : Rat) / 13017774793972194963465) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((60195036373496095075808 : Rat) / 13017774793972194963465) [(8, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1940 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1940_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1940
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1940 := by
  native_decide

/-- Coefficient term 1941 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1941 : Poly :=
[
  term ((809731242085480518121875343888166790253582 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1941 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1941 : Poly :=
[
  term ((1619462484170961036243750687776333580507164 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-809731242085480518121875343888166790253582 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1941 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1941_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1941
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1941 := by
  native_decide

/-- Coefficient term 1942 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1942 : Poly :=
[
  term ((4013249633808297879664 : Rat) / 619894037808199760165) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1942 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1942 : Poly :=
[
  term ((8026499267616595759328 : Rat) / 619894037808199760165) [(8, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4013249633808297879664 : Rat) / 619894037808199760165) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1942 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1942_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1942
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1942 := by
  native_decide

/-- Coefficient term 1943 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1943 : Poly :=
[
  term ((804346746258748341083041988874958649190589783432595914208563724737 : Rat) / 2381358785283337207905539157711689766607732526312451732039180750) [(8, 2), (11, 1), (13, 1)]
]

/-- Partial product 1943 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1943 : Poly :=
[
  term ((-804346746258748341083041988874958649190589783432595914208563724737 : Rat) / 2381358785283337207905539157711689766607732526312451732039180750) [(8, 2), (11, 1), (13, 1)],
  term ((804346746258748341083041988874958649190589783432595914208563724737 : Rat) / 1190679392641668603952769578855844883303866263156225866019590375) [(8, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1943 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1943_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1943
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1943 := by
  native_decide

/-- Coefficient term 1944 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1944 : Poly :=
[
  term ((-17338002450869709041010050565179719146405332 : Rat) / 29675381231735961126159651132274349464125) [(8, 2), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1944 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1944 : Poly :=
[
  term ((17338002450869709041010050565179719146405332 : Rat) / 29675381231735961126159651132274349464125) [(8, 2), (11, 1), (13, 1), (14, 1)],
  term ((-34676004901739418082020101130359438292810664 : Rat) / 29675381231735961126159651132274349464125) [(8, 2), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1944 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1944_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1944
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1944 := by
  native_decide

/-- Coefficient term 1945 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1945 : Poly :=
[
  term ((-10836144824645241587008 : Rat) / 2603554958794438992693) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1945 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1945 : Poly :=
[
  term ((10836144824645241587008 : Rat) / 2603554958794438992693) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-21672289649290483174016 : Rat) / 2603554958794438992693) [(8, 2), (11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1945 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1945_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1945
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1945 := by
  native_decide

/-- Coefficient term 1946 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1946 : Poly :=
[
  term ((12470361184317542426068 : Rat) / 13017774793972194963465) [(8, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1946 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1946 : Poly :=
[
  term ((24940722368635084852136 : Rat) / 13017774793972194963465) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12470361184317542426068 : Rat) / 13017774793972194963465) [(8, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1946 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1946_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1946
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1946 := by
  native_decide

/-- Coefficient term 1947 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1947 : Poly :=
[
  term ((-509708789686072261538544407668091649365674045410001479585837590644954994677 : Rat) / 1961589846315780509757129524895862309879948727683124239972069054742327250) [(8, 2), (11, 1), (15, 1)]
]

/-- Partial product 1947 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1947 : Poly :=
[
  term ((-509708789686072261538544407668091649365674045410001479585837590644954994677 : Rat) / 980794923157890254878564762447931154939974363841562119986034527371163625) [(8, 2), (11, 1), (14, 1), (15, 1)],
  term ((509708789686072261538544407668091649365674045410001479585837590644954994677 : Rat) / 1961589846315780509757129524895862309879948727683124239972069054742327250) [(8, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1947 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1947_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1947
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1947 := by
  native_decide

/-- Coefficient term 1948 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1948 : Poly :=
[
  term ((-2203868905195734473684 : Rat) / 4339258264657398321155) [(8, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1948 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1948 : Poly :=
[
  term ((-4407737810391468947368 : Rat) / 4339258264657398321155) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2203868905195734473684 : Rat) / 4339258264657398321155) [(8, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1948 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1948_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1948
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1948 := by
  native_decide

/-- Coefficient term 1949 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1949 : Poly :=
[
  term ((30975548608346060567276294787193410623728 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 2)]
]

/-- Partial product 1949 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1949 : Poly :=
[
  term ((-30975548608346060567276294787193410623728 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 2)],
  term ((61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1949 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1949_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1949
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1949 := by
  native_decide

/-- Coefficient term 1950 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1950 : Poly :=
[
  term ((-551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 2), (12, 1)]
]

/-- Partial product 1950 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1950 : Poly :=
[
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 2), (12, 1)],
  term ((-1103911739916455930633193356155188855903232 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1950 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1950_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1950
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1950 := by
  native_decide

/-- Coefficient term 1951 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1951 : Poly :=
[
  term ((-1814092432435319071232 : Rat) / 619894037808199760165) [(8, 2), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 1951 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1951 : Poly :=
[
  term ((-3628184864870638142464 : Rat) / 619894037808199760165) [(8, 2), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(8, 2), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1951 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1951_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1951
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1951 := by
  native_decide

/-- Coefficient term 1952 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1952 : Poly :=
[
  term ((275977934979113982658298339038797213975808 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 2), (14, 1)]
]

/-- Partial product 1952 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1952 : Poly :=
[
  term ((-275977934979113982658298339038797213975808 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 2), (14, 1)],
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1952 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1952_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1952
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1952 := by
  native_decide

/-- Coefficient term 1953 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1953 : Poly :=
[
  term ((907046216217659535616 : Rat) / 619894037808199760165) [(8, 2), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 1953 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1953 : Poly :=
[
  term ((-907046216217659535616 : Rat) / 619894037808199760165) [(8, 2), (11, 2), (14, 1), (16, 1)],
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(8, 2), (11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1953 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1953_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1953
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1953 := by
  native_decide

/-- Coefficient term 1954 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1954 : Poly :=
[
  term ((-315735258661985404544 : Rat) / 619894037808199760165) [(8, 2), (11, 2), (16, 1)]
]

/-- Partial product 1954 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1954 : Poly :=
[
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(8, 2), (11, 2), (14, 1), (16, 1)],
  term ((315735258661985404544 : Rat) / 619894037808199760165) [(8, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1954 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1954_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1954
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1954 := by
  native_decide

/-- Coefficient term 1955 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1955 : Poly :=
[
  term ((-5658620654890691387726825612913918700005500599224135614673107271843215818987 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(8, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1955 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1955 : Poly :=
[
  term ((-5658620654890691387726825612913918700005500599224135614673107271843215818987 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(8, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((5658620654890691387726825612913918700005500599224135614673107271843215818987 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(8, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1955 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1955_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1955
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1955 := by
  native_decide

/-- Coefficient term 1956 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1956 : Poly :=
[
  term ((-15953474763229954081676 : Rat) / 1859682113424599280495) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1956 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1956 : Poly :=
[
  term ((-31906949526459908163352 : Rat) / 1859682113424599280495) [(8, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((15953474763229954081676 : Rat) / 1859682113424599280495) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1956 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1956_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1956
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1956 := by
  native_decide

/-- Coefficient term 1957 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1957 : Poly :=
[
  term ((944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(8, 2), (12, 1), (13, 2)]
]

/-- Partial product 1957 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1957 : Poly :=
[
  term ((-944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(8, 2), (12, 1), (13, 2)],
  term ((944670600904739502583305361878242786457019 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1957 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1957_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1957
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1957 := by
  native_decide

/-- Coefficient term 1958 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1958 : Poly :=
[
  term ((77995951754312445042872 : Rat) / 13017774793972194963465) [(8, 2), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1958 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1958 : Poly :=
[
  term ((155991903508624890085744 : Rat) / 13017774793972194963465) [(8, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-77995951754312445042872 : Rat) / 13017774793972194963465) [(8, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1958 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1958_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1958
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1958 := by
  native_decide

/-- Coefficient term 1959 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1959 : Poly :=
[
  term ((15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(8, 2), (12, 1), (15, 2)]
]

/-- Partial product 1959 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1959 : Poly :=
[
  term ((15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(8, 2), (12, 1), (14, 1), (15, 2)],
  term ((-15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(8, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1959 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1959_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1959
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1959 := by
  native_decide

/-- Coefficient term 1960 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1960 : Poly :=
[
  term ((11423328844091868 : Rat) / 7342292683791569) [(8, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1960 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1960 : Poly :=
[
  term ((22846657688183736 : Rat) / 7342292683791569) [(8, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11423328844091868 : Rat) / 7342292683791569) [(8, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1960 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1960_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1960
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1960 := by
  native_decide

/-- Coefficient term 1961 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1961 : Poly :=
[
  term ((1026788159579036192519705130068414549398308962089805924820718579339148347758515580859 : Rat) / 428747172158805889164180133268208093440420081664892256599734457990315661334144000) [(8, 2), (13, 1), (15, 1)]
]

/-- Partial product 1961 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1961 : Poly :=
[
  term ((1026788159579036192519705130068414549398308962089805924820718579339148347758515580859 : Rat) / 214373586079402944582090066634104046720210040832446128299867228995157830667072000) [(8, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1026788159579036192519705130068414549398308962089805924820718579339148347758515580859 : Rat) / 428747172158805889164180133268208093440420081664892256599734457990315661334144000) [(8, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1961 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1961_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1961
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1961 := by
  native_decide

/-- Coefficient term 1962 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1962 : Poly :=
[
  term ((18034466692847781554525773 : Rat) / 420908051671767637152035) [(8, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1962 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1962 : Poly :=
[
  term ((36068933385695563109051546 : Rat) / 420908051671767637152035) [(8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18034466692847781554525773 : Rat) / 420908051671767637152035) [(8, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1962 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1962_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1962
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1962 := by
  native_decide

/-- Coefficient term 1963 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1963 : Poly :=
[
  term ((-1020906267498339183271524975904204465900366557661170966397585294242965328366246193 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 2), (13, 2)]
]

/-- Partial product 1963 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1963 : Poly :=
[
  term ((1020906267498339183271524975904204465900366557661170966397585294242965328366246193 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 2), (13, 2)],
  term ((-1020906267498339183271524975904204465900366557661170966397585294242965328366246193 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1963 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1963_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1963
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1963 := by
  native_decide

/-- Coefficient term 1964 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1964 : Poly :=
[
  term ((194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (13, 2), (14, 1)]
]

/-- Partial product 1964 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1964 : Poly :=
[
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (13, 2), (14, 1)],
  term ((389631033919608636393910441133547134673872 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1964 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1964_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1964
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1964 := by
  native_decide

/-- Coefficient term 1965 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1965 : Poly :=
[
  term ((32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 2), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1965 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1965 : Poly :=
[
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 2), (13, 2), (14, 1), (16, 1)],
  term ((64339132168338029756672 : Rat) / 13017774793972194963465) [(8, 2), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1965 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1965_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1965
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1965 := by
  native_decide

/-- Coefficient term 1966 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1966 : Poly :=
[
  term ((-44927994722911878491813227 : Rat) / 3788172465045908734368315) [(8, 2), (13, 2), (16, 1)]
]

/-- Partial product 1966 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1966 : Poly :=
[
  term ((-89855989445823756983626454 : Rat) / 3788172465045908734368315) [(8, 2), (13, 2), (14, 1), (16, 1)],
  term ((44927994722911878491813227 : Rat) / 3788172465045908734368315) [(8, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1966 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1966_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1966
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1966 := by
  native_decide

/-- Coefficient term 1967 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1967 : Poly :=
[
  term ((-67879803327838658616993636224035301216229730635689500045720517069423296717950941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(8, 2), (15, 2)]
]

/-- Partial product 1967 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1967 : Poly :=
[
  term ((-67879803327838658616993636224035301216229730635689500045720517069423296717950941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(8, 2), (14, 1), (15, 2)],
  term ((67879803327838658616993636224035301216229730635689500045720517069423296717950941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(8, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1967 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1967_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1967
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1967 := by
  native_decide

/-- Coefficient term 1968 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1968 : Poly :=
[
  term ((-1171271353191215465621 : Rat) / 64098215129500397370) [(8, 2), (15, 2), (16, 1)]
]

/-- Partial product 1968 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1968 : Poly :=
[
  term ((-1171271353191215465621 : Rat) / 32049107564750198685) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((1171271353191215465621 : Rat) / 64098215129500397370) [(8, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1968 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1968_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1968
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1968 := by
  native_decide

/-- Coefficient term 1969 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1969 : Poly :=
[
  term ((945934416344657130989 : Rat) / 85464286839333863160) [(8, 2), (16, 1)]
]

/-- Partial product 1969 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1969 : Poly :=
[
  term ((945934416344657130989 : Rat) / 42732143419666931580) [(8, 2), (14, 1), (16, 1)],
  term ((-945934416344657130989 : Rat) / 85464286839333863160) [(8, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1969 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1969_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1969
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1969 := by
  native_decide

/-- Coefficient term 1970 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1970 : Poly :=
[
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 3), (9, 1), (13, 1)]
]

/-- Partial product 1970 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1970 : Poly :=
[
  term ((-705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 3), (9, 1), (13, 1)],
  term ((1410734033780813624550909155773014691180592 : Rat) / 9891793743911987042053217044091449821375) [(8, 3), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1970 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1970_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1970
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1970 := by
  native_decide

/-- Coefficient term 1971 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1971 : Poly :=
[
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 3), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 1971 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1971 : Poly :=
[
  term ((-4800210874590085857024 : Rat) / 4339258264657398321155) [(8, 3), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 3), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1971 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1971_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1971
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1971 := by
  native_decide

/-- Coefficient term 1972 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1972 : Poly :=
[
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 3), (9, 1), (15, 1)]
]

/-- Partial product 1972 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1972 : Poly :=
[
  term ((-705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 3), (9, 1), (14, 1), (15, 1)],
  term ((352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1972 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1972_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1972
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1972 := by
  native_decide

/-- Coefficient term 1973 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1973 : Poly :=
[
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 3), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1973 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1973 : Poly :=
[
  term ((2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 3), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1973 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1973_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1973
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1973 := by
  native_decide

/-- Coefficient term 1974 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1974 : Poly :=
[
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 3), (11, 1), (13, 1)]
]

/-- Partial product 1974 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1974 : Poly :=
[
  term ((-551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 3), (11, 1), (13, 1)],
  term ((1103911739916455930633193356155188855903232 : Rat) / 1099088193767998560228135227121272202375) [(8, 3), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1974 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1974_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1974
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1974 := by
  native_decide

/-- Coefficient term 1975 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1975 : Poly :=
[
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(8, 3), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1975 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1975 : Poly :=
[
  term ((3628184864870638142464 : Rat) / 619894037808199760165) [(8, 3), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1814092432435319071232 : Rat) / 619894037808199760165) [(8, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1975 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1975_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1975
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1975 := by
  native_decide

/-- Coefficient term 1976 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1976 : Poly :=
[
  term ((-275977934979113982658298339038797213975808 : Rat) / 1099088193767998560228135227121272202375) [(8, 3), (11, 1), (15, 1)]
]

/-- Partial product 1976 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1976 : Poly :=
[
  term ((-551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 3), (11, 1), (14, 1), (15, 1)],
  term ((275977934979113982658298339038797213975808 : Rat) / 1099088193767998560228135227121272202375) [(8, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1976 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1976_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1976
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1976 := by
  native_decide

/-- Coefficient term 1977 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1977 : Poly :=
[
  term ((-907046216217659535616 : Rat) / 619894037808199760165) [(8, 3), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1977 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1977 : Poly :=
[
  term ((-1814092432435319071232 : Rat) / 619894037808199760165) [(8, 3), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((907046216217659535616 : Rat) / 619894037808199760165) [(8, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1977 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1977_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1977
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1977 := by
  native_decide

/-- Coefficient term 1978 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1978 : Poly :=
[
  term ((97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(8, 3), (13, 1), (15, 1)]
]

/-- Partial product 1978 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1978 : Poly :=
[
  term ((194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 3), (13, 1), (14, 1), (15, 1)],
  term ((-97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(8, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1978 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1978_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1978
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1978 := by
  native_decide

/-- Coefficient term 1979 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1979 : Poly :=
[
  term ((16084783042084507439168 : Rat) / 13017774793972194963465) [(8, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1979 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1979 : Poly :=
[
  term ((32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16084783042084507439168 : Rat) / 13017774793972194963465) [(8, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1979 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1979_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1979
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1979 := by
  native_decide

/-- Coefficient term 1980 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1980 : Poly :=
[
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 3), (13, 2)]
]

/-- Partial product 1980 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1980 : Poly :=
[
  term ((194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 3), (13, 2)],
  term ((-389631033919608636393910441133547134673872 : Rat) / 1187015249269438445046386045290973978565) [(8, 3), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1980 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1980_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1980
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1980 := by
  native_decide

/-- Coefficient term 1981 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1981 : Poly :=
[
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 3), (13, 2), (16, 1)]
]

/-- Partial product 1981 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1981 : Poly :=
[
  term ((-64339132168338029756672 : Rat) / 13017774793972194963465) [(8, 3), (13, 2), (14, 1), (16, 1)],
  term ((32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1981 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1981_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1981
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1981 := by
  native_decide

/-- Coefficient term 1982 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1982 : Poly :=
[
  term ((-414408885176947928833007692912410070963212088946857371795014077769046285054414529 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 1982 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1982 : Poly :=
[
  term ((414408885176947928833007692912410070963212088946857371795014077769046285054414529 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 1), (10, 1), (11, 1)],
  term ((-414408885176947928833007692912410070963212088946857371795014077769046285054414529 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(9, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1982 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1982_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1982
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1982 := by
  native_decide

/-- Coefficient term 1983 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1983 : Poly :=
[
  term ((-1309165114060851735128770128674654911574753883381342886280450684369 : Rat) / 5556503832327786818446258034660609455418042561395720708091421750) [(9, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 1983 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1983 : Poly :=
[
  term ((1309165114060851735128770128674654911574753883381342886280450684369 : Rat) / 5556503832327786818446258034660609455418042561395720708091421750) [(9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-1309165114060851735128770128674654911574753883381342886280450684369 : Rat) / 2778251916163893409223129017330304727709021280697860354045710875) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1983 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1983_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1983
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1983 := by
  native_decide

/-- Coefficient term 1984 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1984 : Poly :=
[
  term ((15175420325771137362833461890523674314072 : Rat) / 73272546251199904015209015141418146825) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 1984 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1984 : Poly :=
[
  term ((-15175420325771137362833461890523674314072 : Rat) / 73272546251199904015209015141418146825) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((30350840651542274725666923781047348628144 : Rat) / 73272546251199904015209015141418146825) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1984 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1984_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1984
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1984 := by
  native_decide

/-- Coefficient term 1985 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1985 : Poly :=
[
  term ((619445499783108148032 : Rat) / 123978807561639952033) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1985 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1985 : Poly :=
[
  term ((-619445499783108148032 : Rat) / 123978807561639952033) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((1238890999566216296064 : Rat) / 123978807561639952033) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1985 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1985_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1985
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1985 := by
  native_decide

/-- Coefficient term 1986 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1986 : Poly :=
[
  term ((10743735437991368354628 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1986 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1986 : Poly :=
[
  term ((21487470875982736709256 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-10743735437991368354628 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1986 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1986_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1986
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1986 := by
  native_decide

/-- Coefficient term 1987 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1987 : Poly :=
[
  term ((-30350840651542274725666923781047348628144 : Rat) / 73272546251199904015209015141418146825) [(9, 1), (10, 1), (11, 1), (12, 2)]
]

/-- Partial product 1987 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1987 : Poly :=
[
  term ((30350840651542274725666923781047348628144 : Rat) / 73272546251199904015209015141418146825) [(9, 1), (10, 1), (11, 1), (12, 2)],
  term ((-60701681303084549451333847562094697256288 : Rat) / 73272546251199904015209015141418146825) [(9, 1), (10, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1987 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1987_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1987
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1987 := by
  native_decide

/-- Coefficient term 1988 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1988 : Poly :=
[
  term ((-1238890999566216296064 : Rat) / 123978807561639952033) [(9, 1), (10, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 1988 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1988 : Poly :=
[
  term ((-2477781999132432592128 : Rat) / 123978807561639952033) [(9, 1), (10, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((1238890999566216296064 : Rat) / 123978807561639952033) [(9, 1), (10, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1988 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1988_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1988
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1988 := by
  native_decide

/-- Coefficient term 1989 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1989 : Poly :=
[
  term ((2083063458845907915814217156551031672123338469208056051987934142789647212723 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1989 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1989 : Poly :=
[
  term ((4166126917691815831628434313102063344246676938416112103975868285579294425446 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2083063458845907915814217156551031672123338469208056051987934142789647212723 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1989 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1989_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1989
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1989 := by
  native_decide

/-- Coefficient term 1990 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1990 : Poly :=
[
  term ((1089805110791781626712 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1990 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1990 : Poly :=
[
  term ((2179610221583563253424 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1089805110791781626712 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1990 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1990_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1990
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1990 := by
  native_decide

/-- Coefficient term 1991 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1991 : Poly :=
[
  term ((8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 1), (10, 1), (11, 1), (13, 2)]
]

/-- Partial product 1991 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1991 : Poly :=
[
  term ((-8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 1), (10, 1), (11, 1), (13, 2)],
  term ((16100272131347837784397028815214206614139464074168661820285336576 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 1), (10, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1991 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1991_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1991
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1991 := by
  native_decide

/-- Coefficient term 1992 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1992 : Poly :=
[
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 1992 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1992 : Poly :=
[
  term ((44791835683890199076096 : Rat) / 13017774793972194963465) [(9, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1992 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1992_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1992
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1992 := by
  native_decide

/-- Coefficient term 1993 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1993 : Poly :=
[
  term ((-10243193726135076165474422104912446363600507687968983197400047341 : Rat) / 766414321700384388751208004780773717988695525709754580426403000) [(9, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 1993 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1993 : Poly :=
[
  term ((10243193726135076165474422104912446363600507687968983197400047341 : Rat) / 766414321700384388751208004780773717988695525709754580426403000) [(9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-10243193726135076165474422104912446363600507687968983197400047341 : Rat) / 383207160850192194375604002390386858994347762854877290213201500) [(9, 1), (10, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1993 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1993_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1993
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1993 := by
  native_decide

/-- Coefficient term 1994 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1994 : Poly :=
[
  term ((55507672244355432480 : Rat) / 867851652931479664231) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1994 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1994 : Poly :=
[
  term ((-55507672244355432480 : Rat) / 867851652931479664231) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((111015344488710864960 : Rat) / 867851652931479664231) [(9, 1), (10, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1994 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1994_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1994
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1994 := by
  native_decide

/-- Coefficient term 1995 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1995 : Poly :=
[
  term ((-8317862069965428431081644 : Rat) / 3788172465045908734368315) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 1995 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1995 : Poly :=
[
  term ((-16635724139930856862163288 : Rat) / 3788172465045908734368315) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((8317862069965428431081644 : Rat) / 3788172465045908734368315) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1995 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1995_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1995
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1995 := by
  native_decide

/-- Coefficient term 1996 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1996 : Poly :=
[
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (10, 1), (11, 2), (13, 1)]
]

/-- Partial product 1996 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1996 : Poly :=
[
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term ((247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (10, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1996 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1996_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1996
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1996 := by
  native_decide

/-- Coefficient term 1997 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1997 : Poly :=
[
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 1997 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1997 : Poly :=
[
  term ((-2525882069295883236352 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1997 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1997_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1997
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1997 := by
  native_decide

/-- Coefficient term 1998 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1998 : Poly :=
[
  term ((-971867716975345772400936403130031840043354471179773648830160520106061491136119201 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 1998 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1998 : Poly :=
[
  term ((971867716975345772400936403130031840043354471179773648830160520106061491136119201 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-971867716975345772400936403130031840043354471179773648830160520106061491136119201 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1998 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1998_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1998
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1998 := by
  native_decide

/-- Coefficient term 1999 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1999 : Poly :=
[
  term ((-11827189509979847734496910255899571233334319 : Rat) / 39567174975647948168212868176365799285500) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1999 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1999 : Poly :=
[
  term ((11827189509979847734496910255899571233334319 : Rat) / 39567174975647948168212868176365799285500) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-11827189509979847734496910255899571233334319 : Rat) / 19783587487823974084106434088182899642750) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1999 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1999_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1999
        rs_R009_ueqv_R009NYNYN_generator_28_1900_1999 =
      rs_R009_ueqv_R009NYNYN_partial_28_1999 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_28_1900_1999 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_28_1900,
  rs_R009_ueqv_R009NYNYN_partial_28_1901,
  rs_R009_ueqv_R009NYNYN_partial_28_1902,
  rs_R009_ueqv_R009NYNYN_partial_28_1903,
  rs_R009_ueqv_R009NYNYN_partial_28_1904,
  rs_R009_ueqv_R009NYNYN_partial_28_1905,
  rs_R009_ueqv_R009NYNYN_partial_28_1906,
  rs_R009_ueqv_R009NYNYN_partial_28_1907,
  rs_R009_ueqv_R009NYNYN_partial_28_1908,
  rs_R009_ueqv_R009NYNYN_partial_28_1909,
  rs_R009_ueqv_R009NYNYN_partial_28_1910,
  rs_R009_ueqv_R009NYNYN_partial_28_1911,
  rs_R009_ueqv_R009NYNYN_partial_28_1912,
  rs_R009_ueqv_R009NYNYN_partial_28_1913,
  rs_R009_ueqv_R009NYNYN_partial_28_1914,
  rs_R009_ueqv_R009NYNYN_partial_28_1915,
  rs_R009_ueqv_R009NYNYN_partial_28_1916,
  rs_R009_ueqv_R009NYNYN_partial_28_1917,
  rs_R009_ueqv_R009NYNYN_partial_28_1918,
  rs_R009_ueqv_R009NYNYN_partial_28_1919,
  rs_R009_ueqv_R009NYNYN_partial_28_1920,
  rs_R009_ueqv_R009NYNYN_partial_28_1921,
  rs_R009_ueqv_R009NYNYN_partial_28_1922,
  rs_R009_ueqv_R009NYNYN_partial_28_1923,
  rs_R009_ueqv_R009NYNYN_partial_28_1924,
  rs_R009_ueqv_R009NYNYN_partial_28_1925,
  rs_R009_ueqv_R009NYNYN_partial_28_1926,
  rs_R009_ueqv_R009NYNYN_partial_28_1927,
  rs_R009_ueqv_R009NYNYN_partial_28_1928,
  rs_R009_ueqv_R009NYNYN_partial_28_1929,
  rs_R009_ueqv_R009NYNYN_partial_28_1930,
  rs_R009_ueqv_R009NYNYN_partial_28_1931,
  rs_R009_ueqv_R009NYNYN_partial_28_1932,
  rs_R009_ueqv_R009NYNYN_partial_28_1933,
  rs_R009_ueqv_R009NYNYN_partial_28_1934,
  rs_R009_ueqv_R009NYNYN_partial_28_1935,
  rs_R009_ueqv_R009NYNYN_partial_28_1936,
  rs_R009_ueqv_R009NYNYN_partial_28_1937,
  rs_R009_ueqv_R009NYNYN_partial_28_1938,
  rs_R009_ueqv_R009NYNYN_partial_28_1939,
  rs_R009_ueqv_R009NYNYN_partial_28_1940,
  rs_R009_ueqv_R009NYNYN_partial_28_1941,
  rs_R009_ueqv_R009NYNYN_partial_28_1942,
  rs_R009_ueqv_R009NYNYN_partial_28_1943,
  rs_R009_ueqv_R009NYNYN_partial_28_1944,
  rs_R009_ueqv_R009NYNYN_partial_28_1945,
  rs_R009_ueqv_R009NYNYN_partial_28_1946,
  rs_R009_ueqv_R009NYNYN_partial_28_1947,
  rs_R009_ueqv_R009NYNYN_partial_28_1948,
  rs_R009_ueqv_R009NYNYN_partial_28_1949,
  rs_R009_ueqv_R009NYNYN_partial_28_1950,
  rs_R009_ueqv_R009NYNYN_partial_28_1951,
  rs_R009_ueqv_R009NYNYN_partial_28_1952,
  rs_R009_ueqv_R009NYNYN_partial_28_1953,
  rs_R009_ueqv_R009NYNYN_partial_28_1954,
  rs_R009_ueqv_R009NYNYN_partial_28_1955,
  rs_R009_ueqv_R009NYNYN_partial_28_1956,
  rs_R009_ueqv_R009NYNYN_partial_28_1957,
  rs_R009_ueqv_R009NYNYN_partial_28_1958,
  rs_R009_ueqv_R009NYNYN_partial_28_1959,
  rs_R009_ueqv_R009NYNYN_partial_28_1960,
  rs_R009_ueqv_R009NYNYN_partial_28_1961,
  rs_R009_ueqv_R009NYNYN_partial_28_1962,
  rs_R009_ueqv_R009NYNYN_partial_28_1963,
  rs_R009_ueqv_R009NYNYN_partial_28_1964,
  rs_R009_ueqv_R009NYNYN_partial_28_1965,
  rs_R009_ueqv_R009NYNYN_partial_28_1966,
  rs_R009_ueqv_R009NYNYN_partial_28_1967,
  rs_R009_ueqv_R009NYNYN_partial_28_1968,
  rs_R009_ueqv_R009NYNYN_partial_28_1969,
  rs_R009_ueqv_R009NYNYN_partial_28_1970,
  rs_R009_ueqv_R009NYNYN_partial_28_1971,
  rs_R009_ueqv_R009NYNYN_partial_28_1972,
  rs_R009_ueqv_R009NYNYN_partial_28_1973,
  rs_R009_ueqv_R009NYNYN_partial_28_1974,
  rs_R009_ueqv_R009NYNYN_partial_28_1975,
  rs_R009_ueqv_R009NYNYN_partial_28_1976,
  rs_R009_ueqv_R009NYNYN_partial_28_1977,
  rs_R009_ueqv_R009NYNYN_partial_28_1978,
  rs_R009_ueqv_R009NYNYN_partial_28_1979,
  rs_R009_ueqv_R009NYNYN_partial_28_1980,
  rs_R009_ueqv_R009NYNYN_partial_28_1981,
  rs_R009_ueqv_R009NYNYN_partial_28_1982,
  rs_R009_ueqv_R009NYNYN_partial_28_1983,
  rs_R009_ueqv_R009NYNYN_partial_28_1984,
  rs_R009_ueqv_R009NYNYN_partial_28_1985,
  rs_R009_ueqv_R009NYNYN_partial_28_1986,
  rs_R009_ueqv_R009NYNYN_partial_28_1987,
  rs_R009_ueqv_R009NYNYN_partial_28_1988,
  rs_R009_ueqv_R009NYNYN_partial_28_1989,
  rs_R009_ueqv_R009NYNYN_partial_28_1990,
  rs_R009_ueqv_R009NYNYN_partial_28_1991,
  rs_R009_ueqv_R009NYNYN_partial_28_1992,
  rs_R009_ueqv_R009NYNYN_partial_28_1993,
  rs_R009_ueqv_R009NYNYN_partial_28_1994,
  rs_R009_ueqv_R009NYNYN_partial_28_1995,
  rs_R009_ueqv_R009NYNYN_partial_28_1996,
  rs_R009_ueqv_R009NYNYN_partial_28_1997,
  rs_R009_ueqv_R009NYNYN_partial_28_1998,
  rs_R009_ueqv_R009NYNYN_partial_28_1999
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_28_1900_1999 : Poly :=
[
  term ((20756005610147729358403219 : Rat) / 674954205313639184306100) [(8, 1), (14, 1), (16, 1)],
  term ((-20756005610147729358403219 : Rat) / 1349908410627278368612200) [(8, 1), (16, 1)],
  term ((-39234344790765647654748325687558473678265820429700300571588742244606585635888639 : Rat) / 87055999896880187987549160301161551642315772214294656963202962730374841344000) [(8, 2)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (10, 1), (13, 1)],
  term ((982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-3341827119770676978432 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (10, 1), (15, 1)],
  term ((-835456779942669244608 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-472207042615048584508287322324383882378538 : Rat) / 1978358748782397408410643408818289964275) [(8, 2), (9, 1), (11, 1)],
  term ((1134593969302891700024964936116971439430968 : Rat) / 1978358748782397408410643408818289964275) [(8, 2), (9, 1), (11, 1), (12, 1)],
  term ((-2269187938605783400049929872233942878861936 : Rat) / 1978358748782397408410643408818289964275) [(8, 2), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-20597083179504381140224 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((10298541589752190570112 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((13004037950987976517382488847940760173848 : Rat) / 68219267199393014083125634786837584975) [(8, 2), (9, 1), (11, 1), (14, 1)],
  term ((8384833012113807458176 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((1134593969302891700024964936116971439430968 : Rat) / 1978358748782397408410643408818289964275) [(8, 2), (9, 1), (11, 1), (14, 2)],
  term ((10298541589752190570112 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-6767051903494951371616 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term ((520308496359950540440778431075668216955327 : Rat) / 59350762463471922252319302264548698928250) [(8, 2), (9, 1), (12, 1), (13, 1)],
  term ((-520308496359950540440778431075668216955327 : Rat) / 29675381231735961126159651132274349464125) [(8, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((99253841444068580951216 : Rat) / 13017774793972194963465) [(8, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-49626920722034290475608 : Rat) / 13017774793972194963465) [(8, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((6241829515678349399197998131350811576961893 : Rat) / 19783587487823974084106434088182899642750) [(8, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-10619329087211844389448 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6241829515678349399197998131350811576961893 : Rat) / 39567174975647948168212868176365799285500) [(8, 2), (9, 1), (12, 1), (15, 1)],
  term ((5309664543605922194724 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((93062460494473049980318336838847255825565668541520865878561286387249090029031191 : Rat) / 147957229656029639665552960100225185619776868672700548673221247005860465951200) [(8, 2), (9, 1), (13, 1)],
  term ((-408582028633320152964135239051673400459872686908908216434182696982057860699866931 : Rat) / 369893074140074099163882400250562964049442171681751371683053117514651164878000) [(8, 2), (9, 1), (13, 1), (14, 1)],
  term ((-70634429156488935516445438 : Rat) / 3788172465045908734368315) [(8, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9102590025337548828576607981488383256965176 : Rat) / 29675381231735961126159651132274349464125) [(8, 2), (9, 1), (13, 1), (14, 2)],
  term ((-17768933460398757307264 : Rat) / 13017774793972194963465) [(8, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((1045997271071099352923605 : Rat) / 108233499001311678124809) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((400537681318815016007953143616739593157503814900483561683948041696936605490364813 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 2), (9, 1), (14, 1), (15, 1)],
  term ((32090768498158254684266666 : Rat) / 3788172465045908734368315) [(8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-400537681318815016007953143616739593157503814900483561683948041696936605490364813 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 2), (9, 1), (15, 1)],
  term ((-16045384249079127342133333 : Rat) / 3788172465045908734368315) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 2)],
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 2), (12, 1)],
  term ((-1410734033780813624550909155773014691180592 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 2), (12, 1), (14, 1)],
  term ((4800210874590085857024 : Rat) / 4339258264657398321155) [(8, 2), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 2), (9, 2), (12, 1), (16, 1)],
  term ((352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 2), (14, 1)],
  term ((-1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 2), (9, 2), (14, 1), (16, 1)],
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 2), (14, 2)],
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 2), (9, 2), (14, 2), (16, 1)],
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 2), (9, 2), (16, 1)],
  term ((137007524352949323249170167964575687366646469566051 : Rat) / 73144122068565168275232132022233738601204849100226) [(8, 2), (10, 1)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((-247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((2525882069295883236352 : Rat) / 619894037808199760165) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(8, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(8, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((23874605587322585525884960895713394243095120526781137277167307978594108112 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(8, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((5150752383204874566784 : Rat) / 1859682113424599280495) [(8, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11937302793661292762942480447856697121547560263390568638583653989297054056 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((-2575376191602437283392 : Rat) / 1859682113424599280495) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((135627328660642205148579355595485263467848 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (10, 1), (13, 2)],
  term ((-271254657321284410297158711190970526935696 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (10, 1), (13, 2), (14, 1)],
  term ((-44791835683890199076096 : Rat) / 13017774793972194963465) [(8, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(8, 2), (10, 1), (13, 2), (16, 1)],
  term ((-137007524352949323249170167964575687366646469566051 : Rat) / 36572061034282584137616066011116869300602424550113) [(8, 2), (10, 1), (14, 1)],
  term ((10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(8, 2), (10, 1), (14, 1), (15, 2)],
  term ((-3852076819738752 : Rat) / 7342292683791569) [(8, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5284460321537091187395739702458132124184236660907251392412871270 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(8, 2), (10, 1), (15, 2)],
  term ((1926038409869376 : Rat) / 7342292683791569) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((9049482170876529896561167439601568380882764 : Rat) / 29675381231735961126159651132274349464125) [(8, 2), (11, 1), (12, 1), (13, 1)],
  term ((-18098964341753059793122334879203136761765528 : Rat) / 29675381231735961126159651132274349464125) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-120390072746992190151616 : Rat) / 13017774793972194963465) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((60195036373496095075808 : Rat) / 13017774793972194963465) [(8, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1619462484170961036243750687776333580507164 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((8026499267616595759328 : Rat) / 619894037808199760165) [(8, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-809731242085480518121875343888166790253582 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((-4013249633808297879664 : Rat) / 619894037808199760165) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-804346746258748341083041988874958649190589783432595914208563724737 : Rat) / 2381358785283337207905539157711689766607732526312451732039180750) [(8, 2), (11, 1), (13, 1)],
  term ((1500007639933935225674125200031608515714826341940073320648852403709 : Rat) / 1190679392641668603952769578855844883303866263156225866019590375) [(8, 2), (11, 1), (13, 1), (14, 1)],
  term ((4164286657466383830904 : Rat) / 685146041788010261235) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-34676004901739418082020101130359438292810664 : Rat) / 29675381231735961126159651132274349464125) [(8, 2), (11, 1), (13, 1), (14, 2)],
  term ((-21672289649290483174016 : Rat) / 2603554958794438992693) [(8, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-12470361184317542426068 : Rat) / 13017774793972194963465) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-509708789686072261538544407668091649365674045410001479585837590644954994677 : Rat) / 980794923157890254878564762447931154939974363841562119986034527371163625) [(8, 2), (11, 1), (14, 1), (15, 1)],
  term ((-4407737810391468947368 : Rat) / 4339258264657398321155) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((509708789686072261538544407668091649365674045410001479585837590644954994677 : Rat) / 1961589846315780509757129524895862309879948727683124239972069054742327250) [(8, 2), (11, 1), (15, 1)],
  term ((2203868905195734473684 : Rat) / 4339258264657398321155) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-30975548608346060567276294787193410623728 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 2)],
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 2), (12, 1)],
  term ((-1103911739916455930633193356155188855903232 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 2), (12, 1), (14, 1)],
  term ((-3628184864870638142464 : Rat) / 619894037808199760165) [(8, 2), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(8, 2), (11, 2), (12, 1), (16, 1)],
  term ((-30575262537488837360535107066344341818336 : Rat) / 157012599109714080032590746731610314625) [(8, 2), (11, 2), (14, 1)],
  term ((-1538516733541630344704 : Rat) / 619894037808199760165) [(8, 2), (11, 2), (14, 1), (16, 1)],
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 2), (14, 2)],
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(8, 2), (11, 2), (14, 2), (16, 1)],
  term ((315735258661985404544 : Rat) / 619894037808199760165) [(8, 2), (11, 2), (16, 1)],
  term ((-5658620654890691387726825612913918700005500599224135614673107271843215818987 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(8, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-31906949526459908163352 : Rat) / 1859682113424599280495) [(8, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5658620654890691387726825612913918700005500599224135614673107271843215818987 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(8, 2), (12, 1), (13, 1), (15, 1)],
  term ((15953474763229954081676 : Rat) / 1859682113424599280495) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(8, 2), (12, 1), (13, 2)],
  term ((944670600904739502583305361878242786457019 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (12, 1), (13, 2), (14, 1)],
  term ((155991903508624890085744 : Rat) / 13017774793972194963465) [(8, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-77995951754312445042872 : Rat) / 13017774793972194963465) [(8, 2), (12, 1), (13, 2), (16, 1)],
  term ((15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(8, 2), (12, 1), (14, 1), (15, 2)],
  term ((22846657688183736 : Rat) / 7342292683791569) [(8, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(8, 2), (12, 1), (15, 2)],
  term ((-11423328844091868 : Rat) / 7342292683791569) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((1026788159579036192519705130068414549398308962089805924820718579339148347758515580859 : Rat) / 214373586079402944582090066634104046720210040832446128299867228995157830667072000) [(8, 2), (13, 1), (14, 1), (15, 1)],
  term ((36068933385695563109051546 : Rat) / 420908051671767637152035) [(8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1026788159579036192519705130068414549398308962089805924820718579339148347758515580859 : Rat) / 428747172158805889164180133268208093440420081664892256599734457990315661334144000) [(8, 2), (13, 1), (15, 1)],
  term ((-18034466692847781554525773 : Rat) / 420908051671767637152035) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((1020906267498339183271524975904204465900366557661170966397585294242965328366246193 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 2), (13, 2)],
  term ((-1142321574509433504899211384404762455731541347370173520165975102749520001512172593 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 2), (13, 2), (14, 1)],
  term ((-19843466635263388062644446 : Rat) / 757634493009181746873663) [(8, 2), (13, 2), (14, 1), (16, 1)],
  term ((389631033919608636393910441133547134673872 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (13, 2), (14, 2)],
  term ((64339132168338029756672 : Rat) / 13017774793972194963465) [(8, 2), (13, 2), (14, 2), (16, 1)],
  term ((44927994722911878491813227 : Rat) / 3788172465045908734368315) [(8, 2), (13, 2), (16, 1)],
  term ((39234344790765647654748325687558473678265820429700300571588742244606585635888639 : Rat) / 43527999948440093993774580150580775821157886107147328481601481365187420672000) [(8, 2), (14, 1)],
  term ((-67879803327838658616993636224035301216229730635689500045720517069423296717950941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(8, 2), (14, 1), (15, 2)],
  term ((-1171271353191215465621 : Rat) / 32049107564750198685) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((945934416344657130989 : Rat) / 42732143419666931580) [(8, 2), (14, 1), (16, 1)],
  term ((67879803327838658616993636224035301216229730635689500045720517069423296717950941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(8, 2), (15, 2)],
  term ((1171271353191215465621 : Rat) / 64098215129500397370) [(8, 2), (15, 2), (16, 1)],
  term ((-945934416344657130989 : Rat) / 85464286839333863160) [(8, 2), (16, 1)],
  term ((-705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 3), (9, 1), (13, 1)],
  term ((1410734033780813624550909155773014691180592 : Rat) / 9891793743911987042053217044091449821375) [(8, 3), (9, 1), (13, 1), (14, 1)],
  term ((-4800210874590085857024 : Rat) / 4339258264657398321155) [(8, 3), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 3), (9, 1), (13, 1), (16, 1)],
  term ((-705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 3), (9, 1), (14, 1), (15, 1)],
  term ((2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 3), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 3), (9, 1), (15, 1)],
  term ((-1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 3), (9, 1), (15, 1), (16, 1)],
  term ((-551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 3), (11, 1), (13, 1)],
  term ((1103911739916455930633193356155188855903232 : Rat) / 1099088193767998560228135227121272202375) [(8, 3), (11, 1), (13, 1), (14, 1)],
  term ((3628184864870638142464 : Rat) / 619894037808199760165) [(8, 3), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1814092432435319071232 : Rat) / 619894037808199760165) [(8, 3), (11, 1), (13, 1), (16, 1)],
  term ((-551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 3), (11, 1), (14, 1), (15, 1)],
  term ((-1814092432435319071232 : Rat) / 619894037808199760165) [(8, 3), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((275977934979113982658298339038797213975808 : Rat) / 1099088193767998560228135227121272202375) [(8, 3), (11, 1), (15, 1)],
  term ((907046216217659535616 : Rat) / 619894037808199760165) [(8, 3), (11, 1), (15, 1), (16, 1)],
  term ((194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 3), (13, 1), (14, 1), (15, 1)],
  term ((32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(8, 3), (13, 1), (15, 1)],
  term ((-16084783042084507439168 : Rat) / 13017774793972194963465) [(8, 3), (13, 1), (15, 1), (16, 1)],
  term ((194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 3), (13, 2)],
  term ((-389631033919608636393910441133547134673872 : Rat) / 1187015249269438445046386045290973978565) [(8, 3), (13, 2), (14, 1)],
  term ((-64339132168338029756672 : Rat) / 13017774793972194963465) [(8, 3), (13, 2), (14, 1), (16, 1)],
  term ((32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 3), (13, 2), (16, 1)],
  term ((414408885176947928833007692912410070963212088946857371795014077769046285054414529 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 1), (10, 1), (11, 1)],
  term ((1309165114060851735128770128674654911574753883381342886280450684369 : Rat) / 5556503832327786818446258034660609455418042561395720708091421750) [(9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-1884566717468017774961729908052466249581247023088806435609298933209 : Rat) / 2778251916163893409223129017330304727709021280697860354045710875) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-193121616426048471864 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((30350840651542274725666923781047348628144 : Rat) / 73272546251199904015209015141418146825) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 2)],
  term ((1238890999566216296064 : Rat) / 123978807561639952033) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-10743735437991368354628 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((30350840651542274725666923781047348628144 : Rat) / 73272546251199904015209015141418146825) [(9, 1), (10, 1), (11, 1), (12, 2)],
  term ((-60701681303084549451333847562094697256288 : Rat) / 73272546251199904015209015141418146825) [(9, 1), (10, 1), (11, 1), (12, 2), (14, 1)],
  term ((-2477781999132432592128 : Rat) / 123978807561639952033) [(9, 1), (10, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((1238890999566216296064 : Rat) / 123978807561639952033) [(9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((4166126917691815831628434313102063344246676938416112103975868285579294425446 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((2179610221583563253424 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2083063458845907915814217156551031672123338469208056051987934142789647212723 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1089805110791781626712 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 1), (10, 1), (11, 1), (13, 2)],
  term ((16100272131347837784397028815214206614139464074168661820285336576 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 1), (10, 1), (11, 1), (13, 2), (14, 1)],
  term ((44791835683890199076096 : Rat) / 13017774793972194963465) [(9, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-404521579292667704764120399924270773786199103884308801284661954286482515328743197 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-888316585751445701312552 : Rat) / 199377498160310986019385) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-10243193726135076165474422104912446363600507687968983197400047341 : Rat) / 383207160850192194375604002390386858994347762854877290213201500) [(9, 1), (10, 1), (11, 1), (14, 2)],
  term ((111015344488710864960 : Rat) / 867851652931479664231) [(9, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((8317862069965428431081644 : Rat) / 3788172465045908734368315) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term ((247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (10, 1), (11, 2), (13, 1), (14, 1)],
  term ((-2525882069295883236352 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((971867716975345772400936403130031840043354471179773648830160520106061491136119201 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-9045001806546936883373881030779783082543490340427076429067455525780490029028851 : Rat) / 8913086123857207208768250608447300338540775221247021004410918494328943732000) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-11827189509979847734496910255899571233334319 : Rat) / 19783587487823974084106434088182899642750) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 1900 through 1999. -/
theorem rs_R009_ueqv_R009NYNYN_block_28_1900_1999_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_28_1900_1999
      rs_R009_ueqv_R009NYNYN_block_28_1900_1999 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
