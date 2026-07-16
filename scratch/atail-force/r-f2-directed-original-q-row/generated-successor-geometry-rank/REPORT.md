# Generated-successor geometry/rank checkpoint

Date: 2026-07-16

Status: focused Lean check green; scratch only; no production closure claimed.

## Result

`GeneratedSuccessorGeometryRank.lean` consumes the kernel-clean ordered-cap
adapter from `generated-successor-rank/CapRankOppositeSide.lean` at the two
actual live-heavy generated centers.

For a generated row at `K.named.x`, the companion is the actual opposite
named point `K.named.y`; symmetrically, at `K.named.y` the companion is
`K.named.x`.  The live-heavy packet really supplies, for each companion:

- membership in the dangerous live four-set `{q,t1,t2,t3}`; and
- membership in `S.oppCap2`.

Those facts imply that the companion differs from the chosen outside-middle
successor source, because the successor packet says that its source is not in
the live four-set.

The resulting source-exact classifier preserves exactly three alternatives:

1. the chosen successor source is outside `S.oppCap2`;
2. the actual opposite named cap companion is omitted from the generated
   support; or
3. the source and companion are in the generated support and in
   `S.oppCap2`, so `EqualRadiusOppositeRankData` certifies that their ordered
   cap indices lie on opposite sides of the generated center.

The first two alternatives are genuine residuals.  In particular, neither
successor-source cap membership nor companion membership in the generated
support follows from the current live-heavy packet, and this file does not
silently assume either one.

## Direct terminal filtered first

For every exact q-critical triple at the same generated center, the coherent
predecessor `R.sourcePair.x` is absent from the triple support.  This is the
contrapositive-facing residue of the already checked terminal
`false_of_qCritical_coherentSource_mem_support`: if that predecessor were in
the support, the original retained live row and the generated q-critical row
would have two common points outside the strict opposite cap, contradicting
the existing two-row terminal.

Thus each `TerminalFilteredOutsideMiddleRankResidual` contains both:

- the universal coherent-predecessor omission for q-critical generated rows;
- the exact outside-cap / companion-omitted / opposite-rank classification.

## Paired handoff

`OriginalQGeneratedSuccessorRankPacket` packages the classifiers at both
generated centers together with the already checked
`OriginalQGeneratedSuccessorPair.SourceSplit`.  Its source split retains all
five existing alternatives:

- distinct chosen sources;
- equal source with cross-survival at `x`;
- equal source with cross-survival at `y`;
- equal source localized to the live center in the metric arm;
- equal source localized to the retained second apex in the equilateral arm.

The public existence theorem
`AnchoredF2LiveHeavyReduction.exists_generatedSuccessorRankPacket` constructs
this paired handoff directly from the actual live-heavy packet.

## What this does not prove

This checkpoint does not prove `False` and does not close a source `sorry`.
It also does not provide a well-founded descent or a no-wrap theorem for the
ordered-cap rank move.  A next consumer must use the paired source split plus
one or both of the explicit residual alternatives, or prove a genuine rank
monovariant.  Treating every successor as an in-cap rank move would be
overstrong: the current inputs do not imply the two required incidence facts.

## Validation

Focused elaboration produced
`/private/tmp/p97-r-f2-generated-successor-geometry-rank-oleans/GeneratedSuccessorGeometryRank.olean`.
The four printed public theorem closures are exactly:

```text
[propext, Classical.choice, Quot.sound]
```

There is no `sorry`, `admit`, or declared axiom in the Lean source.  The
focused command used `lake env lean -R .. -M 16384` with the current scratch
olean directories and `lean/.lake/build/lib/lean` on `LEAN_PATH`; no full
`lake build` was run.
