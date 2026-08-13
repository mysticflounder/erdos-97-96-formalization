# P97 Exact12 next-row structural PIQD discovery protocol

## Scope

This lane migrates `exact12_next_row_structural_cegar.py` discovery queries to
PIQD by default.  It covers one finite exact-12 schedule cell at a time.  It is
not aggregate cell coverage, a universal producer or lift, a PIQD proof, a Lean
proof, or closure of any proof-blueprint obligation.

The legacy local discovery route exists only behind
`--solver-backend legacy-local`.  Ordinary CLI execution uses `piqd`, exactly
one worker, and sequential scheduling.  PIQD `UNKNOWN`, malformed results,
transport errors, and custody errors fail closed; none can select the local
discovery solver.

## Per-query binding

Each discovery iteration publishes one canonical descriptor under the PIQD
journal root.  Its identity binds:

- the complete canonical root job and job id;
- the root source manifest and current live source bytes;
- the detector contract, its complete live source manifest, and digest;
- the exact schedule cell, global iteration, local iteration, and journal
  parent record;
- the exact current DIMACS bytes, digest, variable count, and clause count;
- the maintained static PIQD source and producer manifests; and
- false claims for source entitlement, theorem coverage, universal lift, and
  Lean closure.

Descriptor and current-CNF staging roots are created with exact mode `0700`;
files are create-once/private (`0600`) and captured through held directory
descriptors without following any path component.  A final ancestry and
file-identity recapture rejects parent substitution or concurrent mutation.
Create-once artifact and run-lock reservations are retained on every exit;
the runner never pathname-unlinks a possibly replaced reservation, so stale
or unsafe reservations require explicit operator handling before reuse.

The adapter calls the maintained authenticated static PIQD runner with a
one-core request profile.  This request is not process/core attestation.  PIQD
receives literal `proof_path=None`; its receipt must cross-bind the descriptor
manifests, current CNF, PIQD job identity, project, verdict, and absence of any
proof endpoint or legacy DRAT write.  The adapter accepts only the maintained
runner's exact 38-key receipt schema, canonical bytes and valid self-hash,
exact builtin field/container types, and all six false claims (including no
one-process or one-core attestation).  The top-level `job_id` must exactly equal
`job_identity.job_id`, whose raw-DIMACS identity is recomputed locally.

SAT assignments must be total and independently satisfy the exact current CNF
before they are decoded for the unchanged structural detector.  PIQD UNSAT is
observational only.

## Terminal proof boundary

Only an observational PIQD UNSAT reaches the coordinator's terminal branch.
That branch performs exactly one fresh local CaDiCaL run over a byte-identical
DIMACS file, requests DRAT, and retains the existing
`proof_verified`, proof-file, CNF-digest, and fresh journal-reconstruction
gates.  Terminal CNF/proof pathnames are reserved create-once as mode-0600
held file descriptors.  CaDiCaL and `drat-trim` receive the same
`/dev/fd/<n>` CNF and proof objects; both descriptors are truncated, fsynced,
rewound, and inode-anchored before use.  Final descriptor-relative inode/byte
recapture rejects pathname replacement, and the caller closes but never
deletes either reservation on failure.  No PIQD artifact can satisfy this
terminal checker.

## Offline validation

Validate a published descriptor/current-CNF/receipt attempt without contacting
PIQD:

```bash
uv run python -m census.card_head.exact12_next_row_structural_piqd \
  --repo-root . \
  --descriptor PATH/descriptor-SHA.json \
  --current-cnf PATH/discovery.cnf \
  --receipt PATH/solver-receipt.json \
  --piqd-journal-root PATH/piqd-journal
```

The receipt path must be the exact attempt path under the configured PIQD
journal root.  The root, `attempts`, attempt, artifact, and descriptor
directories must retain exact mode `0700`; custody files must retain exact mode
`0600`.  Validation holds the configured root and each child directory by file
descriptor, rejects symlinked components, hard links, nonregular or oversized
files, and rechecks every identity and ancestry binding after bounded reads.
The validator rechecks canonical bytes, live source identities, root/current
CNF binding, descriptor-derived static manifests, receipt and custody-seal
hashes, PIQD job identity, the complete attempt inventory, the journal/driver
seal linkage, and each hash-named archived artifact.  In particular, archived
copies of the exact current CNF and both authenticated manifests must match the
bytes derived from the descriptor.  Its success status is finite-local
discovery-artifact validation only.

These custody restrictions repair the P97 structural adapter boundary.  They
do not classify the maintained PIQD runner or daemon as defective.

## Bounded launcher

`scripts/run-exact12-next-row-structural-piqd.py` forces the PIQD backend,
single-worker sequential mode, and common numeric-library thread caps.  It
accepts at most 100 CEGAR iterations and at most 3,600 seconds per discovery or
terminal query.  It does not provide a legacy-local switch.

The proof blueprint is unchanged, open, and off-spine for this migration.
