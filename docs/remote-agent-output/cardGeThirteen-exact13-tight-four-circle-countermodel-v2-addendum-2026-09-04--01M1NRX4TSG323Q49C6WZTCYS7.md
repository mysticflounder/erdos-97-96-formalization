# Exact-card-13 tight four-circle countermodel — v2 source-semantic addendum

Date: 2026-09-04

Base artifact: nthdegree file `01M1NRMJET3VG9K1Q3QKM7ASHN`.

The exact rational verifier has been strengthened beyond the four-circle and convex-order checks.  For the source roles

```text
source0 = l0 ∈ C0,   blocker0 = b0,
source1 = l2 ∈ C1,   blocker1 = b1,
```

it now exhaustively groups all distances from `b0` and `b1` to the other twelve carrier points using exact `Fraction` arithmetic.

Results:

```text
at b0 before deletion: unique largest class C0 of cardinality 4;
after deleting source0=l0: largest distance class has cardinality 3;

at b1 before deletion: unique largest class C1 of cardinality 4;
after deleting source1=l2: largest distance class has cardinality 3.
```

Thus the model satisfies the local actual-blocker failure semantics for the two named good sources: deleting the source destroys every four-point distance class at its displayed blocker.  Since both `z` and `d=k2` are omitted by `C0` and `C1`, the two blocker rows survive both named deletions.

The remaining unencoded source fields are now narrower:

- actual-blocker failure semantics for `z`, `d`, and the other carrier points;
- global K4/minimality over all thirteen carrier centers;
- the `CriticalPairFrontier` proof that `d` is one of the designated frontier pair;
- fully deletion-robust apex structures;
- the MEC/Moser-triangle equations and side predicates identifying the displayed five-point interval with `S.oppInterior2`.

Updated local hashes:

```text
verifier: 8991b9b32732c0dc5dedea4351f5bbdd2656b1f9fe226803e488f6faa6bce649
checkpoint: 925006687ee1b64dba59ba7473b182313919219a8015e16a7f00962ac4ee87ff
transport-v2: 674a4d158a1e36771466504ed1b4ad1b424ce551265d27c043deeed40e476b5e
archive: 817cd81ec345e533387e945443e57d71dd4d5d0944c32aac7905d3df1502c028
```

Claim boundary: this is still not a full `CounterexampleData` or `SurplusCapPacket` realization.  It does, however, refute any proposed terminal whose only additional source input beyond the base artifact is the local actual-blocker failure of the two selected good sources.