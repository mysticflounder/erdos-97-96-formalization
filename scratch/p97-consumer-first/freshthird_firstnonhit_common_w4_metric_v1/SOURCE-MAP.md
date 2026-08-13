# Source map

The live Lean source used to justify this probe is in the following modules.
Line numbers are descriptive for the audited revision and may move.

## Common-radius W4 producers

In `Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceCanonicalSurface.lean`:

- `freshThird_commonRadius_sameBlocker_freshCenter_mem_canonicalCap`;
- `freshThird_commonRadius_sameBlocker_selectedShell_inter_canonicalCap_eq_sources`;
- `freshThird_commonRadius_sameBlocker_exists_four_capInterior_sources_off_selectedShell`;
- `freshThird_commonRadius_sameBlocker_exists_four_capInterior_sources_off_selectedShell_with_deletion_survivals`.

These produce the canonical-cap localization, exact two-source trace, and the
four off-row strict-cap points.  They do not synchronize the four points'
actual blockers or actual selected rows.

## FirstNonHit boundary facts

In `Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean`:

- `freshThirdCapSourceNonHit_centerEq_or_inter_card_le_two`;
- `freshThirdCapSourceInteraction_centerEq_or_inter_card_le_two`; and
- the active terminal
  `TwoSourceExactCollisionRowsTerminal.false_of_freshThird_firstNonHit`.

The two boundary theorems show that neither named canonical source row can
supply the terminal's distinct-center overlap of at least three: it has either
the Q-row center or overlap at most two.

## Scope statement

The exact rank, cap profile, retained endpoint aliases, and named row supports
in `results.json` are frozen computational choices, not conclusions of the
listed Lean declarations.  No result in this directory is imported by Lean.
