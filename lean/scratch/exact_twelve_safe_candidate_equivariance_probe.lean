import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PlacementOrbits
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeCandidate

/-! Probe for the source-safe candidate predicate under the checked normalizer. -/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

attribute [local instance] Classical.propDecidable

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem normalizingRelabeling_candidateClasses_equivariant :
    ∀ placement ∈ frozenPlacementDomain, ∀ center,
      (frozenSafeCandidateClasses center).map
          (normalizingRelabeling placement).finsetCongr.toEmbedding =
        frozenSafeCandidateClasses
          (normalizingRelabeling placement center) := by
  decide

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
