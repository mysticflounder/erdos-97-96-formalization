/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Erdos9796Proof.P97.ErasedCertificate.CardTenProducer
import Erdos9796Proof.P97.ErasedCertificate.P2Closure

/-!
# Erased-pin remainder-dependent per-row residual obligations

The 2026-07-12 redraft of
`IsM44NonSurplusContainmentErasedPinTripleRoutedSeedFiniteResidualRowsFactsStatement`
replaced the positively-asserted `OneSidedSeedCandidateRemainder` scaffold
fields (zero producers tree-wide; refutable in the real configuration for any
`p` realizing the pure surplus-side rows — see
`docs/audits/2026-07-11-erase-p2-remainder-blocker-audit.md`) with direct
per-row `→ False` obligations.  This module carries those twenty obligations
as named residual theorems: nine remainder-dependent count rows plus the
terminal one-sided payload exclusion per non-surplus side.

Every theorem takes the FULL statement hypothesis surface — in particular
`HasNEquidistantProperty 4 A` and minimality.  The stored exact-rational
row-truth witnesses (`scratch/erased-pin-row-truth/STATE.md`) satisfy
`ConvexIndep`, `IsM44`, the exact row counts, and all five ambient residual
inputs, so any statement of these obligations over a smaller local surface is
false; `hK4` and `hMin` are load-bearing and must not be dropped.

Ambient `hK4`, `hconv`, and `hM44` force `A.card ∈ {10, 11}`, so each
obligation is a finite-configuration statement consumable by a card-{10,11}
classifier lane (matrix rows ERASE-P3-MAP / ERASE-P3-SWEEP).

All twenty public row theorems now split on the surplus-cap cardinality.  Their
card-10 branches are discharged in `ErasedCertificate.CardTenProducer`; their
card-11 branches are discharged by the P2 native certificate and closure
pipeline in `ErasedCertificate.P2Closure`.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- Common card-eleven closure for a right-oriented exact count row. -/
private theorem false_of_rightCountRow_cardEleven
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcardGt : 5 < S.surplusCap.card)
    {x p : ℝ²} {m s l r : Nat}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x)
    (hm : S.moserCount p (dist p x) = m)
    (hs : S.sameCapCount S.oppIndex1 p (dist p x) = s)
    (hl : S.leftAdjCount S.oppIndex1 p (dist p x) = l)
    (hr : S.rightAdjCount S.oppIndex1 p (dist p x) = r)
    (hsum : m + s + l + r = 4) : False := by
  have hcard6 :=
    CapSelectedRowCounting.SurplusCapPacket.surplus_card_eq_six_of_convexIndep_K4
      S hconv hK4 hM44 hcardGt
  exact ErasedCertificate.false_of_rightCountRow_of_cardEleven
    hne hconv hK4 hM44 hcard6 hMin hx hp
    (Finset.mem_of_mem_erase hpErase) hm hs hl hr hsum

/-- Common card-eleven closure for a left-oriented exact count row. -/
private theorem false_of_leftCountRow_cardEleven
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcardGt : 5 < S.surplusCap.card)
    {x p : ℝ²} {m s l r : Nat}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x)
    (hm : S.moserCount p (dist p x) = m)
    (hs : S.sameCapCount S.oppIndex2 p (dist p x) = s)
    (hl : S.leftAdjCount S.oppIndex2 p (dist p x) = l)
    (hr : S.rightAdjCount S.oppIndex2 p (dist p x) = r)
    (hsum : m + s + l + r = 4) : False := by
  have hcard6 :=
    CapSelectedRowCounting.SurplusCapPacket.surplus_card_eq_six_of_convexIndep_K4
      S hconv hK4 hM44 hcardGt
  exact ErasedCertificate.false_of_leftCountRow_of_cardEleven
    hne hconv hK4 hM44 hcard6 hMin hx hp
    (Finset.mem_of_mem_erase hpErase) hm hs hl hr hsum

/-- Card-eleven right count-row `(0,0,1,3)` closure. -/
theorem right_row0013_cardEleven_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard6 : 5 < S.surplusCap.card)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x) :
    RightNonSurplusExactCountRowExcluded S x p 0 0 1 3 := by
  intro hm hs hl hr
  exact false_of_rightCountRow_cardEleven
    hne hconv hK4 hMin hM44 hcard6 hx hp hpErase hm hs hl hr (by omega)

