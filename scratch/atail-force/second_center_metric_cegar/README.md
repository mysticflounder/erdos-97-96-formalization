# Fixed-placement card-12 metric CEGAR checkpoint

This directory records a bounded metric-aware CEGAR search for the two fixed
card-12 placements already used by `../second_center_query`, with cap profiles
`(4,5,6)` and `(5,5,5)`.  The reviewed `checkpoint.json` remains the stable
eight-round checkpoint; the 16-, 32-, and 64-round artifacts are immutable
extensions.  This is a fail-closed research checkpoint, not a target-faithful
producer proof.

## What is encoded

For each placement, the deterministic incidence DFS proposes a complete row
assignment satisfying the same incidence, Q-C-negation, critical-blocker, cap,
and named-label constraints as `../second_center_query`.  The proposal's exact
squared-distance equality ideal over `QQ` is then checked by:

1. Singular over `QQ`;
2. msolve in forward variable order; and
3. msolve in reverse variable order.

A row subset is accepted as a monotone no-good cut only when all three calls
return `UNIT`.  The bounded minimizer uses msolve only to propose deletions and
Singular to confirm them; the final retained cut is then rechecked by all three
engines.  No `NONUNIT`, timeout, or disagreement is converted into a cut.

The runs used Singular 4.4.1 and msolve 0.10.1.  The stable checkpoint's
explicit budget is eight CEGAR rounds per placement; every artifact uses
250,000 incidence nodes per round, six seconds per final CAS call, and eighteen
seconds for each greedy minimization pass.

## Result

Both placements reached `STOPPED_ROUND_BUDGET`, not exhaustion.  Every one of
the sixteen proposed full equality ideals was cross-checked `UNIT`, and all
sixteen yielded a cross-checked monotone cut.  Including the two bootstrap
cores, the checkpoint contains eighteen independently cross-checked `UNIT`
row cores.

The incidence DFS was inexpensive at this budget:

- `(4,5,6)`: 20, 20, 21, 31, 42, 49, 75, and 89 nodes;
- `(5,5,5)`: 58, 63, 158, 159, 231, 766, 770, and 771 nodes.

The accepted cut sizes, including the bootstrap cut first, were:

- `(4,5,6)`: 6, 7, 5, 6, 6, 5, 8, 8, 7 rows;
- `(5,5,5)`: 7, 6, 6, 8, 8, 5, 6, 6, 7 rows.

Thus this run supplies useful no-good producers but does not establish that
either fixed placement is exhausted, much less that every card-12 placement is
excluded.

### Budget extensions

`checkpoint-round16.json` and `checkpoint-round32.json` are separate fresh
discoveries.  Because minimization is wall-clock-bounded, their early cut
sequences need not extend the eight-round sequence.  `checkpoint-round64.json`
instead replays and retains the entire round-32 prefix, then continues from it;
its source record binds the round-32 SHA-256
`72f00a1aec133be635798d4aaf62cf1899c44c3223f52b10d0c2af5a0311e94f`.
The round-64 checkpoint SHA-256 is
`e6304b556ec3645c3ca541df0d63313d67f4a4c556f59e420e3ce387737f1e9a`.

All four checkpoints pass the independent structural validator.  The 32- and
64-round artifacts also pass full production replay of every saved proposal
and cut.  At round 64:

- both profiles still end at `STOPPED_ROUND_BUDGET`;
- all 128 full systems and all 128 learned cuts are `CROSSCHECKED_UNIT`;
- `(4,5,6)` reaches at most 4,644 incidence nodes, with 5--8-row cuts; and
- `(5,5,5)` reaches at most 4,380 incidence nodes, with 5--9-row cuts.

There is no exhaustion or non-`UNIT` signal.  `extension_summary.json`
(SHA-256
`81fe4371822bae0c2635f88ff39b7c404052a5cfc696d7cb0054d81063586e78`)
validates the 8/16/32/64 sequence and its mixed fresh/resumed provenance.  The
raw pre-pruning choice surface has 38 decimal digits for each profile, so
one-cut-per-round continuation is not a plausible closure procedure by itself.

## Core-shape and collapse audit

`core_analysis.json` canonicalizes each core as a center/support incidence
structure both with labels 0 and 1 distinguished and under free point
relabeling.  All canonicalizations stayed below the declared permutation cap
and were exact.  The eighteen cores give eighteen distinct types in both
modes; there is no repeated whole-core isomorphism type in this sample.

There are three five-row cores.  They are three distinct exact isomorphism
types, but two `(4,5,6)` cores (rounds 1 and 4) share a literal four-of-five-row
backbone and differ only in the remaining row centered at 6.  All three
five-row cores contain the same fixed-label hinge:

```text
row(center=1) supports {0,2}
row(center=2) supports {0,1}
```

