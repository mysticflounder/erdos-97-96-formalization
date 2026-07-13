import Erdos9796Proof.P97.ErasedCertificate.CardTenP4SeedP4S1A
import Erdos9796Proof.P97.ErasedCertificate.CardTenP4SeedP4S1B

/-! # Erased-pin card-ten P4S1 seed certificate -/

namespace Problem97.SurplusCOMPGBank

theorem false_of_isValidOneSidedSeedRelaxedShapeShadow_of_mem_p4s1
    {seed : OneSidedSeed} {shadow : Shadow}
    (hseed : seed ∈ erasedPinCardTenP4S1GridSeeds)
    (hvalid : isValidOneSidedSeedRelaxedShapeShadow seed shadow = true) :
    False := by
  rw [erasedPinCardTenP4S1GridSeeds_eq_chunks] at hseed
  rcases List.mem_append.mp hseed with hseed | hseed
  · exact false_of_isValidOneSidedSeedRelaxedShapeShadow_of_mem_p4s1a
      hseed hvalid
  · exact false_of_isValidOneSidedSeedRelaxedShapeShadow_of_mem_p4s1b
      hseed hvalid

end Problem97.SurplusCOMPGBank
