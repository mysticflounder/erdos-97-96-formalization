# Exact-12 v14 source45 cell-8 static replay

## Classification

`SAT`. This checkpoint installs 45 proof-backed source-order cuts, but it does
not establish terminal UNSAT, all-cell coverage, a general-cardinality lift, or
closure of a live Lean theorem.

The returned survivor has neither an admitted cut stage nor a detector stage in
the static replay.

## New source45 cut

The source44 survivor is excluded by the three selected rows centered at
`0`, `2`, and `10`. They instantiate the convex-five core
`(a,x,b,c,y) = (11,0,3,10,2)`, whose orientation follows from the frozen source
blocks alone. Exhaustive enumeration of the 26 common-five cores found no
one-row or two-row cover in this detector family; two three-row covers exist,
and this checkpoint uses one of them.

- Lean source:
  `ExactTwelveRigid221MixedV7Cell8FourteenthPositiveCut.lean`
- source bytes: `2814`
- source SHA-256:
  `0df2806f84ee4503ec7d075d17e2df98e1ec44c2a0f9753fec0ac97bab981c94`
- certificate SHA-256:
  `5c16150c4956dc3d2cdc1af846c50ea5df146d813ab03e94206de1a0606ef427`
- learned clause: `(-21, -166, -2425)`
- source-order coverage: `48/48` (`24` direct and `24` mirror)

Direct Lean elaboration of the generic three-row theorem and the source45 cut
passed. The two focused source-order/bank tests passed, and Ruff reported no
errors. A read-only audit found that the first Python binding named the generic
theorem while authenticating the cut-wrapper file. The binding was corrected to
name `commonOrientationCoverage_mixedV7Cell8Fourteenth`, and all checks were
rerun before the authenticated r2 migration below. The r1 source45 migration
and static replay are superseded and are not promoted by this checkpoint.

## Authenticated migration

The source44 journal was replayed into:

`exact12-v14-source45-cell8-migrated-r2.jsonl`

- records: `871`
- bytes: `126296724`
- output SHA-256:
  `69b324f18c96405d0a79e2e2f623f5fce9313dc19c87e98a2b667fa706131e77`
- detector contract SHA-256:
  `b0701d46cef44dbc4410beaeb8073e6b7a1778286702b23e2c3577b65dd554a9`
- terminal record SHA-256:
  `27af4a4678d874cf02cbc0d2d92a83adcd20dfad66ee10e405cfa0c4bff74ae0`
- source44 candidate retired: `true`
- current source replayed: `true`

## Static replay

- variables: `44855`
- clauses: `732122`
- proof-backed source-order clauses: `45`
- solver return code: `10`
- verdict: `SAT`
- proof verified: `false` (no UNSAT proof was produced)

The surviving selected rows are:

```json
{"0":[3,4,9,11],"1":[0,2,6,8],"2":[0,3,10,11],"3":[2,4,7,8],"4":[0,1,5,11],"5":[0,1,9,10],"6":[0,2,3,4],"7":[1,4,6,8],"8":[3,5,6,9],"9":[2,5,6,11],"10":[1,2,9,11],"11":[1,3,6,7]}
```

The next refinement target is this exact source45 survivor. Any source46 cut
must again be source-pinned, replayable over all 48 frozen orders, and consumed
through a named Lean theorem before journal migration.
