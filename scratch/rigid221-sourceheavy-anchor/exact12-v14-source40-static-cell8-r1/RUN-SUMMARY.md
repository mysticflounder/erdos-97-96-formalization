# Exact-12 v14 cell-8 source-40 static checkpoint

Date: 2026-08-09

## Classification

This is a finite discovery/refinement checkpoint.  It is not terminal UNSAT,
all-cell exact-12 coverage, a finite-to-universal lift, or closure of
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker`.

## New source-clean cuts

The cell-8 source bank was extended from source 32 through source 40.  Each
entry is a `SourceOrderPositiveNogood` whose Lean declaration directly
elaborates and whose Python binding authenticates the exact source bytes.

| Source | Lean cut | Cell-8 learned clause |
|---:|---|---|
| 33 | `mixedV7Cell8ThirdPositiveNogood` | `(-972, -2371, -2419)` |
| 34 | `mixedV7Cell8FourthPositiveNogood` | `(-55, -158, -312, -1366, -1641, -2371)` |
| 35 | `mixedV7Cell8FifthPositiveNogood` | `(-55, -545, -2206)` |
| 36 | `mixedV7Cell8SixthPositiveNogood` | `(-34, -234, -841, -2034, -2300)` |
| 37 | `mixedV7Cell8SeventhPositiveNogood` | `(-545, -930, -1393)` |
| 39 | `mixedV7Cell8EighthPositiveNogood` | `(-55, -159, -345, -930, -1207, -2601)` |
| 40 | `mixedV7Cell8NinthPositiveNogood` | `(-55, -2118, -2408)` |

Source 38 was the authenticated bank containing the source-37 cut; source 39
added the eighth positive cut, and source 40 added the ninth positive cut.
The apparent numbering gap therefore reflects detector-source versions, not a
missing Lean theorem.

The source-40 theorem uses only three positive selected rows and the single
convex-five-point core `(a,x,b,c,y) = (2,9,0,10,1)`.  Its source is 3,704 bytes
with SHA-256
`ebb35c707365dda19305f37d510631f313aa0b35d4e8da89a4a7494f9a7d84d9`.
The proof-backed certificate SHA-256 is
`a82d8eb8032924e1bc3ad5e4344899e2a582da9f2ee38630630c4b4ddec70a7b`.

## Authentication and replay

The source-39 migration replayed all 871 retained records, retired the prior
candidate, and produced terminal record
`f620349ccc4b8ef70bfa563cee52440dfe9c7a00410707bf3a3341b4d0d63fd0`.
The source-40 migration again replayed all 871 records, retired the source-39
candidate, and produced terminal record
`259c626d39db6a045a26b91f0e0ac9b4bfdd5f07de5af6b05bb22c38c67c1106`.

The authenticated source-40 static replay loaded all 871 records and 40
proof-backed source-order clauses.  The resulting CNF had 44,855 variables and
732,117 clauses.  CaDiCaL returned SAT (`10`); no detector or admitted-cut
stage accepted the survivor, and no proof was produced or verified.

An earlier source-39 static attempt accidentally passed a nonexistent
`.../journal.jsonl` path because the migration output is a file, not a
directory.  That invalid diagnostic is preserved under
`exact12-v14-source39-static-cell8-bad-seed-r1` and is excluded from every
claim here.  The corrected source-39 and source-40 runs each report
`record_count = 871` in `summary.json`.

## Verification

- Direct Lean elaboration is green for the source-33 through source-40 cut
  files, including source 40.
- Ruff is clean for the ordered-coverage producer and its two focused test
  modules.
- The full 18-test ordered-coverage/source-bank suite passed after source 39
  in 514.387 seconds.
- After source 40, the proof-backed survivor regression and exact 40-entry
  source-bank regression both passed in 72.552 seconds.

The next finite target is the authenticated source-40 survivor.  It still has
a proof-discoverable convex-five-point obstruction, so the immediate action is
another source-clean positive cut, not an exact-assignment blocker.
