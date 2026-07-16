# Original-q live-heavy confined terminal

Status: **kernel-checked scratch theorem; source-clean; not yet integrated into
the production spine.**

`OriginalQConfinedTerminal.lean` closes the formerly residual confined arm at
both named live-heavy centers:

- `AnchoredF2LiveHeavyReduction.nonempty_outsideMiddleSuccessor_atX`
- `AnchoredF2LiveHeavyReduction.nonempty_outsideMiddleSuccessor_atY`

Each theorem preserves the exact original deletion source `q`, generated
center, and generated support witness, and returns a genuine
`OriginalQOutsideMiddleSuccessor`.

## Argument

If a generated support point is already outside both retained rows, the
checked outside-middle constructor gives the successor directly. Otherwise
the exact split forces both support-only middle points `s,t` into the
generated support. Confinement, deleted-source omission, and center omission
then leave only the other live-heavy point and the coherent source as possible
remaining support roles.

- In the q-deleted cardinality-four constructor, the other live-heavy point
  must occur. Together with `s,t`, it gives three common points with the exact
  physical middle row, contradicting `SelectedFourClass.inter_card_le_two`.
- In the q-critical cardinality-three constructor, either the other
  live-heavy point occurs, giving the same three-point collision, or the
  coherent source occurs. The latter joins `q` in both the completed generated
  row and retained live row; both lie outside `oppCap2`, so
  `false_of_two_strictOppCap2_rows_common_outside_pair` closes it.

No support omission is used as deletion survival.

## Focused validation

The repository-pinned Lean check emitted
`/private/tmp/p97-r-f2-original-q-confined-terminal-oleans/OriginalQConfinedTerminal.olean`
and exited successfully. Both printed theorem closures are exactly:

```text
propext
Classical.choice
Quot.sound
```

There is no `sorryAx`, `sorry`, `admit`, or declared axiom in the file. No
full `lake-build` was run.
