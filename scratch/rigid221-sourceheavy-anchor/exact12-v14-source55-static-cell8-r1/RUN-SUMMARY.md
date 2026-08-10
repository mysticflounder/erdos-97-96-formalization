# Exact-12 v14 source55 cell-8 static replay

## Classification

`SAT`. This checkpoint installs 55 proof-backed source-order cuts, but it does
not establish terminal UNSAT, all-cell coverage, a general-cardinality lift, or
closure of a live Lean theorem.

The returned survivor has neither an admitted cut stage nor a detector stage in
the static replay.

## New source55 cut

The source54 survivor is excluded by three selected rows centered at `1`, `9`,
and `10`. The cardinality-independent three-row core
`(a,x,b,c,y) = (2,9,0,10,1)` covers all 48 frozen source orders.

- Lean source:
  `ExactTwelveRigid221MixedV7Cell8TwentyFourthPositiveCut.lean`
- source bytes: `2814`
- source SHA-256:
  `78348d3c4afa4cc7d02d869669d6254feea9566dd6ef3f5a39cd7f0987bd06cd`
- canonical source cube SHA-256:
  `86ab855e71f36c341a6a35784520ab97afde2912a9c4a3a6c18ffa048926701d`
- raw source54 survivor JSON SHA-256:
  `92cd9dd872e60ccded0b604d737187384d26f37cf88bbf8fa36f2560fb6f57c2`
- certificate SHA-256:
  `074c38e374fece4967c56d6fa2826fcd4645599d48333bb561f557654b7eb0ce`
- learned clause: `(-55, -2118, -2420)`
- source-order coverage: `48/48` (`24` direct, `24` mirror)

Direct Lean elaboration passed. The focused ordered-coverage and source-bank
tests passed, and Ruff reported no errors in the changed Python files. An
independent read-only audit confirmed the three rows, seven core memberships,
all 48 source orders, learned clause, source hash, and 55-entry bank. A direct
`#print axioms` audit found no `sorryAx`; only `propext`, `Classical.choice`, and
`Quot.sound` occur.

The Python binding authenticates the canonical cube contents, not the path or
raw serialization of the diagnostic source54 `survivor-cube.json`. The journal
migration below is the provenance check that replays and retires the actual
source54 candidate.

## Authenticated migration

The source54 journal was replayed into:

`exact12-v14-source55-cell8-migrated-r1.jsonl`

- records: `871`
- bytes: `126296724`
- output SHA-256:
  `9d83189d08f8bf3aa90dca6c1443cd37bcc7bb8f4974d52e98edc813c652c4ad`
- detector contract SHA-256:
  `4f441f42941bf7eab837f6cea08eacfe7d9255ef3c8a026697c69ed5f736ff15`
- terminal record SHA-256:
  `16a7c97d3716cb9cf8a9e5ece653fdb09d37b0c816e2829e16430241b9b3c62c`
- source54 candidate retired: `true`
- current source replayed: `true`
- source snapshot replayed: `true`

## Static replay

- variables: `44855`
- clauses: `732132`
- proof-backed source-order clauses: `55`
- solver return code: `10`
- verdict: `SAT`
- proof verified: `false` (no UNSAT proof was produced)
- CNF bytes: `17227367`
- CNF SHA-256:
  `1356865510b37b398f7b44496fd2f58a2c9811de59ed0e2baef82a7cb9418f7a`
- survivor cube SHA-256:
  `b6ae53622c7b413c3a151afa5139aa1738d3c57bd237a62d5d33b54f04b36584`

The surviving selected rows are:

```json
{"0":[2,3,5,11],"1":[0,2,6,8],"2":[4,6,10,11],"3":[2,4,8,10],"4":[0,1,5,6],"5":[1,2,3,10],"6":[1,5,10,11],"7":[1,3,6,8],"8":[3,5,6,9],"9":[0,2,4,5],"10":[0,4,7,9],"11":[3,4,7,8]}
```

The next refinement target is this exact source55 survivor. It still requires
source56 core mining, Lean formalization, source binding, independent audit,
and authenticated migration before another proof-backed clause can be
installed.
