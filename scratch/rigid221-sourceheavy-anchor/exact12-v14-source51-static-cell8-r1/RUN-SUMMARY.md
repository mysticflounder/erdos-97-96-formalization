# Exact-12 v14 source51 cell-8 static replay

## Classification

`SAT`. This checkpoint installs 51 proof-backed source-order cuts, but it does
not establish terminal UNSAT, all-cell coverage, a general-cardinality lift, or
closure of a live Lean theorem.

The returned survivor has neither an admitted cut stage nor a detector stage in
the static replay.

## New source51 cut

The source50 survivor is excluded by three selected rows centered at `4`, `5`,
and `6`. The single convex-five core
`(a,x,b,c,y) = (7,4,0,6,5)` covers all 48 frozen source orders: 24 in the
forward orientation and 24 in the reverse orientation.

- Lean source:
  `ExactTwelveRigid221MixedV7Cell8TwentiethPositiveCut.lean`
- source bytes: `4389`
- source SHA-256:
  `4c19358014e3d1b7c83852bdfa3593e914fae58902d0a3169907e548e389af7d`
- source cube SHA-256:
  `bdca3711df99a8b6fc38be1dead077c4ad854fe6af45fc88a34054a868aad3ab`
- certificate SHA-256:
  `d9c71051bae6d80c9f34e2dea32778de8daba7f00350ebb49d7f855472bcdb3e`
- learned clause: `(-516, -849, -1221)`
- source-order coverage: `48/48` (`24` direct, `24` mirror)

Direct Lean elaboration passed. The two focused Python replay tests passed in
78.829 seconds, Ruff reported no errors, and an independent read-only audit
confirmed the cube, core, equality closure, all 48 source orders, source hash,
and learned clause. The audit also confirmed no `sorryAx` in the new theorem;
only the standard `propext`, `Classical.choice`, and `Quot.sound` axioms occur.

## Authenticated migration

The source50 journal was replayed into:

`exact12-v14-source51-cell8-migrated-r1.jsonl`

- records: `871`
- bytes: `126296724`
- output SHA-256:
  `0d6117c83209a6039c24977c8e6edc746f6eac3d59502868aa579c74250f31fa`
- detector contract SHA-256:
  `6da4b006cf873e6d5f0cf6e8841454ff8b72a291a0183f3272647bb6ba309f2f`
- terminal record SHA-256:
  `f0403431ee0bbf81b3bfcd0ca89109013a7c509dc89f810ccee6f8c67f36dc6b`
- source50 candidate retired: `true`
- current source replayed: `true`

## Static replay

- variables: `44855`
- clauses: `732128`
- proof-backed source-order clauses: `51`
- solver return code: `10`
- verdict: `SAT`
- proof verified: `false` (no UNSAT proof was produced)
- CNF SHA-256:
  `22b768e31718ccb750697a140f1abbc598a18b309a065eea7e123ae42d563810`

The surviving selected rows are:

```json
{"0":[2,3,4,11],"1":[0,2,6,8],"2":[1,7,10,11],"3":[1,2,4,9],"4":[1,2,5,8],"5":[0,1,3,10],"6":[0,2,5,7],"7":[1,3,6,8],"8":[5,6,9,11],"9":[0,4,5,6],"10":[0,1,9,11],"11":[3,4,5,7]}
```

The next refinement target is this exact source51 survivor. It already exposes
a one-core source52 candidate: `(a,x,b,c,y) = (1,3,2,0,4)`, using only rows
centered at `0`, `3`, and `4`, covers all 48 frozen source orders. That candidate
still requires Lean formalization, source binding, independent audit, and
authenticated migration before it can be installed.
