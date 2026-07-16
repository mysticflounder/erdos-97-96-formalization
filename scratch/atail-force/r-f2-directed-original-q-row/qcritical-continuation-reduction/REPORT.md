# Original-q q-critical/q-critical continuation reduction

Status: **kernel-checked scratch reduction; source-clean; checkpoint-ready;
not yet integrated into the production dispatcher.**

`OriginalQCriticalCriticalContinuationReduction.lean` proves:

```text
cross_survival_of_qCritical_qCritical
```

Under `q ≠ S.oppApex2`, if both exact original-`q` generated constructors
are q-critical, then exactly the remaining classifier conclusion is:

```text
HasNEquidistantPointsAt 4 (D.A.erase K.named.y) K.named.x ∨
HasNEquidistantPointsAt 4 (D.A.erase K.named.x) K.named.y
```

The proof consumes
`OriginalQGeneratedPair.cross_survival_or_metricResidual`. Its first two arms
are returned unchanged. The metric arm is eliminated by the checked
`false_of_qCritical_qCritical_metricResidual` theorem.

The full-parent adapter

```text
OriginalQOutsideMiddleParentContext.
  cross_survival_of_qCritical_qCritical
```

has no free exclusion premise. It obtains `q ≠ leafPacket.oppApex2` from the
checked `QNotSecondApex` structural adapter, hence ultimately from the parent
field `hqNonMoser`.

This theorem is deliberately a **reduction, not `False`**. It closes the
q-critical/q-critical metric residual, but the two cross-survival branches
remain live and need their own consumer.

## Focused validation

The repository-pinned Lean check emitted:

```text
/private/tmp/p97-r-f2-original-q-qcritical-continuation-reduction-oleans/OriginalQCriticalCriticalContinuationReduction.olean
```

and exited successfully. Both printed theorem closures are exactly:

```text
propext
Classical.choice
Quot.sound
```

There is no `sorryAx`, `sorry`, `admit`, or declared axiom in the file. No full
`lake-build` was run.
