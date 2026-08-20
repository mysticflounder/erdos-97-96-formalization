# FreshThird source-family diagnostic — 2026-08-19

Status: bounded theorem-mining evidence.  This record adds no CEGAR cut and
does not establish a Lean result.

## Purpose and contract

The preceding 14-role no-alternating-cap probe produced a SAT abstraction in
each boundary cell, while fresh source replay rejected every complete model
signature through the tracked group `source__pinned_source_theory`.  This run
partitions that 612-formula source payload without recreating its formulas:
the diagnostic extracts the tracked Z3 payload from
`freshthird_qfiber_three_carrier_query_v1.py`, then replays the signature in a
fresh solver.

The finite interface is the existing 67 named roles; no ambient-cardinality
bound was introduced.  All hard source predicates are inherited from the
current query.  The SAT assignments remain abstraction witnesses only.

Run root:
`scratch/runs/freshthird-source-family-diagnostic-20260819/source-family-0001/`.
Its manifest pins base `377db68e945079ef8857a3c0fd3283450d2f9470` and the
source digests used below.

## Source partition

`pinned_source_theory` has 612 conjuncts in source order:

- `seed_identity`: 18;
- `seed_multiplicity`: 360;
- `canonical_packet`: 11;
- four `fan_local_i` groups: 46 each;
- `pinned_deletion_profile`: 38; and
- `normalized_fan_outcome`: 1.

The diagnostic checks that concatenating these slices reconstructs the exact
tracked payload.  Core shrinking uses a fresh solver containing only the
currently retained source slice and the full model signature.  It therefore
does not treat a contradiction in another hard source group as evidence that a
slice can be removed.

## Bounded result

The four boundary cells used the existing 6,006-clause, 14-role
no-alternating-cap refinement and a 10-second CaDiCaL cap per cell.

| Boundary cell | CNF result | Full source replay | Isolated family core | Isolated formula core |
| --- | --- | --- | --- | --- |
| 0 | SAT abstraction | UNSAT | `canonical_packet` | `fresh_row_ordered` |
| 1 | SAT abstraction | UNSAT | `canonical_packet` | `fresh_row_ordered` |
| 2 | SAT abstraction | UNSAT | `canonical_packet` | `fresh_row_ordered` |
| 3 | SAT abstraction | UNSAT | `canonical_packet` | `fresh_row_ordered` |

For every cell, the complete signature with no source predicate is SAT.  The
single formula named `fresh_row_ordered` is UNSAT with that same signature.
The formula is the four-arm order-selected survivor packet in
`_ordered_row_at_with`, applied in either orientation to
`freshSourceOne` and `freshSourceTwo`.

## Candidate refinement admission record

Candidate name: `fresh_row_ordered`.

- Source theorem: `freshThird_canonicalDifferentCap_exists_orderSelectedEndpointSurvivingRow` in `TwoSourceFreshThirdFiber.lean`, with its cap-split upgrade through `freshThird_orderSelectedEndpointSurvivingRow_capSplit`.
- Exact antecedent: the canonical-source/different-fresh-cap FreshThird packet,
  the named first-cap source endpoints, distinct source and fresh centers, and
  the packet's source/fresh cap memberships.  The theorem supplies a boundary
  indexing, an outside endpoint, an intermediate endpoint, and one of four
  cyclic order arms together with the endpoint deletion cap-split row packet.
- Active schema arm: the current `freshthird-qfiber-three-carrier` boundary
  cell with the order-selected endpoint survivor branch selected.
- Translation target: the existing CNF `before`, `same`, `incident`,
  `in_cap`, and `cap-choice("row", cap)` literals.  The endpoint cap-split
  part additionally needs the boundary-row at-most-two-in-cap constraints.

The old CNF has all required semantic literals but omits this disjunction.  A
new versioned CNF refinement must encode the complete four-arm predicate;
adding only its order literals would be a stronger assumption than the source
theorem supplies.

## Next action

Build a fresh-namespaced CNF refinement with Tseitin auxiliaries for the four
order arms, three row-cap choices, endpoint-deletion alternative, and
boundary-row cap count.  Differential tests must show that its auxiliary CNF
accepts precisely those assignments whose direct source predicate holds.  The
first run should be a four-cell bounded canary followed by the ordinary fresh
source replay.  Any UNSAT remains discovery evidence until the existing
source-to-query contract and Lean consumer are audited for promotion.