/-- Right count row `(0,0,1,3)`, split between the card-five fixed-seed
producer and the named card-eleven classifier residual. -/
theorem right_row0013_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x) :
    RightNonSurplusExactCountRowExcluded S x p 0 0 1 3 := by
  by_cases hcard5 : S.surplusCap.card = 5
  · exact ErasedCertificate.false_of_rightNonSurplusRow0013_of_cardFive
      hne hconv hK4 hM44 hcontain hcard5 hx hp
  · have hcard6 : 5 < S.surplusCap.card := by
      have hge5 := hM44.surplus_card_ge_five
      omega
    exact right_row0013_cardEleven_residual_excluded
      hne hconv hK4 hgt hMin hM44 hend1 hend2 hpin1 hpin2 hcontain
      hcard6 hx hp hpErase

/-- Card-eleven right count-row `(0,0,0,4)` closure. -/
theorem right_row0004_cardEleven_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard6 : 5 < S.surplusCap.card)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x) :
    RightNonSurplusExactCountRowExcluded S x p 0 0 0 4 := by
  intro hm hs hl hr
  exact false_of_rightCountRow_cardEleven
    hne hconv hK4 hMin hM44 hcard6 hx hp hpErase hm hs hl hr (by omega)

/-- Right count row `(0,0,0,4)`, split between the card-five cardinality
contradiction and the named card-eleven classifier residual. -/
theorem right_row0004_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x) :
    RightNonSurplusExactCountRowExcluded S x p 0 0 0 4 := by
  by_cases hcard5 : S.surplusCap.card = 5
  · exact ErasedCertificate.false_of_rightNonSurplusRow0004_of_cardFive
      S hcard5 hx hp
  · have hcard6 : 5 < S.surplusCap.card := by
      have hge5 := hM44.surplus_card_ge_five
      omega
    exact right_row0004_cardEleven_residual_excluded
      hne hconv hK4 hgt hMin hM44 hend1 hend2 hpin1 hpin2 hcontain
      hcard6 hx hp hpErase

/-- Card-eleven right count-row `(0,1,1,2)` closure. -/
theorem right_row0112_cardEleven_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard6 : 5 < S.surplusCap.card)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x) :
    RightNonSurplusExactCountRowExcluded S x p 0 1 1 2 := by
  intro hm hs hl hr
  exact false_of_rightCountRow_cardEleven
    hne hconv hK4 hMin hM44 hcard6 hx hp hpErase hm hs hl hr (by omega)

/-- Right count row `(0,1,1,2)`, split between its card-five fixed-seed
producer and the named card-eleven residual. -/
theorem right_row0112_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x) :
    RightNonSurplusExactCountRowExcluded S x p 0 1 1 2 := by
  by_cases hcard5 : S.surplusCap.card = 5
  · exact ErasedCertificate.false_of_rightNonSurplusRow0112_of_cardFive
      hne hconv hK4 hM44 hcontain hcard5 hx hp
  · have hcard6 : 5 < S.surplusCap.card := by
      have hge5 := hM44.surplus_card_ge_five
      omega
    exact right_row0112_cardEleven_residual_excluded
      hne hconv hK4 hgt hMin hM44 hend1 hend2 hpin1 hpin2 hcontain
      hcard6 hx hp hpErase

/-- Card-eleven right count-row `(0,1,0,3)` closure. -/
theorem right_row0103_cardEleven_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard6 : 5 < S.surplusCap.card)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x) :
    RightNonSurplusExactCountRowExcluded S x p 0 1 0 3 := by
  intro hm hs hl hr
  exact false_of_rightCountRow_cardEleven
    hne hconv hK4 hMin hM44 hcard6 hx hp hpErase hm hs hl hr (by omega)

/-- Right count row `(0,1,0,3)`, split between its card-five fixed-seed
producer and the named card-eleven residual. -/
theorem right_row0103_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x) :
    RightNonSurplusExactCountRowExcluded S x p 0 1 0 3 := by
  by_cases hcard5 : S.surplusCap.card = 5
  · exact ErasedCertificate.false_of_rightNonSurplusRow0103_of_cardFive
      hne hconv hK4 hM44 hcontain hcard5 hx hp
  · have hcard6 : 5 < S.surplusCap.card := by
      have hge5 := hM44.surplus_card_ge_five
      omega
    exact right_row0103_cardEleven_residual_excluded
      hne hconv hK4 hgt hMin hM44 hend1 hend2 hpin1 hpin2 hcontain
      hcard6 hx hp hpErase

