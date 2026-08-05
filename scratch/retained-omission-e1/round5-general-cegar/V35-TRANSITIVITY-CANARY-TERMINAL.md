# V35 nonapex full-shell transitivity canary terminal audit

Date: 2026-08-03

## Classification

The source-frozen v35 hard canary is terminal and authenticated. It is a
diagnostic obstruction, not a Lean proof, an exhaustive finite certificate,
or a countermodel. All twelve hard exact-15 `DDD` cases exhausted their wall
clock budgets with status `UNKNOWN`.

V35 successfully encoded the banked nonapex full-shell transitivity theorem,
but it did not change the qualitative behavior of the lane. This terminates
the v34--v35 transitivity-only lineage. Another retained-omission CEGAR round
is justified only after a new source-entitled metric/order theorem or a
reciprocal-incidence/common-radius producer has been proved and wired.

The coordinator-interface frontier is unchanged: the retained-omission anchor
still reaches eight terminal obligations. V35 adds no ninth leaf and closes no
existing leaf.

## Frozen invocation and authentication

The canary authenticated Git commit
`61d11be061328c9b9b64959143491229b2a7e257` and the enumerated HEAD-source
snapshot while running with twelve local workers:

```text
round5_cegar_v35.py hard-canary
  --timeout-ms 300000
  --bool-timeout-ms 30000
  --workers 12
  --max-assignments 256
  --replay-timeout-ms 30000
  --raw-probe-timeout-ms 1000
  --seed 97
  --artifacts artifacts-v35-hard-canary-production2
```

The durable run is:

```text
artifacts-v35-hard-canary-production2/
  20260804T010052.296344Z-hard-canary-pid46063
```

The aggregate `summary.json` SHA-256 is
`4b6447ccd412bd9714f6352571c8cd97220ca6d148d778ff0c2a9f194b248353`.
The top-level `head_source_sha256` manifest contains 59 entries, while
`source_contract.files` contains 16 role entries over 14 unique files; the
top-level provenance separately records the exact Git commit. The focused v35
contract suite passed 20/20 tests. The in-run aggregate reports
`child_contract_valid = true`, all twelve child results passed the exact child
validator, and recomputation of all twelve result-file hashes found no
mismatch. No separate durable replay transcript is claimed here.

The driver exited with status 2 because the aggregate is incomplete. That is
the intended fail-closed terminal policy for an all-`UNKNOWN` run, not a
runtime or authentication failure.

## Semantic delta

For every ordered triple of distinct nonapex centers `P`, `C`, and `M`, v35
adds the clause

```text
not k4[P,C] or not k4[P,M] or not k4[C,P]
  or not k4[C,M] or not k4[M,C] or k4[M,P].
```

There are exactly `12 * 11 * 10 = 1320` such clauses. Their source theorem is
`Problem97.false_of_mutualClassPair_sharedMember_thirdClassExcludes`. The
proof needs full physical-shell equivalence for the conclusion center `M`;
the antecedent centers `P` and `C` need only the forward selected-row
implication. V35 nevertheless restricts all three roles to nonapex centers as
a conservative, sound contract. Apex K4 rows remain forward-only
selected-four witnesses and are outside this particular encoded bank; this is
an implementation scope choice, not a theorem-level necessity.

The contract tests enumerate the complete clause set, all role orientations,
the full 64-row local truth table, the exact semantic delta, restoration after
exceptions, dirty-source rejection, a real spawned-worker provenance probe,
and hard-canary parser/dispatch/rejection behavior.

## Terminal outcome

The run ended after 367.063 seconds of aggregate wall time with:

- 0 `SAT` cases;
- 0 terminal `UNSAT` cases;
- 12 `UNKNOWN` cases; and
- 0 contract or runtime errors.

The Boolean prepass returned `sat_no_cut` in all twelve cases. The workers
checked 186 assignments, and every complete metric check was `UNSAT`, but no
Boolean case was exhausted. The learned blockers split into:

- 50 compact projected cores; and
- 136 complete 1,076-literal assignment blockers.

This is the same nonconvergent shape as v34. V34 checked 225 assignments in
361.656 seconds, with 104 compact and 121 full blockers. V35 therefore reduced
the assignment count by 17.3%, but wall time increased by 1.5% and full
assignment blockers became more dominant. The theorem is genuine pruning;
it is not a finite-cover mechanism for these cases.

## Efficiency audit

The 186 v35 assignment scopes totalled 3,241.158 seconds, or 17.426 seconds
per assignment. Normalized checks consumed 2,186.121 seconds, including
2,102.386 seconds of normalization and only 28.761 seconds of solver checking.
Fresh reconstruction consumed another 190.725 seconds. Assignment scopes left
862.119 seconds unattributed; journal appends cost only 2.193 seconds.

Relative to v34, normalization and reconstruction became more expensive even
though fewer assignments were checked. Caching the case-invariant tracker and
raw pseudo-Boolean inventories, and avoiding repeated translation and formula
hashing through an authenticated per-case fresh context, would speed future
runs. Those are engineering improvements, not a reason to continue the
present semantic lineage without a new theorem.

## Mandatory theorem-bank audit

The sibling RVOL, legacy P97, and older general-theorem registries contain no
producer that directly closes a v35 survivor. The indexed Lean search likewise
found no direct hit. Existing consumers become relevant only after one of two
missing bridges is established:

1. a reverse selected-class incidence or common-radius equality relating the
   candidate-source row to the mutual-blocker row; or
2. a genuine metric/cyclic-order contradiction for the surviving
   one-inside/one-outside cap arm.

The current data provide two common class members, not the three needed by the
shared-base U2 contradiction, and do not provide the reciprocal incidences
needed by the U5 exact-center incompatibilities. The two-outside-point cap
localization theorem also does not apply to the one-inside/one-outside arm.

## Decision and next gate

Do not launch v36 by changing budgets, seeds, worker count, normalization, or
by adding another incidence-transitivity consequence. Do not split the parent
into a ninth retained-frontier obligation merely to expose the same missing
geometry.

The next admissible computational round is bounded to one symmetry orbit and
must be gated by a proved source theorem that supplies either:

- reciprocal incidence/common radius, making an existing theorem-bank
  consumer applicable; or
- a new order-sensitive metric inequality for the one-inside/one-outside
  arrangement.

Until that producer exists, the productive lane is theorem discovery and
banking at the FreshThird/retained-omission interface, not broader or
higher-cardinality CEGAR.
