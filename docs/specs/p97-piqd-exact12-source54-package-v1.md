# P97 PIQD Exact12 source54 package v1

Status: strict finite-checkpoint custody and runner ingress. This is not a
solver receipt, source-entitlement argument, theorem, aggregate coverage
result, or Lean closure.

## Purpose and boundary

`census/p97_search/phase3_piqd_exact12_source54_package.py` is an additive
adapter for one frozen artifact: normalized exact-12 v14 cell 8 after 54
proof-backed source-order cuts, replay of the 871-record migrated journal, and
the static equality-closure extension. It does not alter or supersede
`phase3_piqd_package.py`.

The adapter gives a later runner three narrow public seams:

- `load_package` no-follow loads and cross-validates immutable package bytes;
- `reconstruct_checkpoint` regenerates the exact checkpoint without a solver
  and requires byte equality with the frozen DIMACS;
- `validate_total_variable_map` verifies a complete typed role map for every
  variable ID from 1 through 44,855;
- `decode_model_to_base_cube` and `decode_and_validate_model` decode base
  choices and, when a reconstruction is available, independently replay the
  source-faithful and cell-8 semantics.

There is no daemon, solver, proof checker, Lean invocation, or core-selection
logic in this stage. `PiqdRawDimacsClient` can consume `discovery.cnf`; requested
core enforcement remains the runner's responsibility.

## Frozen acceptance identity

V1 accepts exactly this live checkpoint:

| component | exact identity |
| --- | --- |
| cell | exact-12 normalized-v14 cell `8` |
| DIMACS | `17,227,349` bytes; `44,855` variables; `732,131` clauses; SHA-256 `47c6275c143c4e99d10d0c73488629e5b9c3046599a7d31d750192ae17c770d4` |
| migrated journal | `126,296,724` bytes; `871` records; SHA-256 `24be15d8040bd5d3d15a4c71346592110bfd09089d5bde6fee5f6218809d0de6` |
| bound job | SHA-256 `3c873b1591a7a1f2a2f4b30e12288000ccb8b91713a58b5738e6a4e91154e945` |
| detector contract | SHA-256 `89ba37a9c3f18edb2cf33cd0098820098e02e4599fbd1ba47794d8e31fb0f94b` |
| journal terminal | SHA-256 `8cc37d316c243746613b1f65b841356c06d7b3d07696ca38282bf8f2c9215f10` |
| source54 Lean file | `3,712` bytes; SHA-256 `7ca3e854d038dfb07c6d5b4a3e9c9b676cff19b371d96992166c93a001892750` |

The source summary, survivor, migration receipt, run summary, extension
generator, journal, CNF, and Lean source are separate pinned components. They
are opened descriptor-relative with no-follow semantics, bounded by exact
length, hashed while read, checked for in-read mutation, and re-statted after
the complete input set is captured. JSON outputs are strict canonical JSON.

The live theorem bank is append-only and may contain later sources. V1 checks
that source54 remains the exact first-54 prefix with digest
`6565fa5e31da831d7f93f88355c0e687e21d695f6bf87a44401b2a66183e85ff`.
Because the bank builder and detector modules own separate imported globals,
V1 freezes both registries together under a process-local lock, uses the
prefix only for installation/replay or validation, and restores both live
module states on every exit. A later bank entry cannot silently change this
historical checkpoint. The exact frozen 54-entry bank body digest is
`4fe83285d1336a8aaa21906cfa460893ab2eb8fa8b3f2318c98fd0f7cfc0dbd9`.
The `c2d195a8...` digest in the later custody note describes its then-live
55-entry append-only bank; it is not the body digest of this 54-entry package.

## Deterministic reconstruction

Acceptance performs the following one-process, solver-free reconstruction:

1. Build the current exact-12 v14 schedule, require cell 8, build its bound job,
   and require the pinned bound-job digest.
2. Materialize the source-faithful candidate instance and compiled cell.
3. Freshly build, validate, snapshot, and install exactly the first 54
   proof-backed source-order clauses.
4. Replay all 871 authenticated migrated-journal records from captured bytes.
   The bank and journal append clauses directly and allocate no variables.
5. Require the pre-extension checkpoint to have 42,710 variables and 370,196
   clauses.
6. Compile the captured extension-generator bytes and apply its exact,
   non-configurable all-enabled obstruction profile.
7. Independently scan all 732,131 clauses. V1 rejects empty clauses,
   tautologies, and repeated literals; all three counts are pinned to zero.
8. Serialize DIMACS and require exact byte equality with the captured
   17,227,349-byte artifact, in addition to count and digest equality.

The all-enabled extension profile is fixed because it is the profile that
produced the archived artifact. It adds 2,145 relation variables and 361,935
clauses: 18,240 row implications, 137,280 transitivity clauses, 7,920
duplicate-center clauses, 495 equal-K4 clauses, 95,040 equilateral-bisector
clauses, 95,040 three-triad clauses, and 7,920 perpendicular-bisector clauses.
Profile drift is an error, not a configurable option.

## Complete variable map

`variable-map.json` has schema
`p97-piqd-exact12-source54-total-variable-map/v1` and exactly 44,855 ordered
entries. Variable IDs must be the consecutive integers `1..44855`; booleans
are not accepted as integers. Role fields and role counts are validated.
Validation also reconstructs the canonical cell-8 allocation locally and
requires exact object equality. A replacement map with internally consistent
ranges, counts, and newly signed cross-hashes is therefore rejected.

