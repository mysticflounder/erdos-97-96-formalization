# P97 Rigid221 card-18 crossed-incidence source custody (v4)

**Status: EMPIRICALLY VERIFIED source-custody bookkeeping; this is not a Lean
proof, build, axiom audit, or publication claim.**

Lane: `rigid221-card18-crossed-incidence-custody-v4-20260831`
Lane base and repository metadata: `ff935411514804caf003171164807f79d16a341e`.

## Scope

This snapshot authenticates only the current bytes of the 27 repository-local
Lean dependency modules reached by the crossed-incidence root
`Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18CrossedIncidenceProjection`.
It does not authenticate a revision, Lean build, `.olean` tree, axiom audit,
Lean/Python representation, serializer, solver, or proof claim.

The v4 dependency-module tuple records the v3 27-module module/path order.
Two live source-manifest rows have fresh values:

- `Rigid221Placement.lean`: 44,313 bytes and SHA-256
  `49c8c3d6b8ed71c44b4f4287ce923fe63ac477432063db7875ca430753be1ea8`.
- `Rigid221SourceHeavy.lean`: 907,296 bytes and SHA-256
  `2f791217320ef4e3e522ab9f3cdcbb285035bd77a85d3d996a13ec2acb9c4698`.

The other 25 records retain their v3 byte counts and digests. Historical v1,
v2, and v3 modules, tests, receipts, and specifications remain untouched.

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
`.olean` tree, axiom audit, Python serialization alignment, serializer,
solver, and canary authentication are all false. These flags describe the
source-byte trust scope; this candidate does not authorize downstream proof,
coverage, serializer, solver, or canary claims.

## Review evidence

The receipt is
`certificates/rigid221_card18_crossed_incidence_source_custody_v4.json`.
The implementation is 36,886 bytes with SHA-256
`ba8293e381c892158b3139dd8827b4a19c36cb6d4c1ebd0af2773d2936f2718c`.
The receipt is 8,961 bytes with file SHA-256
`5cb27295383c3f4f44ecce722dcf6a2d53407149168764d0edde32f2e1e60d34`,
body self-hash
`d984840081da758176340ae80a181287477ae95c122d84333b5588cb2153f6f9`,
and source-manifest hash
`d6348b804496e3ae6c25f70aa140ffd64ff59ac7091522fb1d0e2f7158d93929`.

The focused command below passed 73 tests.

```sh
PYTHONPATH=. uv run pytest census/p97_search/tests/test_rigid221_card18_crossed_incidence_custody_v4.py
```

Ruff passed on the new implementation and test file. The deployed receipt is
parsed, canonically re-encoded, and freshly live-attested by the focused test.
The lane evidence record captures the commands, results, and authenticated
source hashes.
