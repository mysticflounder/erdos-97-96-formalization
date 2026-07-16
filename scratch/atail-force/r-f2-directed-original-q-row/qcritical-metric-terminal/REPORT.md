# Original-q q-critical/q-critical metric terminal

Status: **kernel-checked scratch theorem; source-clean; not yet integrated into
the full-parent dispatcher.**

`OriginalQCriticalCriticalMetricTerminal.lean` proves two reusable results.

First,

```text
common_support_point_eq_liveCenter_or_secondApex
```

localizes every ambient point common to both generated continuation rows in
`MetricResidual` to `p` or `S.oppApex2`. This is independent of which exact
generated constructors produced the rows.

Second,

```text
false_of_qCritical_qCritical_metricResidual
```

closes the q-critical/q-critical metric subcase with only the external side
condition

```text
q ≠ S.oppApex2
```

Both q-critical constructors complete their stored triples by adjoining the
original deleted point `q`, so `q` belongs to both generated rows. The generic
localization gives `q = p ∨ q = S.oppApex2`. The first equality is ruled out
internally by the exact live critical row: its source `q` belongs to the
positive-radius support while its center `p` does not. The supplied side
condition rules out the second equality.

At the full-parent boundary, `q ≠ S.oppApex2` should be derived from
`hqNonMoser`: `S.oppApex2` is one of the Moser triangle vertices. That adapter
is intentionally separate from this local F2 theorem.

## Geometric argument

For a common support point `z`, equality of the two generated-row radii in
`MetricResidual` gives

```text
dist z x = dist z y.
```

The retained exact live row gives the same equality for `p`, while the
physical retained middle row gives it for `S.oppApex2`. If `z` were distinct
from both, these would be three carrier points on the perpendicular bisector
of the distinct pair `x,y`, contradicting
`Dumitrescu.perpBisector_apex_bound`.

No support omission is interpreted as a metric or survival statement.

## Focused validation

The repository-pinned Lean check emitted:

```text
/private/tmp/p97-r-f2-original-q-qcritical-metric-terminal-oleans/OriginalQCriticalCriticalMetricTerminal.olean
```

and exited successfully. Every printed theorem closure is exactly:

```text
propext
Classical.choice
Quot.sound
```

There is no `sorryAx`, `sorry`, `admit`, or declared axiom in the file. No full
`lake-build` was run.
