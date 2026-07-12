/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Erdos9796Proof.P97.RemovableVertexAxiom.Base

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
-/

open scoped EuclideanGeometry

namespace Problem97

/-- Right remainder-dependent count row `(0,0,1,3)` residual obligation. -/
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
  sorry

/-- Right remainder-dependent count row `(0,0,0,4)` residual obligation. -/
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
  sorry

/-- Right remainder-dependent count row `(0,1,1,2)` residual obligation. -/
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
  sorry

/-- Right remainder-dependent count row `(0,1,0,3)` residual obligation. -/
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
  sorry

/-- Right remainder-dependent count row `(1,0,1,2)` residual obligation. -/
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
  sorry

/-- Right remainder-dependent count row `(1,0,0,3)` residual obligation. -/
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
  sorry

/-- Right remainder-dependent count row `(1,1,1,1)` residual obligation. -/
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
  sorry

/-- Right remainder-dependent count row `(1,1,0,2)` residual obligation. -/
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
  sorry

/-- Right remainder-dependent count row `(2,0,0,2)` residual obligation. -/
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
  sorry

/-- Right terminal row `(2,1,0,1)` one-sided payload residual obligation. -/
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
  sorry

/-- Left remainder-dependent count row `(0,0,3,1)` residual obligation. -/
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
  sorry

/-- Left remainder-dependent count row `(0,0,4,0)` residual obligation. -/
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
  sorry

/-- Left remainder-dependent count row `(0,1,2,1)` residual obligation. -/
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
  sorry

/-- Left remainder-dependent count row `(0,1,3,0)` residual obligation. -/
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
  sorry

/-- Left remainder-dependent count row `(1,0,2,1)` residual obligation. -/
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
  sorry

/-- Left remainder-dependent count row `(1,0,3,0)` residual obligation. -/
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
  sorry

/-- Left remainder-dependent count row `(1,1,1,1)` residual obligation. -/
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
  sorry

/-- Left remainder-dependent count row `(1,1,2,0)` residual obligation. -/
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
  sorry

/-- Left remainder-dependent count row `(2,0,2,0)` residual obligation. -/
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
  sorry

/-- Left terminal row `(2,1,1,0)` one-sided payload residual obligation. -/
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
  sorry

end Problem97
