# Source-faithful terminal integration

Date: 2026-07-16

Status: **KERNEL-CHECKED FULL-PARENT COORDINATOR INTEGRATION; NAMED TERMINAL
POINT RETAINED; METRIC PRODUCER OPEN.**

`TerminalSourceFaithfulPacket.lean` repaired the terminal constructor, but the
old coordinator still projected terminal hits back to an anonymous
`CoherentRCommonDeletionPacket`. This file carries the terminal refinement
through the actual-blocker orbit and the complete dangerous-retaining parent
telescope.

## Checked branch shape

`coherent_sourceOutside_or_reciprocalDirectedCross` proves the
source-outside/reciprocal split for an already constructed coherent packet.
It does not reconstruct a second packet and therefore preserves terminal-only
provenance.

`AmbientRobustHistoryPair.sourceFaithfulTerminal_or_cycleContinuation`
returns exactly:

1. a terminal-hit `SourceFaithfulTerminalCommonDeletionPacket` with an
   anchored transition;
2. a minimal-cycle ordinary coherent packet with an anchored transition; or
3. a terminal-hit `SourceFaithfulTerminalCommonDeletionPacket` with the
   reciprocal directed-cross residual.

The reciprocal arm is then resolved as fresh common deletion or swapped
`FA-UNIQ4`.

`SourceFaithfulResolvedCurrentNormalForm` exposes the complete frontier shape:

1. original first-apex `FA-UNIQ4` / `FA-UNIQ5`;
2. terminal source-faithful anchored transition;
3. minimal-cycle anchored transition;
4. terminal source-faithful reciprocal common deletion;
5. swapped `FA-UNIQ4`; or
6. generic spent-at-entry common deletion.

Finally,

```text
fullParent_extracts_sourceFaithfulResolvedCurrentNormalForm
```

carries this exact split through the complete dangerous-retaining live parent
surface while retaining the second-large-cap witness, physical surplus
membership, critical system, radius, and frontier.

## Consequence

The named point `terminalSecondRowHit` is no longer stranded in a scratch
constructor. It remains available in the full-parent terminal-anchored branch,
so the checked final consumer can genuinely target:

```text
dist firstCenter terminalSecondRowHit = sourceRow.radius
```

or aligned dangerous-base membership.

No production `sorry` closes from this integration alone. The metric/placement
statement remains the mathematical producer.

## Validation

Direct single-file validation exited `0`. Every printed theorem depends only
on:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx`.