/-- Card-eleven right count-row `(1,0,1,2)` closure. -/
theorem right_row1012_cardEleven_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard6 : 5 < S.surplusCap.card)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x) :
    RightNonSurplusExactCountRowExcluded S x p 1 0 1 2 := by
  intro hm hs hl hr
  exact false_of_rightCountRow_cardEleven
    hne hconv hK4 hMin hM44 hcard6 hx hp hpErase hm hs hl hr (by omega)

/-- Right count row `(1,0,1,2)`, split between its card-five fixed-seed
producer and the named card-eleven residual. -/
theorem right_row1012_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x) :
    RightNonSurplusExactCountRowExcluded S x p 1 0 1 2 := by
  by_cases hcard5 : S.surplusCap.card = 5
  · exact ErasedCertificate.false_of_rightNonSurplusRow1012_of_cardFive
      hne hconv hK4 hM44 hcontain hcard5 hx hp
  · have hcard6 : 5 < S.surplusCap.card := by
      have hge5 := hM44.surplus_card_ge_five
      omega
    exact right_row1012_cardEleven_residual_excluded
      hne hconv hK4 hgt hMin hM44 hend1 hend2 hpin1 hpin2 hcontain
      hcard6 hx hp hpErase

/-- Card-eleven right count-row `(1,0,0,3)` closure. -/
theorem right_row1003_cardEleven_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard6 : 5 < S.surplusCap.card)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x) :
    RightNonSurplusExactCountRowExcluded S x p 1 0 0 3 := by
  intro hm hs hl hr
  exact false_of_rightCountRow_cardEleven
    hne hconv hK4 hMin hM44 hcard6 hx hp hpErase hm hs hl hr (by omega)

/-- Right count row `(1,0,0,3)`, split between its card-five fixed-seed
producer and the named card-eleven residual. -/
theorem right_row1003_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x) :
    RightNonSurplusExactCountRowExcluded S x p 1 0 0 3 := by
  by_cases hcard5 : S.surplusCap.card = 5
  · exact ErasedCertificate.false_of_rightNonSurplusRow1003_of_cardFive
      hne hconv hK4 hM44 hcontain hcard5 hx hp
  · have hcard6 : 5 < S.surplusCap.card := by
      have hge5 := hM44.surplus_card_ge_five
      omega
    exact right_row1003_cardEleven_residual_excluded
      hne hconv hK4 hgt hMin hM44 hend1 hend2 hpin1 hpin2 hcontain
      hcard6 hx hp hpErase

/-- Card-eleven right count-row `(1,1,1,1)` closure. -/
theorem right_row1111_cardEleven_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard6 : 5 < S.surplusCap.card)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x) :
    RightNonSurplusExactCountRowExcluded S x p 1 1 1 1 := by
  intro hm hs hl hr
  exact false_of_rightCountRow_cardEleven
    hne hconv hK4 hMin hM44 hcard6 hx hp hpErase hm hs hl hr (by omega)

/-- Right count row `(1,1,1,1)`, split between its card-five fixed-seed
producer and the named card-eleven residual. -/
theorem right_row1111_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x) :
    RightNonSurplusExactCountRowExcluded S x p 1 1 1 1 := by
  by_cases hcard5 : S.surplusCap.card = 5
  · exact ErasedCertificate.false_of_rightNonSurplusRow1111_of_cardFive
      hne hconv hK4 hM44 hcontain hcard5 hx hp
  · have hcard6 : 5 < S.surplusCap.card := by
      have hge5 := hM44.surplus_card_ge_five
      omega
    exact right_row1111_cardEleven_residual_excluded
      hne hconv hK4 hgt hMin hM44 hend1 hend2 hpin1 hpin2 hcontain
      hcard6 hx hp hpErase

/-- Card-eleven right count-row `(1,1,0,2)` closure. -/
theorem right_row1102_cardEleven_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard6 : 5 < S.surplusCap.card)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x) :
    RightNonSurplusExactCountRowExcluded S x p 1 1 0 2 := by
  intro hm hs hl hr
  exact false_of_rightCountRow_cardEleven
    hne hconv hK4 hMin hM44 hcard6 hx hp hpErase hm hs hl hr (by omega)

