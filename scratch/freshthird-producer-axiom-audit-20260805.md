# FreshThird producer axiom audit (2026-08-05)

Target:

`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.exists_freshThird_escape_with_sourceFaithful_cover`

Helper producer:

`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.exists_freshThird_selectedRow_escape_tripleShellSeed`

## Checks

- Rebuilt the changed target with:
  `lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdResidual`
  (build completed successfully; source warning only).
- Ran `lake env lean ../scratch/freshthird-producer-axiom-audit-20260805.lean`
  from the `lean/` Lake root, with `#print axioms` for the target and helper.

## Result

Both declarations report exactly:

`[propext, Classical.choice, Quot.sound]`

Therefore the target theorem is transitively source-clean with respect to
`sorryAx`; its helper theorem in `TwoSourceTripleShellEscape.lean` is also
`sorryAx`-free. The helper source has no literal `sorry` declarations.

The same audit included the later theorem
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`, which
reports `[propext, sorryAx, Classical.choice, Quot.sound]`; that is the known
load-bearing residual obligation at line 524 of
`TwoSourceFreshThirdResidual.lean`, and it is not in the dependency closure of
the FreshThird producer target or its triple-shell helper.

