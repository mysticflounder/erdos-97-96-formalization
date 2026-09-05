# Exact-thirteen cell-0 three-form checker probe

## Result

The isolated module
`CardGeThirteenExact13ThreeFormCheckProbe.lean` records one concrete
three-form certificate and proves that it passes the provider-indexed
executable checker.  The checked proposition is exposed as
`representativeData_valid`.

Targeted verification succeeded:

```text
lake env lean Erdos9796Proof/P97/ATail/FrontierLiveClosure/CardGeThirteenExact13ThreeFormCheckProbe.lean
exit 0
```

The proof of `representativeData_check` is `by decide`; no native evaluator or
external proof oracle is used.

## Authenticated source

The source event is:

```text
scratch/runs/cardge13-exact13-three-form-batch-20260905/run-0002/cell-000-final-model-three-form-batch.json
```

- file SHA-256:
  `a9fc0d0196d84fda94f87f06d1d194d2a8f139d7a6ea2d1a80f6ad45feac960a`
- canonical event hash:
  `d105c57d19483c58e4d5e60ce3796ddf7e16cd8896a7bafc84e2003a9be8caad`
- run-manifest SHA-256:
  `36dcef2d4bfa9ef1a866d21ba6a7548ea5288c74f84a2839f7d52281cb5b7f7a`
- batch counts: 1,637 candidates, 648 cuts, and 407 novel cuts
- representative forms:
  `[[8,0,6,7,1],[2,8,11,7,1],[2,8,5,0,0]]`
- certificate size: six pairings and 21 primitive atoms

## Translation contract

The artifact uses raw point labels.  Lean's ordered-quad and edge fields use
positions in the direct second-opposite chart, so every raw label passes
through `directIndex .secondOpposite`.  Its raw order is

```text
[2,8,9,10,11,12,1,3,4,5,0,6,7]
```

and the raw-to-position map is

```text
0→10, 1→6, 2→0, 3→7, 4→8, 5→9, 6→11,
7→12, 8→1, 9→2, 10→3, 11→4, 12→5.
```

The artifact records diagonal-to-side paths for a form vector written as
diagonals minus sides.  `WeightedKalmansonTerm` supplies sides on its left and
diagonals on its right.  The Lean paths therefore reverse the artifact
direction and run from side edges to diagonal edges.

The six translated raw-label paths are:

1. `[2,8] → [8,6]`, using a flip and provider `g8`;
2. `[5,0] → [0,7]`, using a flip and provider `k`;
3. `[2,7] → [2,11]`, using provider `g2`;
4. `[8,7] → [8,7]`, the empty path;
5. `[0,6] → [2,5]`, alternating flips with `g6`, `t`, `c1`, `g3`, and `g5`;
6. `[8,11] → [8,0]`, alternating flips with `g11` and `l`.

Provider tags are retained independently of centers.  In particular, `k` and
`l` remain different providers although both use raw center zero.  Explicit
flip atoms put center-first row steps in the orientation required by the
checker.

The three artifact entries become three list entries with weight one and are
not normalized through a set.  This keeps the source multiplicity discipline;
the selected representative itself contains no repeated entry.

## Boundary

This result checks one authenticated representative.  It does not establish
coverage of every source cell, connect the certificate to a live
`CriticalPairFrontier`, prove `False`, or add an import to a promoted aggregate.

`ProviderRowNogoodCertificate.lean` compiles and is imported directly.  The
foreign-owned `CardGeThirteenExact13ProviderIngress.lean` had independent
compile failures during this check, so the probe uses local provider tags and
imports the exact-thirteen order transport directly.  Neither foreign-owned
module was edited.
