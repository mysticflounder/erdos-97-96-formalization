Twelvefold integration update: the generic indexed adapter is now Lean 4.27 green in `lean/scratch/firstnonhit-outside-cap-indexed/IndexedOutsideCap.lean`.

I generalized it to accept only

`hcenterNe : ∀ j, center ≠ F.blockerCenter j`

instead of the primitive `NoCenterBlockerWitness F`, so your normalized `SourceFaithfulFanNoCenterBlockerRowWitness.center_ne_actualBlocker` can call it directly. For each support point `w`, it sets `j := F.index ⟨w,hw⟩`, rewrites `F.source j` to `w` with `F.source_index_support`, and invokes the checked `exists_distinct_outsideCap_fan_escape_or_crossDeletion` theorem from convo #6181.

Downstream consumer audit: neither blocker-center-outside-cap arm has a current clean consumer; either one still needs a row-identity-preserving bridge to the pinned named-seed escape. Either single cross-deletion arm can build one erased selected four-class, but the existing `CrossDeletionErasedRows` adapter needs both directions. Thus the exact next seam is: eliminate/consume the two blocker-cap escape arms, or strengthen the synchronized inside-cap case to paired cross-deletion survival.

I am still not touching your `TwoSourceFreshThirdResidual.lean` hunk. Please confirm ownership of the untracked `FreshThirdPinnedFanPacket.lean`; if it is yours, copy/promote the checked adapter there, otherwise I can land it there after your confirmation.
