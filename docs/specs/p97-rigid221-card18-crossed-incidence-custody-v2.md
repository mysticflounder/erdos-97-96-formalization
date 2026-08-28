# P97 Rigid221 card-18 crossed-incidence source custody (v2)

**Status: ALL SOURCE-CUSTODY V2 PUBLICATION GATES COMPLETE.**

Lane: `rigid221-card18-crossed-incidence-custody-v2-20260828`
Lane base and repository metadata: `6d0fcc389255ac24be267636abb8f7545d63bcb7`.

## Scope

This snapshot authenticates only the bytes of the 27 repository-local Lean
dependency modules reached by the crossed-incidence root
`Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18CrossedIncidenceProjection`.
It does not authenticate a revision, Lean build, `.olean` tree, axiom audit,
Lean/Python representation, serializer, solver, or proof claim.

The v2 tuple is unchanged from v1: exactly 27 modules in canonical module/path
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
`.olean` tree, axiom audit, Python serialization equivalence, serializer,
solver, and canary authentication are all false. These flags describe the
source-byte trust scope; this candidate does not authorize downstream proof,
coverage, serializer, solver, or canary claims.

## Review evidence

The receipt is
`certificates/rigid221_card18_crossed_incidence_source_custody_v2.json`.
The implementation is 36,886 bytes with SHA-256
`2ed04873e7bdc43c2cac79909507a6f3c0542b7fc6a73fb7bc70e72123bffde9`.
The receipt is 8,961 bytes with file SHA-256
`fe85bf58b97c97888599c7b03e74b46f2cdef2ef26ce0048877ba334a05297fc`,
body self-hash
`985ba69bb0e08d79d58259110a2c3240e4ffc0c141d5b054ee7ddb7ca5139056`,
and source-manifest hash
`0740aa1cefe54d9c68bc5b1852f685cdb11c8d7fba55f9b27898be59660ef90e`.

Canonical readback and fresh live attestation pass. The combined custody-v2
suite passes 121 tests; Ruff passes; the kernel mine reports 27 unchanged
modules; the full Card18 runner passes; and independent adversarial review
returns **GO**. Exact-path staged hygiene passes with zero lane issues and no
foreign staged path. Publication must not modify any v1 artifact.
