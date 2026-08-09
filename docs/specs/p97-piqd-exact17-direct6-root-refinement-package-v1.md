# P97 PIQD exact-17 direct6 root-refinement package v1

## Status and boundary

This specification defines the additive, fail-closed ingress adapter for Rank-
Four Cartographer's exact-17, cap-nine root-plus-ordered-refinements lane.  The
canonical source schema is exactly
`p97-exact17-cap9-root-refinement-lane/v1`; this document does not define a
second dialect under that schema.

The adapter authenticates custody artifacts, reconstructs one finite normalized
formula, emits an immutable local package, and may expose a generic
`phase3_piqd_exact17_runner.RunPacket` for a separate one-job canary.  It does not
run PIQD, a SAT solver, a replay program, Lean, or Git.  SAT or UNSAT status of
the reconstructed formula is discovery-only and is not inferred by the
adapter.

The proof-blueprint session and anchor remain unchanged:

```text
session: 019fdf9c
anchor:  Problem97.ATailFrontierLiveClosure.false_of_criticalPairFrontier
status:  open, off-spine
```

## Independently pinned ingress

The adapter requires both a manifest path and an independently supplied exact
manifest SHA-256.  It opens the repository root and every path component with
no-follow flags, rejects absolute paths, traversal, noncanonical relative
paths, symlinks, non-regular files, multiply linked files, bounded-read
overruns, and inode/metadata changes during or between authenticated reads.
Consequently a moving live manifest cannot be accepted merely because it is
valid JSON.

The lane manifest must be UTF-8 canonical compact JSON: sorted keys, no
trailing newline, duplicate keys, non-finite values, floats, or non-built-in
JSON container/scalar types.  Its exact top-level keys are:

```text
schema lane producer root variable_map refinements aggregate replay resource claims
```

The historical root manifest, root validation, refinement receipts, and cut
analysis documents are already byte-frozen pretty JSON.  They are parsed with
the same duplicate/non-finite/type checks but retain their authenticated
historical whitespace.  Their exact bytes, sizes, and SHA-256 identities come
from file references in the canonical lane manifest.  The full variable-map
document is canonical compact JSON.

All manifest objects use exact key sets.  Integers and booleans are checked by
exact built-in type, so `true` cannot substitute for `1`, `0` cannot substitute
for `false`, and floats are rejected.

## Canonical lane and producer

The lane object fixes:

- the reviewed 17-point order
  `[0,6,8,11,10,9,12,7,2,15,16,3,4,5,1,13,14]`;
- anonymous positions `[0,1]` and order index `0`;
- the exact label, normalized-case scope, and conservative terminal semantics
  emitted by the v1 producer.

The producer object has exactly `argv`, `executable`, `git_commit`,
`source_files`, and `version`.  The commit is lowercase 40-hex, the invocation
and executable/version are explicit nonempty strings, and `source_files` is a
sorted, unique inventory of repository-relative `{path,byte_count,sha256}`
records.  No runtime-wrapper object is required or accepted.

## Root and full variable map

The root object has exactly `cnf`, `manifest`, `num_clauses`, `num_vars`, and
`validation`.  All three artifacts have exact `{path,byte_count,sha256}` file
references.  The adapter validates the root DIMACS syntax and header, checks
the independently declared dimensions, checks the historical root manifest's
dimensions and order, and requires the matching validation receipt to record
`PASS`.

The variable-map object has exactly `artifact`, `entry_count`, `order_sha256`,
`reconstructor`, and `schema`.  The canonical artifact has exactly `entries`,
`order`, and `schema`; its nonempty serialized entries are complete, unique,
and equal in count to `root.num_vars`.  The map order must equal the reviewed
order and the independent order SHA-256 must equal the canonical JSON hash of
that order.

The reconstructor is an independent diagnostic with exactly `function` and
`source`.  Its source must be present with the same identity in the producer's
authenticated source inventory.  It does not acquire a separate byte/hash
claim and is not used in place of the full acceptance-critical map artifact.

## Eight ordered refinements

`refinements` contains exactly eight entries with dense ordinals `0..7`:
seven `cut_round` entries followed by one `pair_closure`.  Every entry has
exactly:

```text
ordinal kind receipt receipt_schema clause_fragment clause_count
parent_formula_sha256 parent_clause_count
result_formula_sha256 result_clause_count provenance
```

Receipt and fragment references are exact `{path,byte_count,sha256}` records.
The receipt schema sequence is the emitted sequence: cut-admission v1 for
ordinals 0 and 1, cut-admission v2 for ordinals 2 through 6, and pair-closure
admission v3 for ordinal 7.  Every receipt binds the reviewed order, root
variable count, observational `session_id`, appended-fragment SHA-256, and
appended clause count.  No unavailable `job_id` is invented.

Each cut provenance object has exactly `analysis`, `analysis_sha256`,
`model_log`, `model_log_sha256`, and `session_id`.  The adapter performs bounded
no-follow reads of both observations, validates the analysis JSON, and checks
the receipt's path/hash/session bindings.  Pair provenance has exactly
`batch_count`, `selected_pair_count`, `selected_pair_sha256`, and `session_id`;
these values are checked against the receipt's batches and selected-pair
identity.

Clause counts come only from strict parsing of the authenticated raw DIMACS
fragments.  Learned-record counts and other observational receipt fields are
never interpreted as clauses.

## Deterministic aggregate reconstruction