/-- Right count row `(1,1,0,2)`, split between its card-five fixed-seed
producer and the named card-eleven residual. -/
theorem right_row1102_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x) :
    RightNonSurplusExactCountRowExcluded S x p 1 1 0 2 := by
  by_cases hcard5 : S.surplusCap.card = 5
  · exact ErasedCertificate.false_of_rightNonSurplusRow1102_of_cardFive
      hne hconv hK4 hM44 hcontain hcard5 hx hp
  · have hcard6 : 5 < S.surplusCap.card := by
      have hge5 := hM44.surplus_card_ge_five
      omega
    exact right_row1102_cardEleven_residual_excluded
      hne hconv hK4 hgt hMin hM44 hend1 hend2 hpin1 hpin2 hcontain
      hcard6 hx hp hpErase

/-- Card-eleven right count-row `(2,0,0,2)` closure. -/
theorem right_row2002_cardEleven_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard6 : 5 < S.surplusCap.card)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x) :
    RightNonSurplusExactCountRowExcluded S x p 2 0 0 2 := by
  intro hm hs hl hr
  exact false_of_rightCountRow_cardEleven
    hne hconv hK4 hMin hM44 hcard6 hx hp hpErase hm hs hl hr (by omega)

/-- Right count row `(2,0,0,2)`, split between its card-five fixed-seed
producer and the named card-eleven residual. -/
theorem right_row2002_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x) :
    RightNonSurplusExactCountRowExcluded S x p 2 0 0 2 := by
  by_cases hcard5 : S.surplusCap.card = 5
  · exact ErasedCertificate.false_of_rightNonSurplusRow2002_of_cardFive
      hne hconv hK4 hM44 hcontain hcard5 hx hp
  · have hcard6 : 5 < S.surplusCap.card := by
      have hge5 := hM44.surplus_card_ge_five
      omega
    exact right_row2002_cardEleven_residual_excluded
      hne hconv hK4 hgt hMin hM44 hend1 hend2 hpin1 hpin2 hcontain
      hcard6 hx hp hpErase

/-- Card-eleven right terminal payload closure.  The card-ten arm
is discharged by `ErasedCertificate.false_of_rightOneSidedErasedPayload_of_cardFive`;
the card-eleven arm uses `ErasedCertificate.P2Closure`. -/
theorem right_terminal2101_payload_cardEleven_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard6 : 5 < S.surplusCap.card)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x) :
    RightNonSurplusOneSidedTerminalPayloadExcluded S x p := by
  intro hpayload
  exact false_of_rightCountRow_cardEleven
    hne hconv hK4 hMin hM44 hcard6 hx hp hpErase
    (S.rightOneSidedErasedPayload_moserCount_eq_two hpayload)
    (S.rightOneSidedErasedPayload_sameCapCount_eq_one hpayload)
    (S.rightOneSidedErasedPayload_leftAdjCount_eq_zero hpayload)
    (S.rightOneSidedErasedPayload_rightAdjCount_eq_one hpayload) (by omega)

/-- Right terminal row `(2,1,0,1)` one-sided payload exclusion, split into
the proved card-ten bank arm and the named card-eleven classifier residual. -/
theorem right_terminal2101_payload_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x) :
    RightNonSurplusOneSidedTerminalPayloadExcluded S x p := by
  by_cases hcard5 : S.surplusCap.card = 5
  · intro hpayload
    exact ErasedCertificate.false_of_rightOneSidedErasedPayload_of_cardFive
      hne hconv hK4 hM44 hcontain hcard5 hp hx hpayload
  · have hcard6 : 5 < S.surplusCap.card := by
      have hge5 := hM44.surplus_card_ge_five
      omega
    exact right_terminal2101_payload_cardEleven_residual_excluded
      hne hconv hK4 hgt hMin hM44 hend1 hend2 hpin1 hpin2 hcontain
      hcard6 hx hp hpErase

/-- Card-eleven left count-row `(0,0,3,1)` closure. -/
theorem left_row0031_cardEleven_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard6 : 5 < S.surplusCap.card)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x) :
    LeftNonSurplusExactCountRowExcluded S x p 0 0 3 1 := by
  intro hm hs hl hr
  exact false_of_leftCountRow_cardEleven
    hne hconv hK4 hMin hM44 hcard6 hx hp hpErase hm hs hl hr (by omega)

