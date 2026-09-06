import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13SourceIndexedBankCoverage

/-!
# Source-indexed exact-thirteen bank coverage checks

Focused type-check and axiom probes for the source-key coverage adapter.
-/

namespace Problem97.ATailFrontierLiveClosure
namespace CardGeThirteenExact13SourceIndexedBankCoverage

open CardGeThirteenExact13SourceOrderBridge
open CardGeThirteenExact13SourceIndexedFiniteKey
open CardGeThirteenExact13WeightedProviderBankBridge

example (I : Input) (k : Key) (e : Entry)
    (hcenter : k.centerOf = I.positionalPattern.centerOf)
    (hsupport : k.supportOf = I.positionalPattern.supportOf)
    (ho : sourceOrderValid I k.orientation)
    (hmatch : KeyEntryCovers k e) :
    e.Covers I :=
  entry_covers_of_key_match I k e hcenter hsupport ho hmatch

example (bank : List Entry) (hcover : ValidKeyCover bank) :
    BankCovers bank :=
  bankCovers_of_validKeyCover bank hcover

#check entry_covers_of_key_match
#check bankCovers_of_validKeyCover
#print axioms entry_covers_of_key_match
#print axioms bankCovers_of_validKeyCover

end CardGeThirteenExact13SourceIndexedBankCoverage
end Problem97.ATailFrontierLiveClosure
