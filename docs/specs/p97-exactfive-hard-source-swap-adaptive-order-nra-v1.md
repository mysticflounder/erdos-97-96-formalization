# P97 exact-five hard source-swap adaptive order/NRA diagnostic v1

Status: implementation specification. No run is authenticated by this document.

## Purpose and claim boundary

This lane performs one bounded two-level diagnostic for authenticated alias
profile 1697. It asks the frozen QF_LIRA order producer for rank orders other
than the two already tested by the fixed-order QF_NRA canary, then submits at
most two exactly replayed fresh orders to a newly built coordinate QF_NRA
query.

The two rank-order exclusions are `ENUMERATION_CONTROL` clauses. They are not
semantic refinements, learned mathematical consequences, or source-backed
cuts. A structural terminal UNSAT proves only that the authenticated old
formula plus those two enumeration controls has no model. A planar UNSAT
rejects only its fixed order cell. A planar SAT is only an exact-coordinate
model of the encoded system. No result establishes source realization,
exhausts all alias profiles or rank orders, closes a live Lean leaf, or supports
promotion.

## Frozen inputs

- Profile index: `1697`.
- Profile SHA-256:
  `59131cdcdaa474ab022dffd6ab990276ad1893caf70eb55940be3ec75a62ad5e`.
- Structural producer:
  `census/card_head/exactfive_hard_source_swap_order_piqd.py`.
- Coordinate producer:
  `census/card_head/exactfive_hard_source_swap_nra_piqd.py`.
- Shared PIQD adapter:
  `census/p97_search/phase3_piqd_smt_source_adapter.py`.

The wrapper imports these producers and does not alter them. Every query source
snapshot binds their exact bytes and the wrapper bytes.

## Initial enumeration controls

The initial block list is read directly from the frozen NRA producer's ordered
`ORDER_IDS`/`ORDERS` mapping:

1. `c000,c003,c004,c002,c006,c001,c010,c009,c005,c008,c007`;
2. `c000,c003,c004,c002,c006,c001,c007,c009,c010,c008,c005`.

Each order must be a full permutation of the authenticated quotient class
universe. Its SMT-LIB assertion has the exact form

```smt2
(assert (not (and (= rank_c000 0) ... (= rank_cNNN 10))))
```

with one equality for every class and rank. Canonical JSON of the ordered class
list supplies the order digest. Blocks are emitted in the frozen NRA order-ID
order; no sorting, symmetry quotient, partial prefix, or local enumeration is
permitted.

## Structural query

Schema: `p97-exactfive-hard-source-swap-adaptive-order-system/v1`.

The `ROOT_STATIC` command prefix is byte-for-byte the command tuple returned by
the current frozen structural producer for profile 1697. The only appended
commands are the two full-permutation `ENUMERATION_CONTROL` assertions above.
The semantic input binds:

- the complete old semantic system and its digest;
- the old SMT journal digest;
- the complete new semantic system and journal digests;
- the old formula inventory plus enumeration-control counts;
- a clause-class inventory with zero `SEMANTIC_REFINEMENT` entries; and
- false claim flags.

A structural SAT result is eligible to produce a fresh order only when all of
the following pass:

1. adapter custody and exact source-manifest replay;
2. exact descriptor and journal reconstruction from current producer bytes;
3. the frozen structural producer's full rational replay of every rank,
   distance, row, radius, source-strict, skeleton, and Kalmanson assertion;
4. exact reconstruction of the total rank permutation; and
5. rejection against both full-permutation enumeration controls.

The PIQD daemon's `model_replay.outcome` may be `SATISFIED` or `UNDETERMINED`
for this stage because the old journal defines helper functions. Local exact
semantic replay must still be accepted. `VIOLATED`, missing replay, incomplete
values, malformed ranks, or semantic replay failure is fail-closed.

Fresh orders are extracted only from verified PIQD adapter result trees, in
the adapter's fixed engine order (`z3`, then `cvc5`). Duplicate orders are
removed by exact tuple identity, preserving first occurrence. The cap is two.
There is no local permutation enumerator or fallback order generator.

## Planar query

Schema: `p97-exactfive-hard-source-swap-adaptive-planar-system/v1`.

For each accepted fresh order, the wrapper reconstructs the same coordinate
system shape as the frozen canary:

- 22 real coordinate declarations for 11 quotient classes;
- four gauge assertions pinning rank-zero to `(0,0)` and rank-one to `(1,0)`;
- all 165 positive signed-area assertions in the supplied order;
- 13 row equidistance equalities from rows `T0`, `K1`, `K2`, and `L`;
- the `c2` old/replacement radius disequality; and
- the source-strict squared-distance inequality
  `dist²(e,d) < dist²(e,a)`.

The wrapper has its own current-system validator. It reconstructs the complete
system from the authenticated profile and the supplied order and requires
object identity with the descriptor's semantic input.

Every planar target binds a self-hashed linear-origin record containing:

- linear query ID and descriptor digest;
- complete linear adapter-result digest;
- engine ID and canonical engine-record digest;
- exact semantic-replay digest;
- model and get-value digests;
- complete fresh order and order digest; and
- profile index and profile digest.

