/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.RemovableVertexAxiom.PinnedSurplusGeneralM
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Bank

/-!
# Pinned-surplus row-zero consumer

This shard imports the generated row-zero bank only for the label-complete
`m = 5` dispatcher. The general-`m` reduction lives in
`PinnedSurplusGeneralM` so its proof loop does not rebuild the certificate
bank.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- In the label-complete `m = 5` regime, both pinned surplus-family
residuals are impossible.  This exact-cardinality entry point deliberately
does not mention the open general-`m` residual theorem, so exact-ten consumers
inherit only the checked geometry producer and row-zero bank. -/
theorem isM44PinnedSurplusResidualsExcluded_of_card_five
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    (S : SurplusCapPacket A) (hM44 : S.IsM44)
    (hsurplusCard : S.surplusCap.card = 5) :
    (∀ {radius : ℝ} {x : ℝ²},
      S.PinnedRightSurplusResidualAt radius x → False) ∧
    (∀ {radius : ℝ} {x : ℝ²},
      S.PinnedLeftSurplusResidualAt radius x → False) := by
  rcases isM44PinnedSurplusMetricShadowProducer A hne hconv hK4 hgt
      hMin S hM44 hsurplusCard with ⟨hright, hleft⟩
  constructor
  · intro radius x hpinned
    rcases hright hpinned with
      ⟨p₁, p₂, q₁, q₂, s1, s2, s3, centerClass, sstar,
        hvalid, hmetric⟩
    let pointOf :=
      SurplusCOMPGBank.rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
    have hin :
        SurplusCOMPGBank.shadowInBank
          (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass) =
            true :=
      pinnedSurplusCOMPGBankBridge sstar
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass)
        (by simpa [pointOf] using hvalid)
    exact
      SurplusCertificate.RelaxedSplit.Bank.RowZeros.false_of_shadowInBank_of_metricShadow
        (pointOf := pointOf) (centerClass := centerClass)
        hin (by simpa [pointOf] using hmetric)
  · intro radius x hpinned
    rcases hleft hpinned with
      ⟨p₁, p₂, q₁, q₂, s1, s2, s3, centerClass, sstar,
        hvalid, hmetric⟩
    let pointOf :=
      SurplusCOMPGBank.leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
    have hin :
        SurplusCOMPGBank.shadowInBank
          (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass) =
            true :=
      pinnedSurplusCOMPGBankBridge sstar
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass)
        (by simpa [pointOf] using hvalid)
    exact
      SurplusCertificate.RelaxedSplit.Bank.RowZeros.false_of_shadowInBank_of_metricShadow
        (pointOf := pointOf) (centerClass := centerClass)
        hin (by simpa [pointOf] using hmetric)

/-- Pinned surplus-family residuals are impossible in the `IsM44` branch.  The
certificate/row-zero contradiction closes the label-complete `m = 5` regime;
the larger regime is delegated to the explicitly named general-`m` residual. -/
theorem isM44PinnedSurplusResidualsExcluded :
      IsM44PinnedSurplusResidualsExcludedStatement := by
  intro hbridge A hne hconv hK4 hgt hMin S hM44
  by_cases hsurplusCard : S.surplusCap.card = 5
  · exact isM44PinnedSurplusResidualsExcluded_of_card_five hne hconv hK4
      hgt hMin S hM44 hsurplusCard
  · apply isM44PinnedSurplusGeneralMResidualsExcluded A hne hconv hK4 hgt
      hMin S hM44
    have hsurplusCardGe : 5 ≤ S.surplusCap.card :=
      hM44.surplus_card_ge_five
    omega


end Problem97
