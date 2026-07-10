/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.RemovableVertexAxiom.PinnedSurplusProducer
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Bank

/-!
# Pinned-surplus row-zero consumer

This shard keeps the generated row-zero bank import out of producer-side edit
loops.  It should be built only when validating the certificate handoff from the
metric-shadow producer.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- General-`m` pinned-surplus residuals are the remaining branch after the
label-complete `m = 5` row-zero handoff.  The exact ten-label bank does not
claim this regime. -/
theorem isM44PinnedSurplusGeneralMResidualsExcluded :
      IsM44PinnedSurplusGeneralMResidualsExcludedStatement := by
  sorry

/-- Pinned surplus-family residuals are impossible in the `IsM44` branch.  The
certificate/row-zero contradiction closes the label-complete `m = 5` regime;
the larger regime is delegated to the explicitly named general-`m` residual. -/
theorem isM44PinnedSurplusResidualsExcluded :
      IsM44PinnedSurplusResidualsExcludedStatement := by
  intro hbridge A hne hconv hK4 hgt hMin S hM44
  by_cases hsurplusCard : S.surplusCap.card = 5
  · rcases isM44PinnedSurplusMetricShadowProducer A hne hconv hK4 hgt
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
        hbridge sstar
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
        hbridge sstar
          (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass)
          (by simpa [pointOf] using hvalid)
      exact
        SurplusCertificate.RelaxedSplit.Bank.RowZeros.false_of_shadowInBank_of_metricShadow
          (pointOf := pointOf) (centerClass := centerClass)
          hin (by simpa [pointOf] using hmetric)
  · apply isM44PinnedSurplusGeneralMResidualsExcluded A hne hconv hK4 hgt
      hMin S hM44
    have hsurplusCardGe : 5 ≤ S.surplusCap.card :=
      hM44.surplus_card_ge_five
    omega


end Problem97
