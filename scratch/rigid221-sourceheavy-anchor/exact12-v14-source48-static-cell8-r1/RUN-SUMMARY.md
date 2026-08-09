# Exact-12 v14 source48 cell-8 static replay

## Classification

`SAT`. This checkpoint installs 48 proof-backed source-order cuts, but it does
not establish terminal UNSAT, all-cell coverage, a general-cardinality lift, or
closure of a live Lean theorem.

The returned survivor has neither an admitted cut stage nor a detector stage in
the static replay.

## New source48 cut

The source47 survivor is excluded by five selected rows centered at `1`, `2`,
`5`, `7`, and `8`. Two convex-five cores cover the 48 frozen source orders:

- `(a,x,b,c,y) = (3,2,6,1,8)` covers 12 direct/reverse and 12 mirror/forward
  orders;
- `(a,x,b,c,y) = (2,1,8,7,5)` covers 12 direct/forward and 12 mirror/reverse
  orders.

The Lean coverage theorem splits only on the frozen direct/mirror source block
and the forced forward/reverse second-cap order. Each of the four leaves is
discharged by source-block inequalities and `omega`.

- Lean source:
  `ExactTwelveRigid221MixedV7Cell8SeventeenthPositiveCut.lean`
- source bytes: `6652`
- source SHA-256:
  `4363cc6c7a7255ecfe270f1271db32a34e7069c4076dfdfe4df82d2d52d2bb96`
- certificate SHA-256:
  `62bbf6edb0bffd666e82a755e53249cf509401e59daa99d015196a4d4b0bf939`
- learned clause: `(-55, -163, -1069, -1630, -2024)`
- source-order coverage: `48/48` (`24` direct, `24` mirror)

Direct Lean elaboration of the source48 cut passed. An independent read-only
audit ran both focused modules (`18` tests, with `60` subtests), confirmed 48
unique source orders, the source bytes and hash, and the learned clause, and
found only `propext`, `Classical.choice`, and `Quot.sound` in the theorem's
axiom dependencies, with no `sorryAx`. Ruff reported no errors.

## Authenticated migration

The source47 journal was replayed into:

`exact12-v14-source48-cell8-migrated-r1.jsonl`

- records: `871`
- bytes: `126296724`
- output SHA-256:
  `b3d1d96cdeeecce825de3598dae2d7487cb35b651059f44e5e07df2acf2d721b`
- detector contract SHA-256:
  `401ec63af8e793adffcd8552c79bed9e0cf2047d4a14e4e3538043c185a8d720`
- terminal record SHA-256:
  `11eec0e58f446a5ad73c2683c3b2e90e61f30cdf07430769ac67ee83a214d3e8`
- source47 candidate retired: `true`
- current source replayed: `true`

## Static replay

- variables: `44855`
- clauses: `732125`
- proof-backed source-order clauses: `48`
- solver return code: `10`
- verdict: `SAT`
- proof verified: `false` (no UNSAT proof was produced)

The surviving selected rows are:

```json
{"0":[4,5,8,11],"1":[0,2,6,8],"2":[0,3,10,11],"3":[1,8,9,11],"4":[1,2,3,8],"5":[1,2,7,10],"6":[0,2,4,7],"7":[3,5,6,8],"8":[4,6,9,11],"9":[2,3,6,11],"10":[0,1,7,9],"11":[3,5,7,10]}
```

The next refinement target is this exact source48 survivor. Any source49 cut
must again be source-pinned, replayable over all 48 frozen orders, and consumed
through a named Lean theorem before journal migration.
