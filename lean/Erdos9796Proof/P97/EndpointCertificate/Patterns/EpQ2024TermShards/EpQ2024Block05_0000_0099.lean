/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 5:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 5 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_05_0000_0099 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0000 : Poly :=
[
  term ((1203985881286898978259264505040398363233 : Rat) / 799806304934984864377795685353026178660) []
]

/-- Partial product 0 for generator 5. -/
def ep_Q2_024_partial_05_0000 : Poly :=
[
  term ((1203985881286898978259264505040398363233 : Rat) / 799806304934984864377795685353026178660) [(2, 2)],
  term ((1203985881286898978259264505040398363233 : Rat) / 799806304934984864377795685353026178660) [(3, 2)],
  term ((-1203985881286898978259264505040398363233 : Rat) / 799806304934984864377795685353026178660) [(14, 2)],
  term ((-1203985881286898978259264505040398363233 : Rat) / 799806304934984864377795685353026178660) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 5. -/
theorem ep_Q2_024_partial_05_0000_valid :
    mulPoly ep_Q2_024_coefficient_05_0000
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0001 : Poly :=
[
  term ((-1226522336020992712801912164099948448654 : Rat) / 1799564186103715944850040292044308901985) [(0, 1)]
]

/-- Partial product 1 for generator 5. -/
def ep_Q2_024_partial_05_0001 : Poly :=
[
  term ((-1226522336020992712801912164099948448654 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (2, 2)],
  term ((-1226522336020992712801912164099948448654 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 2)],
  term ((1226522336020992712801912164099948448654 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (14, 2)],
  term ((1226522336020992712801912164099948448654 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 5. -/
theorem ep_Q2_024_partial_05_0001_valid :
    mulPoly ep_Q2_024_coefficient_05_0001
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0002 : Poly :=
[
  term ((-84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1)]
]

/-- Partial product 2 for generator 5. -/
def ep_Q2_024_partial_05_0002 : Poly :=
[
  term ((-84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (2, 2), (9, 1)],
  term ((-84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (3, 2), (9, 1)],
  term ((84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1), (14, 2)],
  term ((84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 5. -/
theorem ep_Q2_024_partial_05_0002_valid :
    mulPoly ep_Q2_024_coefficient_05_0002
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0003 : Poly :=
[
  term ((121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (13, 1)]
]

/-- Partial product 3 for generator 5. -/
def ep_Q2_024_partial_05_0003 : Poly :=
[
  term ((121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (2, 2), (13, 1)],
  term ((121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (3, 2), (13, 1)],
  term ((-121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (13, 1), (14, 2)],
  term ((-121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 5. -/
theorem ep_Q2_024_partial_05_0003_valid :
    mulPoly ep_Q2_024_coefficient_05_0003
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0004 : Poly :=
[
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 4 for generator 5. -/
def ep_Q2_024_partial_05_0004 : Poly :=
[
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (1, 1), (3, 2), (15, 1)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (1, 1), (14, 2), (15, 1)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (1, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 5. -/
theorem ep_Q2_024_partial_05_0004_valid :
    mulPoly ep_Q2_024_coefficient_05_0004
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0005 : Poly :=
[
  term ((-9851670194564511 : Rat) / 2325560442306386) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 5. -/
def ep_Q2_024_partial_05_0005 : Poly :=
[
  term ((-9851670194564511 : Rat) / 2325560442306386) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-9851670194564511 : Rat) / 2325560442306386) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((9851670194564511 : Rat) / 2325560442306386) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((9851670194564511 : Rat) / 2325560442306386) [(0, 1), (1, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 5. -/
theorem ep_Q2_024_partial_05_0005_valid :
    mulPoly ep_Q2_024_coefficient_05_0005
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0006 : Poly :=
[
  term ((-2026668639087705403624852686972380630 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (9, 1)]
]

/-- Partial product 6 for generator 5. -/
def ep_Q2_024_partial_05_0006 : Poly :=
[
  term ((-2026668639087705403624852686972380630 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 2), (5, 1), (9, 1)],
  term ((-2026668639087705403624852686972380630 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 2), (5, 1), (9, 1)],
  term ((2026668639087705403624852686972380630 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (9, 1), (14, 2)],
  term ((2026668639087705403624852686972380630 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 5. -/
theorem ep_Q2_024_partial_05_0006_valid :
    mulPoly ep_Q2_024_coefficient_05_0006
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0007 : Poly :=
[
  term ((-13408278867591516263964573029451067132 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (13, 1)]
]

/-- Partial product 7 for generator 5. -/
def ep_Q2_024_partial_05_0007 : Poly :=
[
  term ((-13408278867591516263964573029451067132 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 2), (5, 1), (13, 1)],
  term ((-13408278867591516263964573029451067132 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 2), (5, 1), (13, 1)],
  term ((13408278867591516263964573029451067132 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (13, 1), (14, 2)],
  term ((13408278867591516263964573029451067132 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 5. -/
theorem ep_Q2_024_partial_05_0007_valid :
    mulPoly ep_Q2_024_coefficient_05_0007
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0008 : Poly :=
[
  term ((-90571061978454541516795555975182944929229918063114182 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 8 for generator 5. -/
def ep_Q2_024_partial_05_0008 : Poly :=
[
  term ((-90571061978454541516795555975182944929229918063114182 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (2, 2), (5, 1), (15, 1)],
  term ((-90571061978454541516795555975182944929229918063114182 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 2), (5, 1), (15, 1)],
  term ((90571061978454541516795555975182944929229918063114182 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (14, 2), (15, 1)],
  term ((90571061978454541516795555975182944929229918063114182 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 5. -/
theorem ep_Q2_024_partial_05_0008_valid :
    mulPoly ep_Q2_024_coefficient_05_0008
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0009 : Poly :=
[
  term ((375647204014056 : Rat) / 1162780221153193) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 5. -/
def ep_Q2_024_partial_05_0009 : Poly :=
[
  term ((375647204014056 : Rat) / 1162780221153193) [(0, 1), (2, 2), (5, 1), (15, 1), (16, 1)],
  term ((375647204014056 : Rat) / 1162780221153193) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-375647204014056 : Rat) / 1162780221153193) [(0, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-375647204014056 : Rat) / 1162780221153193) [(0, 1), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 5. -/
theorem ep_Q2_024_partial_05_0009_valid :
    mulPoly ep_Q2_024_coefficient_05_0009
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0010 : Poly :=
[
  term ((711267717866237224134638869344200372606 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1)]
]

/-- Partial product 10 for generator 5. -/
def ep_Q2_024_partial_05_0010 : Poly :=
[
  term ((711267717866237224134638869344200372606 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (7, 1), (9, 1)],
  term ((711267717866237224134638869344200372606 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (7, 1), (9, 1)],
  term ((-711267717866237224134638869344200372606 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (14, 2)],
  term ((-711267717866237224134638869344200372606 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 5. -/
theorem ep_Q2_024_partial_05_0010_valid :
    mulPoly ep_Q2_024_coefficient_05_0010
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0011 : Poly :=
[
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 11 for generator 5. -/
def ep_Q2_024_partial_05_0011 : Poly :=
[
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (7, 1), (12, 1), (13, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (7, 1), (12, 1), (13, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 2)],
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 5. -/
theorem ep_Q2_024_partial_05_0011_valid :
    mulPoly ep_Q2_024_coefficient_05_0011
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0012 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 12 for generator 5. -/
def ep_Q2_024_partial_05_0012 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (2, 2), (7, 1), (12, 1), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (3, 2), (7, 1), (12, 1), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 5. -/
theorem ep_Q2_024_partial_05_0012_valid :
    mulPoly ep_Q2_024_coefficient_05_0012
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0013 : Poly :=
[
  term ((217230840263161 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 5. -/
def ep_Q2_024_partial_05_0013 : Poly :=
[
  term ((217230840263161 : Rat) / 1162780221153193) [(0, 1), (2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((217230840263161 : Rat) / 1162780221153193) [(0, 1), (3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-217230840263161 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-217230840263161 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 5. -/
theorem ep_Q2_024_partial_05_0013_valid :
    mulPoly ep_Q2_024_coefficient_05_0013
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0014 : Poly :=
[
  term ((-123905327885937413341038734560550052154 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 14 for generator 5. -/
def ep_Q2_024_partial_05_0014 : Poly :=
[
  term ((-123905327885937413341038734560550052154 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (7, 1), (13, 1)],
  term ((-123905327885937413341038734560550052154 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (7, 1), (13, 1)],
  term ((123905327885937413341038734560550052154 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (13, 1), (14, 2)],
  term ((123905327885937413341038734560550052154 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 5. -/
theorem ep_Q2_024_partial_05_0014_valid :
    mulPoly ep_Q2_024_coefficient_05_0014
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0015 : Poly :=
[
  term ((-43399307162444072615649573376780395590797368741150161437 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 15 for generator 5. -/
def ep_Q2_024_partial_05_0015 : Poly :=
[
  term ((-43399307162444072615649573376780395590797368741150161437 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((-43399307162444072615649573376780395590797368741150161437 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((43399307162444072615649573376780395590797368741150161437 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term ((43399307162444072615649573376780395590797368741150161437 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 5. -/
theorem ep_Q2_024_partial_05_0015_valid :
    mulPoly ep_Q2_024_coefficient_05_0015
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0016 : Poly :=
[
  term ((-3316024588732535 : Rat) / 1162780221153193) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 5. -/
def ep_Q2_024_partial_05_0016 : Poly :=
[
  term ((-3316024588732535 : Rat) / 1162780221153193) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-3316024588732535 : Rat) / 1162780221153193) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((3316024588732535 : Rat) / 1162780221153193) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((3316024588732535 : Rat) / 1162780221153193) [(0, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 5. -/
theorem ep_Q2_024_partial_05_0016_valid :
    mulPoly ep_Q2_024_coefficient_05_0016
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0017 : Poly :=
[
  term ((-121927047278514377755144520733639888760 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 17 for generator 5. -/
def ep_Q2_024_partial_05_0017 : Poly :=
[
  term ((-121927047278514377755144520733639888760 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 2), (9, 1), (11, 1)],
  term ((-121927047278514377755144520733639888760 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 2), (9, 1), (11, 1)],
  term ((121927047278514377755144520733639888760 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (9, 1), (11, 1), (14, 2)],
  term ((121927047278514377755144520733639888760 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 5. -/
theorem ep_Q2_024_partial_05_0017_valid :
    mulPoly ep_Q2_024_coefficient_05_0017
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0018 : Poly :=
[
  term ((15079716211403877354660632708118932532 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 18 for generator 5. -/
def ep_Q2_024_partial_05_0018 : Poly :=
[
  term ((15079716211403877354660632708118932532 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 2), (9, 1), (12, 1), (13, 1)],
  term ((15079716211403877354660632708118932532 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 2), (9, 1), (12, 1), (13, 1)],
  term ((-15079716211403877354660632708118932532 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-15079716211403877354660632708118932532 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 5. -/
theorem ep_Q2_024_partial_05_0018_valid :
    mulPoly ep_Q2_024_coefficient_05_0018
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0019 : Poly :=
[
  term ((-8501248819002635272876995587763821200414506222869636947 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 19 for generator 5. -/
def ep_Q2_024_partial_05_0019 : Poly :=
[
  term ((-8501248819002635272876995587763821200414506222869636947 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (2, 2), (9, 1), (12, 1), (15, 1)],
  term ((-8501248819002635272876995587763821200414506222869636947 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (3, 2), (9, 1), (12, 1), (15, 1)],
  term ((8501248819002635272876995587763821200414506222869636947 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((8501248819002635272876995587763821200414506222869636947 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 5. -/
theorem ep_Q2_024_partial_05_0019_valid :
    mulPoly ep_Q2_024_coefficient_05_0019
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0020 : Poly :=
[
  term ((2371573036421067 : Rat) / 1162780221153193) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 5. -/
def ep_Q2_024_partial_05_0020 : Poly :=
[
  term ((2371573036421067 : Rat) / 1162780221153193) [(0, 1), (2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((2371573036421067 : Rat) / 1162780221153193) [(0, 1), (3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2371573036421067 : Rat) / 1162780221153193) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2371573036421067 : Rat) / 1162780221153193) [(0, 1), (9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 5. -/
theorem ep_Q2_024_partial_05_0020_valid :
    mulPoly ep_Q2_024_coefficient_05_0020
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0021 : Poly :=
[
  term ((-16699908980317574655756114821325118063192 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 21 for generator 5. -/
def ep_Q2_024_partial_05_0021 : Poly :=
[
  term ((-16699908980317574655756114821325118063192 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (2, 2), (9, 1), (13, 1)],
  term ((-16699908980317574655756114821325118063192 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 2), (9, 1), (13, 1)],
  term ((16699908980317574655756114821325118063192 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (13, 1), (14, 2)],
  term ((16699908980317574655756114821325118063192 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 5. -/
theorem ep_Q2_024_partial_05_0021_valid :
    mulPoly ep_Q2_024_coefficient_05_0021
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0022 : Poly :=
[
  term ((-138258718443640172154833149031924695353189838244162526323 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 22 for generator 5. -/
def ep_Q2_024_partial_05_0022 : Poly :=
[
  term ((-138258718443640172154833149031924695353189838244162526323 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((-138258718443640172154833149031924695353189838244162526323 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((138258718443640172154833149031924695353189838244162526323 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((138258718443640172154833149031924695353189838244162526323 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 5. -/
theorem ep_Q2_024_partial_05_0022_valid :
    mulPoly ep_Q2_024_coefficient_05_0022
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0023 : Poly :=
[
  term ((86455999411294361 : Rat) / 6976681326919158) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 5. -/
def ep_Q2_024_partial_05_0023 : Poly :=
[
  term ((86455999411294361 : Rat) / 6976681326919158) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((86455999411294361 : Rat) / 6976681326919158) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-86455999411294361 : Rat) / 6976681326919158) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-86455999411294361 : Rat) / 6976681326919158) [(0, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 5. -/
theorem ep_Q2_024_partial_05_0023_valid :
    mulPoly ep_Q2_024_coefficient_05_0023
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0024 : Poly :=
[
  term ((1510320506263851247606420389471568293124 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2)]
]

/-- Partial product 24 for generator 5. -/
def ep_Q2_024_partial_05_0024 : Poly :=
[
  term ((1510320506263851247606420389471568293124 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 2), (9, 2)],
  term ((1510320506263851247606420389471568293124 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 2), (9, 2)],
  term ((-1510320506263851247606420389471568293124 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (14, 2)],
  term ((-1510320506263851247606420389471568293124 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 5. -/
theorem ep_Q2_024_partial_05_0024_valid :
    mulPoly ep_Q2_024_coefficient_05_0024
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0025 : Poly :=
[
  term ((-50147794845543336284049146931354572708 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 25 for generator 5. -/
def ep_Q2_024_partial_05_0025 : Poly :=
[
  term ((-50147794845543336284049146931354572708 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 2), (11, 1), (12, 1), (13, 1)],
  term ((-50147794845543336284049146931354572708 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 2), (11, 1), (12, 1), (13, 1)],
  term ((50147794845543336284049146931354572708 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((50147794845543336284049146931354572708 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 5. -/
theorem ep_Q2_024_partial_05_0025_valid :
    mulPoly ep_Q2_024_coefficient_05_0025
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0026 : Poly :=
[
  term ((5626786232852480596986384644012788074352480312750530851 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 26 for generator 5. -/
def ep_Q2_024_partial_05_0026 : Poly :=
[
  term ((5626786232852480596986384644012788074352480312750530851 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (2, 2), (11, 1), (12, 1), (15, 1)],
  term ((5626786232852480596986384644012788074352480312750530851 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (3, 2), (11, 1), (12, 1), (15, 1)],
  term ((-5626786232852480596986384644012788074352480312750530851 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-5626786232852480596986384644012788074352480312750530851 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 5. -/
theorem ep_Q2_024_partial_05_0026_valid :
    mulPoly ep_Q2_024_coefficient_05_0026
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0027 : Poly :=
[
  term ((-1511632778605275 : Rat) / 1162780221153193) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 5. -/
def ep_Q2_024_partial_05_0027 : Poly :=
[
  term ((-1511632778605275 : Rat) / 1162780221153193) [(0, 1), (2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1511632778605275 : Rat) / 1162780221153193) [(0, 1), (3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1511632778605275 : Rat) / 1162780221153193) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1511632778605275 : Rat) / 1162780221153193) [(0, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 5. -/
theorem ep_Q2_024_partial_05_0027_valid :
    mulPoly ep_Q2_024_coefficient_05_0027
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0028 : Poly :=
[
  term ((-1359593368573093172905712257911441661246 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 28 for generator 5. -/
def ep_Q2_024_partial_05_0028 : Poly :=
[
  term ((-1359593368573093172905712257911441661246 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((-1359593368573093172905712257911441661246 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((1359593368573093172905712257911441661246 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((1359593368573093172905712257911441661246 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 5. -/
theorem ep_Q2_024_partial_05_0028_valid :
    mulPoly ep_Q2_024_coefficient_05_0028
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0029 : Poly :=
[
  term ((43459647497705333090949826472205091833136204953312197369 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 29 for generator 5. -/
def ep_Q2_024_partial_05_0029 : Poly :=
[
  term ((43459647497705333090949826472205091833136204953312197369 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((43459647497705333090949826472205091833136204953312197369 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((-43459647497705333090949826472205091833136204953312197369 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((-43459647497705333090949826472205091833136204953312197369 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 5. -/
theorem ep_Q2_024_partial_05_0029_valid :
    mulPoly ep_Q2_024_coefficient_05_0029
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0030 : Poly :=
[
  term ((-15802051720330881 : Rat) / 4651120884612772) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 5. -/
def ep_Q2_024_partial_05_0030 : Poly :=
[
  term ((-15802051720330881 : Rat) / 4651120884612772) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-15802051720330881 : Rat) / 4651120884612772) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((15802051720330881 : Rat) / 4651120884612772) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((15802051720330881 : Rat) / 4651120884612772) [(0, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 5. -/
theorem ep_Q2_024_partial_05_0030_valid :
    mulPoly ep_Q2_024_coefficient_05_0030
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0031 : Poly :=
[
  term ((237388069701818425679127847259107306728735847934448923 : Rat) / 15762694103932539296691075098919760974022820733007820) [(0, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 31 for generator 5. -/
def ep_Q2_024_partial_05_0031 : Poly :=
[
  term ((237388069701818425679127847259107306728735847934448923 : Rat) / 15762694103932539296691075098919760974022820733007820) [(0, 1), (2, 2), (12, 1), (13, 1), (15, 1)],
  term ((237388069701818425679127847259107306728735847934448923 : Rat) / 15762694103932539296691075098919760974022820733007820) [(0, 1), (3, 2), (12, 1), (13, 1), (15, 1)],
  term ((-237388069701818425679127847259107306728735847934448923 : Rat) / 15762694103932539296691075098919760974022820733007820) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-237388069701818425679127847259107306728735847934448923 : Rat) / 15762694103932539296691075098919760974022820733007820) [(0, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 5. -/
theorem ep_Q2_024_partial_05_0031_valid :
    mulPoly ep_Q2_024_coefficient_05_0031
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0032 : Poly :=
[
  term ((-3674958078000033 : Rat) / 1162780221153193) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 5. -/
def ep_Q2_024_partial_05_0032 : Poly :=
[
  term ((-3674958078000033 : Rat) / 1162780221153193) [(0, 1), (2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3674958078000033 : Rat) / 1162780221153193) [(0, 1), (3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3674958078000033 : Rat) / 1162780221153193) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3674958078000033 : Rat) / 1162780221153193) [(0, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 5. -/
theorem ep_Q2_024_partial_05_0032_valid :
    mulPoly ep_Q2_024_coefficient_05_0032
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0033 : Poly :=
[
  term ((-125192598325153958362893424184823628172 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (12, 1), (13, 2)]
]

/-- Partial product 33 for generator 5. -/
def ep_Q2_024_partial_05_0033 : Poly :=
[
  term ((-125192598325153958362893424184823628172 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 2), (12, 1), (13, 2)],
  term ((-125192598325153958362893424184823628172 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 2), (12, 1), (13, 2)],
  term ((125192598325153958362893424184823628172 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (12, 1), (13, 2), (14, 2)],
  term ((125192598325153958362893424184823628172 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 5. -/
theorem ep_Q2_024_partial_05_0033_valid :
    mulPoly ep_Q2_024_coefficient_05_0033
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0034 : Poly :=
[
  term ((66748235112015248168043000490868102755763105025861902396 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 34 for generator 5. -/
def ep_Q2_024_partial_05_0034 : Poly :=
[
  term ((66748235112015248168043000490868102755763105025861902396 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((66748235112015248168043000490868102755763105025861902396 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((-66748235112015248168043000490868102755763105025861902396 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((-66748235112015248168043000490868102755763105025861902396 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 5. -/
theorem ep_Q2_024_partial_05_0034_valid :
    mulPoly ep_Q2_024_coefficient_05_0034
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0035 : Poly :=
[
  term ((16775057433598076 : Rat) / 3488340663459579) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 5. -/
def ep_Q2_024_partial_05_0035 : Poly :=
[
  term ((16775057433598076 : Rat) / 3488340663459579) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((16775057433598076 : Rat) / 3488340663459579) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16775057433598076 : Rat) / 3488340663459579) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16775057433598076 : Rat) / 3488340663459579) [(0, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 5. -/
theorem ep_Q2_024_partial_05_0035_valid :
    mulPoly ep_Q2_024_coefficient_05_0035
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0036 : Poly :=
[
  term ((-1099099907237639857489288939581514116976 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (13, 2)]
]

/-- Partial product 36 for generator 5. -/
def ep_Q2_024_partial_05_0036 : Poly :=
[
  term ((-1099099907237639857489288939581514116976 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (2, 2), (13, 2)],
  term ((-1099099907237639857489288939581514116976 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (3, 2), (13, 2)],
  term ((1099099907237639857489288939581514116976 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (13, 2), (14, 2)],
  term ((1099099907237639857489288939581514116976 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 5. -/
theorem ep_Q2_024_partial_05_0036_valid :
    mulPoly ep_Q2_024_coefficient_05_0036
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0037 : Poly :=
[
  term ((-4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (14, 1)]
]

/-- Partial product 37 for generator 5. -/
def ep_Q2_024_partial_05_0037 : Poly :=
[
  term ((-4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 2), (14, 1)],
  term ((-4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 2), (14, 1)],
  term ((4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (14, 1), (15, 2)],
  term ((4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 5. -/
theorem ep_Q2_024_partial_05_0037_valid :
    mulPoly ep_Q2_024_coefficient_05_0037
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0038 : Poly :=
[
  term ((-104244643455882775953184394052154990217876825480745954569 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(0, 1), (15, 2)]
]

/-- Partial product 38 for generator 5. -/
def ep_Q2_024_partial_05_0038 : Poly :=
[
  term ((-104244643455882775953184394052154990217876825480745954569 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(0, 1), (2, 2), (15, 2)],
  term ((-104244643455882775953184394052154990217876825480745954569 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(0, 1), (3, 2), (15, 2)],
  term ((104244643455882775953184394052154990217876825480745954569 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(0, 1), (14, 2), (15, 2)],
  term ((104244643455882775953184394052154990217876825480745954569 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(0, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 5. -/
theorem ep_Q2_024_partial_05_0038_valid :
    mulPoly ep_Q2_024_coefficient_05_0038
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0039 : Poly :=
[
  term ((23659207676676527 : Rat) / 4651120884612772) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 39 for generator 5. -/
def ep_Q2_024_partial_05_0039 : Poly :=
[
  term ((23659207676676527 : Rat) / 4651120884612772) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((23659207676676527 : Rat) / 4651120884612772) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((-23659207676676527 : Rat) / 4651120884612772) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((-23659207676676527 : Rat) / 4651120884612772) [(0, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 5. -/
theorem ep_Q2_024_partial_05_0039_valid :
    mulPoly ep_Q2_024_coefficient_05_0039
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0040 : Poly :=
[
  term ((-4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1)]
]

/-- Partial product 40 for generator 5. -/
def ep_Q2_024_partial_05_0040 : Poly :=
[
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (14, 2)],
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((-4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 3)],
  term ((-4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 3), (3, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 5. -/
theorem ep_Q2_024_partial_05_0040_valid :
    mulPoly ep_Q2_024_coefficient_05_0040
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0041 : Poly :=
[
  term ((-488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1)]
]

/-- Partial product 41 for generator 5. -/
def ep_Q2_024_partial_05_0041 : Poly :=
[
  term ((-488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (3, 2), (5, 1)],
  term ((488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1), (14, 2)],
  term ((488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1), (15, 2)],
  term ((-488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 3), (5, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 5. -/
theorem ep_Q2_024_partial_05_0041_valid :
    mulPoly ep_Q2_024_coefficient_05_0041
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0042 : Poly :=
[
  term ((1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1)]
]

/-- Partial product 42 for generator 5. -/
def ep_Q2_024_partial_05_0042 : Poly :=
[
  term ((1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 2), (7, 1)],
  term ((-1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (14, 2)],
  term ((-1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (15, 2)],
  term ((1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 5. -/
theorem ep_Q2_024_partial_05_0042_valid :
    mulPoly ep_Q2_024_coefficient_05_0042
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0043 : Poly :=
[
  term ((-2028136524153822677206265073302031559004 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1)]
]

/-- Partial product 43 for generator 5. -/
def ep_Q2_024_partial_05_0043 : Poly :=
[
  term ((-2028136524153822677206265073302031559004 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 2), (9, 1)],
  term ((2028136524153822677206265073302031559004 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (14, 2)],
  term ((2028136524153822677206265073302031559004 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (15, 2)],
  term ((-2028136524153822677206265073302031559004 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 5. -/
theorem ep_Q2_024_partial_05_0043_valid :
    mulPoly ep_Q2_024_coefficient_05_0043
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0044 : Poly :=
[
  term ((219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (12, 1), (13, 1)]
]

/-- Partial product 44 for generator 5. -/
def ep_Q2_024_partial_05_0044 : Poly :=
[
  term ((219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 2), (12, 1), (13, 1)],
  term ((-219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 2)],
  term ((-219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (12, 1), (13, 1), (15, 2)],
  term ((219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 5. -/
theorem ep_Q2_024_partial_05_0044_valid :
    mulPoly ep_Q2_024_coefficient_05_0044
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0045 : Poly :=
[
  term ((-12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (12, 1), (15, 1)]
]

/-- Partial product 45 for generator 5. -/
def ep_Q2_024_partial_05_0045 : Poly :=
[
  term ((-12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (3, 2), (12, 1), (15, 1)],
  term ((12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (12, 1), (14, 2), (15, 1)],
  term ((12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (12, 1), (15, 3)],
  term ((-12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 5. -/
theorem ep_Q2_024_partial_05_0045_valid :
    mulPoly ep_Q2_024_coefficient_05_0045
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0046 : Poly :=
[
  term ((1765379642691762 : Rat) / 1162780221153193) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 5. -/
def ep_Q2_024_partial_05_0046 : Poly :=
[
  term ((1765379642691762 : Rat) / 1162780221153193) [(1, 1), (2, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1765379642691762 : Rat) / 1162780221153193) [(1, 1), (2, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1765379642691762 : Rat) / 1162780221153193) [(1, 1), (2, 1), (12, 1), (15, 3), (16, 1)],
  term ((1765379642691762 : Rat) / 1162780221153193) [(1, 1), (2, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 5. -/
theorem ep_Q2_024_partial_05_0046_valid :
    mulPoly ep_Q2_024_coefficient_05_0046
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0047 : Poly :=
[
  term ((334923165076545527914180094575123784456 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (13, 1)]
]

/-- Partial product 47 for generator 5. -/
def ep_Q2_024_partial_05_0047 : Poly :=
[
  term ((334923165076545527914180094575123784456 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((-334923165076545527914180094575123784456 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (13, 1), (14, 2)],
  term ((-334923165076545527914180094575123784456 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((334923165076545527914180094575123784456 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 5. -/
theorem ep_Q2_024_partial_05_0047_valid :
    mulPoly ep_Q2_024_coefficient_05_0047
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0048 : Poly :=
[
  term ((76060235924508134387712972664199959411421929625801834341 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 48 for generator 5. -/
def ep_Q2_024_partial_05_0048 : Poly :=
[
  term ((76060235924508134387712972664199959411421929625801834341 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((-76060235924508134387712972664199959411421929625801834341 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((-76060235924508134387712972664199959411421929625801834341 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (15, 3)],
  term ((76060235924508134387712972664199959411421929625801834341 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 5. -/
theorem ep_Q2_024_partial_05_0048_valid :
    mulPoly ep_Q2_024_coefficient_05_0048
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0049 : Poly :=
[
  term ((-4253268925985286 : Rat) / 1162780221153193) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 5. -/
def ep_Q2_024_partial_05_0049 : Poly :=
[
  term ((-4253268925985286 : Rat) / 1162780221153193) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((4253268925985286 : Rat) / 1162780221153193) [(1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((4253268925985286 : Rat) / 1162780221153193) [(1, 1), (2, 1), (15, 3), (16, 1)],
  term ((-4253268925985286 : Rat) / 1162780221153193) [(1, 1), (2, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 5. -/
theorem ep_Q2_024_partial_05_0049_valid :
    mulPoly ep_Q2_024_coefficient_05_0049
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0050 : Poly :=
[
  term ((-318157627827131441558407716526566919906 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1)]
]

/-- Partial product 50 for generator 5. -/
def ep_Q2_024_partial_05_0050 : Poly :=
[
  term ((-318157627827131441558407716526566919906 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (3, 1)],
  term ((318157627827131441558407716526566919906 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (14, 2)],
  term ((318157627827131441558407716526566919906 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (15, 2)],
  term ((-318157627827131441558407716526566919906 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 5. -/
theorem ep_Q2_024_partial_05_0050_valid :
    mulPoly ep_Q2_024_coefficient_05_0050
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0051 : Poly :=
[
  term ((2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1)]
]

/-- Partial product 51 for generator 5. -/
def ep_Q2_024_partial_05_0051 : Poly :=
[
  term ((2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (3, 1), (4, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (14, 2)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (15, 2)],
  term ((2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 3), (4, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 5. -/
theorem ep_Q2_024_partial_05_0051_valid :
    mulPoly ep_Q2_024_coefficient_05_0051
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0052 : Poly :=
[
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (9, 1)]
]

/-- Partial product 52 for generator 5. -/
def ep_Q2_024_partial_05_0052 : Poly :=
[
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (3, 1), (5, 1), (9, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (9, 1), (14, 2)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (9, 1), (15, 2)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 3), (5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 5. -/
theorem ep_Q2_024_partial_05_0052_valid :
    mulPoly ep_Q2_024_coefficient_05_0052
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0053 : Poly :=
[
  term ((-9433612767893076993065010042131230720 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 1), (5, 1), (13, 1)]
]

/-- Partial product 53 for generator 5. -/
def ep_Q2_024_partial_05_0053 : Poly :=
[
  term ((-9433612767893076993065010042131230720 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 2), (3, 1), (5, 1), (13, 1)],
  term ((9433612767893076993065010042131230720 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 1), (5, 1), (13, 1), (14, 2)],
  term ((9433612767893076993065010042131230720 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 1), (5, 1), (13, 1), (15, 2)],
  term ((-9433612767893076993065010042131230720 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 3), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 5. -/
theorem ep_Q2_024_partial_05_0053_valid :
    mulPoly ep_Q2_024_coefficient_05_0053
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0054 : Poly :=
[
  term ((14906187992692019146517026891183166212309896428078685278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (15, 1)]
]

/-- Partial product 54 for generator 5. -/
def ep_Q2_024_partial_05_0054 : Poly :=
[
  term ((14906187992692019146517026891183166212309896428078685278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (3, 1), (5, 1), (15, 1)],
  term ((-14906187992692019146517026891183166212309896428078685278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (14, 2), (15, 1)],
  term ((-14906187992692019146517026891183166212309896428078685278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (15, 3)],
  term ((14906187992692019146517026891183166212309896428078685278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 3), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 5. -/
theorem ep_Q2_024_partial_05_0054_valid :
    mulPoly ep_Q2_024_coefficient_05_0054
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0055 : Poly :=
[
  term ((-306473385224616 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 55 for generator 5. -/
def ep_Q2_024_partial_05_0055 : Poly :=
[
  term ((-306473385224616 : Rat) / 1162780221153193) [(1, 1), (2, 2), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((306473385224616 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((306473385224616 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (15, 3), (16, 1)],
  term ((-306473385224616 : Rat) / 1162780221153193) [(1, 1), (3, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 5. -/
theorem ep_Q2_024_partial_05_0055_valid :
    mulPoly ep_Q2_024_coefficient_05_0055
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0056 : Poly :=
[
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1)]
]

/-- Partial product 56 for generator 5. -/
def ep_Q2_024_partial_05_0056 : Poly :=
[
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (3, 1), (8, 1)],
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (14, 2)],
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (15, 2)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 3), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 5. -/
theorem ep_Q2_024_partial_05_0056_valid :
    mulPoly ep_Q2_024_coefficient_05_0056
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0057 : Poly :=
[
  term ((547923610455894560483425491959550791328 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 1), (13, 1)]
]

/-- Partial product 57 for generator 5. -/
def ep_Q2_024_partial_05_0057 : Poly :=
[
  term ((547923610455894560483425491959550791328 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (3, 1), (9, 1), (13, 1)],
  term ((-547923610455894560483425491959550791328 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 2)],
  term ((-547923610455894560483425491959550791328 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2)],
  term ((547923610455894560483425491959550791328 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 5. -/
theorem ep_Q2_024_partial_05_0057_valid :
    mulPoly ep_Q2_024_coefficient_05_0057
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0058 : Poly :=
[
  term ((-8571570734462411811492261358627419460577064432557901137 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (9, 1), (15, 1)]
]

/-- Partial product 58 for generator 5. -/
def ep_Q2_024_partial_05_0058 : Poly :=
[
  term ((-8571570734462411811492261358627419460577064432557901137 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (3, 1), (9, 1), (15, 1)],
  term ((8571570734462411811492261358627419460577064432557901137 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (9, 1), (14, 2), (15, 1)],
  term ((8571570734462411811492261358627419460577064432557901137 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (9, 1), (15, 3)],
  term ((-8571570734462411811492261358627419460577064432557901137 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 5. -/
theorem ep_Q2_024_partial_05_0058_valid :
    mulPoly ep_Q2_024_coefficient_05_0058
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0059 : Poly :=
[
  term ((5233019573407276 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 59 for generator 5. -/
def ep_Q2_024_partial_05_0059 : Poly :=
[
  term ((5233019573407276 : Rat) / 1162780221153193) [(1, 1), (2, 2), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5233019573407276 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5233019573407276 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 1), (15, 3), (16, 1)],
  term ((5233019573407276 : Rat) / 1162780221153193) [(1, 1), (3, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 5. -/
theorem ep_Q2_024_partial_05_0059_valid :
    mulPoly ep_Q2_024_coefficient_05_0059
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0060 : Poly :=
[
  term ((441787725305289624319136007521902947392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 2)]
]

/-- Partial product 60 for generator 5. -/
def ep_Q2_024_partial_05_0060 : Poly :=
[
  term ((441787725305289624319136007521902947392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (3, 1), (9, 2)],
  term ((-441787725305289624319136007521902947392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 2), (14, 2)],
  term ((-441787725305289624319136007521902947392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 2), (15, 2)],
  term ((441787725305289624319136007521902947392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 3), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 5. -/
theorem ep_Q2_024_partial_05_0060_valid :
    mulPoly ep_Q2_024_coefficient_05_0060
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0061 : Poly :=
[
  term ((-179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (12, 1)]
]

/-- Partial product 61 for generator 5. -/
def ep_Q2_024_partial_05_0061 : Poly :=
[
  term ((-179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (3, 1), (12, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (12, 1), (14, 2)],
  term ((179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (12, 1), (15, 2)],
  term ((-179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 5. -/
theorem ep_Q2_024_partial_05_0061_valid :
    mulPoly ep_Q2_024_coefficient_05_0061
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0062 : Poly :=
[
  term ((3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 62 for generator 5. -/
def ep_Q2_024_partial_05_0062 : Poly :=
[
  term ((3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 2), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 3)],
  term ((3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 3), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 5. -/
theorem ep_Q2_024_partial_05_0062_valid :
    mulPoly ep_Q2_024_coefficient_05_0062
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0063 : Poly :=
[
  term ((-550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (12, 1), (15, 2)]
]

/-- Partial product 63 for generator 5. -/
def ep_Q2_024_partial_05_0063 : Poly :=
[
  term ((-550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (2, 2), (3, 1), (12, 1), (15, 2)],
  term ((550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (12, 1), (14, 2), (15, 2)],
  term ((550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (12, 1), (15, 4)],
  term ((-550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 3), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 5. -/
theorem ep_Q2_024_partial_05_0063_valid :
    mulPoly ep_Q2_024_coefficient_05_0063
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0064 : Poly :=
[
  term ((1443384088015008 : Rat) / 1162780221153193) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 64 for generator 5. -/
def ep_Q2_024_partial_05_0064 : Poly :=
[
  term ((1443384088015008 : Rat) / 1162780221153193) [(1, 1), (2, 2), (3, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1443384088015008 : Rat) / 1162780221153193) [(1, 1), (3, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1443384088015008 : Rat) / 1162780221153193) [(1, 1), (3, 1), (12, 1), (15, 4), (16, 1)],
  term ((1443384088015008 : Rat) / 1162780221153193) [(1, 1), (3, 3), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 5. -/
theorem ep_Q2_024_partial_05_0064_valid :
    mulPoly ep_Q2_024_coefficient_05_0064
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0065 : Poly :=
[
  term ((-89155624704474210792214183886281336272739806907090888169 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (13, 1), (15, 1)]
]

/-- Partial product 65 for generator 5. -/
def ep_Q2_024_partial_05_0065 : Poly :=
[
  term ((-89155624704474210792214183886281336272739806907090888169 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 2), (3, 1), (13, 1), (15, 1)],
  term ((89155624704474210792214183886281336272739806907090888169 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1)],
  term ((89155624704474210792214183886281336272739806907090888169 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (13, 1), (15, 3)],
  term ((-89155624704474210792214183886281336272739806907090888169 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 5. -/
theorem ep_Q2_024_partial_05_0065_valid :
    mulPoly ep_Q2_024_coefficient_05_0065
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0066 : Poly :=
[
  term ((513905188349430 : Rat) / 1162780221153193) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 66 for generator 5. -/
def ep_Q2_024_partial_05_0066 : Poly :=
[
  term ((513905188349430 : Rat) / 1162780221153193) [(1, 1), (2, 2), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-513905188349430 : Rat) / 1162780221153193) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-513905188349430 : Rat) / 1162780221153193) [(1, 1), (3, 1), (13, 1), (15, 3), (16, 1)],
  term ((513905188349430 : Rat) / 1162780221153193) [(1, 1), (3, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 5. -/
theorem ep_Q2_024_partial_05_0066_valid :
    mulPoly ep_Q2_024_coefficient_05_0066
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0067 : Poly :=
[
  term ((43172364991138926603597538274087565352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (13, 2)]
]

/-- Partial product 67 for generator 5. -/
def ep_Q2_024_partial_05_0067 : Poly :=
[
  term ((43172364991138926603597538274087565352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (3, 1), (13, 2)],
  term ((-43172364991138926603597538274087565352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (13, 2), (14, 2)],
  term ((-43172364991138926603597538274087565352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (13, 2), (15, 2)],
  term ((43172364991138926603597538274087565352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 5. -/
theorem ep_Q2_024_partial_05_0067_valid :
    mulPoly ep_Q2_024_coefficient_05_0067
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0068 : Poly :=
[
  term ((-1110595145383580408645472096611607285242 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (14, 1)]
]

/-- Partial product 68 for generator 5. -/
def ep_Q2_024_partial_05_0068 : Poly :=
[
  term ((-1110595145383580408645472096611607285242 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (3, 1), (14, 1)],
  term ((1110595145383580408645472096611607285242 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((1110595145383580408645472096611607285242 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (14, 3)],
  term ((-1110595145383580408645472096611607285242 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 5. -/
theorem ep_Q2_024_partial_05_0068_valid :
    mulPoly ep_Q2_024_coefficient_05_0068
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0069 : Poly :=
[
  term ((42338735591756726608862781052457235569684346949652963639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (15, 2)]
]

/-- Partial product 69 for generator 5. -/
def ep_Q2_024_partial_05_0069 : Poly :=
[
  term ((42338735591756726608862781052457235569684346949652963639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (3, 1), (15, 2)],
  term ((-42338735591756726608862781052457235569684346949652963639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (14, 2), (15, 2)],
  term ((-42338735591756726608862781052457235569684346949652963639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (15, 4)],
  term ((42338735591756726608862781052457235569684346949652963639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 5. -/
theorem ep_Q2_024_partial_05_0069_valid :
    mulPoly ep_Q2_024_coefficient_05_0069
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0070 : Poly :=
[
  term ((-735047170265332 : Rat) / 1162780221153193) [(1, 1), (3, 1), (15, 2), (16, 1)]
]

/-- Partial product 70 for generator 5. -/
def ep_Q2_024_partial_05_0070 : Poly :=
[
  term ((-735047170265332 : Rat) / 1162780221153193) [(1, 1), (2, 2), (3, 1), (15, 2), (16, 1)],
  term ((735047170265332 : Rat) / 1162780221153193) [(1, 1), (3, 1), (14, 2), (15, 2), (16, 1)],
  term ((735047170265332 : Rat) / 1162780221153193) [(1, 1), (3, 1), (15, 4), (16, 1)],
  term ((-735047170265332 : Rat) / 1162780221153193) [(1, 1), (3, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 5. -/
theorem ep_Q2_024_partial_05_0070_valid :
    mulPoly ep_Q2_024_coefficient_05_0070
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0071 : Poly :=
[
  term ((-143806235165341577686497186332059487512 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (9, 1)]
]

/-- Partial product 71 for generator 5. -/
def ep_Q2_024_partial_05_0071 : Poly :=
[
  term ((-143806235165341577686497186332059487512 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 2), (4, 1), (9, 1)],
  term ((-143806235165341577686497186332059487512 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 2), (4, 1), (9, 1)],
  term ((143806235165341577686497186332059487512 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (9, 1), (14, 2)],
  term ((143806235165341577686497186332059487512 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 5. -/
theorem ep_Q2_024_partial_05_0071_valid :
    mulPoly ep_Q2_024_coefficient_05_0071
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0072 : Poly :=
[
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (12, 1), (13, 1)]
]

/-- Partial product 72 for generator 5. -/
def ep_Q2_024_partial_05_0072 : Poly :=
[
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (4, 1), (12, 1), (13, 1)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (4, 1), (12, 1), (13, 1)],
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (12, 1), (13, 1), (14, 2)],
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 5. -/
theorem ep_Q2_024_partial_05_0072_valid :
    mulPoly ep_Q2_024_coefficient_05_0072
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0073 : Poly :=
[
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (12, 1), (15, 1)]
]

/-- Partial product 73 for generator 5. -/
def ep_Q2_024_partial_05_0073 : Poly :=
[
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (4, 1), (12, 1), (15, 1)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 2), (4, 1), (12, 1), (15, 1)],
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (12, 1), (14, 2), (15, 1)],
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 5. -/
theorem ep_Q2_024_partial_05_0073_valid :
    mulPoly ep_Q2_024_coefficient_05_0073
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0074 : Poly :=
[
  term ((3864655997676720 : Rat) / 1162780221153193) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 74 for generator 5. -/
def ep_Q2_024_partial_05_0074 : Poly :=
[
  term ((3864655997676720 : Rat) / 1162780221153193) [(1, 1), (2, 2), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(1, 1), (3, 2), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3864655997676720 : Rat) / 1162780221153193) [(1, 1), (4, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3864655997676720 : Rat) / 1162780221153193) [(1, 1), (4, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 5. -/
theorem ep_Q2_024_partial_05_0074_valid :
    mulPoly ep_Q2_024_coefficient_05_0074
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0075 : Poly :=
[
  term ((-19175911641765942668946118011013940304 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (13, 1)]
]

/-- Partial product 75 for generator 5. -/
def ep_Q2_024_partial_05_0075 : Poly :=
[
  term ((-19175911641765942668946118011013940304 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 2), (4, 1), (13, 1)],
  term ((-19175911641765942668946118011013940304 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 2), (4, 1), (13, 1)],
  term ((19175911641765942668946118011013940304 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (13, 1), (14, 2)],
  term ((19175911641765942668946118011013940304 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 5. -/
theorem ep_Q2_024_partial_05_0075_valid :
    mulPoly ep_Q2_024_coefficient_05_0075
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0076 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (13, 1), (14, 1)]
]

/-- Partial product 76 for generator 5. -/
def ep_Q2_024_partial_05_0076 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (4, 1), (13, 1), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (4, 1), (13, 1), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (13, 1), (14, 1), (15, 2)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 5. -/
theorem ep_Q2_024_partial_05_0076_valid :
    mulPoly ep_Q2_024_coefficient_05_0076
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0077 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (14, 1), (15, 1)]
]

/-- Partial product 77 for generator 5. -/
def ep_Q2_024_partial_05_0077 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 2), (4, 1), (14, 1), (15, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 2), (4, 1), (14, 1), (15, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (14, 1), (15, 3)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 5. -/
theorem ep_Q2_024_partial_05_0077_valid :
    mulPoly ep_Q2_024_coefficient_05_0077
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0078 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 78 for generator 5. -/
def ep_Q2_024_partial_05_0078 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (2, 2), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (3, 2), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (4, 1), (14, 1), (15, 3), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (4, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 5. -/
theorem ep_Q2_024_partial_05_0078_valid :
    mulPoly ep_Q2_024_coefficient_05_0078
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0079 : Poly :=
[
  term ((46297346902676175640402165826134159087885762653346004147 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (15, 1)]
]

/-- Partial product 79 for generator 5. -/
def ep_Q2_024_partial_05_0079 : Poly :=
[
  term ((46297346902676175640402165826134159087885762653346004147 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (2, 2), (4, 1), (15, 1)],
  term ((46297346902676175640402165826134159087885762653346004147 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (3, 2), (4, 1), (15, 1)],
  term ((-46297346902676175640402165826134159087885762653346004147 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (14, 2), (15, 1)],
  term ((-46297346902676175640402165826134159087885762653346004147 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 5. -/
theorem ep_Q2_024_partial_05_0079_valid :
    mulPoly ep_Q2_024_coefficient_05_0079
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0080 : Poly :=
[
  term ((-5625452497643948 : Rat) / 1162780221153193) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 80 for generator 5. -/
def ep_Q2_024_partial_05_0080 : Poly :=
[
  term ((-5625452497643948 : Rat) / 1162780221153193) [(1, 1), (2, 2), (4, 1), (15, 1), (16, 1)],
  term ((-5625452497643948 : Rat) / 1162780221153193) [(1, 1), (3, 2), (4, 1), (15, 1), (16, 1)],
  term ((5625452497643948 : Rat) / 1162780221153193) [(1, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((5625452497643948 : Rat) / 1162780221153193) [(1, 1), (4, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 5. -/
theorem ep_Q2_024_partial_05_0080_valid :
    mulPoly ep_Q2_024_coefficient_05_0080
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0081 : Poly :=
[
  term ((415528615091762012913932167433386338017 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1)]
]

/-- Partial product 81 for generator 5. -/
def ep_Q2_024_partial_05_0081 : Poly :=
[
  term ((415528615091762012913932167433386338017 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (5, 1)],
  term ((415528615091762012913932167433386338017 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (5, 1)],
  term ((-415528615091762012913932167433386338017 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (14, 2)],
  term ((-415528615091762012913932167433386338017 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 5. -/
theorem ep_Q2_024_partial_05_0081_valid :
    mulPoly ep_Q2_024_coefficient_05_0081
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0082 : Poly :=
[
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (11, 1)]
]

/-- Partial product 82 for generator 5. -/
def ep_Q2_024_partial_05_0082 : Poly :=
[
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (5, 1), (9, 1), (11, 1)],
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (5, 1), (9, 1), (11, 1)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 2)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 5. -/
theorem ep_Q2_024_partial_05_0082_valid :
    mulPoly ep_Q2_024_coefficient_05_0082
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0083 : Poly :=
[
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 83 for generator 5. -/
def ep_Q2_024_partial_05_0083 : Poly :=
[
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (5, 1), (9, 1), (12, 1), (13, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (5, 1), (9, 1), (12, 1), (13, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 5. -/
theorem ep_Q2_024_partial_05_0083_valid :
    mulPoly ep_Q2_024_coefficient_05_0083
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0084 : Poly :=
[
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 84 for generator 5. -/
def ep_Q2_024_partial_05_0084 : Poly :=
[
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (2, 2), (5, 1), (9, 1), (12, 1), (15, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 2), (5, 1), (9, 1), (12, 1), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 5. -/
theorem ep_Q2_024_partial_05_0084_valid :
    mulPoly ep_Q2_024_coefficient_05_0084
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0085 : Poly :=
[
  term ((850957154578940 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 85 for generator 5. -/
def ep_Q2_024_partial_05_0085 : Poly :=
[
  term ((850957154578940 : Rat) / 1162780221153193) [(1, 1), (2, 2), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(1, 1), (3, 2), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 5. -/
theorem ep_Q2_024_partial_05_0085_valid :
    mulPoly ep_Q2_024_coefficient_05_0085
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0086 : Poly :=
[
  term ((-1533196012139871820251458495733305475032 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (13, 1)]
]

/-- Partial product 86 for generator 5. -/
def ep_Q2_024_partial_05_0086 : Poly :=
[
  term ((-1533196012139871820251458495733305475032 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (5, 1), (9, 1), (13, 1)],
  term ((-1533196012139871820251458495733305475032 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (5, 1), (9, 1), (13, 1)],
  term ((1533196012139871820251458495733305475032 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (13, 1), (14, 2)],
  term ((1533196012139871820251458495733305475032 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 5. -/
theorem ep_Q2_024_partial_05_0086_valid :
    mulPoly ep_Q2_024_coefficient_05_0086
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0087 : Poly :=
[
  term ((-60014409539569963935744582355375799709409709725627656817 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 1), (15, 1)]
]

/-- Partial product 87 for generator 5. -/
def ep_Q2_024_partial_05_0087 : Poly :=
[
  term ((-60014409539569963935744582355375799709409709725627656817 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (5, 1), (9, 1), (15, 1)],
  term ((-60014409539569963935744582355375799709409709725627656817 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 2), (5, 1), (9, 1), (15, 1)],
  term ((60014409539569963935744582355375799709409709725627656817 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 1), (14, 2), (15, 1)],
  term ((60014409539569963935744582355375799709409709725627656817 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 5. -/
theorem ep_Q2_024_partial_05_0087_valid :
    mulPoly ep_Q2_024_coefficient_05_0087
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0088 : Poly :=
[
  term ((13257101325589140 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 88 for generator 5. -/
def ep_Q2_024_partial_05_0088 : Poly :=
[
  term ((13257101325589140 : Rat) / 1162780221153193) [(1, 1), (2, 2), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((13257101325589140 : Rat) / 1162780221153193) [(1, 1), (3, 2), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-13257101325589140 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-13257101325589140 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 5. -/
theorem ep_Q2_024_partial_05_0088_valid :
    mulPoly ep_Q2_024_coefficient_05_0088
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0089 : Poly :=
[
  term ((636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2)]
]

/-- Partial product 89 for generator 5. -/
def ep_Q2_024_partial_05_0089 : Poly :=
[
  term ((636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (5, 1), (9, 2)],
  term ((636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (5, 1), (9, 2)],
  term ((-636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2), (14, 2)],
  term ((-636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 5. -/
theorem ep_Q2_024_partial_05_0089_valid :
    mulPoly ep_Q2_024_coefficient_05_0089
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0090 : Poly :=
[
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (11, 1), (13, 1)]
]

/-- Partial product 90 for generator 5. -/
def ep_Q2_024_partial_05_0090 : Poly :=
[
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 2), (5, 1), (11, 1), (13, 1)],
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 2), (5, 1), (11, 1), (13, 1)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 2)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 5. -/
theorem ep_Q2_024_partial_05_0090_valid :
    mulPoly ep_Q2_024_coefficient_05_0090
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0091 : Poly :=
[
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (11, 1), (15, 1)]
]

/-- Partial product 91 for generator 5. -/
def ep_Q2_024_partial_05_0091 : Poly :=
[
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (5, 1), (11, 1), (15, 1)],
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 2), (5, 1), (11, 1), (15, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (11, 1), (14, 2), (15, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 5. -/
theorem ep_Q2_024_partial_05_0091_valid :
    mulPoly ep_Q2_024_coefficient_05_0091
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0092 : Poly :=
[
  term ((-854765176539728 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 92 for generator 5. -/
def ep_Q2_024_partial_05_0092 : Poly :=
[
  term ((-854765176539728 : Rat) / 1162780221153193) [(1, 1), (2, 2), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-854765176539728 : Rat) / 1162780221153193) [(1, 1), (3, 2), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 5. -/
theorem ep_Q2_024_partial_05_0092_valid :
    mulPoly ep_Q2_024_coefficient_05_0092
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0093 : Poly :=
[
  term ((-18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (12, 1)]
]

/-- Partial product 93 for generator 5. -/
def ep_Q2_024_partial_05_0093 : Poly :=
[
  term ((-18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (5, 1), (12, 1)],
  term ((-18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (5, 1), (12, 1)],
  term ((18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (12, 1), (14, 2)],
  term ((18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 5. -/
theorem ep_Q2_024_partial_05_0093_valid :
    mulPoly ep_Q2_024_coefficient_05_0093
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0094 : Poly :=
[
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 94 for generator 5. -/
def ep_Q2_024_partial_05_0094 : Poly :=
[
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (2, 2), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (3, 2), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 5. -/
theorem ep_Q2_024_partial_05_0094_valid :
    mulPoly ep_Q2_024_coefficient_05_0094
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0095 : Poly :=
[
  term ((4569079916135479 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 95 for generator 5. -/
def ep_Q2_024_partial_05_0095 : Poly :=
[
  term ((4569079916135479 : Rat) / 1162780221153193) [(1, 1), (2, 2), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(1, 1), (3, 2), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 5. -/
theorem ep_Q2_024_partial_05_0095_valid :
    mulPoly ep_Q2_024_coefficient_05_0095
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0096 : Poly :=
[
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (12, 1), (13, 2)]
]

/-- Partial product 96 for generator 5. -/
def ep_Q2_024_partial_05_0096 : Poly :=
[
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (5, 1), (12, 1), (13, 2)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (5, 1), (12, 1), (13, 2)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (12, 1), (13, 2), (14, 2)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 5. -/
theorem ep_Q2_024_partial_05_0096_valid :
    mulPoly ep_Q2_024_coefficient_05_0096
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0097 : Poly :=
[
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (12, 1), (15, 2)]
]

/-- Partial product 97 for generator 5. -/
def ep_Q2_024_partial_05_0097 : Poly :=
[
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (2, 2), (5, 1), (12, 1), (15, 2)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (3, 2), (5, 1), (12, 1), (15, 2)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (12, 1), (14, 2), (15, 2)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 5. -/
theorem ep_Q2_024_partial_05_0097_valid :
    mulPoly ep_Q2_024_coefficient_05_0097
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0098 : Poly :=
[
  term ((-13204414907240807 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 98 for generator 5. -/
def ep_Q2_024_partial_05_0098 : Poly :=
[
  term ((-13204414907240807 : Rat) / 1162780221153193) [(1, 1), (2, 2), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(1, 1), (3, 2), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 5. -/
theorem ep_Q2_024_partial_05_0098_valid :
    mulPoly ep_Q2_024_coefficient_05_0098
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0099 : Poly :=
[
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 99 for generator 5. -/
def ep_Q2_024_partial_05_0099 : Poly :=
[
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 2), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 3)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 5. -/
theorem ep_Q2_024_partial_05_0099_valid :
    mulPoly ep_Q2_024_coefficient_05_0099
        ep_Q2_024_generator_05_0000_0099 =
      ep_Q2_024_partial_05_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_05_0000_0099 : List Poly :=
[
  ep_Q2_024_partial_05_0000,
  ep_Q2_024_partial_05_0001,
  ep_Q2_024_partial_05_0002,
  ep_Q2_024_partial_05_0003,
  ep_Q2_024_partial_05_0004,
  ep_Q2_024_partial_05_0005,
  ep_Q2_024_partial_05_0006,
  ep_Q2_024_partial_05_0007,
  ep_Q2_024_partial_05_0008,
  ep_Q2_024_partial_05_0009,
  ep_Q2_024_partial_05_0010,
  ep_Q2_024_partial_05_0011,
  ep_Q2_024_partial_05_0012,
  ep_Q2_024_partial_05_0013,
  ep_Q2_024_partial_05_0014,
  ep_Q2_024_partial_05_0015,
  ep_Q2_024_partial_05_0016,
  ep_Q2_024_partial_05_0017,
  ep_Q2_024_partial_05_0018,
  ep_Q2_024_partial_05_0019,
  ep_Q2_024_partial_05_0020,
  ep_Q2_024_partial_05_0021,
  ep_Q2_024_partial_05_0022,
  ep_Q2_024_partial_05_0023,
  ep_Q2_024_partial_05_0024,
  ep_Q2_024_partial_05_0025,
  ep_Q2_024_partial_05_0026,
  ep_Q2_024_partial_05_0027,
  ep_Q2_024_partial_05_0028,
  ep_Q2_024_partial_05_0029,
  ep_Q2_024_partial_05_0030,
  ep_Q2_024_partial_05_0031,
  ep_Q2_024_partial_05_0032,
  ep_Q2_024_partial_05_0033,
  ep_Q2_024_partial_05_0034,
  ep_Q2_024_partial_05_0035,
  ep_Q2_024_partial_05_0036,
  ep_Q2_024_partial_05_0037,
  ep_Q2_024_partial_05_0038,
  ep_Q2_024_partial_05_0039,
  ep_Q2_024_partial_05_0040,
  ep_Q2_024_partial_05_0041,
  ep_Q2_024_partial_05_0042,
  ep_Q2_024_partial_05_0043,
  ep_Q2_024_partial_05_0044,
  ep_Q2_024_partial_05_0045,
  ep_Q2_024_partial_05_0046,
  ep_Q2_024_partial_05_0047,
  ep_Q2_024_partial_05_0048,
  ep_Q2_024_partial_05_0049,
  ep_Q2_024_partial_05_0050,
  ep_Q2_024_partial_05_0051,
  ep_Q2_024_partial_05_0052,
  ep_Q2_024_partial_05_0053,
  ep_Q2_024_partial_05_0054,
  ep_Q2_024_partial_05_0055,
  ep_Q2_024_partial_05_0056,
  ep_Q2_024_partial_05_0057,
  ep_Q2_024_partial_05_0058,
  ep_Q2_024_partial_05_0059,
  ep_Q2_024_partial_05_0060,
  ep_Q2_024_partial_05_0061,
  ep_Q2_024_partial_05_0062,
  ep_Q2_024_partial_05_0063,
  ep_Q2_024_partial_05_0064,
  ep_Q2_024_partial_05_0065,
  ep_Q2_024_partial_05_0066,
  ep_Q2_024_partial_05_0067,
  ep_Q2_024_partial_05_0068,
  ep_Q2_024_partial_05_0069,
  ep_Q2_024_partial_05_0070,
  ep_Q2_024_partial_05_0071,
  ep_Q2_024_partial_05_0072,
  ep_Q2_024_partial_05_0073,
  ep_Q2_024_partial_05_0074,
  ep_Q2_024_partial_05_0075,
  ep_Q2_024_partial_05_0076,
  ep_Q2_024_partial_05_0077,
  ep_Q2_024_partial_05_0078,
  ep_Q2_024_partial_05_0079,
  ep_Q2_024_partial_05_0080,
  ep_Q2_024_partial_05_0081,
  ep_Q2_024_partial_05_0082,
  ep_Q2_024_partial_05_0083,
  ep_Q2_024_partial_05_0084,
  ep_Q2_024_partial_05_0085,
  ep_Q2_024_partial_05_0086,
  ep_Q2_024_partial_05_0087,
  ep_Q2_024_partial_05_0088,
  ep_Q2_024_partial_05_0089,
  ep_Q2_024_partial_05_0090,
  ep_Q2_024_partial_05_0091,
  ep_Q2_024_partial_05_0092,
  ep_Q2_024_partial_05_0093,
  ep_Q2_024_partial_05_0094,
  ep_Q2_024_partial_05_0095,
  ep_Q2_024_partial_05_0096,
  ep_Q2_024_partial_05_0097,
  ep_Q2_024_partial_05_0098,
  ep_Q2_024_partial_05_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_05_0000_0099 : Poly :=
[
  term ((-84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (2, 2), (9, 1)],
  term ((121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (2, 2), (13, 1)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((-9851670194564511 : Rat) / 2325560442306386) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (3, 2), (9, 1)],
  term ((121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (3, 2), (13, 1)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (1, 1), (3, 2), (15, 1)],
  term ((-9851670194564511 : Rat) / 2325560442306386) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1), (14, 2)],
  term ((84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1), (15, 2)],
  term ((-121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (13, 1), (14, 2)],
  term ((-121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (13, 1), (15, 2)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (1, 1), (14, 2), (15, 1)],
  term ((9851670194564511 : Rat) / 2325560442306386) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (1, 1), (15, 3)],
  term ((9851670194564511 : Rat) / 2325560442306386) [(0, 1), (1, 1), (15, 3), (16, 1)],
  term ((-1226522336020992712801912164099948448654 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (2, 2)],
  term ((-2026668639087705403624852686972380630 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 2), (5, 1), (9, 1)],
  term ((-13408278867591516263964573029451067132 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 2), (5, 1), (13, 1)],
  term ((-90571061978454541516795555975182944929229918063114182 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (2, 2), (5, 1), (15, 1)],
  term ((375647204014056 : Rat) / 1162780221153193) [(0, 1), (2, 2), (5, 1), (15, 1), (16, 1)],
  term ((711267717866237224134638869344200372606 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (7, 1), (9, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (7, 1), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (2, 2), (7, 1), (12, 1), (15, 1)],
  term ((217230840263161 : Rat) / 1162780221153193) [(0, 1), (2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-123905327885937413341038734560550052154 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (7, 1), (13, 1)],
  term ((-43399307162444072615649573376780395590797368741150161437 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((-3316024588732535 : Rat) / 1162780221153193) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-121927047278514377755144520733639888760 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 2), (9, 1), (11, 1)],
  term ((15079716211403877354660632708118932532 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 2), (9, 1), (12, 1), (13, 1)],
  term ((-8501248819002635272876995587763821200414506222869636947 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (2, 2), (9, 1), (12, 1), (15, 1)],
  term ((2371573036421067 : Rat) / 1162780221153193) [(0, 1), (2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16699908980317574655756114821325118063192 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (2, 2), (9, 1), (13, 1)],
  term ((-138258718443640172154833149031924695353189838244162526323 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((86455999411294361 : Rat) / 6976681326919158) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((1510320506263851247606420389471568293124 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 2), (9, 2)],
  term ((-50147794845543336284049146931354572708 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 2), (11, 1), (12, 1), (13, 1)],
  term ((5626786232852480596986384644012788074352480312750530851 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (2, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1511632778605275 : Rat) / 1162780221153193) [(0, 1), (2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1359593368573093172905712257911441661246 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((43459647497705333090949826472205091833136204953312197369 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-15802051720330881 : Rat) / 4651120884612772) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((237388069701818425679127847259107306728735847934448923 : Rat) / 15762694103932539296691075098919760974022820733007820) [(0, 1), (2, 2), (12, 1), (13, 1), (15, 1)],
  term ((-3674958078000033 : Rat) / 1162780221153193) [(0, 1), (2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-125192598325153958362893424184823628172 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 2), (12, 1), (13, 2)],
  term ((66748235112015248168043000490868102755763105025861902396 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((16775057433598076 : Rat) / 3488340663459579) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1099099907237639857489288939581514116976 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (2, 2), (13, 2)],
  term ((-4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 2), (14, 1)],
  term ((-104244643455882775953184394052154990217876825480745954569 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(0, 1), (2, 2), (15, 2)],
  term ((23659207676676527 : Rat) / 4651120884612772) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((-1226522336020992712801912164099948448654 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 2)],
  term ((-2026668639087705403624852686972380630 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 2), (5, 1), (9, 1)],
  term ((-13408278867591516263964573029451067132 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 2), (5, 1), (13, 1)],
  term ((-90571061978454541516795555975182944929229918063114182 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 2), (5, 1), (15, 1)],
  term ((375647204014056 : Rat) / 1162780221153193) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((711267717866237224134638869344200372606 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (7, 1), (9, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (7, 1), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (3, 2), (7, 1), (12, 1), (15, 1)],
  term ((217230840263161 : Rat) / 1162780221153193) [(0, 1), (3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-123905327885937413341038734560550052154 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (7, 1), (13, 1)],
  term ((-43399307162444072615649573376780395590797368741150161437 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((-3316024588732535 : Rat) / 1162780221153193) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-121927047278514377755144520733639888760 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 2), (9, 1), (11, 1)],
  term ((15079716211403877354660632708118932532 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 2), (9, 1), (12, 1), (13, 1)],
  term ((-8501248819002635272876995587763821200414506222869636947 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (3, 2), (9, 1), (12, 1), (15, 1)],
  term ((2371573036421067 : Rat) / 1162780221153193) [(0, 1), (3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16699908980317574655756114821325118063192 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 2), (9, 1), (13, 1)],
  term ((-138258718443640172154833149031924695353189838244162526323 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((86455999411294361 : Rat) / 6976681326919158) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((1510320506263851247606420389471568293124 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 2), (9, 2)],
  term ((-50147794845543336284049146931354572708 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 2), (11, 1), (12, 1), (13, 1)],
  term ((5626786232852480596986384644012788074352480312750530851 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (3, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1511632778605275 : Rat) / 1162780221153193) [(0, 1), (3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1359593368573093172905712257911441661246 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((43459647497705333090949826472205091833136204953312197369 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((-15802051720330881 : Rat) / 4651120884612772) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((237388069701818425679127847259107306728735847934448923 : Rat) / 15762694103932539296691075098919760974022820733007820) [(0, 1), (3, 2), (12, 1), (13, 1), (15, 1)],
  term ((-3674958078000033 : Rat) / 1162780221153193) [(0, 1), (3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-125192598325153958362893424184823628172 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 2), (12, 1), (13, 2)],
  term ((66748235112015248168043000490868102755763105025861902396 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((16775057433598076 : Rat) / 3488340663459579) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1099099907237639857489288939581514116976 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (3, 2), (13, 2)],
  term ((-4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 2), (14, 1)],
  term ((-104244643455882775953184394052154990217876825480745954569 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(0, 1), (3, 2), (15, 2)],
  term ((23659207676676527 : Rat) / 4651120884612772) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((2026668639087705403624852686972380630 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (9, 1), (14, 2)],
  term ((2026668639087705403624852686972380630 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (9, 1), (15, 2)],
  term ((13408278867591516263964573029451067132 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (13, 1), (14, 2)],
  term ((13408278867591516263964573029451067132 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (13, 1), (15, 2)],
  term ((90571061978454541516795555975182944929229918063114182 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (14, 2), (15, 1)],
  term ((-375647204014056 : Rat) / 1162780221153193) [(0, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((90571061978454541516795555975182944929229918063114182 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (15, 3)],
  term ((-375647204014056 : Rat) / 1162780221153193) [(0, 1), (5, 1), (15, 3), (16, 1)],
  term ((-711267717866237224134638869344200372606 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (14, 2)],
  term ((-711267717866237224134638869344200372606 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (15, 2)],
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 2)],
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-217230840263161 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (12, 1), (15, 3)],
  term ((-217230840263161 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((123905327885937413341038734560550052154 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (13, 1), (14, 2)],
  term ((123905327885937413341038734560550052154 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (13, 1), (15, 2)],
  term ((43399307162444072615649573376780395590797368741150161437 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term ((3316024588732535 : Rat) / 1162780221153193) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((43399307162444072615649573376780395590797368741150161437 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (7, 1), (15, 3)],
  term ((3316024588732535 : Rat) / 1162780221153193) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((121927047278514377755144520733639888760 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (9, 1), (11, 1), (14, 2)],
  term ((121927047278514377755144520733639888760 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((-15079716211403877354660632708118932532 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-15079716211403877354660632708118932532 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((8501248819002635272876995587763821200414506222869636947 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-2371573036421067 : Rat) / 1162780221153193) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((8501248819002635272876995587763821200414506222869636947 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (9, 1), (12, 1), (15, 3)],
  term ((-2371573036421067 : Rat) / 1162780221153193) [(0, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((16699908980317574655756114821325118063192 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (13, 1), (14, 2)],
  term ((16699908980317574655756114821325118063192 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (13, 1), (15, 2)],
  term ((138258718443640172154833149031924695353189838244162526323 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((-86455999411294361 : Rat) / 6976681326919158) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((138258718443640172154833149031924695353189838244162526323 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (9, 1), (15, 3)],
  term ((-86455999411294361 : Rat) / 6976681326919158) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((-1510320506263851247606420389471568293124 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (14, 2)],
  term ((-1510320506263851247606420389471568293124 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (15, 2)],
  term ((50147794845543336284049146931354572708 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((50147794845543336284049146931354572708 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-5626786232852480596986384644012788074352480312750530851 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((1511632778605275 : Rat) / 1162780221153193) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5626786232852480596986384644012788074352480312750530851 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (11, 1), (12, 1), (15, 3)],
  term ((1511632778605275 : Rat) / 1162780221153193) [(0, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((1359593368573093172905712257911441661246 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((1359593368573093172905712257911441661246 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((-43459647497705333090949826472205091833136204953312197369 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((15802051720330881 : Rat) / 4651120884612772) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-43459647497705333090949826472205091833136204953312197369 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (11, 1), (15, 3)],
  term ((15802051720330881 : Rat) / 4651120884612772) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((-237388069701818425679127847259107306728735847934448923 : Rat) / 15762694103932539296691075098919760974022820733007820) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((3674958078000033 : Rat) / 1162780221153193) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-237388069701818425679127847259107306728735847934448923 : Rat) / 15762694103932539296691075098919760974022820733007820) [(0, 1), (12, 1), (13, 1), (15, 3)],
  term ((3674958078000033 : Rat) / 1162780221153193) [(0, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((125192598325153958362893424184823628172 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (12, 1), (13, 2), (14, 2)],
  term ((125192598325153958362893424184823628172 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (12, 1), (13, 2), (15, 2)],
  term ((-66748235112015248168043000490868102755763105025861902396 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((-16775057433598076 : Rat) / 3488340663459579) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-66748235112015248168043000490868102755763105025861902396 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (13, 1), (15, 3)],
  term ((-16775057433598076 : Rat) / 3488340663459579) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((1099099907237639857489288939581514116976 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (13, 2), (14, 2)],
  term ((1099099907237639857489288939581514116976 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (13, 2), (15, 2)],
  term ((4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (14, 1), (15, 2)],
  term ((1226522336020992712801912164099948448654 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (14, 2)],
  term ((104244643455882775953184394052154990217876825480745954569 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(0, 1), (14, 2), (15, 2)],
  term ((-23659207676676527 : Rat) / 4651120884612772) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (14, 3)],
  term ((1226522336020992712801912164099948448654 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (15, 2)],
  term ((104244643455882775953184394052154990217876825480745954569 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(0, 1), (15, 4)],
  term ((-23659207676676527 : Rat) / 4651120884612772) [(0, 1), (15, 4), (16, 1)],
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (14, 2)],
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((-488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (3, 2), (5, 1)],
  term ((1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 2), (7, 1)],
  term ((-2028136524153822677206265073302031559004 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 2), (9, 1)],
  term ((219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 2), (12, 1), (13, 1)],
  term ((-12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (3, 2), (12, 1), (15, 1)],
  term ((1765379642691762 : Rat) / 1162780221153193) [(1, 1), (2, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((334923165076545527914180094575123784456 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((76060235924508134387712972664199959411421929625801834341 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((-4253268925985286 : Rat) / 1162780221153193) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((-4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 3)],
  term ((488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1), (14, 2)],
  term ((488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1), (15, 2)],
  term ((-1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (14, 2)],
  term ((-1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (15, 2)],
  term ((2028136524153822677206265073302031559004 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (14, 2)],
  term ((2028136524153822677206265073302031559004 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (15, 2)],
  term ((-219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 2)],
  term ((-219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (12, 1), (13, 1), (15, 2)],
  term ((12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1765379642691762 : Rat) / 1162780221153193) [(1, 1), (2, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (12, 1), (15, 3)],
  term ((-1765379642691762 : Rat) / 1162780221153193) [(1, 1), (2, 1), (12, 1), (15, 3), (16, 1)],
  term ((-334923165076545527914180094575123784456 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (13, 1), (14, 2)],
  term ((-334923165076545527914180094575123784456 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((-76060235924508134387712972664199959411421929625801834341 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((4253268925985286 : Rat) / 1162780221153193) [(1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((-76060235924508134387712972664199959411421929625801834341 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (15, 3)],
  term ((4253268925985286 : Rat) / 1162780221153193) [(1, 1), (2, 1), (15, 3), (16, 1)],
  term ((-318157627827131441558407716526566919906 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (3, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (3, 1), (4, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (3, 1), (5, 1), (9, 1)],
  term ((-9433612767893076993065010042131230720 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 2), (3, 1), (5, 1), (13, 1)],
  term ((14906187992692019146517026891183166212309896428078685278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (3, 1), (5, 1), (15, 1)],
  term ((-306473385224616 : Rat) / 1162780221153193) [(1, 1), (2, 2), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (3, 1), (8, 1)],
  term ((547923610455894560483425491959550791328 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (3, 1), (9, 1), (13, 1)],
  term ((-8571570734462411811492261358627419460577064432557901137 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (3, 1), (9, 1), (15, 1)],
  term ((5233019573407276 : Rat) / 1162780221153193) [(1, 1), (2, 2), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((441787725305289624319136007521902947392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (3, 1), (9, 2)],
  term ((-179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (3, 1), (12, 1)],
  term ((3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 2), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((-550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (2, 2), (3, 1), (12, 1), (15, 2)],
  term ((1443384088015008 : Rat) / 1162780221153193) [(1, 1), (2, 2), (3, 1), (12, 1), (15, 2), (16, 1)],
  term ((-89155624704474210792214183886281336272739806907090888169 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 2), (3, 1), (13, 1), (15, 1)],
  term ((513905188349430 : Rat) / 1162780221153193) [(1, 1), (2, 2), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((43172364991138926603597538274087565352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (3, 1), (13, 2)],
  term ((-1110595145383580408645472096611607285242 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (3, 1), (14, 1)],
  term ((42338735591756726608862781052457235569684346949652963639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (3, 1), (15, 2)],
  term ((-735047170265332 : Rat) / 1162780221153193) [(1, 1), (2, 2), (3, 1), (15, 2), (16, 1)],
  term ((-143806235165341577686497186332059487512 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 2), (4, 1), (9, 1)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (4, 1), (12, 1), (13, 1)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (4, 1), (12, 1), (15, 1)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(1, 1), (2, 2), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19175911641765942668946118011013940304 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 2), (4, 1), (13, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (4, 1), (13, 1), (14, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 2), (4, 1), (14, 1), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (2, 2), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((46297346902676175640402165826134159087885762653346004147 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (2, 2), (4, 1), (15, 1)],
  term ((-5625452497643948 : Rat) / 1162780221153193) [(1, 1), (2, 2), (4, 1), (15, 1), (16, 1)],
  term ((415528615091762012913932167433386338017 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (5, 1)],
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (5, 1), (9, 1), (11, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (5, 1), (9, 1), (12, 1), (13, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (2, 2), (5, 1), (9, 1), (12, 1), (15, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(1, 1), (2, 2), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1533196012139871820251458495733305475032 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (5, 1), (9, 1), (13, 1)],
  term ((-60014409539569963935744582355375799709409709725627656817 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (5, 1), (9, 1), (15, 1)],
  term ((13257101325589140 : Rat) / 1162780221153193) [(1, 1), (2, 2), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (5, 1), (9, 2)],
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 2), (5, 1), (11, 1), (13, 1)],
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (5, 1), (11, 1), (15, 1)],
  term ((-854765176539728 : Rat) / 1162780221153193) [(1, 1), (2, 2), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (5, 1), (12, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (2, 2), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(1, 1), (2, 2), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (5, 1), (12, 1), (13, 2)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (2, 2), (5, 1), (12, 1), (15, 2)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(1, 1), (2, 2), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 3), (3, 1)],
  term ((-488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 3), (5, 1)],
  term ((1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 3), (7, 1)],
  term ((-2028136524153822677206265073302031559004 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 3), (9, 1)],
  term ((219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 3), (12, 1), (13, 1)],
  term ((-12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 3), (12, 1), (15, 1)],
  term ((1765379642691762 : Rat) / 1162780221153193) [(1, 1), (2, 3), (12, 1), (15, 1), (16, 1)],
  term ((334923165076545527914180094575123784456 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 3), (13, 1)],
  term ((76060235924508134387712972664199959411421929625801834341 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 3), (15, 1)],
  term ((-4253268925985286 : Rat) / 1162780221153193) [(1, 1), (2, 3), (15, 1), (16, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (14, 2)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (15, 2)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (9, 1), (14, 2)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (9, 1), (15, 2)],
  term ((9433612767893076993065010042131230720 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 1), (5, 1), (13, 1), (14, 2)],
  term ((9433612767893076993065010042131230720 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 1), (5, 1), (13, 1), (15, 2)],
  term ((-14906187992692019146517026891183166212309896428078685278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (14, 2), (15, 1)],
  term ((306473385224616 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-14906187992692019146517026891183166212309896428078685278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (15, 3)],
  term ((306473385224616 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (15, 3), (16, 1)],
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (14, 2)],
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (15, 2)],
  term ((-547923610455894560483425491959550791328 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 2)],
  term ((-547923610455894560483425491959550791328 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2)],
  term ((8571570734462411811492261358627419460577064432557901137 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (9, 1), (14, 2), (15, 1)],
  term ((-5233019573407276 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((8571570734462411811492261358627419460577064432557901137 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (9, 1), (15, 3)],
  term ((-5233019573407276 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 1), (15, 3), (16, 1)],
  term ((-441787725305289624319136007521902947392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 2), (14, 2)],
  term ((-441787725305289624319136007521902947392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 2), (15, 2)],
  term ((-3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 3)],
  term ((179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (12, 1), (14, 2)],
  term ((550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (12, 1), (14, 2), (15, 2)],
  term ((-1443384088015008 : Rat) / 1162780221153193) [(1, 1), (3, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (12, 1), (15, 2)],
  term ((550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (12, 1), (15, 4)],
  term ((-1443384088015008 : Rat) / 1162780221153193) [(1, 1), (3, 1), (12, 1), (15, 4), (16, 1)],
  term ((89155624704474210792214183886281336272739806907090888169 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1)],
  term ((-513905188349430 : Rat) / 1162780221153193) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((89155624704474210792214183886281336272739806907090888169 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (13, 1), (15, 3)],
  term ((-513905188349430 : Rat) / 1162780221153193) [(1, 1), (3, 1), (13, 1), (15, 3), (16, 1)],
  term ((-43172364991138926603597538274087565352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (13, 2), (14, 2)],
  term ((-43172364991138926603597538274087565352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (13, 2), (15, 2)],
  term ((1110595145383580408645472096611607285242 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((318157627827131441558407716526566919906 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (14, 2)],
  term ((-42338735591756726608862781052457235569684346949652963639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (14, 2), (15, 2)],
  term ((735047170265332 : Rat) / 1162780221153193) [(1, 1), (3, 1), (14, 2), (15, 2), (16, 1)],
  term ((1110595145383580408645472096611607285242 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (14, 3)],
  term ((318157627827131441558407716526566919906 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (15, 2)],
  term ((-42338735591756726608862781052457235569684346949652963639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (15, 4)],
  term ((735047170265332 : Rat) / 1162780221153193) [(1, 1), (3, 1), (15, 4), (16, 1)],
  term ((-143806235165341577686497186332059487512 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 2), (4, 1), (9, 1)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (4, 1), (12, 1), (13, 1)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 2), (4, 1), (12, 1), (15, 1)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(1, 1), (3, 2), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19175911641765942668946118011013940304 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 2), (4, 1), (13, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (4, 1), (13, 1), (14, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 2), (4, 1), (14, 1), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (3, 2), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((46297346902676175640402165826134159087885762653346004147 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (3, 2), (4, 1), (15, 1)],
  term ((-5625452497643948 : Rat) / 1162780221153193) [(1, 1), (3, 2), (4, 1), (15, 1), (16, 1)],
  term ((415528615091762012913932167433386338017 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (5, 1)],
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (5, 1), (9, 1), (11, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (5, 1), (9, 1), (12, 1), (13, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 2), (5, 1), (9, 1), (12, 1), (15, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(1, 1), (3, 2), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1533196012139871820251458495733305475032 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (5, 1), (9, 1), (13, 1)],
  term ((-60014409539569963935744582355375799709409709725627656817 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 2), (5, 1), (9, 1), (15, 1)],
  term ((13257101325589140 : Rat) / 1162780221153193) [(1, 1), (3, 2), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (5, 1), (9, 2)],
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 2), (5, 1), (11, 1), (13, 1)],
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 2), (5, 1), (11, 1), (15, 1)],
  term ((-854765176539728 : Rat) / 1162780221153193) [(1, 1), (3, 2), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (5, 1), (12, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (3, 2), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(1, 1), (3, 2), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (5, 1), (12, 1), (13, 2)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (3, 2), (5, 1), (12, 1), (15, 2)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(1, 1), (3, 2), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 2), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-318157627827131441558407716526566919906 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 3)],
  term ((2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 3), (4, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 3), (5, 1), (9, 1)],
  term ((-9433612767893076993065010042131230720 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 3), (5, 1), (13, 1)],
  term ((14906187992692019146517026891183166212309896428078685278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 3), (5, 1), (15, 1)],
  term ((-306473385224616 : Rat) / 1162780221153193) [(1, 1), (3, 3), (5, 1), (15, 1), (16, 1)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 3), (8, 1)],
  term ((547923610455894560483425491959550791328 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 3), (9, 1), (13, 1)],
  term ((-8571570734462411811492261358627419460577064432557901137 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 3), (9, 1), (15, 1)],
  term ((5233019573407276 : Rat) / 1162780221153193) [(1, 1), (3, 3), (9, 1), (15, 1), (16, 1)],
  term ((441787725305289624319136007521902947392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 3), (9, 2)],
  term ((-179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 3), (12, 1)],
  term ((3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 3), (12, 1), (13, 1), (15, 1)],
  term ((-550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 3), (12, 1), (15, 2)],
  term ((1443384088015008 : Rat) / 1162780221153193) [(1, 1), (3, 3), (12, 1), (15, 2), (16, 1)],
  term ((-89155624704474210792214183886281336272739806907090888169 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 3), (13, 1), (15, 1)],
  term ((513905188349430 : Rat) / 1162780221153193) [(1, 1), (3, 3), (13, 1), (15, 1), (16, 1)],
  term ((43172364991138926603597538274087565352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 3), (13, 2)],
  term ((-1110595145383580408645472096611607285242 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 3), (14, 1)],
  term ((42338735591756726608862781052457235569684346949652963639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 3), (15, 2)],
  term ((-735047170265332 : Rat) / 1162780221153193) [(1, 1), (3, 3), (15, 2), (16, 1)],
  term ((143806235165341577686497186332059487512 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (9, 1), (14, 2)],
  term ((143806235165341577686497186332059487512 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (9, 1), (15, 2)],
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (12, 1), (13, 1), (14, 2)],
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (12, 1), (13, 1), (15, 2)],
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (12, 1), (14, 2), (15, 1)],
  term ((-3864655997676720 : Rat) / 1162780221153193) [(1, 1), (4, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (12, 1), (15, 3)],
  term ((-3864655997676720 : Rat) / 1162780221153193) [(1, 1), (4, 1), (12, 1), (15, 3), (16, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (13, 1), (14, 1), (15, 2)],
  term ((19175911641765942668946118011013940304 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (13, 1), (14, 2)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (13, 1), (14, 3)],
  term ((19175911641765942668946118011013940304 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (13, 1), (15, 2)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (14, 1), (15, 3)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (4, 1), (14, 1), (15, 3), (16, 1)],
  term ((-46297346902676175640402165826134159087885762653346004147 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (14, 2), (15, 1)],
  term ((5625452497643948 : Rat) / 1162780221153193) [(1, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (14, 3), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (4, 1), (14, 3), (15, 1), (16, 1)],
  term ((-46297346902676175640402165826134159087885762653346004147 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (15, 3)],
  term ((5625452497643948 : Rat) / 1162780221153193) [(1, 1), (4, 1), (15, 3), (16, 1)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 2)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 3)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((1533196012139871820251458495733305475032 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (13, 1), (14, 2)],
  term ((1533196012139871820251458495733305475032 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (13, 1), (15, 2)],
  term ((60014409539569963935744582355375799709409709725627656817 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 1), (14, 2), (15, 1)],
  term ((-13257101325589140 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((60014409539569963935744582355375799709409709725627656817 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 1), (15, 3)],
  term ((-13257101325589140 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((-636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2), (14, 2)],
  term ((-636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2), (15, 2)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 2)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (11, 1), (14, 2), (15, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (11, 1), (15, 3)],
  term ((854765176539728 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 1), (15, 3), (16, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 3)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (12, 1), (13, 2), (14, 2)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (12, 1), (13, 2), (15, 2)],
  term ((18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (12, 1), (14, 2)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (12, 1), (14, 2), (15, 2)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (12, 1), (15, 2)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (12, 1), (15, 4)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (15, 4), (16, 1)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 3)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (13, 1), (14, 3), (15, 1)],
  term ((-415528615091762012913932167433386338017 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (14, 2)],
  term ((-415528615091762012913932167433386338017 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (15, 2)],
  term ((1203985881286898978259264505040398363233 : Rat) / 799806304934984864377795685353026178660) [(2, 2)],
  term ((1203985881286898978259264505040398363233 : Rat) / 799806304934984864377795685353026178660) [(3, 2)],
  term ((-1203985881286898978259264505040398363233 : Rat) / 799806304934984864377795685353026178660) [(14, 2)],
  term ((-1203985881286898978259264505040398363233 : Rat) / 799806304934984864377795685353026178660) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 0 through 99. -/
theorem ep_Q2_024_block_05_0000_0099_valid :
    checkProductSumEq ep_Q2_024_partials_05_0000_0099
      ep_Q2_024_block_05_0000_0099 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
