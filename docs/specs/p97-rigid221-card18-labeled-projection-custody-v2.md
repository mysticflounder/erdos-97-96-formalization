# P97 Rigid221 card-18 labeled-projection source custody (v2)

**Status: ALL SOURCE-CUSTODY V2 PUBLICATION GATES COMPLETE.**

Lane: `rigid221-card18-labeled-projection-custody-v2-20260828`
Lane base and repository metadata: `6d0fcc389255ac24be267636abb8f7545d63bcb7`.

## Scope

This snapshot authenticates only the bytes of the 26 repository-local Lean
dependency modules reached by the labeled-projection root
`Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18LabeledProjection`.
It does not authenticate a revision, Lean build, `.olean` tree, axiom audit,
Lean/Python representation, serializer, solver, or proof claim.

The v2 tuple is unchanged from v1: exactly 26 modules in canonical module/path
order. Exactly one source-manifest row changes: `Rigid221SourceHeavy.lean`,
now 882910 bytes with SHA-256
`f2a5b2bf20dd6063177a2622f86751ce8a3a8549d8c9c386d660193bf4a54530`.
All other rows remain byte-for-byte unchanged. The v1 module, tests, receipt,
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
`certificates/rigid221_card18_labeled_projection_source_custody_v2.json`.
The implementation is 36,245 bytes with SHA-256
`4242ad8136a50f5656923e74505de144fee30a18379717c7e387ee49990ee9b4`.
The receipt is 8,499 bytes with file SHA-256
`d4ea2d9db4c538865616ced8250b8baca8ebe37963d6fd7ca44f83ffbafa5fb7`,
body self-hash
`61fbb155d92d59809209112bbb2c57d22fb474bf62ad74a5aab1ed4310e9ec4a`,
and source-manifest hash
`aca73e5476aacfefd25b675e29a785d41a40e7b594bdccf6ed2ad4c98c3e93cc`.

Canonical readback and fresh live attestation pass. The combined custody-v2
suite passes 121 tests; Ruff passes; the kernel mine reports 26 unchanged
modules; the full Card18 runner passes; and independent adversarial review
returns **GO**. Exact-path staged hygiene passes with zero lane issues and no
foreign staged path. Publication must not modify any v1 artifact.
