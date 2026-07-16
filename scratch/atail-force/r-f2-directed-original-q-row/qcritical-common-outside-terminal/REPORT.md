# Q-critical common-outside terminal

Date: 2026-07-16

Status: **kernel-checked scratch theorem; source-clean; direct consumer proved;
the outside-`oppCap2` placement premise remains an upstream producer.**

## Result

`QCriticalCommonOutsideTerminal.lean` proves

```text
false_of_qCritical_qCritical_common_off_oppCap2_point
```

for an `OriginalQGeneratedPair K`. If both exact generated constructors are
q-critical, then any point `a` satisfying

```text
a in rowX.support
a in rowY.support
a notin S.oppCap2
a != q
```

is contradictory.

The reason is exact and local. Completing either q-critical triple adjoins
the deleted source `q`, so `q` belongs to both generated rows. The checked
live-cap saturation theorem places `q` outside `S.oppCap2`. Thus `{q,a}` is a
pair of distinct outside-cap points shared by the two generated rows. Their
centers `x,y` are distinct points of `strictSecondCap S`, so the existing
ordered-cap terminal

```text
false_of_two_strictOppCap2_rows_common_outside_pair
```

applies.

No cap membership is inferred from a support omission, deletion survival, or
row cardinality.

## Successor specializations

The theorem

```text
OriginalQGeneratedSuccessorPair.
  false_of_qCritical_qCritical_equalSource_off_oppCap2
```

closes an equal-source successor pair as soon as the common chosen source is
explicitly outside `S.oppCap2`. The two cross-deletion survival alternatives
in `SourceSplit` are irrelevant to this terminal: source equality supplies
the second row membership, and explicit cap placement supplies the only
remaining geometric input.

The structure

```text
DistinctSourcesReciprocalSupportOutsideOppCap2
```

records the full source-faithful distinct-source packet: distinct chosen
sources, both outside `oppCap2`, and both reciprocal cross-memberships. Its
consumer

```text
OriginalQGeneratedSuccessorPair.
  false_of_qCritical_qCritical_distinctSources_reciprocalSupport
```

is checked. In fact, the `x`-source half of the packet already closes: `q`
is the first common outside point, and the off-cap `x` source with its
cross-membership is the second.

## Exact remaining producer

This file is a direct terminal, not the missing producer. The open input is
still one of:

```text
equal-source case:
  Q.at_x.source notin S.oppCap2

distinct-source case:
  Q.at_x.source notin S.oppCap2
  and Q.at_x.source in rowY.support
```

The symmetric `y` version is equivalent. The bare `SourceSplit` survival
fields do not imply either fact.

## Bank preflight

Before proving the adapter, the lane rechecked the required current and
archived theorem-bank registries and ran focused `nthdegree docs search
--lean` queries for two distinct ordered-cap centers sharing an outside
pair. The direct hit was
`CapSelectedRowCounting.outsidePair_unique_capCenter`, already exposed in
this scratch import graph through
`false_of_two_strictOppCap2_rows_common_outside_pair`. No stronger theorem
was found that produces the missing successor cap placement or reciprocal
membership.

## Focused validation

The repository-pinned single-file Lean check emitted

```text
/private/tmp/p97-r-f2-qcritical-common-outside-terminal-oleans/
  QCriticalCommonOutsideTerminal.olean
```

and exited successfully. Every printed theorem closure is exactly

```text
propext
Classical.choice
Quot.sound
```

The source scan found no `sorry`, `admit`, declared axiom, heartbeat override,
lint suppression, or line longer than 120 characters. No full `lake-build`
was run.
