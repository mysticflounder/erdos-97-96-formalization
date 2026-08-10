# Exact-12 v14 source53 cell-8 static replay

## Classification

`SAT`. This checkpoint installs 53 proof-backed source-order cuts, but it does
not establish terminal UNSAT, all-cell coverage, a general-cardinality lift, or
closure of a live Lean theorem.

The returned survivor has neither an admitted cut stage nor a detector stage in
the static replay.

## New source53 cut

The source52 survivor is excluded by three selected rows centered at `3`, `7`,
and `8`. The single convex-five core
`(a,x,b,c,y) = (9,3,6,7,8)` covers all 48 frozen source orders: 24 in the
forward orientation and 24 in the reverse orientation.

- Lean source:
  `ExactTwelveRigid221MixedV7Cell8TwentySecondPositiveCut.lean`
- source bytes: `4517`
- source SHA-256:
  `7806f40e8b05848be7a99a00f172a0a570186d4bab5e0b424d6e8f6dcc0c2fc0`
- source cube SHA-256:
  `53a4f05a1f9fddfda67f38aac6937e6ac9a684c8e2144df2693fbf9324dd2609`
- certificate SHA-256:
  `71fc77872514def2c33ed89d9e83a1b969739a369d7d441d24e2a1af6e3c6ca0`
- learned clause: `(-323, -1605, -2074)`
- source-order coverage: `48/48` (`24` direct, `24` mirror)

Direct Lean elaboration passed. Both Python replay modules passed all 18 tests
in 641.774 seconds, and Ruff reported no errors in the changed Python files.
An independent read-only audit confirmed the cube, core, direct row
equalities, all 48 source orders, source hash, and learned clause. A direct
`#print axioms` audit confirmed no `sorryAx` in the new theorem; only the
standard `propext`, `Classical.choice`, and `Quot.sound` axioms occur.

## Authenticated migration

The source52 journal was replayed into:

`exact12-v14-source53-cell8-migrated-r1.jsonl`

- records: `871`
- bytes: `126296724`
- output SHA-256:
  `dcab6d59139c01876c6cfa9c7a9f55331001cfe1932d1f8e924afc266c055a8a`
- detector contract SHA-256:
  `15edd95864396ad489e6fa49977aa5be033c46aa4ff4b9073b7012b6ca00e15e`
- terminal record SHA-256:
  `2024afe9d4f26f248de620246f068a374145fe253f8f67e17c83be5fc4e28f4b`
- source52 candidate retired: `true`
- current source replayed: `true`
- source snapshot replayed: `true`

## Static replay

- variables: `44855`
- clauses: `732130`
- proof-backed source-order clauses: `53`
- solver return code: `10`
- verdict: `SAT`
- proof verified: `false` (no UNSAT proof was produced)
- CNF bytes: `17227333`
- CNF SHA-256:
  `fcb82037a2b005940467505e62eebb96c90e421d9a5f84708a668636b5a258d8`
- survivor cube SHA-256:
  `e4f5091d61456c57d3a9125e97d9555d47974c909d0f295ea133fd62e87ebde2`

The surviving selected rows are:

```json
{"0":[2,3,5,11],"1":[0,2,6,8],"2":[4,6,10,11],"3":[1,2,4,8],"4":[0,1,5,6],"5":[1,2,3,10],"6":[1,5,10,11],"7":[1,3,6,8],"8":[3,5,6,9],"9":[0,2,4,5],"10":[0,3,4,9],"11":[3,4,7,8]}
```

The next refinement target is this exact source53 survivor. It still requires
source54 core mining, Lean formalization, source binding, independent audit,
and authenticated migration before another proof-backed clause can be
installed.
