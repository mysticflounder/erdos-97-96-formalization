# Exact-12 v14 source46 cell-8 static replay

## Classification

`SAT`. This checkpoint installs 46 proof-backed source-order cuts, but it does
not establish terminal UNSAT, all-cell coverage, a general-cardinality lift, or
closure of a live Lean theorem.

The returned survivor has neither an admitted cut stage nor a detector stage in
the static replay.

## New source46 cut

The source45 survivor is excluded by the three selected rows centered at
`0`, `2`, and `6`. They instantiate the convex-five core
`(a,x,b,c,y) = (11,0,3,6,2)`, whose orientation follows from the frozen source
blocks alone. Exhaustive enumeration found 16 common-five cores, four of which
cover all 48 frozen source orders. This checkpoint uses the first full-cover
core in the detector's deterministic order and reuses the previously checked
orientation theorem for this core.

- Lean source:
  `ExactTwelveRigid221MixedV7Cell8FifteenthPositiveCut.lean`
- source bytes: `3119`
- source SHA-256:
  `f57cf850e18d15b24baa342ae0f5308d0a4ffd6f9f13439964c987bc5b46fbf3`
- certificate SHA-256:
  `410ab1592abccb74a8dd7dc70c6b7ce07a86aee9c3459e856e49148ede0a2e96`
- learned clause: `(-37, -156, -1169)`
- source-order coverage: `48/48`

Direct Lean elaboration of the source46 cut passed after compiling the imported
source-clean orientation theorem's module. The two focused source-order/bank
tests passed, and Ruff reported no errors. An independent read-only audit
confirmed the wrapper-to-binding match, selected memberships, core, acyclic
import, source bytes and hash, learned clause, and bank append counts. Its axiom
inspection found only `propext`, `Classical.choice`, and `Quot.sound`, with no
`sorryAx` dependency.

## Authenticated migration

The corrected source45 r2 journal was replayed into:

`exact12-v14-source46-cell8-migrated-r1.jsonl`

- records: `871`
- bytes: `126296724`
- output SHA-256:
  `bfa87d8a0848981e867ed134869eaf0c8cbfadb2603ce5c680187f252657c9fd`
- detector contract SHA-256:
  `02e2b9c7cedbe5079379abf49fe93599e3c4a3269acc23050975f1b87d60f367`
- terminal record SHA-256:
  `b0cd59752f4f31ac54a6a73a336a407da6a9254a25cbe6886a051d333e69d63a`
- source45 candidate retired: `true`
- current source replayed: `true`

## Static replay

- variables: `44855`
- clauses: `732123`
- proof-backed source-order clauses: `46`
- solver return code: `10`
- verdict: `SAT`
- proof verified: `false` (no UNSAT proof was produced)

The surviving selected rows are:

```json
{"0":[2,3,4,11],"1":[0,2,6,8],"2":[4,7,10,11],"3":[1,2,4,6],"4":[0,6,7,11],"5":[0,1,3,10],"6":[0,2,5,7],"7":[1,3,6,8],"8":[5,6,9,11],"9":[2,8,10,11],"10":[0,1,9,11],"11":[3,5,7,8]}
```

The next refinement target is this exact source46 survivor. Any source47 cut
must again be source-pinned, replayable over all 48 frozen orders, and consumed
through a named Lean theorem before journal migration.
