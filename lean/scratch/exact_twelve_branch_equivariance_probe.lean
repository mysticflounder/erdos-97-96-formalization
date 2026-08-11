import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PlacementOrbits
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PhysicalCycleIngress

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate

def reindexBlocker (relabeling : Label ≃ Label)
    (blocker : Fin 5 → Label) : Fin 5 → Label :=
  fun i => relabeling (blocker i)

theorem FrozenNamedDeletionSixArm.reindex
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (relabeling : Label ≃ Label)
    (hadmissible : AdmissibleFrozenRelabeling relabeling)
    (harm : FrozenNamedDeletionSixArm row blocker) :
    FrozenNamedDeletionSixArm (reindexRowPattern relabeling row)
      (reindexBlocker relabeling blocker) := by
  have htwo := hadmissible.1 2 (by decide)
  have hten := hadmissible.1 10 (by decide)
  have heleven := hadmissible.1 11 (by decide)
  simpa [FrozenNamedDeletionSixArm, reindexBlocker, htwo, hten, heleven]
    using harm

theorem FrozenDistinguishedDCommonMissing.reindex
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (relabeling : Label ≃ Label)
    (hadmissible : AdmissibleFrozenRelabeling relabeling)
    (hd : FrozenDistinguishedDCommonMissing row blocker) :
    FrozenDistinguishedDCommonMissing (reindexRowPattern relabeling row)
      (reindexBlocker relabeling blocker) := by
  have hone := hadmissible.1 1 (by decide)
  have hsix := hadmissible.1 6 (by decide)
  have hseven := hadmissible.1 7 (by decide)
  have hnine := hadmissible.1 9 (by decide)
  rcases hd with ⟨d, hd1, hd7, hsevenRow, hnineRow, hblocker, hmissing⟩
  refine ⟨relabeling d, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · simpa [hone] using hd1
  · simpa [hseven] using hd7
  · simpa [hseven] using hsevenRow
  · simpa [hnine] using hnineRow
  · exact relabeling.injective.ne hblocker
  · simpa [hone, hsix, hseven] using hmissing

theorem FrozenDistinguishedDCommonMissingAwayFromEight.reindex
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (relabeling : Label ≃ Label)
    (hadmissible : AdmissibleFrozenRelabeling relabeling)
    (hd : FrozenDistinguishedDCommonMissingAwayFromEight row blocker) :
    FrozenDistinguishedDCommonMissingAwayFromEight
      (reindexRowPattern relabeling row)
      (reindexBlocker relabeling blocker) := by
  have hone := hadmissible.1 1 (by decide)
  have hsix := hadmissible.1 6 (by decide)
  have hseven := hadmissible.1 7 (by decide)
  have height := hadmissible.1 8 (by decide)
  have hnine := hadmissible.1 9 (by decide)
  rcases hd with
    ⟨d, hd1, hd7, hd8, hsevenRow, hnineRow, hblocker, hmissing⟩
  refine ⟨relabeling d, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · simpa [hone] using hd1
  · simpa [hseven] using hd7
  · simpa [height] using hd8
  · simpa [hseven] using hsevenRow
  · simpa [hnine] using hnineRow
  · exact relabeling.injective.ne hblocker
  · simpa [hone, hsix, hseven] using hmissing

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