For each core, the collapse audit adds a Rabinowitsch equation asserting that
the squared separation of distinguished points 0 and 1 is nonzero.  Eight of
eighteen expanded systems were `UNIT` in Singular and both msolve orders, so
those eight cross-check that `d(0,1)^2 = 0`.  The other ten encountered at
least one six-second timeout and remain `UNDECIDED_FAIL_CLOSED`; mixed
`UNIT`/timeout results are not promoted.  Over real coordinates, a certified
zero squared distance identifies points 0 and 1.  Over complex coordinates it
does not rule out a nonzero isotropic separation.

The direct 16-round audit has 34 cores, again all distinct in both relabeling
modes; 14 directly cross-check forced zero squared anchor distance and 20 are
fail-closed timeouts.  The canonical-only 32-round pass has 66 distinct types.
At 64 rounds, however, the 130 bootstrap/learned cores give 129 exact types in
both modes: the first repeated whole-core type occurs in `(5,5,5)` rounds 40
and 62.  Those five-row cores differ only by the unused-label swap `3 <-> 4`:

```text
round 40: 1:{0,2,6,7}  2:{0,1,9,10}  6:{2,7,9,11}
          9:{0,3,5,10}  10:{1,6,9,11}
round 62: the same rows, with 9:{0,4,5,10}
```

`core_shapes-round64.json` records this exact recurrence (SHA-256
`f2580ecb7825201720b1169c040c161a5342da26bafec9d53049d746dec9bd90`).
It contains eleven five-row cores in ten exact types; all eleven retain the
distinguished hinge described above.

## Existing-bank reuse audit

The profile `(4,5,6)` round-1 five-row core also has a verified normalized
Nullstellensatz certificate whose nonzero multipliers use only eleven of the
fifteen row equalities.  The effective row supports are:

```text
1:{0,2,6}  2:{0,1,9,10}  6:{1,2,8}  9:{0,8,10}  10:{1,6,8}
```

Before treating this as a new theorem shape, `bank_reuse_audit.py` checks it
against `DuplicateCenter`, `PerpBisector`, `EqualK4`, `EquilateralBisector`,
`ThreeTriad`, `SurplusSource`, `SixRowAnchor`, `SixPointTwoPair`,
`SevenPointOrbit`, `SevenPointCircleNetwork`, and the current
`SixPointCircleChain` family.  The checker constructs the full edge quotient
generated by row equalities, flips, and transitive closure, then exhausts every
role assignment into the seven active labels.  Role repetition is allowed
unless that family's Lean structure declares the corresponding inequality.

The required eleven-family audit has zero matches.  The mandated indexed Lean
corpus preflight also surfaced the newer equality-only
`SevenPointFiveCircleCollisionCore`; the replay checker includes it as a
supplemental twelfth family and again finds zero matches.  (The indexed
`ConvexFivePoint` and `ConvexRhombus` consumers additionally require boundary
orientation data, so equality closure alone cannot decide them.)  Thus the
effective core is genuinely outside all twelve listed equality families under
the exact checked closure model.  This is a bounded bank-negative result, not a
claim about every possible theorem family.  `bank_reuse_audit.json` binds the
subject certificate and equality hashes, every family pattern, assignment
counts, and hashes of the ten Lean files containing the twelve declarations.

The separate `repeated_core_bank_audit.json` applies the same exhaustive
closure matcher to the newly repeated `(5,5,5)` type.  It finds exactly one
existing family and one role assignment:

```text
SixPointCircleChainCollisionCore
A=0, B=1, C=2, D=6, E=9, F=10
```

Thus this recurring core needs no new metric theorem: its five rows supply all
nine edge-closure hypotheses of the existing six-point circle-chain consumer.
The audit is bound to the round-64 checkpoint, shape pass, Lean source hashes,
and bank audit; its SHA-256 is
`fe4370e4f055859c678bbfe8cf291428634cc4c59a8b69ec4dc9886b704a4e91`.

## Row-origin fidelity and the actual producer gap

`audit_row_origins.py` replays the round-64 incidence assignments and classifies
every retained row against the live finite seed's supplied `CriticalSourceRow`
inventory versus the stronger generated `global:<center>` inventory.  In each
profile, zero of 64 learned cuts has a supplied-source alias for every row, and
zero is source-only.  In particular, the compact `(4,5,6)` round-1 five-row
core consists of `supplied:u`/`global:1` plus four global-only rows centered at
2, 6, 9, and 10.  The repeated `(5,5,5)` circle-chain cores are likewise
global-only.

Consequently the named kernel consumers are not directly wireable from the
five supplied source rows.  The remaining bridge is an incidence producer
which selects the needed K4/global rows at their centers and packages their
row equalities as `EdgeClosure` hypotheses.  `row_origin_audit.json` binds this
negative fidelity result to round 64 (SHA-256
`c10c7864d8b369f257f25b299dfb1aea611059fd56a441313607a1571036c735`).

