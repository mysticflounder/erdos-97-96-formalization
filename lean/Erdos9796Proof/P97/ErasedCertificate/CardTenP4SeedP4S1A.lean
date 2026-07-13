import Erdos9796Proof.P97.ErasedCertificate.CardTenP4SeedDefs

/-! # Erased-pin card-ten P4S1-A native certificate -/

namespace Problem97.SurplusCOMPGBank

def erasedPinCardTenP4S1AEntries : List (OneSidedSeed × List Nat) :=
  erasedPinCardTenP4S1GridSeedsA.flatMap
    oneSidedSeedRelaxedShapeSearchEntriesFor

theorem erasedPinCardTenP4S1AEntries_eq_nil :
    erasedPinCardTenP4S1AEntries = [] := by
  native_decide

theorem false_of_isValidOneSidedSeedRelaxedShapeShadow_of_mem_p4s1a
    {seed : OneSidedSeed} {shadow : Shadow}
    (hseed : seed ∈ erasedPinCardTenP4S1GridSeedsA)
    (hvalid : isValidOneSidedSeedRelaxedShapeShadow seed shadow = true) :
    False := by
  have hmem : (seed, shadow.masks) ∈ erasedPinCardTenP4S1AEntries := by
    exact List.mem_flatMap.mpr
      ⟨seed, hseed,
        mem_oneSidedSeedRelaxedShapeSearchEntriesFor_of_isValidOneSidedSeedRelaxedShapeShadow
          hvalid⟩
  simpa [erasedPinCardTenP4S1AEntries_eq_nil] using hmem

end Problem97.SurplusCOMPGBank