The exact algorithm label is
`root-body-plus-ordered-raw-fragments/v1`, version `1`:

1. authenticate and validate the complete root CNF;
2. preserve every root byte except the decimal clause-count token in its sole
   `p cnf` header;
3. replace that token with the cumulative clause count; and
4. append authenticated fragments, byte-for-byte, in ordinal order.

Fragments must be nonempty newline-terminated sequences of canonical DIMACS
clauses.  Headers, comments, blank lines, carriage returns, tabs, repeated
spaces, leading-zero integers, embedded zeros, missing terminal zeros, and
variables outside the root domain are rejected.  At every ordinal the adapter
checks the parent hash/count, exact parsed fragment count, and reconstructed
result hash/count.

The aggregate object has exactly `algorithm`, `byte_count`, `num_clauses`,
`num_vars`, `sha256`, `upload_cap_bytes`, `version`, and `within_upload_cap`.
The cap is exactly 256 MiB and `within_upload_cap` is exactly true.  Ingress
requires independently supplied exact aggregate SHA-256, byte count, variable
count, and clause count to match the reconstruction; the final DIMACS is also
rescanned.  Oversized intermediate or final results fail before emission.

## Replay, resources, and claims

The replay object has exactly `expected_exact_global_lra_result`,
`expected_structural_result`, and `source_model_validator`.  The two result
labels are the exact conservative v1 strings.  The validator object has exactly
`argv_template`, `path`, and `source_files`; its sole sorted source inventory
must identify `path` and must match the same file in the producer inventory.
The adapter authenticates these inputs but does not execute the template.

The resource object is exact v1:

```json
{"max_cores":1,"max_solver_processes":1,"parallel":false,"wall_time_envelope_seconds":[1,900]}
```

`normalized_case_only` must be true.  These claims must all be false:

- `source_entitlement`;
- `aggregate_case_coverage`;
- `universal_lift`;
- `theorem_closure`;
- `lean_checked`; and
- `daemon_signed_attestation`.

In particular, the frozen root's direct-exporter snapshot drifted and is not
recoverable from Git.  The separately hash-bound analyzer is replay tooling,
not retroactive source entitlement.

## Immutable package and generic runner packet

Successful ingress writes exactly five outputs using exclusive no-follow file
creation and a per-directory exclusive writer lock:

```text
discovery.cnf
producer-manifest.json
variable-map.json
wave-manifest.json
package-result.json
```

Existing byte-identical files allow idempotent verification; different files,
extra directory entries, symlinks, link/inode changes, output-file mutation,
and output-directory replacement fail closed.  The package result and artifact
hash mapping are immutable.  At the generic runner boundary, `RunPacket` gets
fresh exact built-in JSON dictionaries/lists for `wave_manifest` and a fresh
built-in dictionary for `package_hashes`; the shared runner serializes these
containers directly.  These boundary copies are validated and self-hash-bound
to the emitted artifacts before return, and do not expose the immutable
`PackageResult` mapping.  The public packet is suitable only for a separate
one-job canary executed by the generic runner.

## Frozen instance and authenticated local probe

The final frozen v1 manifest SHA-256 is:

```text
e025d750cee5cddcb42dd42776df7c35106542f34bb7ee95d8eedc7875d64d1b
```

An adapter-only local probe reconstructed and authenticated:

| Field | Value |
|---|---:|
| Variables | 74,813 |
| Clauses | 4,254,176 |
| Bytes | 196,106,545 |
| Aggregate SHA-256 | `2aa85c2368c3f271caebe47c4a6b861cc7e64d177cd349e58697a724c4b43605` |

The preserved audit package is
`scratch/p97-exact17-direct6-adapter-live-probe-e025d750/`.  This is a local
custody/reconstruction PASS only.  No PIQD daemon, solver process, submission,
Lean check, universal lift, or theorem closure was performed.

## Live one-job canary result

The separately executed generic-runner canary completed as
`SAT` / `STRUCTURAL_SAT` in PIQD job
`dfba235e-4833-45b2-a5a2-8a1a2b22aa30`.  The request and terminal response
both bind `requested_core_limit = 1`; the terminal response attests one solver
process with basis `SINGLE_PROCESS_NO_PARALLEL_FLAG`.  The generic runner
independently replayed the total SAT model before sealing the run.

The durable audit directory is
`scratch/p97-exact17-direct6-live-canary-e025d750-v2/`.  Its receipt self-hash
is `0578f93b223f14a1ec8ed39e36c5548a37514affcc478335e81080aea5bb4033`,
and its journal SHA-256 is
`32e495c0bb09560a632dced4f13516508fde155ca716606a8cec176c26ace392`.
This remains finite discovery evidence: source semantics, source entitlement,
complete source coverage, aggregate order-case coverage, universal lift, and
theorem closure are all false.

## Synthetic test policy

The focused tests use one process and construct tiny formulas entirely in a
temporary fixture.  They include an obvious satisfiable formula and an obvious
unsatisfiable formula; both remain `PIQD_DISCOVERY_ONLY`.  They cover
deterministic bytes, manifest pinning, schema/key/type attacks, source drift,
missing map/provenance/receipt inputs, refinement reorder/duplicate/gap/kind,
fragment syntax/header/range/hash/count attacks, stale 15/24 receipt mismatch,
root/map/chain/aggregate tampering, the 256 MiB cap, booleans/floats/subclasses,
path traversal, symlinks, output collisions, and input/output TOCTOU.
