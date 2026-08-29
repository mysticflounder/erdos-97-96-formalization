# P97 Rigid221 card-18 labeled-projection source custody (v3)

**Status: ALL SOURCE-CUSTODY V3 PUBLICATION GATES COMPLETE.**

Lane: `rigid221-card18-labeled-projection-custody-v3-20260828`
Lane base and repository metadata: `7cf1e60bde589fe27c246c0edbc7ad20e96d6db3`.

## Scope

This snapshot authenticates only the bytes of the 26 repository-local Lean
dependency modules reached by the labeled-projection root
`Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18LabeledProjection`.
It does not authenticate a revision, Lean build, `.olean` tree, axiom audit,
Lean/Python representation, serializer, solver, or proof claim.

The v3 tuple is unchanged from v2: exactly 26 modules in canonical module/path
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
`.olean` tree, axiom audit, Python serialization equivalence, and solver
authentication are all false. These flags describe the source-byte trust
scope; this candidate does not authorize downstream proof or solver claims.

## Review evidence

The receipt is
`certificates/rigid221_card18_labeled_projection_source_custody_v3.json`.
The implementation is 36,245 bytes with SHA-256
`3973fd630fa43e56e69c77eb9b9b1a3542350f8a62c7d3d67b54d7ba7a6f3de3`.
The receipt is 8,499 bytes with file SHA-256
`d0154184414ca09a216c8d946be5ecb1448b050098d770c5799938bd239ef3ed`,
body self-hash
`de18ac2e839d660bced1dfbba9a4de232cc55461a0a6aca4417604f3d72b71ba`,
and source-manifest hash
`abf5ceef188044ce4aff831011cb88dfef9efeb19f30980dd33f1b85e69ec348`.

Canonical readback and fresh live attestation pass. The combined custody-v3
suite passes 121 tests; Ruff passes; the kernel mine reports 26 unchanged
modules; and independent adversarial review returns **GO** on the implementation
and receipt. The full Card18 runner passes 131 historical tests with 348 skips,
131 live v3/v5 tests, and the 10,888-job aggregate build. Exact-path staged
hygiene passes with no foreign staged path. Publication must not modify any
v1/v2 artifact.
