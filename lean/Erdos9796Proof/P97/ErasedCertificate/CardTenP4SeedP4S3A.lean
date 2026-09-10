import Erdos9796Proof.P97.ErasedCertificate.CardTenP4SeedDefs

/-! # Erased-pin card-ten P4S3-A native certificate -/

namespace Problem97.SurplusCOMPGBank

/-- P97 ErasedCertificate def. -/
def erasedPinCardTenP4S3AEntries : List (OneSidedSeed × List Nat) :=
  erasedPinCardTenP4S3GridSeedsA.flatMap
    oneSidedSeedRelaxedShapeSearchEntriesFor

/-- P97 ErasedCertificate theorem. -/
theorem erasedPinCardTenP4S3AEntries_eq_nil :
    erasedPinCardTenP4S3AEntries = [] := by
  native_decide

/-- P97 ErasedCertificate theorem. -/
theorem false_of_isValidOneSidedSeedRelaxedShapeShadow_of_mem_p4s3a
    {seed : OneSidedSeed} {shadow : Shadow}
    (hseed : seed ∈ erasedPinCardTenP4S3GridSeedsA)
    (hvalid : isValidOneSidedSeedRelaxedShapeShadow seed shadow = true) :
    False := by
  have hmem : (seed, shadow.masks) ∈ erasedPinCardTenP4S3AEntries := by
    exact List.mem_flatMap.mpr
      ⟨seed, hseed,
        mem_oneSidedSeedRelaxedShapeSearchEntriesFor_of_isValidOneSidedSeedRelaxedShapeShadow
          hvalid⟩
  simpa [erasedPinCardTenP4S3AEntries_eq_nil] using hmem

end Problem97.SurplusCOMPGBank