The record appears both in planar semantic input and as its own exact source
snapshot. Any field or self-hash drift rejects the planar query.

A planar SAT is accepted only when PIQD reports daemon
`model_replay.outcome = SATISFIED` and the wrapper's exact `Fraction` replay
checks the gauge, every signed area, every row equality, the radius
disequality, and the source-strict inequality. `UNDETERMINED` is not accepted
for planar SAT.

## Validation controls

Both stages run positive and negative controls before target interpretation.

- Structural positive: the frozen four-class strict Kalmanson control, expected
  `SAT/SAT`, with exact old-producer replay.
- Structural negative: the frozen four-class failing control, expected
  `UNSAT/UNSAT`.
- Planar positive: four pinned points in strict positive cyclic order, expected
  `SAT/SAT`, with exact coordinate replay.
- Planar negative: the fourth point reflected below the axis, expected
  `UNSAT/UNSAT`.

A control mismatch aborts the lane without publishing a terminal record.

## ENCODED / OMITTED ledger

ENCODED:

- the full authenticated profile-1697 structural QF_LIRA system;
- the two exact full-permutation enumeration controls;
- the complete rank and distance readback requested from each structural SAT;
- for each fresh order, the complete direct-coordinate QF_NRA system listed
  above;
- structural and planar positive/negative controls;
- exact local structural and coordinate replay; and
- source, query, result, engine, witness, launch, and terminal custody hashes.

OMITTED:

- a source-to-abstract ingress theorem for this diagnostic;
- an abstract-to-source realization theorem for a structural or coordinate
  model;
- rank-order coverage beyond the one bounded request and at most two returned
  witnesses;
- any proof that a planar UNSAT order block preserves all source targets;
- any semantic refinement or F1--F7 cut-admission evidence;
- survivor discharge, alias-profile exhaustiveness, and a general-cardinality
  lift;
- checked QF_NRA UNSAT certificates; and
- a named source-clean Lean consumer and Lean-ingress binding record.

Consequently, enumeration completion, structural UNSAT, cross-engine agreement,
or one/two planar results remain diagnostic facts about authenticated finite
formulas.

## Bounded execution and statuses

The run has exactly one round, one structural target query, at most two planar
target queries, `workers` restricted to integers in `1..2`, and a timeout that
must convert exactly to an integral millisecond in `1..3600000`. All solver
calls go through the shared PIQD SMT source adapter. No direct solver process is
permitted.

Terminal statuses are:

- `NO_FRESH_SAT`: the structural engines agree and no verified fresh SAT order
  exists;
- `TARGET_RESULTS`: at least one fresh order was tested and every planar target
  has a non-UNKNOWN agreeing engine pair;
- `STRUCTURAL_UNKNOWN`;
- `STRUCTURAL_DISAGREEMENT`;
- `PLANAR_UNKNOWN`; or
- `PLANAR_DISAGREEMENT`.

UNKNOWN and disagreement never create an order block or semantic consequence.
The terminal record also carries a coarse `status_class` so consumers cannot
mistake those outcomes for target results.

## Artifact lifecycle and resume

Governed root:
`scratch/runs/exactfive-hard-source-swap-adaptive-order-nra-20260903/run-0001/`.

Before any solver request the wrapper creates and validates:

- checkpoint-bound `run_manifest.json` (`worktree-run-manifest/v1`);
- create-once, self-hashed `events/launch.json`; and
- the `artifacts`, `events`, and `tmp` output classes.

The run manifest repeats the checkpoint's `base_head`, not the execution-time
HEAD, and binds exact source and input digests. Every adapter query publishes an
atomic create-once artifact directory. The wrapper revalidates every bound
file, source snapshot, solve digest, model replay, semantic replay, and absence
of unbound files before consuming it.

The create-once, self-hashed `events/terminal.json` binds the manifest, launch,
controls, structural result, ordered fresh witnesses, origins, and planar
results. On completed resume, the wrapper creates no transport and makes no
solver call: it reconstructs every query from current sources, replays every
artifact tree, recomputes fresh-order extraction and the terminal record, and
requires exact equality. Partial, tampered, stale-source, extra, or missing
output fails closed.

The durable post-run summary path is
`docs/computation/exactfive-hard-source-swap-adaptive-order-nra-20260903/run-0001-summary.json`.
It is not created by implementation or tests and must be derived only after a
completed artifact replay. A separate publication checkpoint must own that
summary; the execution checkpoint does not claim a result that does not yet
exist.

## CEGAR interpretation

This is a two-level bounded diagnostic, not a semantic-refinement loop. The
structural map proposes a complete order; the coordinate query tests that exact
cell. The two initial blocks exist solely to request different models from the
same structural formula. No planar outcome is automatically appended to a
future structural query. Any successor round that wishes to add a planar-UNSAT
order block must start a fresh governed namespace and retain the block's
`ENUMERATION_CONTROL` classification unless a separate source-preservation
contract is proved.
