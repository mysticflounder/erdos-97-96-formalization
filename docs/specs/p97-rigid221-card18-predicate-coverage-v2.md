# P97 Rigid221 card-18 predicate coverage (v2)

**Status: COVERAGE V2 COMPLETE / ZERO EXTERNAL ADMISSION.**

Lane: `rigid221-card18-predicate-coverage-v2-20260827`.

Lane base: `7b24c21f0b4764dae852c747b4b384b9a6a97fab`.

Schema:

```text
p97-rigid221-card18-predicate-coverage/v2
```

## 1. Purpose and scope

Predicate coverage v1 is the immutable baseline for the exact 188 candidate
predicates and 37 Lean-source bundles. The crossed-incidence projection now
supplies one formerly Prop-only source bundle as a source-linked `Fin 18`
five-Boolean profile. This checkpoint records only that reviewed delta.

The v2 manifest remains a gap ledger. It does not serialize a Lean value,
establish a Python/Lean serialization relation, admit a hard clause, run a
solver, authorize a canary, or make a proof claim.

The durable v2 artifact is:

```text
certificates/rigid221_card18_predicate_coverage_v2.json
```

The root lane generated, read back, freshly attested, and independently
reviewed that exact file before publication.

## 2. Immutable v1 baseline

V2 imports v1 only as a guarded frozen baseline. It binds and freshly attests:

- `census/p97_search/rigid221_card18_predicate_coverage.py`, exactly 70,454
  bytes with SHA-256
  `fbf8a5cdac806a6f2d01929ce93aa4cbc490d557e91144728a85cfb60efee7da`;
- v1 configuration digest
  `dcb17cb8bd406f903599f56f5046ed56467bc6e68c91ef9d25e0b8c90fd76d5c`;
- `certificates/rigid221_card18_predicate_coverage_v1.json`, exactly 134,343
  bytes with file SHA-256
  `4031a8ce6d67c5b2d4f10c30753e5fe1aa615d544f679a5dcb303eea5dac69dc`
  and body self-hash
  `23bb018c8fb625dbd2e7f936322d7df5fc98a7ad87915b68a9684a3f10357e2e`;
- the v1 candidate module/schema/schema-snapshot binding; and
- the v1 labeled-projection source, custody receipt, and axiom receipt
  bindings without changing any path, size, digest, root, schema, or command.

Fresh attestation invokes the v1 manifest API against the live repository.
The v2 module also performs its own descriptor-relative, no-follow,
single-link reads of every bound v1 artifact. A stale v1 module, manifest,
candidate, source, custody receipt, or axiom receipt rejects before a v2
manifest can be built.

The candidate ID set remains exactly 188 rows with hash:

```text
ca7a9c209a01eb76153f4784569a5282bd54c96734d4e4db492a61b61d616561
```

The Lean-source ID set remains exactly 37 rows with hash:

```text
28dc1f316c91a9c9aef64972ecfdd3f9ef034f723005afefa02db90c504ba433
```

## 3. Exact source-bundle delta

Only `profile.crossed_missing_incidence` changes in the Lean-source universe.
Its v1 row was Prop-only and blocking. Its exact v2 state is:

```text
status = LABEL_DATA_AVAILABLE
representation = LEAN_FIN18_FIVE_INCIDENCE_BOOL_PROFILE
custody_digest = fe1ecab611ba041527f0dd753a4f89ef94531a979faeb2adf9f87cc92afa030c
noncomputable = true
executable = false
blocking = false
```

`noncomputable = true` records the upstream carrier-label construction.
`executable = false` is mandatory: the Lean profile has not been serialized
or reconstructed by Python. The row is data-available for coverage accounting,
not externally executable.

All other 36 source rows are byte-for-structure identical to v1, including
their original labeled-projection custody digest. The resulting status counts
are exactly:

```text
LABEL_DATA_AVAILABLE = 14
PROP_AVAILABLE_NOT_EMITTED = 16
ABSENT_FROM_LABELED_EXPORT = 7
```

The full canonical v2 source-row hash is:

```text
7e0970a8b76ce161080808feb7fbe59631bf5482712b5ad3e9869f240d7343f0
```

## 4. Exact crossed-incidence anchors

The upgraded source row has 23 sorted, duplicate-free declaration anchors in
exactly one module:

