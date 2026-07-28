# MD / blocker-closed bank — REPORT

Written by the orchestrating session from the banking agent's delivered report
(the agent's own REPORT.md write was blocked; content below is the agent's
report of record, 2026-07-28). Source math: the multi-deletion-failure (MD)
interface identified in `docs/solve-prompts/2026-07-28-u1-double-apex-round1-response.md`,
generalizing the pair-erase results of `lean/scratch/d-package-bank/D1GlobalSurvival.lean`
to arbitrary deletion sets.

## Deliverable

`MDBlockerClosed.lean` — 558 lines, 28 theorems, 2 defs (`blockerMap`,
`BlockerClosed`). Imports production only (`ATail.GlobalMinimalDeletion`,
`U1CarrierInjection`).

## Validation (independent re-run by orchestrator)

- Gate: `lake env lean scratch/md-blocker-closed-bank/MDBlockerClosed.lean`
  — exit 0, zero errors, zero warnings.
- All 28 inline `#print axioms`: exactly `[propext, Classical.choice,
  Quot.sound]`; 0 hits for `sorryAx`/`ofReduceBool`/`trustCompiler`.
- No production file touched; only this directory written.

## Headline results (all PROVEN, kernel-checked)

1. `exists_failed_center_of_escaping_blocker`: s ∈ V with χ(s) ∉ V ⟹ χ(s) is
   a failed remaining center of A ∖ V. Needs only s ∈ A, s ∈ V.
2. `blockerClosed_of_globalK4_sdiff` (dichotomy): global K4 on A ∖ V forces V
   closed under χ. `md_or_blockerClosed` packages the usable residual form.
3. Pair/singleton instantiations recover the D1GlobalSurvival results as
   instances (`mutual_centerAt_of_blockerClosed_pair`,
   `false_of_globalK4_singleErase`); χ(s) ≠ s comes from
   `CriticalFourShell.center_mem` via `Finset.mem_erase`.
4. Blocker-closed structure: `two_le_card_of_blockerClosed`;
   `blockerFiber_card_le_four` at ARBITRARY centers (strengthens the B2Arm3
   version, which was attained-center-only);
   `card_le_four_mul_card_blockerImage`; bundled in
   `blockerClosed_counting_normalForm`.
5. Stretch landed: `exists_periodic_of_fixedPointFree_selfMap` (pigeonhole;
   period n ≥ 2, not necessarily minimal) with geometric corollary
   `exists_blocker_cycle_of_blockerClosed`.
6. MD from minimality — NO adapter gap: `exists_failed_remaining_center_of_minimal`
   (verbatim round-1 response shape) is a two-line composition of production
   `not_hasNEquidistantProperty_of_nonempty_proper_subset` +
   `exists_local_blocker_of_not_global_K4` (GlobalMinimalDeletion.lean:32–56).
7. Sharp consequence `exists_fresh_failed_center_of_blockerClosed`: for
   minimal D and nonempty proper blocker-closed V, minimality supplies a
   failed remaining center that is provably NOT a designated blocker of any
   deleted source. `md_census_of_minimal` bundles the full dichotomy.

## Re-derived prerequisites (provenance)

`equidistantAt_mono`, `centerAt_mem_A`, `centerAt_ne_self` (verbatim from
D1GlobalSurvival); `mem_support_of_centerAt_eq` (B2Arm3, reproved via
`CriticalShellSystem`/`CriticalFourShell` fields only — no frontier import).

## Residual gaps — CONJECTURE (not in the Lean file)

1. No proper nonempty blocker-closed V ⊆ D.A exists for minimal D with the
   packet data. The bank proves only necessary conditions (card ≥ 2, fiber
   ≤ 4, image containment, χ-cycle); `FiniteMapSaturationProbe.lean`'s Fin 8
   model shows the combinatorial constraints alone do not refute it.
2. Fiber bound < 4 via two-circle intersection for co-circular
   source/blocker configurations — not attempted.
3. No geometric contradiction: the U1-response open core (global K4 +
   convexity + caps + no-M44 vs blocker-closed sets) is untouched.

Spine status: BANK (off-spine); no production sorry shrunk.