| range | count | role and allocation order |
| --- | ---: | --- |
| `1..3040` | 3,040 | choice variables, center-major then candidate-index |
| `3041..6080` | 3,040 | one-hot Sinz level-0 counters, same input order |
| `6081..42560` | 36,480 | C4 Sinz counters, lexicographic point-pair order, incident choices in center/candidate order, levels 0 then 1 |
| `42561..42710` | 150 | 50 cell blockers, 50 per-source at-most-one counters, then 50 per-center at-most-one counters |
| `42711..44855` | 2,145 | equality-relation variables over lexicographic pairs of the 66 undirected edges |

The cell source insertion order is `6, 9, 0, 2, 8`. Source blockers exclude
center 1 and the source itself. Relation variable rank for zero-based edge
indices `left < right` is

```text
q = sum(65 - k for k in range(left)) + right - left - 1
variable = 42711 + q.
```

No journal/source-order “pattern variables” exist. The bank and journal add
clauses only.

## Clause provenance and PIQD clause IDs

PIQD certificate clause IDs are assigned after detautologization and
deduplication. They are therefore not source-certificate positions. Every
source-order cut in the producer manifest is bound by its canonical clause
content and `canonical_clause_sha256`; `certificate_position_binding` is
always false. Source54's independent anomaly scan happens to find zero
tautologies and zero repeated literals, but that fact does not license a
positional provenance assumption. A sparse submitted-to-certificate exception
map is future daemon work and is not fabricated by this package.

This is a P97 adapter/custody gap, not a PIQD core defect.

## Package layout and digests

Emission is create-once. An existing output directory is never overwritten or
cleaned. If a write fails, only files created by that call are removed. A
successful emission contains exactly:

```text
discovery.cnf
bound-job.json
source-order-bank.json
variable-map.json
order.json
producer-manifest.json
wave-manifest.json
package-index.json
```

Every parent/output component is opened with no-follow semantics. Creation,
artifact opens, cleanup, and final identity checks are descriptor-relative to
held parent/output directory descriptors. Device, inode, link count, size,
digest, and cross-file stability checks prevent a symlink or directory
replacement from redirecting a write or cleanup operation.

The complete frozen file inventory is independently pinned, rather than
trusting an index whose artifact records were merely re-signed:

| file | bytes | SHA-256 |
| --- | ---: | --- |
| `discovery.cnf` | 17,227,349 | `47c6275c143c4e99d10d0c73488629e5b9c3046599a7d31d750192ae17c770d4` |
| `bound-job.json` | 26,946 | `3c873b1591a7a1f2a2f4b30e12288000ccb8b91713a58b5738e6a4e91154e945` |
| `source-order-bank.json` | 1,803,145 | `fa138c495c1f425e18a57cfb5e916eabdbe87dffb1e4e21d7488ce8eda399d4b` |
| `variable-map.json` | 4,429,954 | `8360d8785b73c56e2b2fd92cacfde51da1163dcca359c9fb5dac068825fbf94c` |
| `order.json` | 1,176 | `fc014da8307a58210f32b98e77c1c34e4a844c65b651d8b31e1d9da995f12265` |
| `producer-manifest.json` | 21,421 | `740775cfdf6de9772a0f2541ca5f8c1e144c09238d6275e78b76051483439c9a` |
| `wave-manifest.json` | 1,247 | `e4568948f8180b6b419965a0ab7f5a9f96128e37fc517fad6dbf106887af8dc1` |
| `package-index.json` | 1,100 | `ac0ba9e938f05e847a9774d596c638d4129e583f4836d7df0879dae9da096b72` |

On load, the full source-order bank schema, claims, source manifests, entries,
body digest, and exact 54-entry recompilation are checked. The bank is then
cross-bound to the producer replay identity, order, and canonical
content-hash provenance. The bound-job compiler/contract identities are also
cross-bound to the producer. Thus package integrity does not mistake mutually
consistent replacement artifacts for the frozen source54 checkpoint.

`package-index.json` records `file_sha256` for each complete archived file.
The producer manifest separately records
`identity.canonical_body_sha256`, defined as SHA-256 of the canonical producer
object with the entire `identity` field omitted. These are deliberately
different names and domains. The wave contract's legacy field
`encoding.producer_manifest_sha256` means the complete archived producer file
hash and is cross-checked against the package index. No internal self-digest is
ever compared with a full-file digest.

The emitted `p97-cegar-wave/v1` manifest binds the CNF, total variable map,
producer file, execution order, exact counts, and SAT-as-counterexample query
polarity. Its `LOCAL_CERTIFICATE` classification describes the only available
promotion tier; all theorem fields remain null.

## Honest claims

The canonical producer manifest fixes all of these claims to `false`:

```json
{"aggregate_cell_coverage":false,"lean_closure":false,"proof":false,"sat":false,"solver_receipt":false,"source_entitlement":false,"universal":false,"unsat":false}
```

The historical run summary reports SAT, but it is an input provenance record,
not a solver receipt emitted or authenticated by this package. In particular,
the package does not promote historical solver output into a current SAT claim.
Its scope is finite, local, and off the universal proof spine.

`LoadedPackage` retains only immutable canonical artifact bytes. Parsed
properties return newly detached objects, so caller mutation cannot alter a
later validation view. `decode_model_to_base_cube` is an explicitly partial
projection helper; the public semantic boundary
`decode_and_validate_model` requires exactly one signed literal for every
variable ID `1..44855` before replaying source and cell semantics.

## Invocation and validation

The output parent must already exist and the output directory must not exist:

```bash
uv run python -m census.p97_search.phase3_piqd_exact12_source54_package \
  --repo-root . \
  --output-dir scratch/p97-piqd-exact12-source54-package-v1
```

Fast tests omit the live 143 MB input capture and full reconstruction. The
focused live check is opt-in and remains solver-free:

```bash
P97_RUN_EXACT12_SOURCE54_LIVE=1 \
  uv run pytest -n 1 \
  census/p97_search/tests/test_phase3_piqd_exact12_source54_package.py
```
