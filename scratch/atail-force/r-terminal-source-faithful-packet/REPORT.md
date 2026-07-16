# R terminal source-faithful packet

Date: 2026-07-16

Status: **KERNEL-CHECKED TERMINAL INTERFACE REPAIR; THE ORIGINAL
DOUBLE-ERASED SECOND-APEX ROW CAN BE RETAINED EXACTLY; NO PRODUCTION `sorry`
IS CLOSED.**

## Result

The information loss in
`nonempty_coherentPacket_of_terminalEndpoint` is avoidable without a new
geometric theorem.

The old constructor:

1. starts from
   `HasNEquidistantPointsAt 4
     ((T.carrier.erase deleted).erase other) S.oppApex2`;
2. monotonically enlarges the carrier; and then
3. chooses an arbitrary four-point row in the enlarged carrier.

The checked constructor in `TerminalSourceFaithfulPacket.lean` instead:

1. chooses a `SelectedFourClass` in the original double-erased terminal
   carrier;
2. lifts that exact support and radius along the carrier inclusion; and
3. installs the lifted row as the current
   `CoherentRCommonDeletionPacket.secondApexRow`.

Thus the ambient row and terminal row have definitionally copied data and
the packet stores checked equalities of both support and radius.

The main producer is:

```lean
LeastPositiveTerminalHitPredecessor.
  nonempty_sourceFaithfulTerminalPacket
```

It constructs:

```lean
SourceFaithfulTerminalCommonDeletionPacket T P H
```

with:

- the exact `LeastPositiveTerminalHitPredecessor`;
- the resulting `CoherentRCommonDeletionPacket`;
- the equality between its source and the predecessor source;
- `otherTerminal`;
- both endpoints' membership in the terminal off-surplus marginal;
- their distinctness;
- a `SelectedFourClass` on
  `((T.carrier.erase deleted).erase otherTerminal)`;
- exact support equality with the coherent ambient second-apex row; and
- exact radius equality with that row.

## Exact residual mapping

For a `TerminalThreePointTwoRowCoverResidual`, the source-faithful packet
proves:

```lean
sourceRow_marginal_eq_otherTerminal
```

so the other named terminal endpoint is exactly the unique terminal
source-row hit.

It then defines:

```lean
terminalSecondRowHit
```

and proves:

```lean
terminalSecondApexRow_marginal_eq_terminalSecondRowHit
```

Hence the unique second-row marginal hit is now a named point of the
original double-erased terminal row, not merely a point in an arbitrary
ambient row chosen after monotone enlargement.

The complete off-surplus marginal is:

```lean
terminalMarginal_eq_named_triple

SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap =
  {deleted, otherTerminal, terminalSecondRowHit}
```

The three roles are exact:

- `deleted` is the unique point outside both retained rows;
- `otherTerminal` is the unique source-row marginal hit; and
- `terminalSecondRowHit` is the unique original terminal second-row
  marginal hit.

The last point is distinct from both terminal endpoints and is not in the
source row. This is the honest current residual, not a closing incidence.

The packet also proves:

```lean
firstCenter_eq_leastPositiveTerminalHit
```

so the retained first center remains identified with the actual least
positive blocker-orbit hit.

## What remains open

This repair names the correct object, but it does not prove the missing
metric theorem:

```lean
dist coherent.firstCenter terminalSecondRowHit =
  coherent.sourceRow.radius
```

That equality would place the named third marginal point in the exact source
row and contradict the checked residual. An equivalent aligned producer
could place the point in the live dangerous base.

`TerminalSourceFaithfulMetricBridge.lean` kernel-checks the two exact named
consumers:

```text
false_of_terminalSecondRowHit_on_sourceCircle
false_of_aligned_terminalSecondRowHit_in_dangerousBase
```

The generic theorem needs only the displayed scalar equality. The aligned
theorem needs only:

```text
terminalSecondRowHit ∈ {q,t1,t2,t3}.
```

The source-faithful constructor therefore removes witness ambiguity but does
not itself close K-A-PAIR or any production `sorry`.

## Smallest production refactor

`CoherentRCommonDeletionPacket` is uniform across the terminal-hit and
minimal-cycle producers. The cycle producer has no `otherTerminal`, so adding
terminal-only fields directly to the uniform structure would be an
overstrong API change.

The smallest exact refactor is:

1. keep `CoherentRCommonDeletionPacket` as the uniform base packet;
2. add a terminal-only refinement equivalent to
   `SourceFaithfulTerminalCommonDeletionPacket`;
3. make the least-terminal-hit producer return that refinement; and
4. project `.coherent` at existing callers that only need the old packet.

Internally, the terminal helper must accept the already chosen
double-erased `SelectedFourClass` and lift it support-identically. It must not
re-run arbitrary row selection after enlargement.

An already constructed arbitrary `CoherentRCommonDeletionPacket` cannot in
general be retrofitted with this source row. The repair belongs at the
terminal constructor boundary.

## Theorem-bank preflight

Before implementing the packet, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The indexed Lean corpus was also searched for the terminal endpoint,
double-erasure, least-terminal-hit, and selected-four-class shape. The local
formalization corpus was indexed at source snapshot `97deb84a`. No existing
declaration supplied this terminal-only refinement. Nearby finite-pattern
families requiring positive `D.IsM44` remain unusable under the live
`hNoM44` parent.

No new finite-pattern contradiction was asserted in this lane.

## Validation

The scratch file was checked directly as a deliberate single-file
validation:

```bash
env LEAN_PATH=/private/tmp/p97-r-orbit-entry-oleans \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-terminal-source-faithful-oleans/TerminalSourceFaithfulPacket.olean \
  ../scratch/atail-force/r-terminal-source-faithful-packet/TerminalSourceFaithfulPacket.lean
```

All printed declarations close with only:

```text
propext, Classical.choice, Quot.sound
```

No `sorryAx` or custom axiom remains. No full Lake build was run.
