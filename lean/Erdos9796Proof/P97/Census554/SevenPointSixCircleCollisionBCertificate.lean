/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.SevenPointSixCircleCollisionBCertificateStage01Part01
import Erdos9796Proof.P97.Census554.SevenPointSixCircleCollisionBCertificateStage01Part02
import Erdos9796Proof.P97.Census554.SevenPointSixCircleCollisionBCertificateStage01Part03
import Erdos9796Proof.P97.Census554.SevenPointSixCircleCollisionBCertificateStage01Part04
import Erdos9796Proof.P97.Census554.SevenPointSixCircleCollisionBCertificateStage01Part05
import Erdos9796Proof.P97.Census554.SevenPointSixCircleCollisionBCertificateStage01Part06
import Erdos9796Proof.P97.Census554.SevenPointSixCircleCollisionBCertificateStage01Part07
import Erdos9796Proof.P97.Census554.SevenPointSixCircleCollisionBCertificateStage01Part08
import Erdos9796Proof.P97.Census554.SevenPointSixCircleCollisionBCertificateStage01Part09
import Erdos9796Proof.P97.Census554.SevenPointSixCircleCollisionBCertificateStage01Part10
import Erdos9796Proof.P97.Census554.SevenPointSixCircleCollisionBCertificateStage01Part11
import Erdos9796Proof.P97.Census554.SevenPointSixCircleCollisionBCertificateStage01Part12
import Erdos9796Proof.P97.Census554.SevenPointSixCircleCollisionBCertificateStage01Part13
import Erdos9796Proof.P97.Census554.SevenPointSixCircleCollisionBCertificateStage01Part14
import Erdos9796Proof.P97.Census554.SevenPointSixCircleCollisionBCertificateStage01Part15
import Erdos9796Proof.P97.Census554.SevenPointSixCircleCollisionBCertificateStage01Part16
import Erdos9796Proof.P97.Census554.SevenPointSixCircleCollisionBCertificateStage02
import Erdos9796Proof.P97.Census554.SevenPointSixCircleCollisionBCertificateStage03
import Erdos9796Proof.P97.Census554.SevenPointSixCircleCollisionBCertificateStage04
import Erdos9796Proof.P97.Census554.SevenPointSixCircleCollisionBCertificateStage05
import Erdos9796Proof.P97.Census554.SevenPointSixCircleCollisionBCertificateStage06
import Erdos9796Proof.P97.Census554.SevenPointSixCircleCollisionBCertificateStage07
import Erdos9796Proof.P97.Census554.SevenPointSixCircleCollisionBCertificateStage08
import Erdos9796Proof.P97.Census554.SevenPointSixCircleCollisionBCertificateStage09
import Erdos9796Proof.P97.Census554.SevenPointSixCircleCollisionBCertificateStage10
import Erdos9796Proof.P97.Census554.SevenPointSixCircleCollisionBCertificateStage11

/-!
# Exact UNIT certificate for the second seven-point six-circle core

Generated exact rational certificate module.
-/

set_option linter.style.longLine false
set_option maxRecDepth 100000
-- Exact certificate normalization needs extended heartbeats.
set_option maxHeartbeats 24000000

namespace Problem97
namespace Census554
namespace EqualityCore

/-- The normalized shard 15 polynomial system is inconsistent. -/
theorem normalizedSevenPointSixCircleBUnitCertificate
    (x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y : ℝ)
    (hp1 : -x2x^2-x2y^2+1 = 0)
    (hp2 : -x3x^2+2*x3x-x3y^2 = 0)
    (hp3 : -x2x^2+2*x2x*x3x-x2y^2+2*x2y*x3y = 0)
    (hp4 : 2*x3x*x6x+2*x3y*x6y-x6x^2-x6y^2 = 0)
    (hp5 : -x3x^2+2*x3x*x4x-x3y^2+2*x3y*x4y-2*x4x+1 = 0)
    (hp6 : 2*x4x*x5x-2*x4x+2*x4y*x5y-x5x^2-x5y^2+1 = 0)
    (hp7 : 2*x4x*x6x-2*x4x+2*x4y*x6y-x6x^2-x6y^2+1 = 0)
    (hp8 : 2*x5x-1 = 0)
    (hp9 : -x4x^2+2*x4x*x5x-x4y^2+2*x4y*x5y = 0)
    (hp10 : -x2x^2+2*x2x*x6x-x2y^2+2*x2y*x6y = 0)
    (hp11 : -x5x^2+2*x5x*x6x-x5y^2+2*x5y*x6y = 0)
    : False := by
  have hs1p1 := normalizedSevenPointSixCircleBUnitSummand01Part01 x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y hp1
  have hs1p2 := normalizedSevenPointSixCircleBUnitSummand01Part02 x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y hp1
  have hs1p3 := normalizedSevenPointSixCircleBUnitSummand01Part03 x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y hp1
  have hs1p4 := normalizedSevenPointSixCircleBUnitSummand01Part04 x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y hp1
  have hs1p5 := normalizedSevenPointSixCircleBUnitSummand01Part05 x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y hp1
  have hs1p6 := normalizedSevenPointSixCircleBUnitSummand01Part06 x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y hp1
  have hs1p7 := normalizedSevenPointSixCircleBUnitSummand01Part07 x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y hp1
  have hs1p8 := normalizedSevenPointSixCircleBUnitSummand01Part08 x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y hp1
  have hs1p9 := normalizedSevenPointSixCircleBUnitSummand01Part09 x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y hp1
  have hs1p10 := normalizedSevenPointSixCircleBUnitSummand01Part10 x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y hp1
  have hs1p11 := normalizedSevenPointSixCircleBUnitSummand01Part11 x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y hp1
  have hs1p12 := normalizedSevenPointSixCircleBUnitSummand01Part12 x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y hp1
  have hs1p13 := normalizedSevenPointSixCircleBUnitSummand01Part13 x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y hp1
  have hs1p14 := normalizedSevenPointSixCircleBUnitSummand01Part14 x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y hp1
  have hs1p15 := normalizedSevenPointSixCircleBUnitSummand01Part15 x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y hp1
  have hs1p16 := normalizedSevenPointSixCircleBUnitSummand01Part16 x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y hp1
  have hs2 := normalizedSevenPointSixCircleBUnitSummand02 x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y hp2
  have hs3 := normalizedSevenPointSixCircleBUnitSummand03 x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y hp3
  have hs4 := normalizedSevenPointSixCircleBUnitSummand04 x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y hp4
  have hs5 := normalizedSevenPointSixCircleBUnitSummand05 x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y hp5
  have hs6 := normalizedSevenPointSixCircleBUnitSummand06 x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y hp6
  have hs7 := normalizedSevenPointSixCircleBUnitSummand07 x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y hp7
  have hs8 := normalizedSevenPointSixCircleBUnitSummand08 x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y hp8
  have hs9 := normalizedSevenPointSixCircleBUnitSummand09 x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y hp9
  have hs10 := normalizedSevenPointSixCircleBUnitSummand10 x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y hp10
  have hs11 := normalizedSevenPointSixCircleBUnitSummand11 x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y hp11
  have hunit : (10790208 : ℝ) = 0 := by
    linarith only [hs1p1, hs1p2, hs1p3, hs1p4, hs1p5, hs1p6, hs1p7, hs1p8, hs1p9, hs1p10, hs1p11, hs1p12, hs1p13, hs1p14, hs1p15, hs1p16, hs2, hs3, hs4, hs5, hs6, hs7, hs8, hs9, hs10, hs11]
  norm_num at hunit

end EqualityCore
end Census554
end Problem97
