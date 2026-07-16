# Generated-successor ordered-cap rank adapter

Status: **kernel-checked conditional scratch theorem; source-clean; not a
standalone consumer.**

`CapRankOppositeSide.lean` proves the exact ordered-cap fact available once a
generated row contains one chosen cap companion and its outside-middle
successor source also lies in the same opposite cap:

```text
EqualRadiusOppositeRankData
```

For two distinct points of one cap at equal distance from the generated
center, strict convex boundary order places their cap indices on opposite
sides of the center index.  The file provides both a generic theorem and
adapters for `OriginalQOffLiveGeneratedProfile` and
`OriginalQOutsideMiddleSuccessor`.

The hypotheses are intentionally explicit.  Generated-support membership
does not imply cap membership, and support omission does not imply a metric
or deletion-survival fact.  Consequently this result supplies a certified
rank move only in the cap-retained arm; it still needs a cycle-wide no-wrap
or well-founded consumer before it can prove `False`.

## Focused validation

The repository-pinned Lean check emitted:

```text
/private/tmp/p97-r-f2-generated-successor-rank-oleans/CapRankOppositeSide.olean
```

and exited successfully.  Every printed public theorem closure is exactly:

```text
propext
Classical.choice
Quot.sound
```

There is no `sorryAx`, `sorry`, `admit`, or declared axiom in the Lean file.
No full `lake-build` was run.