/-- Left count row `(0,0,3,1)`, split between the card-five fixed-seed
producer and the named card-eleven classifier residual. -/
theorem left_row0031_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x) :
    LeftNonSurplusExactCountRowExcluded S x p 0 0 3 1 := by
  by_cases hcard5 : S.surplusCap.card = 5
  · exact ErasedCertificate.false_of_leftNonSurplusRow0031_of_cardFive
      hne hconv hK4 hM44 hcontain hcard5 hx hp
  · have hcard6 : 5 < S.surplusCap.card := by
      have hge5 := hM44.surplus_card_ge_five
      omega
    exact left_row0031_cardEleven_residual_excluded
      hne hconv hK4 hgt hMin hM44 hend1 hend2 hpin1 hpin2 hcontain
      hcard6 hx hp hpErase

/-- Card-eleven left count-row `(0,0,4,0)` closure. -/
theorem left_row0040_cardEleven_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard6 : 5 < S.surplusCap.card)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x) :
    LeftNonSurplusExactCountRowExcluded S x p 0 0 4 0 := by
  intro hm hs hl hr
  exact false_of_leftCountRow_cardEleven
    hne hconv hK4 hMin hM44 hcard6 hx hp hpErase hm hs hl hr (by omega)

/-- Left count row `(0,0,4,0)`, split between the card-five cardinality
contradiction and the named card-eleven classifier residual. -/
theorem left_row0040_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x) :
    LeftNonSurplusExactCountRowExcluded S x p 0 0 4 0 := by
  by_cases hcard5 : S.surplusCap.card = 5
  · exact ErasedCertificate.false_of_leftNonSurplusRow0040_of_cardFive
      S hcard5 hx hp
  · have hcard6 : 5 < S.surplusCap.card := by
      have hge5 := hM44.surplus_card_ge_five
      omega
    exact left_row0040_cardEleven_residual_excluded
      hne hconv hK4 hgt hMin hM44 hend1 hend2 hpin1 hpin2 hcontain
      hcard6 hx hp hpErase

/-- Card-eleven left count-row `(0,1,2,1)` closure. -/
theorem left_row0121_cardEleven_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard6 : 5 < S.surplusCap.card)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x) :
    LeftNonSurplusExactCountRowExcluded S x p 0 1 2 1 := by
  intro hm hs hl hr
  exact false_of_leftCountRow_cardEleven
    hne hconv hK4 hMin hM44 hcard6 hx hp hpErase hm hs hl hr (by omega)

/-- Left count row `(0,1,2,1)`, split between its card-five fixed-seed
producer and the named card-eleven residual. -/
theorem left_row0121_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x) :
    LeftNonSurplusExactCountRowExcluded S x p 0 1 2 1 := by
  by_cases hcard5 : S.surplusCap.card = 5
  · exact ErasedCertificate.false_of_leftNonSurplusRow0121_of_cardFive
      hne hconv hK4 hM44 hcontain hcard5 hx hp
  · have hcard6 : 5 < S.surplusCap.card := by
      have hge5 := hM44.surplus_card_ge_five
      omega
    exact left_row0121_cardEleven_residual_excluded
      hne hconv hK4 hgt hMin hM44 hend1 hend2 hpin1 hpin2 hcontain
      hcard6 hx hp hpErase

/-- Card-eleven left count-row `(0,1,3,0)` closure. -/
theorem left_row0130_cardEleven_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard6 : 5 < S.surplusCap.card)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x) :
    LeftNonSurplusExactCountRowExcluded S x p 0 1 3 0 := by
  intro hm hs hl hr
  exact false_of_leftCountRow_cardEleven
    hne hconv hK4 hMin hM44 hcard6 hx hp hpErase hm hs hl hr (by omega)

