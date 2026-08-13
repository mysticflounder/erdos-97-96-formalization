# P97 SAT-generator PIQD discovery v1

Status: P97 caller-adapter contract. These are P97 adapter guarantees, not new
PIQD guarantees and not a proof-closure claim.

## Authoritative entry points

`census/p97_search/sat_generate.py` is a byte-frozen v2 artifact. Its required
SHA-256 is
`5a32d21476ca47945cf5be41cbf07fe4fe831fd91a88be7326bb3138df38d817`.
It remains the explicit legacy-local implementation and is not edited or
relabelled as a generic PIQD caller.

The additive production entry point is
`phase3_piqd_sat_generate_adapter.enumerate_cell_with_piqd`; the module's CLI
defaults to `--solver-backend piqd`. It reconstructs the SAT encoding with the
frozen generator's encoding and banking primitives, while owning the PIQD
preflight, discovery lifecycle, terminal rerun, and final publication. Other
cells and configurations remain available only through the adapter CLI's
explicit `--solver-backend legacy-local`, which delegates to the frozen
`sat_generate.enumerate_cell`.

The consumer boundary is likewise additive. Production-wrapper output must be
checked with the exported production-aware offline verifier
`phase3_piqd_sat_generate_adapter.verify_production_run_artifacts`, not with
`sat_generate.verify_run_artifacts`. The latter deliberately reconstructs the
byte-frozen, unextended v2 encoding and remains the consumer only for frozen
legacy-local output.

The default PIQD route supports only the exact public authority-v3 profile:

- cell `k=4,n=10,profile=(4,4,5),exact=true`;
- cap-bearing projected blockers and static `DUAL2`;
- mincut scope `counterexample_card_ge_ten`;
- the global pinned-multiplicity extension; and
- sealed `phase3-v0.2-projected-static` identity: 1,194 variables, 58,314
  clauses, base SHA-256
  `89548ae97ba91b15592c59c34a6c57f53f34095b990b0aea3993b13d84b5c30b`.

The production launcher applies that exact configuration rather than
pretending that arbitrary `k`, `n`, bare v0.1, or mixed projected profiles are
supported. It completes the cell/configuration/sealed-hash preflight and the
lexical custody checks before filesystem or transport access. Unsupported
input therefore cannot create the run directory, read control manifests, or
open a PIQD session. PIQD runs are fresh-only; `resume` and `overwrite` reject
before output creation.

The CLI requires the PIQD base URL, custody root, source and producer
manifests, producer job id, solver name, and production authority. A typical
shape is:

```bash
PYTHONPATH=census/p97_search:. uv run python \
  census/p97_search/phase3_piqd_sat_generate_adapter.py \
  --k 4 --n 10 --profile 4,4,5 --out /absolute/custody/run \
  --piqd-base-url http://127.0.0.1:8080 \
  --piqd-custody-root /absolute/custody \
  --piqd-source-manifest /absolute/source.json \
  --piqd-producer-manifest /absolute/producer.json \
  --piqd-producer-job-id JOB \
  --piqd-solver-name cadical-pinned \
  --piqd-authority /absolute/production-authority.json
```

This specification does not authorize a live daemon run by a checker or test.

An already-published production-wrapper run is checked offline with:

```bash
PYTHONPATH=census/p97_search:. uv run python \
  census/p97_search/phase3_piqd_sat_generate_adapter.py \
  --check --out /absolute/custody/run
```

## Input and custody boundary

Every programmatic path must be an exact native, absolute, normalized `Path`.
Timeouts and model limits must be builtin integers (a boolean is not accepted
as an integer). The output directory must be a strict lexical descendant of
the documented custody root. The stable seed identity is exact equality with
`output_dir/base.cnf`, not a basename comparison.

Those checks occur before output I/O. Once the profile is accepted, the caller
holds the output-directory inode and creates it component by component without
following symlinks. Caller custody reads and publications use:

- componentwise nofollow directory traversal;
- bounded reads of singly linked regular files;
- before/after inode, size, timestamp, and link-count revalidation;
- a held parent descriptor and pathname-to-inode revalidation;
- create-once `O_EXCL|O_NOFOLLOW` writes;
- file and directory `fsync`; and
- a final absolute-chain recapture for nonempty artifacts.

The exact pinned `base.cnf` is create-once. Source and producer manifests and
the authority are captured before transport/session creation with the same
bounded nofollow/nlink discipline. A repointed output path, symlinked control
file, hardlink, oversized control file, alternate base path, changed base
bytes, or pre-existing caller artifact fails closed.

The create-once caller manifest binds the exact cell and configuration, pinned
descriptor, variable map, counts, base/source/producer/authority hashes,
producer job id, and the single-worker sequential/no-fallback execution mode.

## Discovery and terminal proof boundary

One persistent public `make_piqd_incremental_v3_solver_runner` instance owns a
fresh cell session. Each observational discovery call receives the current
`.solver.cnf` and literal `proof_path=None`. A valid SAT model is decoded and
revalidated, banked through the frozen census primitives, blocked as its raw
semantic assignment, and sent to the same persistent session on the next
iteration.

PIQD `UNKNOWN`, transport error, malformed result, custody failure, or model
failure publishes no local discovery fallback. Only observational PIQD
`UNSAT` reaches the local certificate boundary:

