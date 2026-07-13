import Erdos9796Proof.P97.ErasedCertificate.CardTenP4SeedP4S2A
import Erdos9796Proof.P97.ErasedCertificate.CardTenP4SeedP4S2B

/-! # Erased-pin card-ten P4S2 seed certificate -/

namespace Problem97.SurplusCOMPGBank

theorem false_of_isValidOneSidedSeedRelaxedShapeShadow_of_mem_p4s2
    {seed : OneSidedSeed} {shadow : Shadow}
    (hseed : seed ∈ erasedPinCardTenP4S2GridSeeds)
    (hvalid : isValidOneSidedSeedRelaxedShapeShadow seed shadow = true) :
    False := by
  rw [erasedPinCardTenP4S2GridSeeds_eq_chunks] at hseed
  rcases List.mem_append.mp hseed with hseed | hseed
  · exact false_of_isValidOneSidedSeedRelaxedShapeShadow_of_mem_p4s2a
      hseed hvalid
  · exact false_of_isValidOneSidedSeedRelaxedShapeShadow_of_mem_p4s2b
      hseed hvalid

end Problem97.SurplusCOMPGBank