/-- Left count row `(0,1,3,0)`, split between its card-five fixed-seed
producer and the named card-eleven residual. -/
theorem left_row0130_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x) :
    LeftNonSurplusExactCountRowExcluded S x p 0 1 3 0 := by
  by_cases hcard5 : S.surplusCap.card = 5
  · exact ErasedCertificate.false_of_leftNonSurplusRow0130_of_cardFive
      hne hconv hK4 hM44 hcontain hcard5 hx hp
  · have hcard6 : 5 < S.surplusCap.card := by
      have hge5 := hM44.surplus_card_ge_five
      omega
    exact left_row0130_cardEleven_residual_excluded
      hne hconv hK4 hgt hMin hM44 hend1 hend2 hpin1 hpin2 hcontain
      hcard6 hx hp hpErase

/-- Card-eleven left count-row `(1,0,2,1)` closure. -/
theorem left_row1021_cardEleven_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard6 : 5 < S.surplusCap.card)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x) :
    LeftNonSurplusExactCountRowExcluded S x p 1 0 2 1 := by
  intro hm hs hl hr
  exact false_of_leftCountRow_cardEleven
    hne hconv hK4 hMin hM44 hcard6 hx hp hpErase hm hs hl hr (by omega)

/-- Left count row `(1,0,2,1)`, split between its card-five fixed-seed
producer and the named card-eleven residual. -/
theorem left_row1021_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x) :
    LeftNonSurplusExactCountRowExcluded S x p 1 0 2 1 := by
  by_cases hcard5 : S.surplusCap.card = 5
  · exact ErasedCertificate.false_of_leftNonSurplusRow1021_of_cardFive
      hne hconv hK4 hM44 hcontain hcard5 hx hp
  · have hcard6 : 5 < S.surplusCap.card := by
      have hge5 := hM44.surplus_card_ge_five
      omega
    exact left_row1021_cardEleven_residual_excluded
      hne hconv hK4 hgt hMin hM44 hend1 hend2 hpin1 hpin2 hcontain
      hcard6 hx hp hpErase

/-- Card-eleven left count-row `(1,0,3,0)` closure. -/
theorem left_row1030_cardEleven_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard6 : 5 < S.surplusCap.card)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x) :
    LeftNonSurplusExactCountRowExcluded S x p 1 0 3 0 := by
  intro hm hs hl hr
  exact false_of_leftCountRow_cardEleven
    hne hconv hK4 hMin hM44 hcard6 hx hp hpErase hm hs hl hr (by omega)

/-- Left count row `(1,0,3,0)`, split between its card-five fixed-seed
producer and the named card-eleven residual. -/
theorem left_row1030_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x) :
    LeftNonSurplusExactCountRowExcluded S x p 1 0 3 0 := by
  by_cases hcard5 : S.surplusCap.card = 5
  · exact ErasedCertificate.false_of_leftNonSurplusRow1030_of_cardFive
      hne hconv hK4 hM44 hcontain hcard5 hx hp
  · have hcard6 : 5 < S.surplusCap.card := by
      have hge5 := hM44.surplus_card_ge_five
      omega
    exact left_row1030_cardEleven_residual_excluded
      hne hconv hK4 hgt hMin hM44 hend1 hend2 hpin1 hpin2 hcontain
      hcard6 hx hp hpErase

/-- Card-eleven left count-row `(1,1,1,1)` closure. -/
theorem left_row1111_cardEleven_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard6 : 5 < S.surplusCap.card)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x) :
    LeftNonSurplusExactCountRowExcluded S x p 1 1 1 1 := by
  intro hm hs hl hr
  exact false_of_leftCountRow_cardEleven
    hne hconv hK4 hMin hM44 hcard6 hx hp hpErase hm hs hl hr (by omega)

/-- Left count row `(1,1,1,1)`, split between its card-five fixed-seed
producer and the named card-eleven residual. -/
theorem left_row1111_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x) :
    LeftNonSurplusExactCountRowExcluded S x p 1 1 1 1 := by
  by_cases hcard5 : S.surplusCap.card = 5
  · exact ErasedCertificate.false_of_leftNonSurplusRow1111_of_cardFive
      hne hconv hK4 hM44 hcontain hcard5 hx hp
  · have hcard6 : 5 < S.surplusCap.card := by
      have hge5 := hM44.surplus_card_ge_five
      omega
    exact left_row1111_cardEleven_residual_excluded
      hne hconv hK4 hgt hMin hM44 hend1 hend2 hpin1 hpin2 hcontain
      hcard6 hx hp hpErase