1. create `terminal.cnf` once from the exactly recaptured current
   `.solver.cnf` bytes;
2. invoke the supplied local CaDiCaL proof runner exactly once on that
   `terminal.cnf` with a non-null pending proof path;
3. require local `UNSAT` and a nonempty, safely recaptured DRAT artifact;
4. publish `terminal.drat` create-once; and
5. invoke the existing checker exactly once and require verified output.

There is no second discovery path and no local rerun after PIQD `SAT`,
`UNKNOWN`, or an exception.

## Lifecycle and durable provenance

Runner close advances three stages: underlying session close, final immutable
metadata snapshot, then caller-custody descriptor close. A stage is marked
complete only after it succeeds, so retry repeats the failed stage without
repeating a successful earlier stage. Factory failure after underlying runner
creation attempts close and adds a close failure as an exception note rather
than replacing the setup exception. The enumeration wrapper includes factory
setup in its cleanup boundary.

A close failure while another exception is active is added as a note and never
masks that exception. A close failure after an otherwise normal result is
recorded in a create-once lifecycle-failure artifact and downgrades the result
to `UNKNOWN` with `unsat_verified=false`.

Every successful runner call and final close writes a new numbered,
create-once session-metadata object. Metadata records the caller-manifest hash,
its exact sequence number, and the preceding metadata hash. The final
`manifest.json` is itself a create-once durable publication written only after
the close attempt. Its `piqd_provenance` boundary contains the caller-manifest
hash, the ordered metadata hash chain, the closed-session state, and any
lifecycle failure. The same artifacts are included in `artifact_hashes` along
with the ordinary base/model/bank/terminal artifacts and the explicitly
retained `.solver.cnf` and `.solver.log` diagnostics. If a non-`COMPLETE` local
terminal rerun leaves `.terminal.drat.pending`, that singly linked regular file
is retained without deletion and is also hashed; `COMPLETE` forbids it.

Publication and verification require an exact directory inventory. Apart from
the self-referential `manifest.json`, every accepted entry must be one of those
named durable artifacts, retained diagnostics, or an exactly numbered PIQD
session-metadata file, and every accepted entry is bounded-recaptured under the
same nofollow and single-link rules before its hash is published or accepted.
Any unlisted regular file, symlink, hardlink, directory, or other entry rejects
the run without deleting or rewriting the hostile entry. The directory name
inventory is revalidated after capture to detect concurrent additions or
removals.

`verify_piqd_provenance` independently reopens the held output, rechecks the
component and link boundary, reconstructs the complete metadata hash chain,
recomputes the artifact inventory, and rejects a `COMPLETE` result without a
durably closed session. Removing, adding, renaming, hardlinking, symlinking, or
changing published PIQD provenance is therefore detectable without trusting
the returned in-memory manifest.

`verify_piqd_provenance` is deliberately a provenance-and-hash verifier, not a
SAT semantic verifier. The independently exported
`verify_production_run_artifacts` is the acceptance boundary for production
wrapper output. It performs the same held-directory custody and PIQD provenance
checks and additionally:

- reconstructs the one supported cell and seals the pinned production-v3
  extension, including the exact 1,194-variable, 58,314-clause base identity;
- checks the exact caller-manifest schema, cell/configuration, variable map,
  execution mode, authority identities, and base identity;
- parses canonical model records, replays every raw assignment through the
  encoding decoder and blocker, checks raw uniqueness and prior-bank chaining,
  and compares exact iterator records and canonical bank bytes;
- compares the manifest counts and hashes with the reconstructed semantic
  state and requires `terminal.cnf` to equal the sealed base plus the ordered
  model blockers; and
- for `COMPLETE`, checks terminal proof/checker metadata, reruns only the DRAT
  checker, and recaptures the terminal and proof artifacts afterward.

That verifier reads only the published run and invokes no PIQD transport or SAT
solver. A `COMPLETE` check does invoke the local DRAT checker; tests inject a
fake checker and the structural gate never runs it. It does not reopen or trust
the source, producer, or authority files whose immutable hashes are already
bound into caller/session/publication provenance.

## Gates and limitations

The focused fake-only tests cover exact-profile rejection before filesystem
access, containment and alternate-base rejection, exact native/builtin
boundaries, control-file symlink/hardlink/size attacks, output symlink and
repoint races, setup cleanup, retry-safe close, nonmasking close downgrade,
literal `None`, no fallback, exactly one terminal proof rerun/check, provenance
publication, production-aware offline verification, frozen-versus-additive
consumer separation, and hash-preserving terminal/bank/manifest semantic
tampering. They also cover exact-inventory rejection of unexpected regular,
symlink, and hardlink entries without deletion, plus truthful hashing of a
retained pending-proof failure artifact and link rejection under a permitted
transient name. The structural checker parses the adapter and tests, asserts the
frozen generator digest, and inspects the actual production launcher and
offline verifier rather than merely searching for phrases.

No focused test or structural checker contacts a PIQD daemon, invokes a SAT
solver, runs `drat-trim`, invokes Lean, or changes Git. Live source/producer/authority
authentication and PIQD server behavior remain delegated to the already
qualified v3 layer and require a separately authorized operational run. A
finite `COMPLETE` census manifest is still not a universal theorem or Lean
proof; proof-blueprint state is unchanged.
