# Exact biquadratic residual-(4,5,6) witness

**Classification:** EMPIRICALLY VERIFIED exact-algebraic regression witness.
**Artifact:** `scratch/atail-force/residual_456_exact_witness.json`
**Artifact SHA-256:** `0c59485be06467015681daea1f144b2a40cc3602df5538eba4265be68b61afe9`

This strict-convex `n=12` model shows that a source/blocker row can land at a
cap endpoint while omitting both endpoints. It is the endpoint/unused-point
regression witness.

The exact field is `Q(sqrt(3),sqrt(K))`, where
`K=6709288214136987/738259314849316`. Coordinates in the basis
`(1,sqrt(3),sqrt(K),sqrt(3*K))` are:

```text
0  (0, 0)
1  (1, 0)
2  (8000000/15162281, 13364000/15162281)
3  (86332191/113667809, 73940000/113667809)
4  (83361759/116638241, 81580000/116638241)
5  (1/2, sqrt(3)/2)
6  (125000/932989, 466500/932989)
7  (2218335411287671/3446926521424658
      - 397957542336000/1723463260712329*sqrt(K),
    1320077828308000/1723463260712329
      - 399650467287671/1723463260712329*sqrt(K))
8  (821346826799671/4680835845200329,
    -255311400664000/4680835845200329)
9  (80260746401719/231315774098281,
    -23628829041000/231315774098281)
10 (18577799715470958/17280617942264521,
    -5156814462480000/17280617942264521)
11 (29872168159262/27034865360369,
    -7784691428800/27034865360369)
```

**Fails:** all-center K4, MEC, and the full source-dependent residual fields.
Therefore it refutes only the omitted-hypothesis inference, not the live route.
