# Exact-12 v14 source54 cell-8 static replay

## Classification

`SAT`. This checkpoint installs 54 proof-backed source-order cuts, but it does
not establish terminal UNSAT, all-cell coverage, a general-cardinality lift, or
closure of a live Lean theorem.

The returned survivor has neither an admitted cut stage nor a detector stage in
the static replay.

## New source54 cut

The source53 survivor is excluded by three selected rows centered at `0`, `3`,
and `5`. The single convex-five core
`(a,x,b,c,y) = (1,3,2,0,5)` covers all 48 frozen source orders: 24 in the
forward orientation and 24 in the reverse orientation.

- Lean source:
  `ExactTwelveRigid221MixedV7Cell8TwentyThirdPositiveCut.lean`
- source bytes: `3712`
- source SHA-256:
  `7ca3e854d038dfb07c6d5b4a3e9c9b676cff19b371d96992166c93a001892750`
- canonical source cube SHA-256:
  `9e461b6cd53901a1e3ccfab2c667516262ea9ce81b8f4f5ffbdd7ef2791a7b83`
- raw source53 survivor JSON SHA-256:
  `e4f5091d61456c57d3a9125e97d9555d47974c909d0f295ea133fd62e87ebde2`
- certificate SHA-256:
  `bced6baf706ef06be020195c6518a56e2d037dc46200173595552b18d034cddc`
- learned clause: `(-21, -290, -936)`
- source-order coverage: `48/48` (`24` direct, `24` mirror)

Direct Lean elaboration passed. The two focused Python replay tests passed in
86.336 seconds, and Ruff reported no errors in the changed Python files. An
independent read-only audit confirmed the cube, core, direct row equalities,
all 48 source orders, source hash, pinned consumer, and learned clause. A direct
`#print axioms` audit confirmed no `sorryAx` in the new theorem; only the
standard `propext`, `Classical.choice`, and `Quot.sound` axioms occur.

The Python binding authenticates the canonical cube contents, not the path or
raw serialization of the diagnostic `survivor-cube.json`. The authenticated
journal migration below is the provenance check that replays and retires the
actual source53 candidate. Both hashes are recorded above to keep that
distinction explicit.

## Authenticated migration

The source53 journal was replayed into:

`exact12-v14-source54-cell8-migrated-r1.jsonl`

- records: `871`
- bytes: `126296724`
- output SHA-256:
  `24be15d8040bd5d3d15a4c71346592110bfd09089d5bde6fee5f6218809d0de6`
- detector contract SHA-256:
  `89ba37a9c3f18edb2cf33cd0098820098e02e4599fbd1ba47794d8e31fb0f94b`
- terminal record SHA-256:
  `8cc37d316c243746613b1f65b841356c06d7b3d07696ca38282bf8f2c9215f10`
- source53 candidate retired: `true`
- current source replayed: `true`
- source snapshot replayed: `true`

## Static replay

- variables: `44855`
- clauses: `732131`
- proof-backed source-order clauses: `54`
- solver return code: `10`
- verdict: `SAT`
- proof verified: `false` (no UNSAT proof was produced)
- CNF bytes: `17227349`
- CNF SHA-256:
  `47c6275c143c4e99d10d0c73488629e5b9c3046599a7d31d750192ae17c770d4`
- survivor cube SHA-256:
  `92cd9dd872e60ccded0b604d737187384d26f37cf88bbf8fa36f2560fb6f57c2`

The surviving selected rows are:

```json
{"0":[2,3,5,11],"1":[0,2,6,8],"2":[4,6,10,11],"3":[2,4,8,10],"4":[0,1,5,6],"5":[1,2,3,10],"6":[1,5,10,11],"7":[1,3,6,8],"8":[3,5,6,9],"9":[0,2,4,5],"10":[0,1,7,9],"11":[0,3,4,7]}
```

The next refinement target is this exact source54 survivor. It still requires
source55 core mining, Lean formalization, source binding, independent audit,
and authenticated migration before another proof-backed clause can be
installed.
