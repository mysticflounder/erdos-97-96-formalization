# P97 Rigid221 card-18 labeled-projection source custody (v4)

**Status: EMPIRICALLY VERIFIED source-custody bookkeeping; this is not a Lean
proof, build, axiom audit, or publication claim.**

Lane: `rigid221-card18-labeled-projection-custody-v4-20260831`
Lane base and repository metadata: `ff935411514804caf003171164807f79d16a341e`.

## Scope

This snapshot authenticates only the current bytes of the 26 repository-local Lean
dependency modules reached by the labeled-projection root
`Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18LabeledProjection`.
It does not authenticate a revision, Lean build, `.olean` tree, axiom audit,
Lean/Python representation, serializer, solver, or proof claim.

The v4 dependency-module tuple is the immutable v3 tuple in canonical
module/path order. Two live source-manifest rows changed from v3:

- `Rigid221Placement.lean`: 44,313 bytes and SHA-256
  `49c8c3d6b8ed71c44b4f4287ce923fe63ac477432063db7875ca430753be1ea8`.
- `Rigid221SourceHeavy.lean`: 907,296 bytes and SHA-256
  `2f791217320ef4e3e522ab9f3cdcbb285035bd77a85d3d996a13ec2acb9c4698`.

The other 24 records remain byte-for-byte the v3 records. Historical v1, v2,
and v3 modules, tests, receipts, and specifications remain untouched.

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
`.olean` tree, axiom audit, Python serialization alignment, and solver
authentication are all false. These flags describe the source-byte trust
scope; this candidate does not authorize downstream proof or solver claims.

## Review evidence

The receipt is
`certificates/rigid221_card18_labeled_projection_source_custody_v4.json`.
The implementation is 36,245 bytes with SHA-256
`6df7fdac2ff0be6e7747f85c60509ee651f535a5357266bbd624818031a8c9b8`.
The receipt is 8,499 bytes with file SHA-256
`c29f76c8f38d170c8efe1b94a96fdd5ebc9872045cdaeef66c2fec3c9135b6a9`,
body self-hash
`547a82012de5572f879bc30bf5306de456cc4086305f5ac572db2e286db7f40f`,
and source-manifest hash
`5248f7ac37b12e3b623059959d7f6f3c541297569c128aa7d192da93cdb39900`.

The focused command below passed 50 tests.

```sh
PYTHONPATH=. uv run pytest census/p97_search/tests/test_rigid221_card18_labeled_projection_custody_v4.py
```

The deployed receipt is parsed, canonically re-encoded, and freshly
live-attested by that focused test. The lane evidence record also captures the
command, result, and authenticated source hashes.
