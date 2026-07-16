# Original-q generated-successor pair

Status: **kernel-checked scratch theorem; source-clean; not yet integrated into
the production spine.**

`OriginalQGeneratedSuccessorPair.lean` packages, under one
`AnchoredF2LiveHeavyReduction`, both exact generated profiles and the checked
outside-middle successor at each named center. The final existence theorem is:

```text
exists_originalQGeneratedSuccessorPair_with_sourceSplit
```

Its `SourceSplit` has five exact outcomes:

1. the two chosen successor sources are distinct;
2. they agree and deleting `y` preserves K4 at `x`;
3. they agree and deleting `x` preserves K4 at `y`;
4. they agree, the continuation rows are in `MetricResidual`, and the common
   source is the live center `p`;
5. they agree, the continuation rows are in `EquilateralResidual`, and the
   common source is `S.oppApex2`.

The equal-source metric refinement is the new coupling. The common source
belongs to both exact generated rows, so it is equidistant from the distinct
centers `x,y`. The exact live row puts `p` on the same perpendicular bisector,
and the physical retained middle row puts `S.oppApex2` there. These are three
points of `D.A`; Dumitrescu's perpendicular-bisector bound forces the common
source to equal `p` or `S.oppApex2`. In the latter case, the non-equilateral
arm's explicit omission of `S.oppApex2` contradicts generated-row membership,
leaving the named equilateral residual.

The package also retains the two common-deletion packets at the exact shared
source through
`OriginalQGeneratedSuccessorPair.nonempty_commonDeletionPackets_at_sharedSource`.

## Bank preflight and scope

The required bank preflight checked the general-n registry and the sibling,
legacy, and older theorem-bank censuses, followed by indexed Lean searches for
two-row/common-deletion successor couplings. No existing source-clean theorem
directly eliminates this pair. The earlier successor-sink audit likewise says
that a bare successor recursion is not closure.

This file therefore records the strongest source-implied split. It does **not**
claim a direct contradiction, does not make the two existential witnesses
distinct without splitting, and does not infer metrics or deletion survival
from support omission. In particular, it does not assign either successor a
strict-cap side or cap rank: those facts are absent from this interface.

## Focused validation

The repository-pinned Lean check emitted:

```text
/private/tmp/p97-r-f2-original-q-generated-successor-pair-oleans/OriginalQGeneratedSuccessorPair.olean
```

and exited successfully. All printed public theorem closures are exactly:

```text
propext
Classical.choice
Quot.sound
```

There is no `sorryAx`, `sorry`, `admit`, or declared axiom in the file. No full
`lake-build` was run.
