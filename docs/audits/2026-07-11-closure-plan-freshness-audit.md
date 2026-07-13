<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Closure-plan freshness audit (2026-07-11)

> **Status update (2026-07-13):** the ERASE hole counts and OPEN findings in
> this dated audit are superseded. ERASE is closed and pushed at `652fdfcb`;
> the current project inventory is 36 symbols / 80 holes, all in Front A.

Audited documents:

- `docs/closure-plan-full-spec-2026-07-09.md`
  (`cafb994dd8cc6bb8997c596e6870da378322732f0c408864d3a80b28682c4fb0`);
- `docs/closure-matrix-2026-07-09.md`
  (`0913a34967f734ef002f2f158220dd150c6882dc1807b05d9af259cc77a9fc74`);
- the generated `docs/live-blueprint.md`; and
- the source, build, census, and audit artifacts named below.

The main audit snapshot was captured at 2026-07-11 18:28 PDT. The endpoint
finite artifact landed during the review and was rechecked at 18:32 PDT. The
plan and matrix hashes above did not change across that interval.

This was a read-only audit. It changed no plan status, source, checkpoint, or
live process, and it did not run a Lean build. Claims below use the labels
PROVEN, EMPIRICALLY VERIFIED, EXACT WITHIN MODEL, or OPEN where the distinction
matters.

## Verdict

The plan is not fresh enough to serve as the authoritative dispatch surface.
Its broad decomposition remains useful, and many theorem/build facts remain
accurate, but three high-risk surfaces have drifted:

1. the current proof inventory is six declarations and 88 textual proof holes,
   not five and 87;
2. the endpoint route-(b) split is already on the proof spine while the matrix
   still presents it as an unresolved decision; and
3. Census-554 has forked into a paused theorem-oracle checkpoint and a separately
   advancing legacy bank/certification line, while the plan describes one active
   locked run.

Do not dispatch K-B-END or resume/merge Census-554 solely from the current
plan. Apply the corrections in the final section and run CTRL-GRAPH first.

## Evidence collected

### Proof surface

The following non-mutating proof-blueprint queries were run:

```text
proof-blueprint --version
proof-blueprint index --check
proof-blueprint refs --check
proof-blueprint status
proof-blueprint show-targets
proof-blueprint symbols --with-sorry
proof-blueprint anchor list
```

Current results:

- proof-blueprint version: `0.2.0-dev`;
- current build fingerprint: `a9f729a16e8f`;
- source index: 1,416/1,416 files in sync;
- source symbols: 14,589;
- six declarations with `sorry`;
- all six are on both configured publish-target spines;
- zero off-spine sorry declarations;
- `Problem97.erdos97_rhs`: OPEN, reaching the six declarations;
- `Problem96.erdos96_rhs`: OPEN, reaching the six declarations;
- mined graph: 6,782 fresh project symbols, zero stale, twelve never mined;
- active anchors at the snapshot: endpoint umbrella and pinned-surplus general-M.

The twelve never-mined symbols mean CTRL-GRAPH has not passed. The source-level
inventory is current, but this audit does not re-endorse every historical
DONE/PROVEN row against a fully reconciled current kernel graph.

The exact current source inventory is:

| Declaration | Declaration / hole locations | Code holes |
|---|---|---:|
| `U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair` | `U1LargeCapRouteBTail.lean:2657/2702` | 1 |
| `u1_largeCap_routeB_tail_liveData_false` | `U1LargeCapRouteBTail.lean:3525`, three 24-hole bands plus seven terminal holes | 79 |
| `isM44PinnedSurplusGeneralMResidualsExcluded` | `PinnedSurplusGeneralM.lean:704/791` | 1 |
| `isM44EndpointGeneralMResidualsExcluded` | `Base.lean:9511/9513` | 1 |
| `isM44EndpointResidualsExcluded` | `Base.lean:9521`, holes at 9555 and 9578 | 2 |
| `isM44NonSurplusContainmentErasedPinTripleResidualsExcluded` | `Continuation.lean:107`, holes at 183, 211, 312, and 337 | 4 |
| **Total** | | **88** |

### Census-554 state

The theorem-oracle run inspected was:

```text
scratch/census-554/separation_probe_runs/
  run-20260711T204242Z-40533-f03a883e
```

