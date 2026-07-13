import Erdos9796Proof.P97.ErasedCertificate.CardTenP4SeedDefs

/-! # Erased-pin card-ten P4S2-B native certificate -/

namespace Problem97.SurplusCOMPGBank

def erasedPinCardTenP4S2BEntries : List (OneSidedSeed × List Nat) :=
  erasedPinCardTenP4S2GridSeedsB.flatMap
    oneSidedSeedRelaxedShapeSearchEntriesFor

theorem erasedPinCardTenP4S2BEntries_eq_nil :
    erasedPinCardTenP4S2BEntries = [] := by
  native_decide

theorem false_of_isValidOneSidedSeedRelaxedShapeShadow_of_mem_p4s2b
    {seed : OneSidedSeed} {shadow : Shadow}
    (hseed : seed ∈ erasedPinCardTenP4S2GridSeedsB)
    (hvalid : isValidOneSidedSeedRelaxedShapeShadow seed shadow = true) :
    False := by
  have hmem : (seed, shadow.masks) ∈ erasedPinCardTenP4S2BEntries := by
    exact List.mem_flatMap.mpr
      ⟨seed, hseed,
        mem_oneSidedSeedRelaxedShapeSearchEntriesFor_of_isValidOneSidedSeedRelaxedShapeShadow
          hvalid⟩
  simpa [erasedPinCardTenP4S2BEntries_eq_nil] using hmem

end Problem97.SurplusCOMPGBank
