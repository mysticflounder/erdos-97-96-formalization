# E-package bank — REPORT

Written by the orchestrating session from the banking agent's delivered report
(the agent's own REPORT.md write was blocked; content below is the agent's
report of record, 2026-07-28). Source math:
`docs/solve-prompts/2026-07-28-e-round1-response.md` against leaf E1
`false_of_retainedInteriorDirectedOmission_and_all_low_hits`
(`FrontierLiveClosure.lean:6594`, `sorry` at `:6605`).

## Deliverables

- `EPackageBank.lean` — 27 kernel-checked, sorry-free theorems; all four
  targets landed, nothing weakened.
- [`FidelityCheck.lean`](../../../attic/p97-package-bank-fidelity-2026-08-30/e-package-bank/FidelityCheck.lean)
  — archived PARKED-SPEC harness (one intentional `sorry`): a
  False-goal theorem with the E1 binder block character-for-character,
  applying all 19 E1-indexed bank theorems. Compiles ⇒ every bank hypothesis
  instantiates verbatim in the leaf context. The
  [archive README](../../../attic/p97-package-bank-fidelity-2026-08-30/README.md#manual-replay)
  records the current manual replay recipe.

## Validation (independent re-run by orchestrator)

- Gate: `lake env lean scratch/e-package-bank/EPackageBank.lean` — exit 0,
  zero errors/warnings; 27/27 inline `#print axioms` exactly
  `[propext, Classical.choice, Quot.sound]`; no sorryAx/ofReduceBool/
  trustCompiler; only this directory written; E1 leaf untouched.

## Interface corrections vs the response/prompt docs (bank follows the leaf)

1. (E9.1) `hlow` is NOT a leaf binder — the low-hit bound is DERIVABLE from
   T's tri-apex richness + the two-circle bound; banked as `e1_low_hit`.
   Consumers therefore need no low-hit assumption (strengthening).
2. The two-hit localizer is PRODUCTION:
   `criticalShellCenter_mem_capInteriorByIndex_of_two_hits`
   (FrontierLiveClosure.lean:6433); the E9-shaped bound exists as
   `criticalShell_inter_oppositeCapClassInterior_card_le_two_of_apexRich`
   (ApexRichClassStructure.lean:100). No scratch re-derivation needed.

## Headline — the two terminal consumers (PROVEN)

- `e1_false_of_three_hits` / `e1_false_of_threeHitWitness`: the response's
  displayed three-hit existential → False over verbatim E1 binders.
- `e1_false_of_capPair_crossDeletionBlocked_of_center_outside` /
  `e1_false_of_weakFormWitness`: weak-form consumer — same-slice pair p≠q
  (both in Γ(vᵢ,r) ∩ Cᵢ°) with ¬K4(A∖{q}, c(p)) and c(p) ∉ Cᵢ° → False.
  Exact hypothesis shape recorded in the file; richness and unique-four at
  c(p) are derivable, q ∈ A follows from slice membership.
- `e1_packetPair_weakForm_consumer`: instantiated at the E4 packet pair
  (which IS a same-rich-cap pair — `e1_sources_mem_commonSlice`), both
  orientations.

E1's residual is now a pure PRODUCER obligation: produce a three-hit witness
or a cross-deletion-failure + outside-blocker pair.

## Also banked (PROVEN)

- Tri-apex robustness package: `e1_{first,second,surplus}Apex_robust`,
  `e1_apexByIndex_{rich,robust}`, `e1_center_ne_apexByIndex` (no blocker
  center equals any apex), `e1_row_inter_apexClass_card_le_two`, `e1_low_hit`.
- `e1_not_mutual_cross_membership` + `e1_directed_omission_of_sameApexCircle`
  — UNIFORM in the cap index (stronger than the response's a₁-only §3 and
  production's oppApex1-specific version), via Dumitrescu
  `perpBisector_apex_bound`.
- §5 plumbing: `e1_deletion_blocks_own_blocker`,
  `e1_omission_deletion_profile` (deleting the omitted source preserves K4
  at all three apices + partner's blocker, destroys it at its own blocker —
  why minimality gives no immediate removable vertex),
  `e1_notRobustCenters_card_ge` (⌈|A|/4⌉ lower bound),
  `e1_apices_not_mem_notRobustCenters`.
- Packet index helpers re-derived with provenance (project copies private).

## Residual — CONJECTURE

- Discharging either consumer over E1 binders (the producer itself), exactly
  the response's "Exact remaining gap".
- `e1_omission_row_hits_pair_card_eq_one` covers only the pair half of §2's
  polarity claim (no claim that a second slice hit is impossible).
- The response's §4 circularity remark about the downstream three-hit
  theorem was not audited.

Spine status: BANK (off-spine); no production sorry shrunk.

## Cold-restart pointers

Leaf FLC:6594 (sorry :6605); localizer FLC:6433; E9 bound
ApexRichClassStructure.lean:100; bisector Dumitrescu/L1.lean:128;
cross-deletion iff CriticalPairFrontier.lean:781.
