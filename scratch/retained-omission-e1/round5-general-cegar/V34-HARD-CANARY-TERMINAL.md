# V34 retained-omission hard-canary terminal audit

Date: 2026-08-03

## Classification

The source-frozen v34 hard canary is terminal and authenticated. It is a
diagnostic obstruction, not a Lean proof, an exhaustive finite certificate,
or a countermodel. All twelve hard exact-15 `DDD` cases exhausted their wall
clock budgets with status `UNKNOWN`.

The result retires v8--v34 as an active timeout-, seed-, or normalization-
tuning lane. A successor is justified only after adding a new source-entitled
semantic theorem or a certificate-producing backend. The post-round audit
found one such theorem candidate, described below; it does not itself close a
case until it is proved, wired, and rerun under a new frozen contract.

The coordinator-interface frontier is unchanged: the retained-omission anchor
still reaches eight terminal obligations, and this checkpoint introduces no
Lean `sorry`.

## Frozen invocation and authentication

The canary ran from source checkpoint `a5dc3156` with twelve local workers:

```text
round5_cegar_v34.py hard-canary
  --timeout-ms 300000
  --bool-timeout-ms 30000
  --workers 12
  --max-assignments 256
  --replay-timeout-ms 30000
  --raw-probe-timeout-ms 1000
  --seed 97
  --artifacts artifacts-v34-hard-canary-production1
```

The durable run is:

```text
artifacts-v34-hard-canary-production1/
  20260803T194133.633360Z-hard-canary-pid27983
```

The aggregate `summary.json` SHA-256 is
`3e90d6e8784f11fffaa9b8c33dc8e2ac845b062d92e95b9eaed80aeb1f4db18d`.
The frozen source contract contains 56 entries. Independent replay of the
v34 provenance checker succeeded, all twelve child results passed the exact
child validator, and recomputation of all twelve result-file hashes found no
mismatch.

## Terminal outcome

The run ended after 361.66 seconds of aggregate wall time with:

- 0 `SAT` cases;
- 0 terminal `UNSAT` cases;
- 12 `UNKNOWN` cases; and
- 0 contract or runtime errors.

Every case reports `v34_wall_clock_budget_exhausted`. The Boolean prepass took
10.88--13.29 seconds per case, returned `sat_no_cut` in every case, and learned
zero cuts. No power-pattern row was selected.

The workers checked 225 Boolean assignments. Every checked assignment was
metrically `UNSAT`, but no Boolean case was exhausted. The learned blockers
split as follows:

- 104 compact raw-replay cores, of sizes 4--17;
- 121 complete 1,076-literal assignment blockers; and
- 225 distinct projected-core hashes, with no repeated core.

Thus the run found abundant local metric inconsistency but no reusable finite
cover of any case. The 121 full-assignment blockers are especially strong
evidence that increasing only the timeout or worker count is not a convergence
strategy.

## Where the time went

Across 121 normalized primary-plus-fresh-replay pairs, the measured check time
was 1,905.38 seconds. Of that, 1,831.73 seconds was normalization, 47.25
seconds solver setup, and 26.04 seconds solver checking. The largest
normalization components were weighted pseudo-Boolean rewriting, raw-PB
inventory, logic audit, tracker scan, and the pre-normalization PB audit.

Fresh reconstruction cost another 152.87 seconds, almost entirely formula
hashing. Assignment scopes totalled 3,116.70 seconds, of which 1,055.87
seconds (33.88%) remained unattributed by the phase telemetry. Journal append
time was only 2.58 seconds.

There is therefore a real implementation speed problem, but fixing it would
only make the present nonconvergent blocker sequence run faster. It would not
turn this artifact into a proof.

## Mandatory theorem-bank and core-motif audit

The sibling RVOL, legacy P97, and older general-theorem registries, including
their exhaustive JSON inventories, contain no theorem that directly closes
the recurring v34 hard cases. The indexed Lean search likewise returned no
matching theorem. Existing selected-class membership machinery supplies the
semantics used below, but not the completed contradiction.

The compact cores nevertheless exposed one repeated missing static consequence.
It appeared 14 times across six of the twelve cases. For distinct nonapex
centers `a`, `b`, and `c`, the following signed pattern is impossible:

```text
k4_a_b = true     k4_a_c = false
k4_b_a = true     k4_b_c = true
k4_c_a = true     k4_c_b = true
```

Indeed, the five positive incidences say that the selected physical radii at
`b` and `c`, together with symmetry of distance, force
`dist a b = dist a c`. Since the nonapex `k4` row at `a` is a full positive
radius class, `b` lying in that class forces `c` to lie in it as well. The
sound static clause is therefore

```text
not k4_a_b or k4_a_c or not k4_b_a or not k4_b_c
  or not k4_c_a or not k4_c_b.
```

This is source-entitled: the frozen invocation assigns full-shell semantics to
nonapex global-K4 supports through `exists_selectedClass_card_ge_four_of_hasNEquidistantProperty`
and `mem_selectedClass`. The v18 static triangle bank currently permits a
nonapex `k4` class as supporting data when `exact = false`, but only permits the
`critical` class as its exact target, so it misses this closure. Apex `k4`
supports remain selected four-subsets and must not receive this rule.

This motif is distinct from the already-audited FreshThird same-between route
and from the cyclic-alternation cut already encoded in v8.

## Decision and next gate

Do not run a v35 that merely changes budgets, seeds, worker count, or
normalization. The next admissible step is:

1. bank the nonapex full-shell six-directed incompatibility in Lean;
2. add the corresponding static clause only for source-entitled nonapex
   physical K4 rows;
3. freeze and test the changed semantic contract; and
4. rerun only the twelve hard cases as a bounded canary.

If that semantic canary still produces only unique local blockers and no case
closure, stop this lineage again and return to the normalized FreshThird
metric/global producer rather than broad higher-cardinality CEGAR.
