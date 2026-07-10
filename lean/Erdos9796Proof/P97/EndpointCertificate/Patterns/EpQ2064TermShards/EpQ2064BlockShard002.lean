/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.ProductCertificate
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2064Generators

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_064 computed product shard

This generated module stores bounded coefficient blocks. The shared checker
computes each coefficient-generator product when the row coordinator is
checked.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2064TermShards

/-- Computed coefficient block `28:0-50` for
endpoint certificate `ep_Q2_064`. -/
def ep_Q2_064_block_28_0000_0050 :
    ComputedProductBlock EpQ2064Generators.ep_Q2_064_generators :=
  { generatorIndex := 28
    coefficient :=
[
  term ((-8225 : Rat) / 16) [],
  term ((9 : Rat) / 4) [(0, 1)],
  term (54 : Rat) [(0, 1), (1, 1), (3, 1)],
  term (-18 : Rat) [(0, 1), (1, 1), (5, 1)],
  term (-36 : Rat) [(0, 1), (1, 1), (9, 1)],
  term (-18 : Rat) [(0, 1), (1, 1), (15, 1)],
  term (-81 : Rat) [(0, 1), (3, 1), (5, 1)],
  term (54 : Rat) [(0, 1), (5, 1), (9, 1)],
  term (27 : Rat) [(0, 1), (5, 1), (15, 1)],
  term (-18 : Rat) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term (27 : Rat) [(0, 1), (5, 2)],
  term (-18 : Rat) [(0, 1), (15, 2), (16, 1)],
  term (81 : Rat) [(1, 1), (3, 1)],
  term (9 : Rat) [(1, 1), (5, 1)],
  term (-9 : Rat) [(1, 1), (5, 1), (16, 1)],
  term (-36 : Rat) [(1, 1), (7, 1)],
  term (-54 : Rat) [(1, 1), (9, 1)],
  term (-18 : Rat) [(1, 1), (13, 1)],
  term (9 : Rat) [(1, 1), (15, 1)],
  term (-9 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-6783 : Rat) [(3, 1), (5, 1)],
  term (8523 : Rat) [(3, 1), (6, 1), (15, 1)],
  term (324 : Rat) [(3, 1), (7, 1)],
  term (-8595 : Rat) [(3, 1), (12, 1), (15, 1)],
  term ((3861 : Rat) / 8) [(3, 1), (13, 1)],
  term (36 : Rat) [(3, 1), (15, 1)],
  term ((7929 : Rat) / 4) [(3, 2)],
  term (-2841 : Rat) [(5, 1), (6, 1), (15, 1)],
  term ((945 : Rat) / 8) [(5, 1), (7, 1)],
  term (3641 : Rat) [(5, 1), (9, 1)],
  term (2865 : Rat) [(5, 1), (12, 1), (15, 1)],
  term ((-3843 : Rat) / 8) [(5, 1), (13, 1)],
  term ((1807 : Rat) / 2) [(5, 1), (15, 1)],
  term (16 : Rat) [(5, 1), (15, 1), (16, 1)],
  term ((8163 : Rat) / 4) [(5, 2)],
  term (-45 : Rat) [(6, 1)],
  term (-5682 : Rat) [(6, 1), (9, 1), (15, 1)],
  term (-2841 : Rat) [(6, 1), (15, 2)],
  term (-216 : Rat) [(7, 1), (9, 1)],
  term ((-13605 : Rat) / 8) [(7, 1), (15, 1)],
  term (5730 : Rat) [(9, 1), (12, 1), (15, 1)],
  term ((-1971 : Rat) / 8) [(9, 1), (13, 1)],
  term (-24 : Rat) [(9, 1), (15, 1)],
  term (-881 : Rat) [(9, 2)],
  term (45 : Rat) [(12, 1)],
  term (2865 : Rat) [(12, 1), (15, 2)],
  term ((11091 : Rat) / 8) [(13, 1), (15, 1)],
  term (18 : Rat) [(13, 2)],
  term ((-9 : Rat) / 4) [(14, 1)],
  term ((-4549 : Rat) / 4) [(15, 2)],
  term (16 : Rat) [(15, 2), (16, 1)]
] }

