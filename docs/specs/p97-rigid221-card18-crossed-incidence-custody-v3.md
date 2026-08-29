# P97 Rigid221 card-18 crossed-incidence source custody (v3)

**Status: ALL SOURCE-CUSTODY V3 PUBLICATION GATES COMPLETE.**

Lane: `rigid221-card18-crossed-incidence-custody-v3-20260828`
Lane base and repository metadata: `7cf1e60bde589fe27c246c0edbc7ad20e96d6db3`.

## Scope

This snapshot authenticates only the bytes of the 27 repository-local Lean
dependency modules reached by the crossed-incidence root
`Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18CrossedIncidenceProjection`.
It does not authenticate a revision, Lean build, `.olean` tree, axiom audit,
Lean/Python representation, serializer, solver, or proof claim.

The v3 tuple is unchanged from v2: exactly 27 modules in canonical module/path
order. Exactly one source-manifest row changes: `Rigid221SourceHeavy.lean`,
now 882784 bytes with SHA-256
`a4a906aa240101bad39424450e08f70161f8923d9d261f3892fad19685324c29`.
All other rows remain byte-for-byte unchanged. The v2 module, tests, receipt,
and documentation are immutable historical artifacts.

## Security contract

The implementation freezes its schema, metadata, roots, tuple, manifest,
validation policy, and authentication flags behind a configuration digest.
Every public build, encode, parse, validate, manifest, and attest operation
checks that digest. Receipt JSON is canonical, duplicate-free, finite, and
exactly shaped; self-hash verification is mandatory.

Live reads start at a resolved non-symlink repository root and traverse with
descriptor-relative no-follow opens. Escapes, absolute/backslash/NUL paths,
symlinked roots/ancestors/leaves, missing or unreadable paths, directories,
FIFOs/devices, and hardlink aliases are rejected. Each source must be a
regular file with one hard link and match its frozen byte count and SHA-256.

## Authentication flags

`lean_source_bytes_authenticated` is true. Revision metadata, Lean build,
`.olean` tree, axiom audit, Python serialization equivalence, serializer,
solver, and canary authentication are all false. These flags describe the
source-byte trust scope; this candidate does not authorize downstream proof,
coverage, serializer, solver, or canary claims.

## Review evidence

The receipt is
`certificates/rigid221_card18_crossed_incidence_source_custody_v3.json`.
The implementation is 36,886 bytes with SHA-256
`6c3570c25c0be4007bbae0f8f697ee3a19940a4d5852e8153b14566e2b328dcd`.
The receipt is 8,961 bytes with file SHA-256
`7a5fa9842276bc38503b284ef5b9120f7321d9d4d9a222f669c9b9615c73e589`,
body self-hash
`0280ac09c6a0f022e322222bdc81e7560299875651a54257be18445becf4cafd`,
and source-manifest hash
`bd84bae401c4852b236e46c7d4444698c8cf53392c875ebf2cebacd14060875e`.

Canonical readback and fresh live attestation pass. The combined custody-v3
suite passes 121 tests; Ruff passes; the kernel mine reports 27 unchanged
modules; and independent adversarial review returns **GO** on the implementation
and receipt. The full Card18 runner passes 131 historical tests with 348 skips,
131 live v3/v5 tests, and the 10,888-job aggregate build. Exact-path staged
hygiene passes with no foreign staged path. Publication must not modify any
v1/v2 artifact.