Evidence included `progress.json`, the workdir lock, `result.json` existence,
open-file state, the SQLite database plus WAL, runtime/catalog fingerprints,
and a read-only SQLite integrity/count query.

At the snapshot:

- no `frozen_separation_probe`, CaDiCaL, or `drat-trim` process was live;
- no process held the workdir lock;
- `result.json` was absent;
- `progress.json` ended at `SAT-progress`, iteration 437, updated 14:50:55 PDT;
- SQLite `integrity_check` returned `ok`;
- 1,748,013 dynamic records were durable, including 72
  `formalized_structural_core` records;
- with 156,278 static instances, the formula had 1,904,291 total instances;
- the current runtime and oracle fingerprints still match the frozen metadata.

Dynamic accounting is exact:

```text
1,602,162 migrated records
  145,779 newly learned algebra records
       72 newly learned structural records
---------
1,748,013 dynamic records
```

The mutable legacy state was separately checked:

- `scratch/census-554/bank.jsonl`: 5,839 rows, SHA-256
  `9a0af306fc88c1546bcae6b8025ced05fafa87a9a2b8110342d396d11675a576`;
- the frozen theorem-oracle snapshot remains 5,836 rows, SHA-256
  `36348d35397a494bee5ac0ab9e423c20802e7aff45fa12f0530df36a57cfc43a`;
- `frontier_loop` added `pat_05836` through `pat_05838` to the mutable bank;
- a 24-worker certification fleet and `retry_certify_drain` were live at the
  audit snapshot;
- the drain had dispatched 82 confirmed-dead certification retries and writes
  successes to a pending artifact rather than banking them automatically.

### Other finite artifacts

- `surplus_source_metric_core_results_n11_12_v5.json` has `complete = true`;
  it is no longer a rolling active artifact.
- `endpoint_direct_metric_core_residuals_n11.json` has `complete = true` and
  reports `EXHAUSTIVE = 64`: all 64 endpoint left/right placements have zero
  residuals under the twelve formalized metric cores. This is EMPIRICALLY
  VERIFIED and EXACT WITHIN THE FINITE MODEL, not yet the required Lean
  classifier, geometry bridge, or source consumer.

## Findings

### P0. Current proof inventory is incomplete

The matrix says it includes every current source-level proof hole, but its
headline and exhaustive reconciliation still give five declarations and 87
holes. The plan's source table gives the same inventory. Current source and
`docs/live-blueprint.md` give six declarations and 88 holes.

The omitted leaf is:

```text
Problem97.isM44EndpointGeneralMResidualsExcluded
```

It is load-bearing: `isM44EndpointResidualsExcluded` calls it in the `m != 5`
branch. Therefore the plan is not merely showing an old line count; it omits a
current proof-spine obligation and its producer route.

Required repair:

- update the plan table, matrix kernel rows, exhaustive reconciliation,
  `.blueprint.toml` comment, and active sorry ledger to six/88;
- add the new theorem, consumer edge, and current locations; and
- retain the old five/87 data only as an explicitly dated historical snapshot.

### P0. K-B-END contradicts the implemented route split

Matrix K-B-END still says route (b) needs Adam's decision and describes the
endpoint statement as lacking a card-five hypothesis. Current source has
already implemented route (b):

```text
isM44EndpointResidualsExcluded
  -> by_cases S.surplusCap.card = 5
     -> label-complete END-L / END-R holes
     -> isM44EndpointGeneralMResidualsExcluded
```

The plan's B.1 section and matrix END-MOD/END-L/END-R rows still describe the
old unsplit route. END-L and END-R can now close only the label-complete branch;
they cannot remove the umbrella declaration from the spine while the new
general-M leaf remains open.

The general-M endpoint leaf also cannot consume K-B-PIN unchanged:
`PinnedShellOK` requires the Moser apex in the pinned row, whereas endpoint
escape forces it out of the escaped row. The required scoped extension is
recorded in `docs/audits/2026-07-11-endpoint-generalm-representability.md`:

- `EndpointLeftShellOK` and `EndpointRightShellOK` seed predicates;
- endpoint finite-classifier coverage;
- a shared `(4,2,2)` labeling/geometry bridge with endpoint seed production;
- endpoint-specific left/right source consumers.

