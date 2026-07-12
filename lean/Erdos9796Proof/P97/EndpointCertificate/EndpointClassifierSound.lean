/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.CapSelectedNativeClosureSound
import Erdos9796Proof.P97.EndpointCertificate.GeneralMCardEleven
import Erdos9796Proof.P97.EndpointCertificate.EndpointPlacementDispatch

/-!
# Endpoint classifier soundness (card-eleven extension lane)

Classifier-soundness layer of the endpoint transport (items 4–5 of
`docs/audits/2026-07-11-endpoint-classifier-transport-map.md`).  Ports the
pinned `CapSelectedNativeClassifierSound` interface to the endpoint escaped-row
seed:

* the two `native_decide +revert` seed-mask identities (endpoint analogues of
  `maskOfFinset_pinnedRow`);
* `rowOfPattern_eq_fixedEndpointLeftRow` / `_RightRow` (from the escaped-row
  conjunct + seed-mask identity);
* the endpoint restatement of
  `localCandidateSpec_of_incidenceOK_pinnedShellOK` (consumes the
  `deleted ∈ row P 0` conjunct; only the `rcases` pattern changes).

Everything imports committed modules only; nothing in `Census554/` is modified.
-/

namespace Problem97

namespace EndpointCertificate

namespace EndpointNativeClassifier

open Census554.CapSelectedFiniteCode
open Census554.CapSelectedNativeClassifier
open Census554.CapSelectedNativeClassifierFacts
open Census554.CapSelectedNativeClassifierSound

/- ## Seed-mask identities -/

set_option maxHeartbeats 1000000 in
-- Exhaustive identity over the left endpoint escaped-row seed placements.
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
theorem maskOfFinset_endpointLeftRow (escapee fourth : Label)
    (he : escapee ∈ intO2) (hf : fourth ∈ insert 2 intS) :
    maskOfFinset ({7, 8, escapee, fourth} : Finset Label) =
      (fixedEndpointLeftRow escapee.val fourth.val).support := by
  native_decide +revert

set_option maxHeartbeats 1000000 in
-- Exhaustive identity over the right endpoint escaped-row seed placements.
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
theorem maskOfFinset_endpointRightRow (escapee fourth : Label)
    (he : escapee ∈ intO1) (hf : fourth ∈ insert 1 intS) :
    maskOfFinset ({9, 10, escapee, fourth} : Finset Label) =
      (fixedEndpointRightRow escapee.val fourth.val).support := by
  native_decide +revert

/- ## Fixed-row identities -/

/-- The semantic left escaped row is exactly the fixed left endpoint seed row. -/
theorem rowOfPattern_eq_fixedEndpointLeftRow
    {P : PatternCode} {blocker : Label -> Label}
    {escapee fourth deleted : Label}
    (hshell : EndpointLeftShellOK P blocker escapee fourth deleted) :
    rowOfPattern P 1 = fixedEndpointLeftRow escapee.val fourth.val := by
  rcases hshell with
    ⟨he, hf, _hdeletedInterior, _hne, hrow, _hdeleted, _hblocker,
      _hpinnedBlocker, _hdeletedBlocker⟩
  simp only [rowOfPattern, rowMaskOf]
  rw [hrow, maskOfFinset_endpointLeftRow escapee fourth he hf]
  rfl

/-- The semantic right escaped row is exactly the fixed right endpoint seed
row. -/
theorem rowOfPattern_eq_fixedEndpointRightRow
    {P : PatternCode} {blocker : Label -> Label}
    {escapee fourth deleted : Label}
    (hshell : EndpointRightShellOK P blocker escapee fourth deleted) :
    rowOfPattern P 2 = fixedEndpointRightRow escapee.val fourth.val := by
  rcases hshell with
    ⟨he, hf, _hdeletedInterior, _hne, hrow, _hdeleted, _hblocker,
      _hpinnedBlocker, _hdeletedBlocker⟩
  simp only [rowOfPattern, rowMaskOf]
  rw [hrow, maskOfFinset_endpointRightRow escapee fourth he hf]
  rfl

/- ## Local candidate specifications -/

