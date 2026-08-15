# Exact17 post-SAT refinement audit (pre-child32)

Scope: read-only inspection of the PIQD response ingress, exact17 analysis,
motif enumeration/minimization, Lean emission, successor-CNF wiring, and
publication artifacts. I did not launch PIQD, a solver, or a Lean build.

## Findings (severity ranked)

### HIGH — certificate re-enumeration ignores the authenticated named order

The current analysis artifact says `named_orders: [1]`
(`scratch/exact17-lean-to-sat/piqd-thirty-first-root-model-analysis.json:5-7`).
The top-level generator correctly selects that order when enumerating the
237 records (`scripts/generate_exact17_thirty_first_all_cancellation_refinements.py:297-306`),
but `choose_exact_support_record`, used for every forward and reflected
certificate, hard-codes `tuple(range(N))`
(`scripts/generate_exact17_twenty_eighth_all_cancellation_refinements.py:76-83`).
It therefore emits occurrence data certified in order 0 while the analysis
and generated guarded clauses are for order 1. The source semantics are order
guarded (`lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSourceCnfCdefg.lean:172-194`),
and Lean consumes the supplied forward/reverse data in the occurrence proof;
there is no generated-data check binding its order to the analysis order.
The old export validator has the same canonical-order replay
(`scripts/validate_exact17_thirtieth_model_refinements_export.py:121-127`).
This is a child32 soundness blocker unless order-1/order-0 certificate
equivalence is proved and checked explicitly.

### HIGH — analyzer CLI permits caller-supplied trust-anchor replacement

The analyzer has fixed production constants
(`scripts/analyze_exact17_thirty_first_root_model.py:21-27`), and its model/CNF
replay checks are otherwise strict (`:52-142`). However, all trust anchors are
overridable by CLI flags (`:276-286`) and are passed directly into validation
(`:290-306`). The result unconditionally reports
`production_authenticated: True` (`:327-342`). Thus a caller can provide a
different CNF/model/job and matching self-selected hashes/count, and receive a
production-authenticated report. Existing tests cover schema and atomic output
but not rejection of alternate authorization anchors
(`scripts/test_analyze_exact17_thirty_first_root_model.py:35-93`).
Production use needs a fixed release profile or an explicit non-production
mode; otherwise this report is provenance-ambiguous.

### HIGH — generated Lean outputs are not transactionally published

Each temporary file is staged durably, but the final replacements are a
sequential loop over shards/coordinator followed by the ledger
(`scripts/generate_exact17_thirty_first_all_cancellation_refinements.py:386-398`).
A crash or concurrent reader can observe a mixed old/new shard set, or new Lean
files with the old ledger; there is no generation lock or reader-side
transaction/manifest gate in this publication path. Calling the ledger a
“publication marker” does not make the multi-file replacement atomic
(`:391-395`). The ledger does record output hashes
(`:365-383`), so consumers can detect this only if they actually verify all
hashes before use.

### MEDIUM — transitive producer/source provenance is under-bound

The generator authenticates the analysis and parent ledger bytes and schema
(`scripts/generate_exact17_thirty_first_all_cancellation_refinements.py:321-325,365-370`),
but does not hash/replay the parent CNF despite declaring `PARENT_CNF_SHA256`
(`:27-31`), nor bind the producer-bank implementation, this generator, the
Lean source theorem/import version, or the `ORDERS` table. A stale ledger or
code/theorem drift can therefore produce a byte-consistent child ledger without
an end-to-end source-to-CNF provenance gate.

### LOW — terminal identity hash is accepted but not recomputed

`validate_terminal_artifact` only requires a nonempty identity-hash string;
it does not recompute it from the terminal's CNF/backend/profile/manifest
fields (`scripts/analyze_exact17_thirty_first_root_model.py:190-240`). The
hard-pinned model/CNF/job checks reduce the practical impact, but the terminal
identity field is not independently authenticated.

## Completeness and consistency checks performed

- No first-hit-only break was found: enumeration is exhaustive and fails on
  `max_cores` overflow (`scripts/generate_exact17_thirty_first_all_cancellation_refinements.py:305-319`).
  `path_hits` intentionally counts row incidences and ignores flip transport
  steps (`scripts/generate_exact17_twenty_eighth_all_cancellation_refinements.py:51-59`).
- Current ledger reports 237 records, 135 distinct supports, 84 minimal
  supports, and 336 emitted clauses
  (`scratch/exact17-lean-to-sat/audit-child32-regeneration/ledger.json:2-3,35203-35209`);
  a read-only signature check found 336 unique raw clause signatures (no
  duplicate-clause or dropped-entry evidence in this artifact).
- The Lean successor structurally appends the parent CNF and the 336-clause
  suffix, with source-assignment coverage split over parent/suffix
  (`lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenThirtyFirstModelRefinements.lean:61-82`).
  This confirms list wiring, not the order mismatch above.
- Analyzer output uses fsync+replace for its single report
  (`scripts/analyze_exact17_thirty_first_root_model.py:257-273`), and the
  inherited PIQD runner has a transaction lock; those local mechanisms were
  not findings.

## Verdict

Do not treat the current child31-to-child32 path as soundly promoted: the
order-1 analysis versus order-0 certificate re-enumeration is the direct
semantic blocker. Independently, harden production authorization and publish
the Lean shards/ledger under a verifiable transaction boundary before relying
on the generated successor CNF.
