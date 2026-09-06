# Exact-13 strong-valid source refinement

Lane: `exact13-strong-valid-source-refinement-20260906`

Owner: `luna-swarm-lemma-lantern-97`

Base head: `ec13064a5b8202dc8ee86dc6b06c52e6190290df`

## Scope and statement boundary

This lane refines the finite exact-thirteen key domain without changing the
historical `Key.Valid` predicate.  The source module adds
`GlobalOneBoundaryValid`, whose three cardinality conclusions are all guarded
by membership of the relevant apex in the global raw support, and defines
`StrongValid` as `Key.Valid ∧ GlobalOneBoundaryValid`.  The global raw support
continues to use the existing blocker-guarded provider map.

The module also proves source extraction for a valid key, existence of a
`StrongValid` key for each source input, and the scoped adapter
`bankCovers_of_strongValidKeyCover`.  The adapter says that a cover of the
refined finite domain yields the existing `BankCovers` predicate; it does not
assert a cover, an exact-thirteen contradiction, or terminal closure.

The source-derived geometry uses the Stage 1 helper
`Problem97.SelectedFourClass.inter_card_le_one_of_mem_boundary_apex`, committed
at `00942f94e`.  Each use supplies an explicit apex-membership hypothesis.

## Owned paths

- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/CardGeThirteenExact13StrongSourceCoverage.lean`
- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/CardGeThirteenExact13StrongSourceCoverageTest.lean`
- `docs/audits/2026-09-06-exact13-strong-valid-source-refinement-20260906.md`
- `.codex/worktree-checkpoints/exact13-strong-valid-source-refinement-20260906.json`

No foreign exact16 or replay paths are in scope.

## Validation record

The governed target build was launched with:

```text
lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13StrongSourceCoverage
```

The build completed successfully with exit `0` after all `12008` jobs.  The
durable build log is:

```text
lean/.lake/lake-build-logs/7618-1788711806611593000.log
```

The wrapper's best-effort proof-blueprint resync failed after the successful
Lean build; it wrote `docs/live-blueprint.md`.  This does not affect the Lean
build result.  The focused probe was:

```text
lake env lean Erdos9796Proof/P97/ATail/FrontierLiveClosure/CardGeThirteenExact13StrongSourceCoverageTest.lean
```

The focused probe exited `0` and printed all three exported declarations.  Its
`#print axioms` output for each declaration was exactly
`[propext, Classical.choice, Quot.sound]`.  A source scan found no
`sorry`, `admit`, `unsafe`, `partial`, or `native_decide` in either owned Lean
file.  The test module now has a module docstring and the focused probe is
warning-free.  Owner-scoped staged hygiene and the exact-path staged diff both
passed.  This audit makes no publication or aggregate-spine claim.
