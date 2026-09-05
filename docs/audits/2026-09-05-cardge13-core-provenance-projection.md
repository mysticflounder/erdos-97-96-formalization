# Card-ge-thirteen verified-core provenance projection

Date: 2026-09-05
Lane: `cardge13-core-provenance-projection-20260905`
Base commit: `bffaf8c50100dcd7637f761a3baf6e9c397268e5`

## Claim scope

This checkpoint joins the source-reconstructing exact-thirteen v2 clause
provenance to the independently replayed dense LRAT core.  It is a diagnostic
formula-core custody result.  It does not prove source coverage, does not close
the variable-row exact-thirteen branch, and is not Lean promotion evidence.

The retained core contains five role-pin clauses and four row-pin clauses.
Consequently, even a kernel replay of this core would prove only the recorded
fixed direct cell unless a separate source theorem supplies those pins or a
finite occurrence theorem transports every source packet into certified cells.

## Inputs

The projector binds these two existing custody chains:

- v2 conversion manifest self-hash
  `fda2362399c31c09e6c158b35c5c5aabc4921c2a33c3b3073e5a4dd7fb9faeb7`;
- v2 DIMACS SHA-256
  `9d2c72288ebf97f4bd6462a4711c028449095884568b5cd57317bb1f3fdbf944`;
- 51,580-row provenance SHA-256
  `eae2c135870238f04618d45d2bd385140a8bfb24984150155b1f71b99f126881`;
- verified-core receipt self-hash
  `e640912632ddf136a863d007976d69ff9d04fbc728bec5085ec3b940f1b06e55`;
- dense core CNF SHA-256
  `e0dcb0466deca221f7be368e47dd241d4a734548b826d8a7d73482b7eea68504`;
- dense-to-original map SHA-256
  `fbe70e119d7e79ddaf99851fbb0dcd47618d556bf2622a30ed028b8089f51917`;
- legacy full DIMACS SHA-256
  `e03108c2bf961d48a343da0a132b1de3d76b28773f5658c7e80443f1029181c4`.

The legacy and v2 DIMACS files have different bytes because the v2 file carries
new comments.  The projector parses both and requires the same 286 variables
and the same ordered sequence of 51,580 clause bodies.

## Fail-closed join

`scripts/project_cardge13_verified_core_provenance.py` performs the following
checks before publishing output:

1. reject duplicate JSON keys and noncanonical or non-LF JSONL;
2. validate both parent self-hashes, the governed run-manifest self-hash, and
   every selected artifact digest, byte count, and repository-relative path;
3. reject symlinks, hardlinks, path escapes, control characters, malformed
   DIMACS, and aliasing between the legacy and v2 full CNFs;
4. require exact ordered clause equality between the legacy and v2 full CNFs;
5. validate the dense variable map and every one of the 51,580 provenance rows
   against its original clause ID, literal sequence, and literal digest;
6. authenticate the raw LRAT, trimmed core, trim trace, dense LRAT, and replay
   checker, then independently replay all 56,077 dense-RUP additions and
   31,389 deletions rather than trusting the parent receipt's Boolean flag;
7. validate all 4,767 core-map rows, strictly increasing original IDs, literal
   digests, and exact dense-core clauses;
8. recheck the core original-ID digest and parent clause/core counts;
9. require the run manifest to pin every source and input byte sequence;
10. capture every input and source through descriptor-relative no-follow opens,
    recapture them immediately before publication, and abort on any mutation;
11. publish the two-file output directory with an atomic no-replace rename,
    parent-directory durability sync, and rollback on a post-rename failure.

The output is under
`scratch/runs/cardge13-core-provenance-projection-20260905/run-0001/tmp/verified-core-provenance-v3/`.
Its receipt self-hash is
`7c73b88989cdd1443634933cf952215bd9ddd7e86094f3bb73e166b27b40ff0d`.
The 4,767-row joined provenance has SHA-256
`b687e7f31f378c6b6fc094b5c2d41a731975d6d2f106ce92f0af3588dad2e028`
and byte count 6,283,690.

The exact receipt is retained at
`scratch/runs/cardge13-core-provenance-projection-20260905/run-0001/core-provenance-receipt.json`
with file SHA-256
`c6027bc87739b33ed9a87bc811e0957cd72cc5bec06282454041fd134f780e29`.
It binds run-manifest self-hash
`ebcbd566704db656073021c5a6c943cea13193652bdcd60b8d7c6c2d6d2e437d`.

## Core inventory

| Family or subtype | Retained clauses |
|---|---:|
| base combinatorial, source command | 1,339 |
| base combinatorial, role pin | 5 |
| base combinatorial, row pin | 4 |
| base Kalmanson, one-provider conflict | 1,470 |
| dynamic Kalmanson, seeded cut | 1,004 |
| dynamic Kalmanson, terminal-event cut | 945 |
| **total** | **4,767** |

The 1,949 retained dynamic cuts split into 1,244 transitive-incidence paths and
705 two-form incidence paths.  This inventory identifies the precise
provider-cancellation records needed by a future Lean data generator; it does
not itself prove that the source rows satisfy the fixed-cell pins.

## Validation

The focused test suite passes 24 tests.  Mutation coverage includes
parent self-hashes, ordered full-CNF clauses, provenance literals and duplicate
keys, strict integer fields, fixed claim dimensions, core-map IDs, dense-core
clauses, all replay artifacts, independent replay failure, run-manifest drift,
artifact paths, noncanonical JSONL, symlinks, hardlinks, output-parent swaps,
publication rollback, output collision, and an input change immediately before
atomic publication.

```text
uv run pytest -q --tb=short scripts/test_project_cardge13_verified_core_provenance.py
24 passed

uv run --with ruff ruff check \
  scripts/project_cardge13_verified_core_provenance.py \
  scripts/test_project_cardge13_verified_core_provenance.py
All checks passed
```

## Next semantic lift

The nearest source-facing use is to project the retained Kalmanson clauses into
the provider checker and prove each selected clause from its recorded
cancellation data.  That supplies a checked terminal for this pinned cell only.
Closing the exact-thirteen outcome still additionally requires one of:

- a source-derived occurrence theorem producing these exact role and row pins;
- a symmetry transport reducing every source packet to this certified cell; or
- source-general direct and mirror certificates with a typed finite coverage
  theorem.

The row-overlap, uncovered-point, and adjacent-grid outcomes remain separate
open branches and are not affected by this checkpoint.
