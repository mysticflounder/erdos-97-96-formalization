# Equal-source live-center metric terminal

Date: 2026-07-16

Status: **kernel-checked scratch theorem; source-clean; one whole
generated-successor constructor is closed; no production `sorry` closure is
claimed.**

## Result

`EqualSourceMetricTerminal.lean` proves that the complete
`equalSource_atLiveCenter` constructor of
`OriginalQGeneratedSuccessorPair.SourceSplit` is impossible:

```text
false_of_equalSource_atLiveCenter_metricResidual
```

This is uniform over all four exact generated-row constructor combinations.
It is not restricted to q-critical/q-critical.

The resulting source split is:

```text
ReducedSourceSplit
  | distinctSources
  | equalSource_crossAtX
  | equalSource_crossAtY
  | equalSource_atSecondApex
```

The checked full-existence adapter is:

```text
exists_originalQGeneratedSuccessorPair_with_reducedSourceSplit
```

Thus the five-constructor generated-successor frontier has become a genuine
four-constructor frontier.

## Why the live-center arm closes

Every `MetricResidual` contains the two full-row incidences:

```text
y in completed generated row at x
x in completed generated row at y.
```

For a q-deleted generated row, its completed selected support is exactly its
raw support.  For a q-critical row, the completed support is:

```text
insert q rawSupport.
```

The named centers `x,y` belong to the dangerous triple, while the original
live source `q` does not.  Therefore neither named center is `q`, and the two
full-row incidences descend to the raw generated supports.  This conversion
is the checked theorem:

```text
ExactGeneratedAt.mem_support_of_mem_full_of_ne_deleted
```

The live-heavy cap facts place:

```text
p, x, y in oppCap2.
```

In the equal-source-at-live-center constructor, the common successor source
is `p`.  The already checked shared ordered-cap theorem

```text
false_of_equalSource_bothCompanions
```

then uses the generated-row equalities

```text
dist x y = dist x p
dist y x = dist y p
```

on one canonical ordered-cap presentation.  One-sided cap-distance
injectivity makes `x` lie strictly between `y` and `p`, while simultaneously
making `y` lie strictly between `x` and `p`; linear order eliminates all
orientations.

This directly closes both the non-equilateral and equilateral metric
subcases at the live center.  The earlier strict-`oppCap1` common-hit,
surplus-heavy, and three-reverse-equality producer routes are therefore not
load-bearing for this constructor.

## Exact retained boundary

The same argument does **not** close `equalSource_atSecondApex`.

The checked cap facts say:

```text
S.oppApex2 notin S.oppCap2.
```

Hence the common source in that constructor is not on the ordered cap
containing `x,y`, so `false_of_equalSource_bothCompanions` is inapplicable.
The constructor retains an exact `EquilateralResidual`.

The q-critical/q-critical instance remains separately closed by the existing
q-critical metric terminal.  The honest residual is the second-apex
equilateral arm with at least one q-deleted generated row.  The existing
equilateral theorem also proves that `S.oppApex2` is the unique common
support point outside `oppCap2`, so a second-common-outside-point target has
the wrong polarity.

## Required bank and indexed-corpus preflight

Before promoting this reduction, the lane checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered equal-source
equilateral generated rows, q-deleted rows, mutual support, and the retained
second apex.  The closest bank hits included:

```text
u5_qcritical_mutual_no_p_exact_center_metric_incompatibility
u1EquilateralTransfer_proof
```

The first requires additional exact-center incidences not supplied by the
q-deleted residual; the second concerns global endpoint equality rather than
this local successor packet.  Neither is needed for the live-center closure,
which reuses the existing ordered-cap theorem and adds only the exact
full-support-to-raw-support conversion.

## Focused validation

The successful single-file check was run from `lean/`:

```bash
LEAN_PATH="/private/tmp/p97-r-f2-equal-source-metric-terminal-oleans:\
/private/tmp/p97-r-f2-qcritical-rank-integration-oleans:\
/private/tmp/p97-r-collapse-lean427-current-pb2jam3_:\
/private/tmp/p97-root-failure-parent-lift:\
$(find /private/tmp -maxdepth 1 -type d -name '*oleans' -print | \
  sort | paste -sd: -):\
./.lake/build/lib/lean" \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-f2-equal-source-metric-terminal-oleans/\
EqualSourceMetricTerminal.olean \
  ../scratch/atail-force/r-f2-directed-original-q-row/\
equal-source-metric-terminal/EqualSourceMetricTerminal.lean
```

Every printed theorem closure is exactly:

```text
propext
Classical.choice
Quot.sound
```

The source contains no `sorry`, `admit`, declared axiom, `native_decide`,
`unsafe`, heartbeat override, or lint suppression.  No full `lake-build` was
run.