## Replay and regression commands

From the repository root:

```bash
PYTHONPATH=. .venv/bin/python -u scratch/atail-force/second_center_metric_cegar/cegar.py --check
PYTHONPATH=. .venv/bin/python -u scratch/atail-force/second_center_metric_cegar/cegar.py --check \
  --checkpoint scratch/atail-force/second_center_metric_cegar/checkpoint-round32.json
PYTHONPATH=. .venv/bin/python -u scratch/atail-force/second_center_metric_cegar/cegar.py --check \
  --checkpoint scratch/atail-force/second_center_metric_cegar/checkpoint-round64.json
PYTHONPATH=. .venv/bin/python -u scratch/atail-force/second_center_metric_cegar/analyze_cores.py --check
PYTHONPATH=. .venv/bin/python -u scratch/atail-force/second_center_metric_cegar/analyze_cores.py \
  --checkpoint scratch/atail-force/second_center_metric_cegar/checkpoint-round16.json \
  --output scratch/atail-force/second_center_metric_cegar/core_analysis-round16.json --check
PYTHONPATH=. .venv/bin/python -u scratch/atail-force/second_center_metric_cegar/analyze_cores.py \
  --checkpoint scratch/atail-force/second_center_metric_cegar/checkpoint-round64.json \
  --skip-collapse \
  --output scratch/atail-force/second_center_metric_cegar/core_shapes-round64.json --check
PYTHONPATH=. .venv/bin/python scratch/atail-force/second_center_metric_cegar/bank_reuse_audit.py --check
PYTHONPATH=scratch/atail-force/second_center_metric_cegar .venv/bin/python \
  scratch/atail-force/second_center_metric_cegar/repeated_core_bank_audit.py --check
PYTHONPATH=. .venv/bin/python scratch/atail-force/second_center_metric_cegar/audit_row_origins.py --check
PYTHONPATH=. .venv/bin/python scratch/atail-force/second_center_metric_cegar/summarize_extensions.py --check
PYTHONPATH=. .venv/bin/python scratch/atail-force/second_center_metric_cegar/resume_smoke.py --check
PYTHONPATH=. .venv/bin/python -m unittest scratch/atail-force/second_center_metric_cegar/test_cegar.py
```

The first command deterministically replays every saved incidence round,
verifies that each saved cut is a subset of the replayed proposal, and reruns
the three exact ideal checks.  The second deterministically recomputes all
canonical forms and Rabinowitsch-system hashes while validating the saved
three-engine verdict records.  It intentionally does not rerun the bounded
collapse probes because CAS wall-clock timeouts are load-sensitive.  To refresh
those probes independently without overwriting reviewed evidence, use:

```bash
PYTHONPATH=. .venv/bin/python -u scratch/atail-force/second_center_metric_cegar/analyze_cores.py \
  --output /tmp/second-center-core-analysis-recheck.json
```

Any refreshed timeout remains undecided and may differ from the checkpoint
under a different machine load.  The unit tests independently check hashes and
structure, mutation rejection, monotone-cut behavior, fail-closed collapse
accounting, the five-row motifs, and canonical-signature invariance under
relabeling.

For a fresh bounded discovery, write to a new path first so the reviewed
checkpoint is not overwritten:

```bash
PYTHONPATH=. .venv/bin/python -u scratch/atail-force/second_center_metric_cegar/cegar.py \
  --discover --max-rounds 8 --output /tmp/second-center-metric-cegar.json
```

`--max-rounds` must be positive and is embedded as
`budgets.max_rounds_per_case` in the generated checkpoint.  Omitting it uses
the reviewed default of eight.

To resume an immutable budget-stopped checkpoint without re-minimizing its
prefix, provide it explicitly and write the continuation to a new file:

```bash
PYTHONPATH=. .venv/bin/python -u scratch/atail-force/second_center_metric_cegar/cegar.py \
  --discover \
  --resume-from scratch/atail-force/second_center_metric_cegar/checkpoint-round32.json \
  --max-rounds 64 --output /tmp/second-center-metric-cegar-round64.json
```

`resume_smoke.json` uses a deterministic fake oracle/minimizer to verify that a
fresh budget-2 run is byte-identical to budget 1 resumed to budget 2 for both
profiles, while production checkpoints still replay every saved algebraic
system.

## Scope boundary

The exact omissions and verdict policy live in `manifest.json`.  In
particular, this search covers one fixed label placement per profile, omits
off-radius disequalities and several pieces of live target geometry, trusts the
Python finite search, and produces neither a replayed Nullstellensatz
certificate nor a Lean producer theorem.  `NONUNIT` would only mean a nonempty
complex equality variety, not a real target witness.