```text
Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18CrossedIncidenceProjection
```

They cover:

- `Rigid221FiveIncidenceProfile`, `allFive`, and `conjunctionHasFalse`;
- `xvDeletionFiveIncidenceProfile` and `uDeletionFiveIncidenceProfile`;
- all ten arm/bit membership `iff` theorems;
- both arm-specific `conjunctionHasFalse` theorems;
- both typed projection structures and their two construction definitions;
- the three-constructor incidence alternative; and
- the total labeled-alternative-to-incidence conversion.

The exact anchor-list hash is:

```text
a09c8667e1d5117849c7363c963ed48871c5f41889689b88f6e996b35729898a
```

These declarations retain the original labeled source, compute each bit with
`decide` on an exact labeled support membership, link all ten bits back to the
geometric memberships, and derive each arm's missing cell from its stored
source negation.

## 5. Exact candidate delta

Exactly twelve candidate rows change, and only their
`lean_coverage_status` field changes from
`PROP_AVAILABLE_NOT_EMITTED` to `LABEL_DATA_AVAILABLE`:

```text
cross.u_deletion.incidence.c1_in_bo
cross.u_deletion.incidence.c1_in_k2
cross.u_deletion.incidence.c2_in_k1
cross.u_deletion.incidence.conjunction_has_false
cross.u_deletion.incidence.opp_apex_2_in_k1
cross.u_deletion.incidence.opp_apex_2_in_k2
cross.xv_deletion.incidence.c1_in_bo
cross.xv_deletion.incidence.c1_in_k2
cross.xv_deletion.incidence.c2_in_k1
cross.xv_deletion.incidence.conjunction_has_false
cross.xv_deletion.incidence.opp_apex_2_in_k1
cross.xv_deletion.incidence.opp_apex_2_in_k2
```

The exact ordered delta hash is:

```text
1632720d34634da1c388c5053f141f8e3c637a4254574006e3198d777a854a6a
```

Every origin, representation, candidate anchor, arm list, dependency,
algorithm/input list, source ID, entitlement flag, and admission flag remains
identical to v1 for all 188 rows. All 176 non-delta rows are wholly identical
to v1. The full canonical v2 candidate-row hash is:

```text
f9d4a1e9dff4ef038217a701cf3b6b6050af0251acfe48c0d3d4d46b7d562f98
```

The origin partition remains `42 / 39 / 107` for caller assertion, caller
data, and locally recomputed rows. Candidate coverage statuses become
`115 / 70 / 3` for label-data, Prop-only, and absent.

## 6. New crossed-incidence bindings

V2 binds the crossed Lean source at 19,558 bytes and SHA-256:

```text
27e356b50f38e974dc44884937d00c03e56c36c2180e3a01c619115576377439
```

It binds the crossed axiom receipt at 2,266 bytes, file SHA-256
`604059c92e9ea71affd44ba2e4d0026da07afb185c824eed7954cdd7760cbf2f`,
and body self-hash
`f5d2b07cdbddb4fb4d6448f5bcc52ec7e8411659f8512676b4c0e311f5b83e52`.
Strict validation rejects duplicate keys and non-finite JSON, checks the exact
field set, body self-hash, three commands and declarations, source path,
source byte count and digest, zero exit codes, and false sorry/native flags.
The receipt's exact file hash binds its remaining metadata. This is receipt
integrity checking, not independent axiom authentication.

It binds the crossed source-custody receipt at 8,958 canonical bytes, file
SHA-256
`772b0d246070487c4e3e5dc9811581488e49177d21ec4110379e26f5479dfff3`,
body self-hash
`cab2d626f0a30dd55a10f4640d13046ae1003b657d1a53e1f81061939747fa3b`,
configuration digest
`28f9a2065e5566f2e065adea79ffe8608bb7ac0f0bbf1337387449bc4546bea2`,
and source-manifest digest
`fe1ecab611ba041527f0dd753a4f89ef94531a979faeb2adf9f87cc92afa030c`.
Fresh v2 attestation invokes the crossed-custody API against all 27 live
source files and rejects old-schema or cross-root receipts.

## 7. Canonical validation and filesystem boundary

The manifest has the same eight top-level roles as v1: schema, metadata,
bindings, candidate rows, source rows, summary, admission, and self-hash. Its
schema and APIs are independent from v1.

