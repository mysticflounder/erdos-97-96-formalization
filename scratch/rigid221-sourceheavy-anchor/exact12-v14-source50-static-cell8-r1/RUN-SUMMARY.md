# Exact-12 v14 source50 cell-8 static replay

## Classification

`SAT`. This checkpoint installs 50 proof-backed source-order cuts, but it does
not establish terminal UNSAT, all-cell coverage, a general-cardinality lift, or
closure of a live Lean theorem.

The returned survivor has neither an admitted cut stage nor a detector stage in
the static replay.

## New source50 cut

The source49 survivor is excluded by three selected rows centered at `3`, `9`,
and `10`. The single convex-five core
`(a,x,b,c,y) = (0,10,1,3,9)` covers all 48 frozen source orders: 24 in the
forward orientation and 24 in the reverse orientation.

- Lean source:
  `ExactTwelveRigid221MixedV7Cell8NineteenthPositiveCut.lean`
- source bytes: `4344`
- source SHA-256:
  `ebff5b867abf7e96294f0e92db6f853e8af6a178a44aed7fa4566e68787727f0`
- certificate SHA-256:
  `6db1c95661f53773a173e2c987731460286f3943421022ee2663f660c176a970`
- learned clause: `(-367, -2085, -2420)`
- source-order coverage: `48/48` (`24` direct, `24` mirror)

Direct Lean elaboration passed. The two focused Python replay tests passed in
84.641 seconds, Ruff reported no errors, and an independent read-only audit
confirmed the cube, core, equality closure, all 48 source orders, source hash,
and learned clause.

## Authenticated migration

The source49 journal was replayed into:

`exact12-v14-source50-cell8-migrated-r1.jsonl`

- records: `871`
- bytes: `126296724`
- output SHA-256:
  `5f76d951091f21cd4bba8789e44cdf16329cbbb04df70f41a370551986c0fd17`
- detector contract SHA-256:
  `d0bf1432b7ff1ef94559a95d58d4cc82fd8c8d679913bef691691bbad9fbaace`
- terminal record SHA-256:
  `a27c87cb56e871744c0cc4ee497a36afbb89d966c2436666c9095c890198d647`
- source49 candidate retired: `true`
- current source replayed: `true`

## Static replay

- variables: `44855`
- clauses: `732127`
- proof-backed source-order clauses: `50`
- solver return code: `10`
- verdict: `SAT`
- proof verified: `false` (no UNSAT proof was produced)
- CNF SHA-256:
  `02f2ed7de461badbd000d20355310afbe11dfba530071391e1a2614c256075a2`

The surviving selected rows are:

```json
{"0":[3,4,7,11],"1":[0,2,6,8],"2":[0,3,10,11],"3":[5,7,9,10],"4":[0,1,7,9],"5":[0,2,3,7],"6":[0,4,5,10],"7":[1,5,6,8],"8":[4,6,9,11],"9":[1,6,7,11],"10":[1,2,9,11],"11":[2,4,7,8]}
```

The next refinement target is this exact source50 survivor. Any source51 cut
must again be source-pinned, replayable over all 48 frozen orders, and consumed
through a named Lean theorem before journal migration.
