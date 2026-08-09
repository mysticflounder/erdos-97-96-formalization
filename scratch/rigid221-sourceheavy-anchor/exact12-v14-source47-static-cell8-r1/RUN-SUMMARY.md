# Exact-12 v14 source47 cell-8 static replay

## Classification

`SAT`. This checkpoint installs 47 proof-backed source-order cuts, but it does
not establish terminal UNSAT, all-cell coverage, a general-cardinality lift, or
closure of a live Lean theorem.

The returned survivor has neither an admitted cut stage nor a detector stage in
the static replay.

## New source47 cut

The source46 survivor is excluded by the three selected rows centered at
`1`, `3`, and `6`. They instantiate the convex-five core
`(a,x,b,c,y) = (0,6,2,3,1)`, whose orientation follows from the frozen source
blocks alone. Exhaustive enumeration found 20 common-five cores, three of which
cover all 48 frozen source orders. This checkpoint uses the first full-cover
core in the detector's deterministic order.

- Lean source:
  `ExactTwelveRigid221MixedV7Cell8SixteenthPositiveCut.lean`
- source bytes: `2813`
- source SHA-256:
  `74f14d0ec23a99a7a6a677866381e1b864425431b8b188ca4f66557bb4c3e811`
- certificate SHA-256:
  `b00f7ce9ec9a8c62c733691cf8cb0d47216c39c5861ea4626f89c6d721626e82`
- learned clause: `(-55, -288, -1182)`
- source-order coverage: `48/48` (`24` direct, `24` mirror)

Direct Lean elaboration of the source47 cut passed after compiling the imported
source-clean orientation theorem's module. The two focused source-order/bank
tests passed, and Ruff reported no errors. An independent read-only audit ran
both focused test modules (`18` tests) and confirmed the wrapper-to-binding
match, selected memberships, core, acyclic import, source bytes and hash,
learned clause, all 48 orders, and bank append counts. Its axiom inspection
found only `propext`, `Classical.choice`, and `Quot.sound`, with no `sorryAx`
dependency.

## Authenticated migration

The source46 journal was replayed into:

`exact12-v14-source47-cell8-migrated-r1.jsonl`

- records: `871`
- bytes: `126296724`
- output SHA-256:
  `a69ff0adcdfa22225b1546bbd7f877770e3f6728462ee997928697e8861f073f`
- detector contract SHA-256:
  `71901a555684b6fe10c8b3d5613f39e86fbfa6ca04b5bf20b0a16e440b0dabb4`
- terminal record SHA-256:
  `ae2a446f06aaab8a28c1c1b5374021806408fae6443e94eac2b37bcb608eb52e`
- source46 candidate retired: `true`
- current source replayed: `true`

## Static replay

- variables: `44855`
- clauses: `732124`
- proof-backed source-order clauses: `47`
- solver return code: `10`
- verdict: `SAT`
- proof verified: `false` (no UNSAT proof was produced)

The surviving selected rows are:

```json
{"0":[1,3,4,8],"1":[0,2,6,8],"2":[3,6,10,11],"3":[4,6,7,10],"4":[0,7,9,10],"5":[2,8,10,11],"6":[0,2,4,5],"7":[1,5,6,8],"8":[3,4,6,9],"9":[1,3,5,7],"10":[3,5,8,9],"11":[1,2,4,7]}
```

The next refinement target is this exact source47 survivor. Any source48 cut
must again be source-pinned, replayable over all 48 frozen orders, and consumed
through a named Lean theorem before journal migration.
