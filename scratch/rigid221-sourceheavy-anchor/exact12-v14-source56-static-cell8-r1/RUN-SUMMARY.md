# Exact-12 v14 source56 cell-8 static replay

## Classification

`SAT`. This checkpoint installs 56 proof-backed source-order cuts, but it does
not establish terminal UNSAT, all-cell coverage, a general-cardinality lift, or
closure of a live Lean theorem.

The returned survivor has neither an admitted cut stage nor a detector stage in
the static replay.

## New source56 cut

The source55 survivor is excluded by three selected rows centered at `4`, `9`,
and `10`. The cardinality-independent three-row core
`(a,x,b,c,y) = (5,9,0,10,4)` covers all 48 frozen source orders.

- Lean source:
  `ExactTwelveRigid221MixedV7Cell8TwentyFifthPositiveCut.lean`
- source bytes: `3964`
- source SHA-256:
  `77b562af529f3a3432e6fd5df16cbcecdec1fd9322838254674fab965369226f`
- canonical source cube SHA-256:
  `193626f4fb4e4780230c59be1470cc82c44bc56b1427d140f96b7cac4fd14649`
- raw source55 survivor JSON SHA-256:
  `b6ae53622c7b413c3a151afa5139aa1738d3c57bd237a62d5d33b54f04b36584`
- certificate SHA-256:
  `44f698760b4735dff1aa8f1a0adc05df1d0682ce990468286820509bf26889fc`
- learned clause: `(-504, -2118, -2484)`
- source-order coverage: `48/48` (`24` direct, `24` mirror)

Direct Lean elaboration passed. A direct `#print axioms` audit found no
`sorryAx`; only `propext`, `Classical.choice`, and `Quot.sound` occur. The
guarded module build was also attempted, but an already-modified dependency,
`ExactTwelveRigid221V14JobCnf`, exceeded the wrapper's 16 GiB memory cap before
Lake reached this module. That failure is not evidence about the source56
declarations; it records the current full dependency-build state honestly.

The Python binding authenticates the canonical cube contents, not the path or
raw serialization of the diagnostic source55 `survivor-cube.json`. The journal
migration below is the provenance check that replays and retires the actual
source55 candidate.

## Authenticated migration

The source55 journal was replayed into:

`exact12-v14-source56-cell8-migrated-r1.jsonl`

- records: `871`
- bytes: `126296724`
- output SHA-256:
  `87ea90bcb67dfca56c0bd312ac43d9937c9862d7a33d956f579fff4f7f0e9e3b`
- detector contract SHA-256:
  `3fcf20b2ca7e1caa3ac152950164e1c342a1adfadf4ac45d1896b23b17d0a4ee`
- terminal record SHA-256:
  `e7352d1b3fc04c85f8107e207d88b9d514e4dcbb0cf487e022321cc7e697f859`
- source55 candidate retired: `true`
- current source replayed: `true`
- source snapshot replayed: `true`

## Static replay

- variables: `44855`
- clauses: `732133`
- proof-backed source-order clauses: `56`
- solver return code: `10`
- verdict: `SAT`
- proof verified: `false` (no UNSAT proof was produced)
- CNF bytes: `17227386`
- CNF SHA-256:
  `4960c8a87629c1ecd6a0a0d4fd50dafa55326990717289a87fe3ac32d5ac5b60`
- raw survivor JSON SHA-256:
  `0c60171ab9a04136d661cedd470ef06248b0fa6c04f880303191d4d37609c0eb`
- canonical survivor cube SHA-256:
  `331ce536e415bce95c48e1b622330e8f1a17a9c4e2ec84f8895e2cc7881bf6c7`

The surviving selected rows are:

```json
{"0":[1,2,3,4],"1":[0,2,6,8],"2":[0,3,10,11],"3":[0,2,7,11],"4":[6,7,10,11],"5":[0,3,6,7],"6":[0,4,9,10],"7":[1,5,6,8],"8":[3,5,6,9],"9":[1,4,5,7],"10":[2,5,9,11],"11":[2,3,7,8]}
```

The next refinement target is this exact source56 survivor. It still requires
source57 core mining, Lean formalization, source binding, independent audit,
and authenticated migration before another proof-backed clause can be
installed.