The 64-placement finite sweep now supplies exact bounded evidence for this
route, but none of those Lean adapters is thereby proved.

Required repair:

- resolve K-B-END route (b) as implemented;
- split K-B-END-LABEL from K-B-END-GENERAL;
- scope END-L/R to `m = 5`;
- add endpoint seed, classifier, geometry-bridge, and source-consumer rows; and
- state the completed 64-placement sweep as EXACT WITHIN MODEL, not PROVEN.

### P0. Census-554 has two divergent state lines

The plan and matrix say that the theorem-oracle run is active under a four-hour
cap and holds its workdir lock. It is not active and no terminal result exists.
The correct status is:

```text
PAUSED; RESUMABLE; NO TERMINAL RESULT
```

The invocation stopped after about 59 minutes, so the four-hour cap did not
cause the stop. The cap is per invocation, not a total run deadline.

At the same time, the mutable legacy bank advanced from 5,836 to 5,839 rows and
the legacy certification backlog was active. The 5,836 count and digest remain
correct only for the immutable theorem-oracle snapshot; they are no longer the
working-bank identity.

The plan also calls `frontier_loop.py` the pipeline while the theorem-oracle
checkpoint is driven by `frozen_separation_probe.py --resume`. Because the
legacy frontier/certification machinery actually ran again, this wording now
hides a real fork rather than a harmless historical name.

Required repair:

- mark A11-RUN PAUSED/RESUMABLE and record iteration 437 plus the exact counts;
- distinguish the immutable 5,836 snapshot from the mutable 5,839 working bank;
- record the active legacy certification backlog separately;
- name both operational workflows; and
- add an explicit decision: resume the 5,836 snapshot, or perform a
  preservation-first transition of its checkpoint onto an audited 5,839-plus
  bank after adjudicating pending certification output.

No merge or resume should occur from this audit alone.

### P1. `progress.json` is not a live-process oracle

The plan instructs readers to treat `progress.json` as the live status surface.
That file records the last durable iteration; it does not prove that a process
or lock is live. Here it still says `SAT-progress` hours after the process
stopped.

It also records only the latest iteration's algebra/structural split. At the
snapshot it says `new_structural_instances = 0`, although SQLite contains 72
cumulative structural records.

Required freshness protocol:

1. terminal `result.json`, if present, controls terminal classification;
2. otherwise require a recent `progress.json` timestamp, a live process, and a
   held workdir lock before saying RUNNING;
3. if any are absent, report PAUSED or UNKNOWN and inspect the checkpoint;
4. obtain cumulative algebra/structural counts from SQLite; and
5. distinguish `budget` from `UNSAT-verified` and `combined-frontier`.

### P1. PIN-GENERAL has incompatible passages presented as current

The plan currently presents three mechanisms without consistently marking the
older two as fallback:

1. `RowwiseConfinedQDeletedClasses` as the acceptance route;
2. nonfresh escape to a metric core or strict boundary-rank descent; and
3. the later forced `m = 6`, `A.card = 11` route using a `(4,2,2)` canonical
   labeling bridge plus a checked finite classifier.

The later section and matrix identify route 3 as the current critical path with
two proof-producing gaps, while the ordering/sizing summary still describes
END/PIN as open-ended generic non-fixed-center confinement.

Required repair:

- make the forced-card-11 route the sole current PIN-GENERAL path;
- label the confinement and escape/rank-descent passages historical fallback;
- classify PIN-KQ35 and PIN-EXACT-CLOSURE consistently as fallback or optional
  partial work unless the current route explicitly consumes them; and
- make the summary and execution order agree with the detailed current route.

### P2. Completed or stale live claims remain in prose

1. The plan calls schema v5 rolling/active, but its artifact is complete.
   Record its terminal bounded summary without promoting it to a geometric
   producer theorem.
2. The plan's ownership snapshot says erased-pin, pinned-surplus, and liveData
   all have active owners. The current anchor list contains endpoint and pinned
   owners only. Keep only the instruction to query anchors live, or timestamp
   the old ownership sentence as history.
3. The plan says the preserved historical rollback process remains stopped.
   No stopped process remains; only the rollback artifacts are preserved.
4. The execution-order section still says not to start a census driver before
   the operations rows pass, even though both frozen and legacy drivers have
   run. Rewrite it as a gate on the next resume/transition rather than a claim
   about an action that has not happened.

