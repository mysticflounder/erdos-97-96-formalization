# Exact-12 next-row structural CEGAR v2 — 100-cut wave

## Status

This is an authenticated finite exact-12 theorem-mining checkpoint.  It is not
terminal UNSAT, all-cell coverage, an arbitrary-cardinality lift, or a Lean
`sorry` closure.

The twelve-cell wave ended with:

| status | cells |
| --- | ---: |
| `ITERATION_LIMIT` | 11 |
| `STRUCTURALLY_UNRESOLVED` | 1 |
| `UNSAT_DRAT_VERIFIED` | 0 |

The unresolved cell is cell 3 at local iteration 82.  The other eleven cells
reached the configured 100-refinement limit.

## Fresh replay audit

`census/card_head/exact12_next_row_structural_postwave.py` independently:

1. reconstructs each source-faithful cell job;
2. authenticates the recorded detector contract and artifacts;
3. semantically replays every chained journal cut and reconstructed CNF hash;
4. replays any unresolved survivor against the exact post-journal CNF; and
5. requires that the current detector still returns no certificate for an
   artifact reported as structurally unresolved.

All 12 cells and all 1,182 records passed.  The machine report is
`postwave-theorem-search.json` (14,134 bytes, SHA-256
`abb0176c55318bc30d1740b24e9792a4188de87a7da3199bb8c48d9f211103b1`).

## Learned theorem families

| detector family | records | cells |
| --- | ---: | ---: |
| `equality-duplicate-center` | 1,167 | 12 |
| `equality-equilateral-bisector-collision` | 11 | 5 |
| `equality-three-triad-collision` | 3 | 2 |
| `equality-perpendicular-bisector-convex` | 1 | 1 |

Every certificate has literal `direct_row_equality_replay = true`.  There are
977 distinct proof digests and 972 distinct nogood digests.  Minimum cores use
3--10 selected rows; 543 of the 1,182 certificates use four rows.

A theorem-bank audit found existing generic geometry for every admitted
family: `DuplicateCenterCore`, `equilateral_bisector_collision`,
`three_triad_collision`, and the `PerpBisectorCore`/four-row bridge.  Those
declarations explain why the admitted finite cuts are plausible theorem
schemas.  They do not prove that every source assignment falsifies a stored
cut, and this audit did not re-run their complete transitive axiom closure.

## Cell-3 survivor

The authenticated survivor artifact has SHA-256
`d7f8ceb557664887fad7f8920c38bf0a16bc3e0d0ffb3c8491fc9c540d61e1c8`.
Its selected supports are:

| center | support |
| ---: | --- |
| 0 | 1, 3, 4, 5 |
| 1 | 2, 6, 8, 10 |
| 2 | 0, 4, 10, 11 |
| 3 | 2, 7, 8, 11 |
| 4 | 7, 9, 10, 11 |
| 5 | 0, 3, 8, 10 |
| 6 | 2, 3, 5, 9 |
| 7 | 0, 1, 6, 8 |
| 8 | 1, 6, 9, 11 |
| 9 | 0, 4, 5, 6 |
| 10 | 5, 7, 8, 9 |
| 11 | 1, 2, 5, 10 |

The selected rows are `exact=False`: they assert four positive equal-radius
members, not complete fibers.  An exploratory exact-metric QF_NRA check timed
out as `UNKNOWN`; it is not evidence of realizability or contradiction.

The existing proof-backed source-order bank does not classify this cube.
However, the broader diagnostic source-order detector covers all 48 source
orders: 42 orders by `convex-five-point-common-orientation` and six by
`selected-rows-kalmanson`.  Its certificate SHA-256 is
`e79c767271347a27c9fd49bfbb549466f0b8123718a4c1da4c092f72f61314cb`.
This is a concrete candidate cut, not an admitted refinement: the diagnostic
has no generated Lean `SourceOrderPositiveNogood` or authenticated bank binding
for this cube yet.

## Route decision

Do not continue cell 3 with the unchanged order-independent detector: its
current assignment has already passed that entire cascade.  The next bounded
target is now the identified 48-order candidate certificate.  Before it can
be admitted, it must receive both:

1. independent finite certificate replay over positive selected-row facts;
2. a generic Lean adapter deriving the matching geometric contradiction from
   arbitrary positively matching source rows.

Generate and kernel-check the corresponding `SourceOrderPositiveNogood`, bind
it to the exact certificate in a proof-backed bank, and add a tagged
source-order stage without mutating the v2 order-independent journal semantics.
Then run a fresh cell-3 canary and the remaining cells.  A finite promotion
still additionally requires terminal checked UNSAT for all cells and the
existing source/lift contract.
