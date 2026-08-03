# V18 interrupted production-1 global theorem-bank audit

Date: 2026-08-02

## Decision

**NO-GO for mathematical use, theorem-bank promotion, or continuation from the interrupted artifact tree.**

The run retained authenticated launch metadata only. It retained no proposed
assignment, full-assignment check, replay, blocker, model, trace, Boolean
prepass report, frozen formula, Boolean master, result, or summary. Therefore it
contains no new mathematical data to search against the theorem banks.

A later run may start afresh from the authenticated v18 sources, but this tree
is not a checkpoint and cannot justify skipping or reconstructing any CEGAR
iteration.

## Audited scope

Artifact root:

`artifacts-v18-production1/20260802T150708.553001Z-case-pid36447`

Requested case and budgets, as recorded in `invocation.json`:

- case: `fresh / DDD / kept=0 / deleted=2 / fresh=1`;
- wall-clock budget: 3,600,000 ms;
- Boolean-prepass timeout: 30,000 ms;
- replay timeout: 30,000 ms;
- assignment budget: 100,000;
- one worker.

No Lean, Lake, solver, generator, or theorem-bank search was run during this
audit.

## Durable artifact inventory

Exactly one file exists beneath the run root:

| File | Bytes | SHA-256 | Authentication |
|---|---:|---|---|
| `invocation.json` | 8,634 | `7494fedea05ce8cc2baec1bf10c4723dcd1ae0d99df57ae45975b36716d531fc` | valid JSON object; source and test pins verified below |

The case directory `fresh_DDD_k0_d2_f1/` exists but is empty. In particular,
none of the following exists:

- `boolean_prepass_v18.json`;
- `boolean_master_v18.smt2.gz`;
- `full_frozen_v18.smt2.gz`;
- `cegar_trace_v18.json`;
- `witness_v18.json`;
- `result.json`;
- run-level `summary.json`.

There are consequently no gzip blobs on which an integrity test could be
performed and no result self-hash or summary attestation to check.

## Invocation authentication

Every invocation pin checked against the current corresponding file and
matched exactly:

- v18 script: `d538401eb80bbe2ba84e2a0a50d1ab5be6cc5458a2a5788a9b13f5c89ba5489d`;
- v18 schema: `a9cc61d446ad33a8cad4e36a8a16ae7e07c5ffcb2fdec3ae07941247b72bbee5`;
- v18 focused test source: `ae03ba265f8bd19e959456dd64d2473edd9bd57252270b985018ae7d43b43e18`;
- v18 focused test log: `90e5aa8b3da26d6f0b6e0490679989c66ef217b1a5ce1db6fa05d3e0ac12292d`
  (`8 passed in 6.32s`, read from the retained log, not rerun);
- v17 script/schema/test/log pins;
- v16, v15, v14, v13, v12, v9-miner, and v8 script/schema pins;
- `uv.lock`.

All eight Lean source files named by `source_contract.files` also match their
invocation hashes. This is a source-identity check only; no Lean build or
kernel audit was performed.

The invocation additionally records the precomputed DDD static-bank manifest
as 15,684 descriptors with hash
`0b6a64872273b44b656089f384128267beeca2d8c83382c4431f8b34fde673d7`.
That manifest is launch provenance generated before the case computation. It
is not evidence that the bank reached a persisted Boolean master or eliminated
an assignment in this run.

## Recovered mathematical data

| Category | Durable count | Audit conclusion |
|---|---:|---|
| Proposed semantic-Bool assignments | 0 | no assignment record or hash exists |
| Full-assignment checks | 0 | no status, QF_LRA audit, normalized hash, or replay exists |
| Generalized blockers | 0 | no projected core, blocker formula, or blocker hash exists |
| Complete-assignment blockers | 0 | no complete blocker exists |
| SAT models or witnesses | 0 | no model or witness exists |
| CEGAR iterations | 0 | no trace exists; this is absence of durable iterations, not proof that no in-memory model was proposed |
| Terminal statuses | 0 | no result or summary exists |

The reported interruption inside
`v17._fixed_normalized_formula` while hashing normalized assertions is
consistent with the absence pattern. In the inherited v16 control flow, an
assignment is appended to the in-memory trace only after `check_assignment`
returns. Trace, prepass, master, frozen-formula, and result files are all
written only after the CEGAR loop exits. A process interruption at the stated
point therefore leaves the already-written invocation and empty case directory
but no durable assignment/check record. This is a source-flow inference, not a
reconstruction of lost in-memory state.

## Theorem-bank routing

The mandatory theorem-bank condition was evaluated and the search was skipped:
there is no actual new mathematical datum to match. The DDD bank manifest is a
pre-launch source descriptor already pinned by the invocation, while the
interrupted run persisted no assignment, core, blocker, model, or check result.
Searching the existing P97 theorem-bank registries would therefore compare
them only to an empty set and could not support a promotion or novelty claim.

## Missing information required to change NO-GO

At minimum, a fresh authenticated run must retain:

1. the Boolean-prepass report and its static-bank admission record;
2. the frozen full-formula and Boolean-master blobs with hashes;
3. the first proposed complete assignment and semantic-Bool universe hashes;
4. the completed full-assignment check record, including status, normalization
   audit/hash, and independent replay where applicable;
5. any projected core and admitted blocker with its raw replay authentication;
6. the CEGAR trace, result, summary, and external result-file hash attestation;
7. a model plus raw validation if the terminal status is SAT, or a complete
   authenticated blocker chain if the terminal status is UNSAT.

Until those exist, the interrupted tree is authenticated only as evidence that
the v18 invocation began under the pinned sources. It proves no case outcome
and contributes nothing to the global theorem bank.
