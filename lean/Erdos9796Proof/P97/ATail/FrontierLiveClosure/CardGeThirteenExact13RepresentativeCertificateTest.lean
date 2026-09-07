/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13RepresentativeCertificate

/-!
# Focused checks for the exact-13 representative certificate

This test keeps the API smoke checks separate from the certificate module.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace CardGeThirteenExact13RepresentativeCertificate

open CardGeThirteenExact13SourceIndexedBankCoverage

example : oneFormEntry.data.check oneFormEntry.choices oneFormEntry.checkPattern = true :=
  oneForm_data_check

example : twoFormEntry.data.check twoFormEntry.choices twoFormEntry.checkPattern = true :=
  twoForm_data_check

example : KeyEntryCovers oneFormKey oneFormEntry := oneForm_keyEntryCovers

example : KeyEntryCovers twoFormKey twoFormEntry := twoForm_keyEntryCovers

#check oneFormEntry
#check twoFormEntry
#check oneForm_keyEntryCovers
#check twoForm_keyEntryCovers

end CardGeThirteenExact13RepresentativeCertificate
end ATailFrontierLiveClosure
end Problem97
