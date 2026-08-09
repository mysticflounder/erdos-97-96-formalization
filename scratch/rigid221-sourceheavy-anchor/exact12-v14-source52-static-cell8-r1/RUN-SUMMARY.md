# Exact-12 v14 source52 cell-8 static replay

## Classification

`SAT`. This checkpoint installs 52 proof-backed source-order cuts, but it does
not establish terminal UNSAT, all-cell coverage, a general-cardinality lift, or
closure of a live Lean theorem.

The returned survivor has neither an admitted cut stage nor a detector stage in
the static replay.

## New source52 cut

The source51 survivor is excluded by three selected rows centered at `0`, `3`,
and `4`. The single convex-five core
`(a,x,b,c,y) = (1,3,2,0,4)` covers all 48 frozen source orders: 24 in the
forward orientation and 24 in the reverse orientation.

- Lean source:
  `ExactTwelveRigid221MixedV7Cell8TwentyFirstPositiveCut.lean`
- source bytes: `3709`
- source SHA-256:
  `af3ec71d8e571db8e3582577eea8610a81a9282980fe6230d297c83f07bc0215`
- source cube SHA-256:
  `cdac1b3045ca14558436082dab6293175a67ab1ac57c4170f1f2817d140a4e0d`
- certificate SHA-256:
  `47e557394b7ced08d2e5c95439e89513f3a5952d334f25be65c2bda58529be00`
- learned clause: `(-19, -291, -618)`
- source-order coverage: `48/48` (`24` direct, `24` mirror)

Direct Lean elaboration passed. The two focused Python replay tests passed in
79.754 seconds, and Ruff reported no errors in the changed Python files. An
independent read-only audit confirmed the cube, core, direct row equalities,
all 48 source orders, source hash, and learned clause. The audit also confirmed
no `sorryAx` in the new theorem; only the standard `propext`,
`Classical.choice`, and `Quot.sound` axioms occur.

The repository-wide formatter still proposes pre-existing formatting changes
elsewhere in `exact12_v14_ordered_coverage.py`; the new source52 block itself
was normalized without taking ownership of those older lines.

## Authenticated migration

The source51 journal was replayed into:

`exact12-v14-source52-cell8-migrated-r1.jsonl`

- records: `871`
- bytes: `126296724`
- output SHA-256:
  `ea9e35ed6ef6a76b2e508e6186aeb8eb12d0929e4077ce5c278ba77c1c555be9`
- detector contract SHA-256:
  `d224d916bbeb016baa0a474a71e18604e9df281464e91cdd50434a2d439e1c73`
- terminal record SHA-256:
  `f04f3d55d7160c587ba7d3f2fef8a29fe7abf889cc17e94d9e945ce52c56bd08`
- source51 candidate retired: `true`
- current source replayed: `true`

## Static replay

- variables: `44855`
- clauses: `732129`
- proof-backed source-order clauses: `52`
- solver return code: `10`
- verdict: `SAT`
- proof verified: `false` (no UNSAT proof was produced)
- CNF bytes: `17227314`
- CNF SHA-256:
  `749e10332b8b40a65bc22ddcfa1f96f6d58b3e7193471b231cdb099a516ed3fe`

The surviving selected rows are:

```json
{"0":[2,3,4,11],"1":[0,2,6,8],"2":[1,7,10,11],"3":[1,4,6,9],"4":[1,2,5,8],"5":[0,1,3,10],"6":[0,2,5,7],"7":[1,3,6,8],"8":[5,6,9,11],"9":[0,4,5,6],"10":[0,1,9,11],"11":[3,4,5,7]}
```

The next refinement target is this exact source52 survivor. It still requires
source53 core mining, Lean formalization, source binding, independent audit,
and authenticated migration before another proof-backed clause can be
installed.