### P2. Status vocabulary is incomplete

The defined status table does not define several statuses used by live rows,
including:

- `DONE-BOUNDED`;
- `PARTIAL-PROVEN`;
- `OPEN-FINITE-BRIDGE`;
- `CLASSIFIER PARTIAL`;
- `PARTIAL-PRODUCER`; and
- `OPEN-PRODUCER`.

Either define these precisely or normalize the rows to the existing composable
statuses (`DONE-CORE`, `PARTIAL`, `OPEN-ADAPTER`, `OPTIONAL-PARTIAL`, and so
on). An executable matrix should not require readers to infer whether an
undefined status is dispatchable.

### P3. Mechanical references have drifted

- Endpoint umbrella theorem: documented at Base line 10070, current line 9521.
- Endpoint label-complete holes: documented at 10097/10119, current lines
  9555/9578.
- New endpoint general-M theorem/hole: 9511/9513, absent from the plan.
- Erased-pin scaffold locations have moved; theorem names remain usable, but
  the recorded Base line ranges do not.
- The exact-shell theorem is misnamed in the plan and matrix. The live symbol
  is
  `Problem97.Census554.EqualityCore.false_of_criticalFourShell_exactOffCircleCore`,
  declared in `Census554/ExactShellBridge.lean`.
- Several forced-card-11 theorem names omit their enclosing
  `Problem97.CapSelectedRowCounting.SurplusCapPacket` namespace.

Line numbers are dated aids, not proof identity, but broken locations are
dispatch hazards when the corresponding row is active. Prefer theorem names
plus current paths, and refresh line numbers in the same change.

## Claims that remain fresh

The audit found no reason to retract the following scoped claims:

- both publish targets are open through the same current six declarations;
- no off-spine source declaration contains `sorry`;
- the Front-A 1+79 hole counts, pinned-general single hole, endpoint umbrella
  two holes, and erased-pin four holes remain accurate;
- `GeneralCarrierBridge.MetricCoreAlternative` still has twelve formalized
  branches, eleven raw-cube-eligible, with exact-off-circle correctly requiring
  `ExactAt`;
- the frozen 5,836-row transition snapshot, theorem-source hashes, `.olean`
  hash, build fingerprint, and axiom evidence remain intact;
- the theorem-oracle runtime fingerprint still matches its metadata, and its
  checkpoint is internally sound and resumable;
- the Python-versus-Lean trust boundary for emitted structural records remains
  correctly stated;
- sampled A11 geometry, motif, support-injection, Q3, and PIN-R/L theorem
  surfaces exist and are absent from the current sorry inventory; and
- the completed endpoint sweep is exact within its finite abstraction but does
  not itself prove the source theorem.

## Required correction order

1. Replace the five/87 inventory with six/88 everywhere that claims current or
   exhaustive authority; update the active ledger and `.blueprint.toml` prose.
2. Resolve K-B-END route (b) to match source and add the general-M endpoint
   finite/geometry/consumer rows, keeping END-L/R scoped to `m = 5`.
3. Reconcile Census-554's paused theorem-oracle checkpoint, mutable 5,839-plus
   bank, and pending certification output before any resume or transition.
4. Make PIN-GENERAL's forced-card-11 route the sole current path and mark older
   approaches as fallback.
5. Update v5, ownership, rollback, status-vocabulary, theorem-name, and line
   references.
6. Run CTRL-GRAPH: serialized relevant build(s), source index refresh, kernel
   reference refresh/check, current spine, and axiom checks for touched terminal
   theorems.
7. Only then treat the plan and matrix as the dispatch authority again.

## Acceptance conditions for the freshness repair

The repair is complete when:

- plan, matrix, active ledger, `.blueprint.toml` prose, and generated live
  blueprint agree on six current declarations and their consumers;
- K-B-END's dependency graph matches the implemented source split;
- A11-RUN names exactly one authoritative checkpoint/bank transition state and
  separately records any live certification backlog;
- no current/fallback strategy is ambiguous;
- every matrix status used is defined;
- `proof-blueprint index --check` and `refs --check` pass against the same
  current build; and
- a final read-only reread finds no active-process claim supported only by a
  stale progress file.
