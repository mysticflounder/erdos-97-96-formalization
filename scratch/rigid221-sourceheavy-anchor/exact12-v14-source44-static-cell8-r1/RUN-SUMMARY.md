# Exact-12 v14 source44 cell-8 static replay

## Classification

`SAT`. This checkpoint installs 44 proof-backed source-order cuts, but it does
not establish terminal UNSAT, all-cell coverage, a general-cardinality lift, or
closure of a live Lean theorem.

The returned survivor has neither an admitted cut stage nor a detector stage in
the static replay.

## New source44 cut

The source43 survivor is excluded by the three selected rows centered at
`0`, `1`, and `6`. They instantiate the convex-five core
`(a,x,b,c,y) = (3,0,2,1,6)`, whose orientation follows from the frozen source
blocks alone.

- Lean source:
  `ExactTwelveRigid221MixedV7Cell8ThirteenthPositiveCut.lean`
- source bytes: `2814`
- source SHA-256:
  `00808f26c902bd3c491e982475c4eddb24b6628f2f8ed6504c324392e2f5c3d6`
- certificate SHA-256:
  `b15222c599a5bdd751cb64f3c73e65955d303f36d7b25c912bb96cef00765349`
- learned clause: `(-21, -55, -1169)`
- source-order coverage: `48/48` (`24` direct and `24` mirror)

Direct Lean elaboration of the generic three-row theorem and the source44 cut
passed. The two focused source-order/bank tests passed, and Ruff reported no
errors. An independent read-only audit also passed the core argument order, row
memberships, source binding, and finite-status classification.

## Authenticated migration

The source43 journal was replayed into:

`exact12-v14-source44-cell8-migrated-r1.jsonl`

- records: `871`
- bytes: `126296724`
- output SHA-256:
  `a627715bb652e0b998b7676b791b9ca0713f55793ef47ff3eaca96e3c526b9d6`
- detector contract SHA-256:
  `78deb00e8ebd4a93d21e70e994868656f7d138222e1e872b8548532bbfc98ecd`
- terminal record SHA-256:
  `acb0ef615fb473107d55863ec6363eb4124b22b2d8a48da6d8fde4ec24624011`
- source43 candidate retired: `true`
- current source replayed: `true`

## Static replay

- variables: `44855`
- clauses: `732121`
- proof-backed source-order clauses: `44`
- solver return code: `10`
- verdict: `SAT`
- proof verified: `false` (no UNSAT proof was produced)

The surviving selected rows are:

```json
{"0":[2,3,5,11],"1":[0,2,6,8],"2":[3,9,10,11],"3":[4,5,7,11],"4":[0,1,9,11],"5":[1,2,4,10],"6":[1,2,7,8],"7":[3,5,6,8],"8":[1,4,6,9],"9":[0,4,5,6],"10":[0,2,3,4],"11":[0,5,7,8]}
```

The next refinement target is this exact source44 survivor. Any source45 cut
must again be source-pinned, replayable over all 48 frozen orders, and consumed
through a named Lean theorem before journal migration.