/-- Card-eleven left count-row `(1,1,2,0)` closure. -/
theorem left_row1120_cardEleven_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard6 : 5 < S.surplusCap.card)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x) :
    LeftNonSurplusExactCountRowExcluded S x p 1 1 2 0 := by
  intro hm hs hl hr
  exact false_of_leftCountRow_cardEleven
    hne hconv hK4 hMin hM44 hcard6 hx hp hpErase hm hs hl hr (by omega)

/-- Left count row `(1,1,2,0)`, split between its card-five fixed-seed
producer and the named card-eleven residual. -/
theorem left_row1120_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x) :
    LeftNonSurplusExactCountRowExcluded S x p 1 1 2 0 := by
  by_cases hcard5 : S.surplusCap.card = 5
  · exact ErasedCertificate.false_of_leftNonSurplusRow1120_of_cardFive
      hne hconv hK4 hM44 hcontain hcard5 hx hp
  · have hcard6 : 5 < S.surplusCap.card := by
      have hge5 := hM44.surplus_card_ge_five
      omega
    exact left_row1120_cardEleven_residual_excluded
      hne hconv hK4 hgt hMin hM44 hend1 hend2 hpin1 hpin2 hcontain
      hcard6 hx hp hpErase

/-- Card-eleven left count-row `(2,0,2,0)` closure. -/
theorem left_row2020_cardEleven_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard6 : 5 < S.surplusCap.card)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x) :
    LeftNonSurplusExactCountRowExcluded S x p 2 0 2 0 := by
  intro hm hs hl hr
  exact false_of_leftCountRow_cardEleven
    hne hconv hK4 hMin hM44 hcard6 hx hp hpErase hm hs hl hr (by omega)

/-- Left count row `(2,0,2,0)`, split between its card-five fixed-seed
producer and the named card-eleven residual. -/
theorem left_row2020_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x) :
    LeftNonSurplusExactCountRowExcluded S x p 2 0 2 0 := by
  by_cases hcard5 : S.surplusCap.card = 5
  · exact ErasedCertificate.false_of_leftNonSurplusRow2020_of_cardFive
      hne hconv hK4 hM44 hcontain hcard5 hx hp
  · have hcard6 : 5 < S.surplusCap.card := by
      have hge5 := hM44.surplus_card_ge_five
      omega
    exact left_row2020_cardEleven_residual_excluded
      hne hconv hK4 hgt hMin hM44 hend1 hend2 hpin1 hpin2 hcontain
      hcard6 hx hp hpErase

/-- Card-eleven left terminal payload closure.  The card-ten arm
is discharged by `ErasedCertificate.false_of_leftOneSidedErasedPayload_of_cardFive`;
the card-eleven arm uses `ErasedCertificate.P2Closure`. -/
theorem left_terminal2110_payload_cardEleven_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard6 : 5 < S.surplusCap.card)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x) :
    LeftNonSurplusOneSidedTerminalPayloadExcluded S x p := by
  intro hpayload
  exact false_of_leftCountRow_cardEleven
    hne hconv hK4 hMin hM44 hcard6 hx hp hpErase
    (S.leftOneSidedErasedPayload_moserCount_eq_two hpayload)
    (S.leftOneSidedErasedPayload_sameCapCount_eq_one hpayload)
    (S.leftOneSidedErasedPayload_leftAdjCount_eq_one hpayload)
    (S.leftOneSidedErasedPayload_rightAdjCount_eq_zero hpayload) (by omega)

/-- Left terminal row `(2,1,1,0)` one-sided payload exclusion, split into
the proved card-ten bank arm and the named card-eleven classifier residual. -/
theorem left_terminal2110_payload_residual_excluded
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hpin1 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False)
    (hpin2 : ∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x) :
    LeftNonSurplusOneSidedTerminalPayloadExcluded S x p := by
  by_cases hcard5 : S.surplusCap.card = 5
  · intro hpayload
    exact ErasedCertificate.false_of_leftOneSidedErasedPayload_of_cardFive
      hne hconv hK4 hM44 hcontain hcard5 hp hx hpayload
  · have hcard6 : 5 < S.surplusCap.card := by
      have hge5 := hM44.surplus_card_ge_five
      omega
    exact left_terminal2110_payload_cardEleven_residual_excluded
      hne hconv hK4 hgt hMin hM44 hend1 hend2 hpin1 hpin2 hcontain
      hcard6 hx hp hpErase

end Problem97