/-- Computed coefficient block `29:0-53` for
endpoint certificate `ep_Q2_064`. -/
def ep_Q2_064_block_29_0000_0053 :
    ComputedProductBlock EpQ2064Generators.ep_Q2_064_generators :=
  { generatorIndex := 29
    coefficient :=
[
  term ((-9 : Rat) / 2) [(0, 1), (1, 1), (3, 1)],
  term ((135 : Rat) / 2) [(0, 1), (1, 1), (5, 1)],
  term ((9 : Rat) / 2) [(0, 1), (1, 1), (9, 1)],
  term (-72 : Rat) [(0, 1), (1, 1), (13, 1)],
  term ((135 : Rat) / 2) [(0, 1), (1, 1), (15, 1)],
  term ((27 : Rat) / 4) [(0, 1), (3, 1), (5, 1)],
  term ((-27 : Rat) / 4) [(0, 1), (5, 1), (9, 1)],
  term (108 : Rat) [(0, 1), (5, 1), (13, 1)],
  term ((-405 : Rat) / 4) [(0, 1), (5, 1), (15, 1)],
  term (18 : Rat) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((-405 : Rat) / 4) [(0, 1), (5, 2)],
  term (18 : Rat) [(0, 1), (15, 2), (16, 1)],
  term ((-27 : Rat) / 4) [(1, 1), (3, 1)],
  term ((405 : Rat) / 4) [(1, 1), (5, 1)],
  term (9 : Rat) [(1, 1), (5, 1), (16, 1)],
  term ((-117 : Rat) / 4) [(1, 1), (9, 1)],
  term (-72 : Rat) [(1, 1), (13, 1)],
  term ((261 : Rat) / 4) [(1, 1), (15, 1)],
  term (9 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (2988 : Rat) [(3, 1), (5, 1)],
  term ((-2841 : Rat) / 4) [(3, 1), (6, 1), (15, 1)],
  term (-27 : Rat) [(3, 1), (7, 1)],
  term ((881 : Rat) / 16) [(3, 1), (9, 1)],
  term ((2865 : Rat) / 4) [(3, 1), (12, 1), (15, 1)],
  term (-2589 : Rat) [(3, 1), (13, 1)],
  term ((5981 : Rat) / 4) [(3, 1), (15, 1)],
  term ((-2643 : Rat) / 16) [(3, 2)],
  term ((42615 : Rat) / 4) [(5, 1), (6, 1), (15, 1)],
  term (405 : Rat) [(5, 1), (7, 1)],
  term ((18267 : Rat) / 16) [(5, 1), (9, 1)],
  term ((-42975 : Rat) / 4) [(5, 1), (12, 1), (15, 1)],
  term ((157683 : Rat) / 16) [(5, 1), (13, 1)],
  term ((-56373 : Rat) / 8) [(5, 1), (15, 1)],
  term (-16 : Rat) [(5, 1), (15, 1), (16, 1)],
  term ((-122445 : Rat) / 16) [(5, 2)],
  term ((2841 : Rat) / 4) [(6, 1), (9, 1), (15, 1)],
  term (-11364 : Rat) [(6, 1), (13, 1), (15, 1)],
  term ((42615 : Rat) / 4) [(6, 1), (15, 2)],
  term (27 : Rat) [(7, 1), (9, 1)],
  term (-432 : Rat) [(7, 1), (13, 1)],
  term (405 : Rat) [(7, 1), (15, 1)],
  term ((-2865 : Rat) / 4) [(9, 1), (12, 1), (15, 1)],
  term ((-12719 : Rat) / 8) [(9, 1), (13, 1)],
  term ((64591 : Rat) / 16) [(9, 1), (15, 1)],
  term ((881 : Rat) / 8) [(9, 2)],
  term ((-27 : Rat) / 2) [(11, 1), (13, 1)],
  term ((-1953 : Rat) / 16) [(12, 1)],
  term (11460 : Rat) [(12, 1), (13, 1), (15, 1)],
  term ((-42975 : Rat) / 4) [(12, 1), (15, 2)],
  term ((-59767 : Rat) / 16) [(13, 1), (15, 1)],
  term ((-15819 : Rat) / 8) [(13, 2)],
  term ((2097 : Rat) / 8) [(14, 1)],
  term ((-19401 : Rat) / 16) [(15, 2)],
  term (-16 : Rat) [(15, 2), (16, 1)]
] }

/-- Computed coefficient block `30:0-5` for
endpoint certificate `ep_Q2_064`. -/
def ep_Q2_064_block_30_0000_0005 :
    ComputedProductBlock EpQ2064Generators.ep_Q2_064_generators :=
  { generatorIndex := 30
    coefficient :=
[
  term (18 : Rat) [(0, 1), (5, 1), (15, 1)],
  term (18 : Rat) [(0, 1), (15, 2)],
  term (9 : Rat) [(1, 1), (5, 1)],
  term (9 : Rat) [(1, 1), (15, 1)],
  term (-16 : Rat) [(5, 1), (15, 1)],
  term (-16 : Rat) [(15, 2)]
] }

end EpQ2064TermShards

end Patterns

end EndpointCertificate

end Problem97