/-- The proof-facing incidence and left endpoint-shell premises supply every
local condition used to enumerate a row.  Mirrors
`localCandidateSpec_of_incidenceOK_pinnedShellOK`; only the shell `rcases`
pattern changes, consuming `deleted ∈ row P 0`. -/
theorem localCandidateSpec_of_incidenceOK_endpointLeftShellOK
    {P : PatternCode} {blocker : Label -> Label}
    {escapee fourth deleted : Label}
    (hinc : IncidenceOK P)
    (hshell : EndpointLeftShellOK P blocker escapee fourth deleted)
    (center : Label) :
    LocalCandidateSpec center deleted (row P center) := by
  rcases hinc with ⟨hlocal, _hintersections, _hpairCount,
    _hseparation, _hq3, hcapCounts⟩
  rcases hlocal with ⟨hrows, hmoser, hnonMoser⟩
  rcases hshell with
    ⟨_he, _hf, _hdeletedInterior, _hne, _hrow, hdeleted, _hblocker,
      _hpinnedBlocker, _hdeletedBlocker⟩
  refine ⟨(hrows center).1, (hrows center).2, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · intro hcenter
    subst center
    simpa [capO1, capO2] using hmoser.1
  · intro hcenter
    subst center
    simpa [capS, capO2] using hmoser.2.1
  · intro hcenter
    subst center
    simpa [capS, capO1] using hmoser.2.2
  · exact hnonMoser center
  · exact hcapCounts center
  · intro hcenter
    subst center
    exact hdeleted

/-- Right-family mirror of the local-candidate specification. -/
theorem localCandidateSpec_of_incidenceOK_endpointRightShellOK
    {P : PatternCode} {blocker : Label -> Label}
    {escapee fourth deleted : Label}
    (hinc : IncidenceOK P)
    (hshell : EndpointRightShellOK P blocker escapee fourth deleted)
    (center : Label) :
    LocalCandidateSpec center deleted (row P center) := by
  rcases hinc with ⟨hlocal, _hintersections, _hpairCount,
    _hseparation, _hq3, hcapCounts⟩
  rcases hlocal with ⟨hrows, hmoser, hnonMoser⟩
  rcases hshell with
    ⟨_he, _hf, _hdeletedInterior, _hne, _hrow, hdeleted, _hblocker,
      _hpinnedBlocker, _hdeletedBlocker⟩
  refine ⟨(hrows center).1, (hrows center).2, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · intro hcenter
    subst center
    simpa [capO1, capO2] using hmoser.1
  · intro hcenter
    subst center
    simpa [capS, capO2] using hmoser.2.1
  · intro hcenter
    subst center
    simpa [capS, capO1] using hmoser.2.2
  · exact hnonMoser center
  · exact hcapCounts center
  · intro hcenter
    subst center
    exact hdeleted

/-- Every row of a left endpoint-shell admissible placement occurs in the native
candidate list. -/
theorem rowOfPattern_mem_candidateRows_endpointLeft
    {P : PatternCode} {blocker : Label -> Label}
    {escapee fourth deleted : Label}
    (hinc : IncidenceOK P)
    (hshell : EndpointLeftShellOK P blocker escapee fourth deleted)
    (center : Label) :
    rowOfPattern P center ∈ candidateRows center.val deleted.val :=
  rowOfPattern_mem_candidateRows_of_localCandidateSpec
    (localCandidateSpec_of_incidenceOK_endpointLeftShellOK hinc hshell center)

/-- Every row of a right endpoint-shell admissible placement occurs in the
native candidate list. -/
theorem rowOfPattern_mem_candidateRows_endpointRight
    {P : PatternCode} {blocker : Label -> Label}
    {escapee fourth deleted : Label}
    (hinc : IncidenceOK P)
    (hshell : EndpointRightShellOK P blocker escapee fourth deleted)
    (center : Label) :
    rowOfPattern P center ∈ candidateRows center.val deleted.val :=
  rowOfPattern_mem_candidateRows_of_localCandidateSpec
    (localCandidateSpec_of_incidenceOK_endpointRightShellOK hinc hshell center)

end EndpointNativeClassifier

end EndpointCertificate

end Problem97
