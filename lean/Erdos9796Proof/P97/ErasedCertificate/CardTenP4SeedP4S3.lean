import Erdos9796Proof.P97.ErasedCertificate.CardTenP4SeedP4S3A
import Erdos9796Proof.P97.ErasedCertificate.CardTenP4SeedP4S3B

/-! # Erased-pin card-ten P4S3 seed certificate -/

namespace Problem97.SurplusCOMPGBank

theorem false_of_isValidOneSidedSeedRelaxedShapeShadow_of_mem_p4s3
    {seed : OneSidedSeed} {shadow : Shadow}
    (hseed : seed ∈ erasedPinCardTenP4S3GridSeeds)
    (hvalid : isValidOneSidedSeedRelaxedShapeShadow seed shadow = true) :
    False := by
  rw [erasedPinCardTenP4S3GridSeeds_eq_chunks] at hseed
  rcases List.mem_append.mp hseed with hseed | hseed
  · exact false_of_isValidOneSidedSeedRelaxedShapeShadow_of_mem_p4s3a
      hseed hvalid
  · exact false_of_isValidOneSidedSeedRelaxedShapeShadow_of_mem_p4s3b
      hseed hvalid

end Problem97.SurplusCOMPGBank
