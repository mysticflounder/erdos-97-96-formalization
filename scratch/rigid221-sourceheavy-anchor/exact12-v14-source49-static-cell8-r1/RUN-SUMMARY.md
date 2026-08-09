# Exact-12 v14 source49 cell-8 static replay

## Classification

`SAT`. This checkpoint installs 49 proof-backed source-order cuts, but it does
not establish terminal UNSAT, all-cell coverage, a general-cardinality lift, or
closure of a live Lean theorem.

The returned survivor has neither an admitted cut stage nor a detector stage in
the static replay.

## New source49 cut

The source48 survivor is excluded by seven selected rows centered at `3`, `5`,
`7`, `8`, `9`, `10`, and `11`. Three convex-five cores cover the 48 frozen
source orders:

- `(a,x,b,c,y) = (1,5,7,11,10)` covers 12 direct/reverse and 12 mirror/forward
  orders;
- `(a,x,b,c,y) = (6,7,3,11,9)` covers 6 direct/forward and 6 mirror/reverse
  orders;
- `(a,x,b,c,y) = (6,8,11,3,9)` covers 6 direct/reverse and 6 mirror/forward
  orders.

The Lean coverage theorem splits only on the frozen direct/mirror source block
and the forced forward/reverse second-cap order. The resulting leaves are
discharged by source-block inequalities and `omega`. The second core's metric
contradiction uses a five-step equality-closure chain; the other two use direct
selected-row equalities.

- Lean source:
  `ExactTwelveRigid221MixedV7Cell8EighteenthPositiveCut.lean`
- source bytes: `8606`
- source SHA-256:
  `5fced4304c884da53e637b903add5253ce26aea173268f2b14b8d63d3658bd90`
- certificate SHA-256:
  `b56beeb4bdcff921fddaa96e6c2e792cd8401eeb13fc27116f238b41d746884e`
- learned clause: `(-368, -951, -1719, -2065, -2291, -2420, -2992)`
- source-order coverage: `48/48` (`24` direct, `24` mirror)

Direct Lean elaboration of the source49 cut passed. The two focused Python
replay tests passed in 79.739 seconds, and Ruff reported no errors. An
independent read-only source/axiom/replay audit is recorded separately in the
checkpoint handoff.

## Authenticated migration

The source48 journal was replayed into:

`exact12-v14-source49-cell8-migrated-r1.jsonl`

- records: `871`
- bytes: `126296724`
- output SHA-256:
  `95a3b30e48a9804e970df8ee4b00eb727f6148de636394b18324389dad76ea47`
- detector contract SHA-256:
  `d64e803baed2d2cb6b4224842230f7128d7d9a8bf8194ffe9da34eff9cc99d69`
- terminal record SHA-256:
  `d8f683757e8883e27ac088d4c32d3ec9afa6f6043755d0d8eb27a47da3f78eeb`
- source48 candidate retired: `true`
- current source replayed: `true`

## Static replay

- variables: `44855`
- clauses: `732126`
- proof-backed source-order clauses: `49`
- solver return code: `10`
- verdict: `SAT`
- proof verified: `false` (no UNSAT proof was produced)
- CNF SHA-256:
  `f1af19047552e737b5f365c0177218ce8398a9af1c88c5fd0a174fbd96e19a7f`

The surviving selected rows are:

```json
{"0":[4,5,8,11],"1":[0,2,6,8],"2":[0,3,10,11],"3":[1,8,9,10],"4":[1,2,3,8],"5":[1,2,7,10],"6":[0,2,4,7],"7":[3,5,6,8],"8":[4,6,9,11],"9":[0,1,3,6],"10":[0,1,7,9],"11":[3,5,7,10]}
```

The next refinement target is this exact source49 survivor. Any source50 cut
must again be source-pinned, replayable over all 48 frozen orders, and consumed
through a named Lean theorem before journal migration.
