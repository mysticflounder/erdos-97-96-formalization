# CardGe13 TerminalSplit cycle cut

Lane: `cardge13-terminal-split-cycle-cut-20260905`

## Scoped changes

- Removed the unused `TwoSourceFreshThirdFiber` import and the unused
  `open TwoSourceExactCollisionRowsTerminal` from
  `CardGeThirteenTerminalSplitV2.lean`.
- Repaired the CardGe13 outcome producer’s two-arm `rcases` destructuring in
  `CardGeThirteenOutcomeDispatcher.lean`; both existing fresh and exact branch
  bodies are preserved.  The two isolated-dot style warnings were folded into
  their following declarations.

## Governed validation

The final focused `lake-build` command targeted:

1. `CardGeThirteenTerminalSplitV2`
2. `CardGeThirteenUncoveredStrictInterior`
3. `CardGeThirteenOutcomeDispatcher`
4. `CardGeThirteenAnchoredOutcomeDispatcher`

It completed successfully with all 8,744 jobs.  The final log is
`scratch/runs/cardge13-terminal-split-cycle-cut-20260905/run-0001/artifacts/build-final.log`.
The wrapper’s best-effort proof-blueprint resync reported an unrelated stale
private-symbol cache error, then completed its source indexing; this did not
affect the successful Lean build.

The explicit probe in
`scratch/runs/cardge13-terminal-split-cycle-cut-20260905/run-0001/artifacts/axiom_probe.log`
reports exactly `[propext, Classical.choice, Quot.sound]` for:

- `nonempty_cardGeThirteenUncoveredThreeCenterPacket_or_exactAdjacentCapGrid`;
- `nonempty_cardGeThirteenUncoveredStrictInteriorPacket_or_exactAdjacentCapGrid`;
- `nonempty_cardGeThirteenOutcome`; and
- `nonempty_cardGeThirteenAnchoredOutcome`.

Post-edit import-graph BFS reports `Rigid221Closure` unreachable from each of
`CardGeThirteenAnchoredOutcomeDispatcher`, `CardGeThirteenExact13RawIngress`,
`CardGeThirteenExact13DispatchRawBridge`,
`CardGeThirteenExact13CoarseCellIngress`, and
`CardGeThirteenExact13SourceRoleIngress`.

Final source hashes:

- `CardGeThirteenTerminalSplitV2.lean`:
  `f70a6ac399bc6b2e5e49f1093ae9609450d20f16ebfe7cb1bb8f53cd71d68827`;
- `CardGeThirteenOutcomeDispatcher.lean`:
  `5a2eb4efa3bfd400e4163d17b9c02ea1b008c7a543b83b95018ef30178d61da6`.
