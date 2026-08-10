<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# P97 PIQD source-faithful five-omission v1

## Status and boundary

This adapter routes only discovery calls for one finite exact-12 deleted-label
structural-CEGAR shard through PIQD. It does not establish all-shard coverage,
source entitlement, a universal theorem, a PIQD proof, or Lean closure. Those
claims are all explicitly false in the lane descriptor, static manifests, and
result sidecar.

PIQD maintainer issue `#4682` remains unchanged and open. Proof-blueprint item
`019fdf9c` remains unchanged, open, and off-spine. PIQD certificate linkage is
blocked on `CERT-001`; no observational PIQD UNSAT is presented as a proof.

## Required production configuration

The production entry point is
`census.card_head.source_faithful_five_omission_piqd`. It requires both
`--piqd-base-url` and `--piqd-journal-root`; there is no default PIQD endpoint
and no local discovery fallback. The remaining shard arguments match the
legacy launcher.

The legacy direct entry point and its v2/v3 artifact parsing are unchanged.
`run_five_omission_cegar` has one additive keyword-only `discovery_solver`
seam. Omitting it preserves local discovery. Supplying it causes every
discovery invocation to receive the literal `proof_path=None`. The terminal
branch is not injectable and remains a direct call to the local
`_solve_persisted_cadical` function with the exact `terminal.drat` path.
Expected adapter input and custody failures, including malformed shared-bank
`ValueError`/`SharedFiveOmissionBankError`, are normalized by the PIQD CLI to a
single structured `PIPELINE_ERROR` record and exit status 2. Unexpected
exceptions and `BaseException` are not caught by that boundary.

## Canonical source and input identity

Before contacting PIQD, the adapter creates a content-addressed, create-once
input bundle. Its canonical descriptor binds:

- the ordered `FORMULA_FILES` list and exact bounded byte snapshot, size, and
  SHA-256 of every current file;
- the ordered `DETECTOR_FILES` list and the same exact byte metadata;
- the adapter, shared static runner, shared `phase3_cegar_wave.py` contract,
  PIQD oracle, PIQD driver, and PIQD replay source bytes;
- the eight transitive `exact12_v14` bound-job, cell-run, job, ordered-coverage,
  ordered-cut, schedule, source-order-bank, and valuation modules used by the
  imported finite source/detector contract;
- the exact deleted label and one-shard finite cardinality scope;
- the canonical variable-allocation map and hash;
- exact seed-journal and shared-bank bytes when supplied; and
- an explicit `present: false` record, with null path/hash/size/snapshot fields,
  when either optional input is absent.

`phase3_cegar_wave.py` is part of this exact source set because the adapter and
the shared runner/oracle/driver use its canonical JSON, digest, status, and
manifest validators. The remaining local transitive contract closure is bound
as well; the semantic-empty `census/global_confinement/__init__.py` package
marker is the sole excluded local import. Mutation or inode replacement of a
bound source therefore fails before transport just like a formula or detector
change.

All path components are opened without following symlinks. Reads are bounded,
regular-file-only, single-link, and checked for stable pathname, inode, size,
and modification time while read. The installed bundle uses exclusive
create-once files and retains both exact bytes and inode identity. Before and
after every PIQD call, and once more before result publication, the adapter
rechecks the bundle plus the original sources and optional inputs. Replacement
with identical bytes therefore still fails custody.

The descriptor hash is the `source_sha256` in the strict
`p97-piqd-static-source/v1` manifest. The strict
`p97-piqd-static-producer/v1` manifest embeds that source manifest and binds
the variable-map hash. Both are canonical JSON and all static-manifest claims,
including one-process and one-core claims, are false.

## Discovery and terminal protocol

For each current CEGAR formula:

1. The legacy coordinator persists the exact `discovery.cnf` bytes.
2. The adapter calls
   `make_static_piqd_solver_runner(...)(discovery.cnf, timeout, None)`.
3. The shared runner authenticates the strict manifests, enforces one
   same-job PIQD identity, retains create-once attempt custody, requires an
   exact total SAT assignment, and replays that assignment against the exact
   DIMACS bytes.
4. On SAT, the adapter converts the checked total assignment to the legacy
   positive-variable boundary. The existing coordinator then independently
   replays the exact CNF, decodes the same-labeling five-omission boundary,
   validates the source cube, validates the structural certificate, and only
   then appends a learned cut.
5. On observational PIQD UNSAT, the adapter returns an unproved discovery
   result. The existing terminal branch performs exactly one fresh local
   CaDiCaL solve over an identical persisted CNF and gives only that call the
   exact `terminal.drat` path. `UNSAT_DRAT_VERIFIED` still requires DRAT-trim
   verification and identical discovery/terminal CNF artifacts.
