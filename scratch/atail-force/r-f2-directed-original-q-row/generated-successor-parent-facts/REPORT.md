# Generated-successor parent facts

Status: **kernel-checked scratch adapters; source-clean; not yet wired into the
production dispatcher.**

This lane closes the q-critical/q-critical metric subcase at the full-parent
boundary without adding a free geometric assumption.

`QNotSecondApex.lean` proves:

```text
OriginalQOutsideMiddleParentContext.q_ne_leafPacket_oppApex2
```

The proof unfolds the CP-derived leaf packet after substituting the retained
Moser-triangle equality.  In each of the three cap indices, `oppApex2` is one
of the vertices in `M.verts`; hence the parent hypothesis `q ∉ M.verts`
implies `q ≠ leafPacket.oppApex2`.

`ParentQCriticalMetricTerminal.lean` composes that adapter with the checked
local theorem:

```text
OriginalQOutsideMiddleParentContext.
  false_of_qCritical_qCritical_metricResidual
```

Consequently, whenever the two live-heavy generated constructors are both
q-critical and their continuation pair reaches `MetricResidual`, the exact
full-parent data prove `False`.  The local terminal derives `q ≠ p` from the
retained live critical row, so no extra exclusion remains.

This is a genuine branch closure, but not yet a production `sorry` closure:
the remaining constructor combinations, cross-survival arms, and other
origin/F2 callbacks still require consumers.

## Focused validation

Both files were checked from `lean/` against the existing scratch olean
dependency chain.  Their printed public theorem closures are exactly:

```text
propext
Classical.choice
Quot.sound
```

There is no `sorryAx`, `sorry`, `admit`, or declared axiom in either file. No
full `lake-build` was run.
