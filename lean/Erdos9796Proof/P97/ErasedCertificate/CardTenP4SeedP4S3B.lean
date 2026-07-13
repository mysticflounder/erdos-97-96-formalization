import Erdos9796Proof.P97.ErasedCertificate.CardTenP4SeedDefs

/-! # Erased-pin card-ten P4S3-B native certificate -/

namespace Problem97.SurplusCOMPGBank

def erasedPinCardTenP4S3BEntries : List (OneSidedSeed × List Nat) :=
  erasedPinCardTenP4S3GridSeedsB.flatMap
    oneSidedSeedRelaxedShapeSearchEntriesFor

theorem erasedPinCardTenP4S3BEntries_eq_nil :
    erasedPinCardTenP4S3BEntries = [] := by
  native_decide

theorem false_of_isValidOneSidedSeedRelaxedShapeShadow_of_mem_p4s3b
    {seed : OneSidedSeed} {shadow : Shadow}
    (hseed : seed ∈ erasedPinCardTenP4S3GridSeedsB)
    (hvalid : isValidOneSidedSeedRelaxedShapeShadow seed shadow = true) :
    False := by
  have hmem : (seed, shadow.masks) ∈ erasedPinCardTenP4S3BEntries := by
    exact List.mem_flatMap.mpr
      ⟨seed, hseed,
        mem_oneSidedSeedRelaxedShapeSearchEntriesFor_of_isValidOneSidedSeedRelaxedShapeShadow
          hvalid⟩
  simpa [erasedPinCardTenP4S3BEntries_eq_nil] using hmem

end Problem97.SurplusCOMPGBank