6. PIQD UNKNOWN, transport error, malformed output, crossed job identity, or
   any custody failure returns UNKNOWN or raises a fail-closed adapter error.
   None of these outcomes invokes local discovery or the local terminal path.

The shared runner never calls a PIQD proof endpoint and never writes a legacy
DRAT path. Its UNSAT is observational pending `CERT-001`.

## Result and claims

The legacy `summary.json` schema is not extended. At publication, the adapter
opens it without following symlinks, retains that exact regular-file descriptor
through sidecar installation, and binds its exact bytes in
`legacy_summary_sha256`. It rechecks the held inode and pathname plus the full
bundle and original input/source identities before and after the exclusive
create-once install. Mutation or replacement between capture and installation
is therefore detected. A hostile or preexisting `piqd-result.json` is never
overwritten or deleted; a failure after the adapter's own exclusive install is
reported fail-closed and that create-once file is likewise left intact.

A successful production coordination run adds `piqd-result.json`, containing
the bundle and static-manifest hashes, finite lane and deleted label,
`piqd_proof_obtained: false`, `CERT-001`, and false stronger claims. The Python
production API returns the legacy summary and this additive PIQD metadata
separately.

## Tests and concurrency note

Run:

```bash
scripts/test-p97-piqd-five-omission.sh
```

The test suite uses only a fake HTTP transport and fixed replay data; it does
not start PIQD or a solver. It checks SAT-to-learned-cut, observational UNSAT
to one local terminal boundary, UNKNOWN/error no-fallback behavior, literal
`proof_path=None`, crossed identity, source/seed/shared-bank/bundle tampering,
exact builtin result shapes, and create-once result publication.
It also exercises mutation and replacement of the shared wave contract before
transport, summary publication races through the held-descriptor seam,
publication-time source rechecking, structured malformed-shared-bank CLI
failure, and propagation of unexpected and base exceptions.

The test script uses one pytest worker (`-n 1`) and sets OMP, OpenBLAS, MKL,
NumExpr, vecLib, and Rayon thread caps to one. These are software concurrency
caps only; they do not pin the process to one physical core and are not a
physical-core-affinity claim.

## Live finite qualification

On 2026-08-10, deleted-label shard 0 completed one bounded live discovery
iteration against PIQD daemon build
`6087acb84cf179821240625b60f93502e37eb8b5362840a70b810103c9d1b464`.
The fresh job was `ba39fb0d-ee62-4bfd-adc0-63bb53617c26`
(`existing: false`) with identity
`baa3b60957513be110ad12be2f589c4ef9953b8af6bf5b0f966b9295700b9a95`.
PIQD ran CaDiCaL with requested process limit 1 and reported one solver process
under `SINGLE_PROCESS_NO_PARALLEL_FLAG`; this is not physical CPU-affinity or
thread-count attestation.

The exact discovery formula had 42,680 variables and 405,267 clauses. Its
5,924,883 persisted bytes had SHA-256
`df1934c5c1e2a39879a52279855df48edbf6e75bf714ae15a4f8c5052ac5d479`.
The terminal result was SAT. The shared runner accepted the same-job total
model only after exact DIMACS replay, and the legacy coordinator independently
decoded and checked the source boundary and structural certificate before
adding one learned cut. The bounded run then stopped at `ITERATION_LIMIT` with
405,268 current clauses. It neither entered the local terminal branch nor
created a terminal CNF or DRAT proof.

The static receipt SHA-256 is
`9a0e7f3bd8503629be1583518536f4d544ff2e01fbac905a2f07f05aea68f863`;
the durable journal SHA-256 is
`1d923f4b776f0b2d4899b85a0dc59e138fde62b7ee91b484109b30f1c4ec8cf7`,
and its six-record seal is
`efca86acd68a7d3fe3f3d994f7707cea9371bc911e50f9c8a115dd71906d77ef`.
The canonical legacy summary SHA-256 bound by the additive result is
`cab582e3ac516211ddf98bd1b1ebece7ea41af50e5e2008f6035da7a9b8c6f06`.
The preserved evidence is under
`scratch/p97-piqd-five-omission-canary-2026-08-10-6087acb8-label0-v1{,-piqd}`.
An independent read-only audit revalidated all 37 input-bundle files, the full
journal hash chain and custody bindings, total and unique assignment of all
42,680 variables, satisfaction of every clause, and the decoded boundary
(blocker 11, centers 6 through 10). It reproduced the single-cut post-state
SHA-256 `391b6e02cb1ab84732d4b4dca7e5d6e9c078695993016a2af0c1b36d856f2bcd`.

This qualification is finite discovery evidence for one shard and one
iteration. It does not upgrade source entitlement, all-shard coverage,
minimality, UNSAT certification, aggregate or universal closure, or any Lean
theorem claim.