Every public frozen/build/validate/encode/parse/attest API first checks the
live configuration snapshot against the independent in-body literal:

```text
0e4fcd139eed1723ff2a049a25ebd8ae0d0e4cd5eaa37fb73f04db3f85dbe651
```

Validation requires exact keys and strict types, canonical sorted row order,
duplicate-free ID and anchor sets, exact set and full-row hashes, status
derivation from referenced source rows, known arm-scoped dependencies,
acyclicity, and exact algorithm inputs for locally recomputed rows. It rejects
aliases, omissions, replacements, reordering, stale hashes, caller-truth
smuggling, and all status or admission escalation.

Parsing accepts immutable `bytes` only. It rejects duplicate JSON keys,
NaN/positive infinity/negative infinity, unknown fields, and noncanonical
bytes. The self-hash covers the canonical body without its own field.

All bound artifacts are read below a resolved nonsymlink repository root by
descriptor-relative traversal with no-follow and nonblocking flags. Each leaf
must be a regular file with `st_nlink == 1`. Missing files, directories,
FIFOs, devices, symlinked roots or components, inside/outside hardlinks,
absolute paths, empty/dot components, backslashes, NULs, and `..` escapes
reject.

The v2 module's own live path/byte/hash record is stored in the manifest and
checked on attestation, but it is deliberately excluded from the frozen
configuration to avoid a self-referential source hash.

## 8. Admission and remaining blockers

Every one of the 188 candidate rows retains:

```text
source_entitled = false
hard_clause_admission = false
```

Global admission remains:

```text
source_faithful_serializer = false
python_lean_serialization_equivalence = false
hard_clause_count = 0
solver_admission = false
canary_authorized = false
proof_ready = false
solver_ready = false
noncomputable_projection_present = true
```

Sixteen Prop-only source bundles and seven absent source bundles remain
blocking. No v2 field authorizes external serialization, proof admission,
solver input, or a canary.

These counts are bookkeeping for the historical external packet, not a claim
that every one of the 188 predicates must be projected before a sound finite
argument can begin. The reviewed next architecture is a pure finite Lean
abstraction with a theorem sending each source alternative to a valid finite
packet. Search should target that decidable surface arm by arm, refining it
only with additional source-derived consequences. V2 neither serializes the
noncomputable source witness nor authorizes that search by itself.

## 9. Acceptance and publication gates

Local implementation review requires:

1. independent regeneration of the exact twelve-ID delta and its hash;
2. structural comparison of every v2 candidate and source row against v1;
3. mutation tests for IDs, order, statuses, anchors, digests, receipts,
   dependencies, strict Booleans, admissions, and canonical JSON;
4. filesystem tests for missing, symlinked, hardlinked, nonregular, FIFO, and
   path-escape artifacts;
5. fresh v1 and crossed-custody attestation;
6. combined v1/v2/custody test suites and Ruff; and
7. independent adversarial review.

Durable publication additionally required the root lane to generate the exact
canonical v2 JSON, perform byte-identical readback, freshly attest it, and
review its live self-module binding. Those gates are complete.

## 10. Local implementation evidence

On 2026-08-27:

- the focused v2 suite passed 82 cases;
- the combined v1, v2, historical source custody, labeled-projection custody,
  and crossed-incidence custody suites passed 305 cases;
- Ruff lint and format checks passed for both owned Python files;
- independent adversarial review regenerated the exact delta and returned
  `GO` for row preservation, hashes, receipt validation, configuration
  immutability, malformed-input handling, filesystem defenses, and nonclaims;
- the finalized v2 module is 59,747 bytes with SHA-256
  `77ecf6d56ebe69ef74f219c9c0904992e2e631fbae769cef9cfd690837341fc2`;
  and
- the published canonical artifact has 143,311 bytes, file SHA-256
  `889d0f496baeefc4eb053370b45a04f88353d1180a2b52f26da37136b71d083e`,
  and body self-hash
  `6e7770b29b15da91faa9b7648779a22c28e403a825263ffabdb0cdf0f1f89114`.

Canonical readback is byte-identical, fresh live attestation passes, and
independent review is `GO`. This publishes only the exact coverage delta; all
serializer, proof, solver, hard-clause, and canary admissions remain closed.
