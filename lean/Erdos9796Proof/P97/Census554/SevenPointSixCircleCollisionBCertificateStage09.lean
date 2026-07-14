/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Shard 15 UNIT certificate summand 9

Generated exact rational certificate module.
-/

set_option linter.style.longLine false
set_option maxRecDepth 100000
-- Exact certificate normalization needs extended heartbeats.
set_option maxHeartbeats 24000000

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Expanded exact consequence of polynomial generator 9. -/
theorem normalizedSevenPointSixCircleBUnitSummand09
    (x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y : ℝ)
    (hp9 : -x4x^2+2*x4x*x5x-x4y^2+2*x4y*x5y = 0)
    : 2838673408*x2x*x3y^2*x4x^2 - 5677346816*x2x*x3y^2*x4x*x5x + 2838673408*x2x*x3y^2*x4y^2 - 5677346816*x2x*x3y^2*x4y*x5y - 40223520*x2x*x3y*x4x^2*x5y + 80447040*x2x*x3y*x4x^2*x6y + 80447040*x2x*x3y*x4x*x5x*x5y - 160894080*x2x*x3y*x4x*x5x*x6y - 40223520*x2x*x3y*x4y^2*x5y + 80447040*x2x*x3y*x4y^2*x6y + 80447040*x2x*x3y*x4y*x5y^2 - 160894080*x2x*x3y*x4y*x5y*x6y + 281407392*x2x*x4x^2*x6x - 51372936*x2x*x4x^2 - 562814784*x2x*x4x*x5x*x6x + 102745872*x2x*x4x*x5x + 281407392*x2x*x4y^2*x6x - 51372936*x2x*x4y^2 - 562814784*x2x*x4y*x5y*x6x + 102745872*x2x*x4y*x5y - 2848254016*x2y*x3x*x3y*x4x^2 + 5696508032*x2y*x3x*x3y*x4x*x5x - 2848254016*x2y*x3x*x3y*x4y^2 + 5696508032*x2y*x3x*x3y*x4y*x5y - 120868416*x2y*x3x*x4x^2*x5y + 190883232*x2y*x3x*x4x^2*x6y + 241736832*x2y*x3x*x4x*x5x*x5y - 381766464*x2y*x3x*x4x*x5x*x6y - 120868416*x2y*x3x*x4y^2*x5y + 190883232*x2y*x3x*x4y^2*x6y + 241736832*x2y*x3x*x4y*x5y^2 - 381766464*x2y*x3x*x4y*x5y*x6y + 19161216*x2y*x3y^2*x4x^2*x5y - 38322432*x2y*x3y^2*x4x^2*x6y - 38322432*x2y*x3y^2*x4x*x5x*x5y + 76644864*x2y*x3y^2*x4x*x5x*x6y + 19161216*x2y*x3y^2*x4y^2*x5y - 38322432*x2y*x3y^2*x4y^2*x6y - 38322432*x2y*x3y^2*x4y*x5y^2 + 76644864*x2y*x3y^2*x4y*x5y*x6y + 50853600*x2y*x3y*x4x^2*x6x + 5733507536*x2y*x3y*x4x^2 - 101707200*x2y*x3y*x4x*x5x*x6x - 11467015072*x2y*x3y*x4x*x5x + 50853600*x2y*x3y*x4y^2*x6x + 5733507536*x2y*x3y*x4y^2 - 101707200*x2y*x3y*x4y*x5y*x6x - 11467015072*x2y*x3y*x4y*x5y + 60434208*x2y*x4x^2*x5y*x6x + 849168*x2y*x4x^2*x5y - 120868416*x2y*x4x^2*x6x*x6y + 208029456*x2y*x4x^2*x6y - 120868416*x2y*x4x*x5x*x5y*x6x - 1698336*x2y*x4x*x5x*x5y + 241736832*x2y*x4x*x5x*x6x*x6y - 416058912*x2y*x4x*x5x*x6y + 60434208*x2y*x4y^2*x5y*x6x + 849168*x2y*x4y^2*x5y - 120868416*x2y*x4y^2*x6x*x6y + 208029456*x2y*x4y^2*x6y - 120868416*x2y*x4y*x5y^2*x6x - 1698336*x2y*x4y*x5y^2 + 241736832*x2y*x4y*x5y*x6x*x6y - 416058912*x2y*x4y*x5y*x6y + 40070880*x3x*x3y^2*x4x^2 - 80141760*x3x*x3y^2*x4x*x5x + 40070880*x3x*x3y^2*x4y^2 - 80141760*x3x*x3y^2*x4y*x5y - 17132384*x3x*x3y*x4x^2*x4y + 82808640*x3x*x3y*x4x^2*x5y - 257933376*x3x*x3y*x4x^2*x6y + 34264768*x3x*x3y*x4x*x4y*x5x - 165617280*x3x*x3y*x4x*x5x*x5y + 515866752*x3x*x3y*x4x*x5x*x6y - 17132384*x3x*x3y*x4y^3 + 117073408*x3x*x3y*x4y^2*x5y - 257933376*x3x*x3y*x4y^2*x6y - 165617280*x3x*x3y*x4y*x5y^2 + 515866752*x3x*x3y*x4y*x5y*x6y + 92644992*x3x*x4x^2*x6x + 1332589224*x3x*x4x^2 - 185289984*x3x*x4x*x5x*x6x - 2665178448*x3x*x4x*x5x + 92644992*x3x*x4y^2*x6x + 1332589224*x3x*x4y^2 - 185289984*x3x*x4y*x5y*x6x - 2665178448*x3x*x4y*x5y - 80141760*x3y^3*x4x^2*x5y + 160283520*x3y^3*x4x^2*x6y + 160283520*x3y^3*x4x*x5x*x5y - 320567040*x3y^3*x4x*x5x*x6y - 80141760*x3y^3*x4y^2*x5y + 160283520*x3y^3*x4y^2*x6y + 160283520*x3y^3*x4y*x5y^2 - 320567040*x3y^3*x4y*x5y*x6y + 17132384*x3y^2*x4x^3 - 34264768*x3y^2*x4x^2*x5x + 92316096*x3y^2*x4x^2*x6x - 55869824*x3y^2*x4x^2 + 17132384*x3y^2*x4x*x4y^2 - 34264768*x3y^2*x4x*x4y*x5y - 184632192*x3y^2*x4x*x5x*x6x + 111739648*x3y^2*x4x*x5x + 92316096*x3y^2*x4y^2*x6x - 55869824*x3y^2*x4y^2 - 184632192*x3y^2*x4y*x5y*x6x + 111739648*x3y^2*x4y*x5y + 17132384*x3y*x4x^2*x4y - 131797728*x3y*x4x^2*x5y*x6x + 244074672*x3y*x4x^2*x5y + 263595456*x3y*x4x^2*x6x*x6y - 391649328*x3y*x4x^2*x6y - 34264768*x3y*x4x*x4y*x5x + 263595456*x3y*x4x*x5x*x5y*x6x - 488149344*x3y*x4x*x5x*x5y - 527190912*x3y*x4x*x5x*x6x*x6y + 783298656*x3y*x4x*x5x*x6y + 17132384*x3y*x4y^3 - 131797728*x3y*x4y^2*x5y*x6x + 209809904*x3y*x4y^2*x5y + 263595456*x3y*x4y^2*x6x*x6y - 391649328*x3y*x4y^2*x6y + 263595456*x3y*x4y*x5y^2*x6x - 488149344*x3y*x4y*x5y^2 - 527190912*x3y*x4y*x5y*x6x*x6y + 783298656*x3y*x4y*x5y*x6y - 17132384*x4x^3 + 34264768*x4x^2*x5x + 40927968*x4x^2*x5y*x6x*x6y - 93578400*x4x^2*x5y*x6y - 5622480*x4x^2*x6x^2 - 81855936*x4x^2*x6x*x6y^2 - 160942752*x4x^2*x6x + 187156800*x4x^2*x6y^2 - 2922183840*x4x^2 - 17132384*x4x*x4y^2 + 34264768*x4x*x4y*x5y - 81855936*x4x*x5x*x5y*x6x*x6y + 187156800*x4x*x5x*x5y*x6y + 11244960*x4x*x5x*x6x^2 + 163711872*x4x*x5x*x6x*x6y^2 + 321885504*x4x*x5x*x6x - 374313600*x4x*x5x*x6y^2 + 5844367680*x4x*x5x + 40927968*x4y^2*x5y*x6x*x6y - 93578400*x4y^2*x5y*x6y - 5622480*x4y^2*x6x^2 - 81855936*x4y^2*x6x*x6y^2 - 160942752*x4y^2*x6x + 187156800*x4y^2*x6y^2 - 2922183840*x4y^2 - 81855936*x4y*x5y^2*x6x*x6y + 187156800*x4y*x5y^2*x6y + 11244960*x4y*x5y*x6x^2 + 163711872*x4y*x5y*x6x*x6y^2 + 321885504*x4y*x5y*x6x - 374313600*x4y*x5y*x6y^2 + 5844367680*x4y*x5y = 0 := by
  linear_combination (norm := ring_nf) (-2838673408*x2x*x3y^2 + 40223520*x2x*x3y*x5y - 80447040*x2x*x3y*x6y - 281407392*x2x*x6x + 51372936*x2x + 2848254016*x2y*x3x*x3y + 120868416*x2y*x3x*x5y - 190883232*x2y*x3x*x6y - 19161216*x2y*x3y^2*x5y + 38322432*x2y*x3y^2*x6y - 50853600*x2y*x3y*x6x - 5733507536*x2y*x3y - 60434208*x2y*x5y*x6x - 849168*x2y*x5y + 120868416*x2y*x6x*x6y - 208029456*x2y*x6y - 40070880*x3x*x3y^2 + 17132384*x3x*x3y*x4y - 82808640*x3x*x3y*x5y + 257933376*x3x*x3y*x6y - 92644992*x3x*x6x - 1332589224*x3x + 80141760*x3y^3*x5y - 160283520*x3y^3*x6y - 17132384*x3y^2*x4x - 92316096*x3y^2*x6x + 55869824*x3y^2 - 17132384*x3y*x4y + 131797728*x3y*x5y*x6x - 244074672*x3y*x5y - 263595456*x3y*x6x*x6y + 391649328*x3y*x6y + 17132384*x4x - 40927968*x5y*x6x*x6y + 93578400*x5y*x6y + 5622480*x6x^2 + 81855936*x6x*x6y^2 + 160942752*x6x - 187156800*x6y^2 + 2922183840) * hp9

end EqualityCore
end Census554
end Problem97
