# Q-critical generated-successor rank integration

Date: 2026-07-16

Status: **kernel-checked scratch theorem; source-clean; the equal-source
double-rank cell is closed; no production `sorry` closure is claimed.**

## Result

`QCriticalRankIntegration.lean` combines three already checked surfaces:

- the paired original-`q` outside-middle successors;
- the source-exact cap-rank classifier at both live-heavy generated centers;
- the q-critical/q-critical metric terminal and common-outside-point terminal.

The main theorem is

```text
Problem97.ATailRF2OriginalQCriticalRankIntegrationScratch.
  qCriticalRankReduction
```

It takes an `OriginalQGeneratedSuccessorPair`, exact q-critical constructors
at both generated centers, and the sole local exclusion
`q != S.oppApex2`.  Its full-parent adapter is

```text
Problem97.ATailRF2OriginalQCriticalRankIntegrationScratch.
  OriginalQOutsideMiddleParentContext.qCriticalRankReduction
```

The parent adapter discharges the exclusion from the retained
`OriginalQOutsideMiddleParentContext`; it has no free geometric side
condition.

Every returned branch records that one of the two cross deletions preserves
K4.  The q-critical/q-critical metric residual has therefore been consumed,
not carried forward.

## Outside-source normalization

For either chosen successor source, the exact normalized alternatives are:

1. the source is outside `S.oppCap2` and is absent from the opposite
   generated row;
2. the source is inside `S.oppCap2` and the opposite named center is absent
   from its own generated row; or
3. the source is inside `S.oppCap2`, the opposite named center is present,
   and `EqualRadiusOppositeRankData` certifies the resulting ordered-cap
   rank move.

The opposite-row omission in item 1 is proved, not assumed.  If an outside
source were also on the opposite q-critical generated row, then it and the
original point `q` would be two distinct common points outside `oppCap2`.
The checked ordered-cap terminal would give `False`.

This is the strongest honest use of the new common-outside theorem.  A bare
distinct outside source is not itself contradictory: it survives precisely
with the recorded opposite-row omission.  Deletion survival does not produce
the missing cross-membership.

## Equal-source double-rank cell closes

If the two chosen successor sources agree, either side's outside alternative
would automatically put that source on the opposite row.  Hence the common
source is inside `oppCap2` on both sides.

The remaining apparent four cells were:

```text
omitted at x / omitted at y
omitted at x / rank at y
rank at x    / omitted at y
rank at x    / rank at y
```

The last cell is now kernel-closed.  The proof calls
`S.capByIndex_cgn4g_capData D.convex S.oppIndex2` once and places the named
centers `x,y` and common source `s` in one shared ordered-cap presentation.
Generated-row equal-radius facts give:

```text
dist x y = dist x s
dist y x = dist y s
```

One-sided distance injectivity forces `x` to lie strictly between `y` and
`s`, and simultaneously forces `y` to lie strictly between `x` and `s`.
The four possible orientation combinations are eliminated by `omega`.

Consequently `EqualSourceQCriticalRankResidual` includes the checked field

```text
K.named.y notin generated-row-x support
or
K.named.x notin generated-row-y support
```

At least one opposite-center companion is omitted.  This does not rely on
comparing two independently chosen ordered-cap witnesses, and it does not
need a conjectural no-wrap theorem.

## Exact remaining residual

The theorem does not prove `False` for the whole q-critical/q-critical arm.
The surviving surfaces are now:

- **equal sources:** the common source is in `oppCap2`, at least one
  opposite-center companion is omitted, the other side is either omitted or
  a certified rank move, and one cross deletion preserves K4;
- **distinct sources:** on each side, an outside source carries an explicit
  opposite-row omission, while an inside source carries either companion
  omission or a certified rank move; again one cross deletion preserves K4.

Thus the next consumer should attack an actual companion-omission/cross-
survival packet, or produce the missing reciprocal source incidence from
full parent geometry.  Treating a single remaining rank move as descent is
still invalid without a global no-wrap or well-founded consumer.

## Required bank and indexed-corpus preflight

Before adding this normal form, the lane checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered:

- equal-radius opposite-rank companion omission;
- two common support points outside one ordered cap; and
- q-critical generated-successor cross survival.

The load-bearing direct hit was

```text
CapSelectedRowCounting.outsidePair_unique_capCenter
```

already exposed through the checked q-critical common-outside terminal.
The `CriticalPairFrontier` cross-survival declarations do not produce a
chosen successor source in the opposite generated row.

The high-ranked sibling hits

```text
U5QCriticalTripleClass.rank_one_radius_child_incompatibility
U5QCriticalTripleClass.phase_one_exact_companion_incompatibility
U5QCriticalTripleClass.phase_one_shared_companion_incompatibility
```

are not adapters for this packet.  Their exact registry statements require
additional U5 dangerous-triple critical/deleted rows and several named
cross-incidences absent from the current two-row surface.  Importing them
would merely move the missing-producer boundary.

No existing theorem was found which turns cross-deletion survival into the
needed reciprocal successor-source support membership.

## Focused validation

The successful single-file check was run from `lean/`:

```bash
LEAN_PATH="/private/tmp/p97-r-collapse-lean427-current-pb2jam3_:/private/tmp/p97-root-failure-parent-lift:$(find /private/tmp -maxdepth 1 -type d -name '*oleans' -print | sort | paste -sd: -):./.lake/build/lib/lean" \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-f2-qcritical-rank-integration-oleans/QCriticalRankIntegration.olean \
  ../scratch/atail-force/r-f2-directed-original-q-row/qcritical-rank-integration/QCriticalRankIntegration.lean
```

The emitted artifact is:

```text
/private/tmp/p97-r-f2-qcritical-rank-integration-oleans/
  QCriticalRankIntegration.olean
```

Both printed public theorem closures are exactly:

```text
propext
Classical.choice
Quot.sound
```

The source scan found no `sorry`, `admit`, declared axiom, `native_decide`,
`unsafe`, heartbeat override, or lint suppression.  No Lean source line is
longer than 100 characters.  No full `lake-build` was run.
