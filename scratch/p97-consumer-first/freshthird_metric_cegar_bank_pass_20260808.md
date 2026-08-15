# FreshThird metric-CEGAR bank pass (2026-08-08)

## Pilot result

`freshthird_cross_deletion_metric_cegar_20260808.results.md` is a sounder
two-level pilot than the earlier orbit scan: it uses no S4 quotient, adds the
motif-free complement to each branch, replays every returned structural model
in exact QF_LRA, and blocks a structural assignment only after cvc5 also says
`unsat`.

The six-branch pilot examined seven metric models.  Z3 returned `unsat` for all
seven.  Branch 1 produced two width-296 exact structural blocks and both had
cvc5 `unsat`; it is correctly marked `metric_unsat_bounded_pending` because
`MAX_MODELS_PER_BRANCH=2` is only a bounded sample.  Branches 2--6 each
returned one Z3-UNSAT model whose cvc5 replay timed out, so they remain
`metric_unsat_unverified_survivor`.  No branch reached structural UNSAT after
all verified blocks, and the branch limit was hit at 6/576.

The recurring structural facts are stable: every survivor has no two-centre
motif (`distinct_center_pairs=6`, `shared_pairs=0`, six insufficient-shared-
support fields), the cross direction is `1 -> 0`, and the independent mutual
pair contributes both directions.  Branch 1's verified shape is
`cross:1->0` plus `mutual:0->1,1->0`; the other branches retain the same cross
direction with mutual pairs `0-2`, `0-3`, `1-2`, `1-3`, or `2-3`.  Occupied
alias classes vary (25, 26, and 32 representatives), as do metric assertion
counts (32,743; 38,276; 87,595), so this is not one fixed metric schema.

## Exact recurring core candidates

The smallest Lean-visible equality pattern suggested by the verified branch is
three selected four-rows: two rows at one blocker centre (the cross row and
the reverse mutual row) and one row at the other centre (the forward mutual
row).  If the two same-centre rows share one bridge point and the other
centre's row contains the transferred late pair, the exact existing consumer
is `CapCrossingKalmanson.false_of_three_selected_rows_bridged_late_pair`.
Its docstring explicitly calls this “the exact equality-only consumer for the
six-premise FreshThird CEGAR core.”  The weaker two-row specialization is
`false_of_two_selected_rows_shared_late_pair`; the four-order endpoint form is
`false_of_freshThird_four_order_arms`.

This identification is conditional: the pilot report does not record the
cross/mutual slot overlap needed to construct the bridge and late pair.  The
absence of shared *blocker-shell* points is not that bridge.  A producer must
therefore extract those support memberships from each model, or prove a
source-level alternative such as the common-radius distinct-cap residual
`false_of_freshThird_commonRadius_distinctCaps_survivingRow`.

As a direct replay of branch 1's structural constraints (same order/caps and
pair `0-1`), one satisfying model had cross support
`{a1_1,b2,a3_1,w0}`, mutual `0->1` support
`{c2,a2_0,a3_1,a3_2}`, and mutual `1->0` support
`{drowCenter,sourceCenter,a3_2,a3_1}`.  Thus the first two rows share the
bridge `a3_1`, while the third row supplies the transferred pair
`{a3_2,a3_1}`—exactly the six-membership shape expected by
`false_of_three_selected_rows_bridged_late_pair`.  This is still one model,
not a universal assertion about the branch; the full producer must derive the
same bridge/late-pair disjunction for every structural assignment.

The broader bank search found the same hierarchy:

* `TwoCenterBisectorParity.false_of_two_centers_equidistant_pair_*` is the
  minimal two-centre/two-point consumer, but every pilot survivor is explicitly
  motif-free, so it cannot be the current second arm without a new producer.
* `FivePointEuclideanObstruction.false_of_five_ccw_*` supplies five-point
  orientation/equality consumers after an ordered five-point ingress.
* `KalmansonThreeEqualitySchemas.false_of_{four,five,six}_ccw_three_shell_equalities_*`
  supplies cardinality-independent three-equality schemas, but still requires
  explicit ordered boundary indices and equalities.
* `KalmansonRadiusOrderReversal.false_of_seven_ccw_radius_order_reversal_equalities`
  and its selected-row adapters are stronger seven-point consumers, not the
  smallest repeatable core here.

The required AGENTS theorem-bank registries were searched directly.  The
general-n mining report records the Kalmanson three-equality consumers and
their exact-cardinality adapters; the four certificate JSON/Markdown banks
contain no direct FreshThird metric-CEGAR producer or exact cross-deletion
schema.  Corpus-scoped Lean search found the source-facing FreshThird
producers/residuals (`freshThird_orderSelectedEndpointDeletionObstructions_or_survivingRow`,
`freshThird_acyclic_crossRetainedEndpoints_doubleDeletion_obstructsFirstApex`,
and `false_of_freshThird_commonRadius_distinctCaps_survivingRow`), but none
bridges an arbitrary motif-free metric model to the three-row core.  Agentic
search was attempted and unavailable because the configured Codex-Spark
quota is exhausted; plain corpus-scoped search was used as the fallback.

## Smallest fidelity-preserving full-run optimization

Defer and batch cvc5, but do not weaken the final trust rule:

1. In a Z3 discovery pass, keep the current exact structural block and metric
   replay.  When Z3 says `unsat`, write the SMT2 text, a content hash, and the
   complete structural assignment to a pending ledger, then provisionally add
   the block so Z3 can learn cuts and enumerate the next model.  A provisional
   block must never count as closure or be published as a theorem.
2. Deduplicate pending SMT2 texts by hash and run cvc5 in a separate batch with
   escalating timeouts (for example 1s, 10s, then 60s) and bounded parallelism.
   This avoids paying the cvc5 timeout on every model while preserving an
   independent replay for every distinct candidate.
3. Promote only hashes with cvc5 `unsat`; remove/replay any provisional blocks
   whose cvc5 result is timeout/unknown, and rerun the affected branch until
   structural UNSAT follows from promoted blocks alone.  Keep Z3-SAT,
   Z3-unknown, and unverified metric models as survivors.

This is the smallest optimization because it changes scheduling and caching,
not the source-faithful formulas or the closure rule.  Running cvc5 inline as
the current pilot does is fidelity-safe but prevents Z3 from learning cuts
after a timeout, which is why five of six branches stop after their first
candidate.

## Status

Producer/search evidence only.  No production edits, universal metric lift,
or Lean closure was obtained.
