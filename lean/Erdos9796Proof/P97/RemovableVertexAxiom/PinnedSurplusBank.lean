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

/-- Pinned surplus-family residuals are impossible in the `IsM44` branch.  The
  certificate/row-zero contradiction is closed here; the remaining geometric
  work is the named metric-shadow producer above. -/
theorem isM44PinnedSurplusResidualsExcluded :
      IsM44PinnedSurplusResidualsExcludedStatement := by
  intro hbridge A hne hconv hK4 hgt hMin S hM44
  rcases isM44PinnedSurplusMetricShadowProducer A hne hconv hK4 hgt
      hMin S hM44 with ⟨hright, hleft⟩
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


end Problem97
