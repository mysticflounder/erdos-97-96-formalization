# P4 direct-outer occurrence ingress audit

## Result

Do not build a 10,614-clause source-occurrence bridge from the two stipulated
inputs.  The direct adapter contains generic source theorems for all three
families, but the available finite semantic table covers only the middle
family.  The compact occurrence ledger preserves clause provenance and literal
order, not the missing source-atom interpretation.

This is an ingress/data boundary, not a statement about full P4 closure, a
mirror valuation, or production replay.

## Inputs checked

- `unique4-p4-source-bridge/generated/p4-direct-row-arc-finite/`
  contains 3,179 `direct_row_pattern_implies_outer_arc` records.  Each record
  carries its output, core, and terminal indices plus a center, four-element
  row support, side, and turn mask.  It contains neither compact/core literal
  order nor records for the other direct families.
- `unique4-exact-two-core-map/generated/p4-seed0-compact/`
  `p4-seed0-compact-occurrences.jsonl` contains all compact literal orders and
  exact output/core/terminal provenance.  Its family census is 1,265
  `direct_memberships_imply_row_pattern`, 3,179
  `direct_row_pattern_implies_outer_arc`, and 6,170
  `direct_no_four_turn_disjoint_outer_arcs`.

The 3,179 finite-table records agree position-by-position with the ledger on
the `(output_clause_index, source_core_clause_index,
source_terminal_clause_index)` triple.  The first and last joined records are
`(8430, 29749, 2598679)` and `(12872, 42295, 2614353)`.

## Exact blockers

For the 1,265 membership-to-row clauses the ledger gives only signed literals
and provenance.  It has no stored map from each membership and row variable to
its `MembershipAtom` / `RowSupportAtom`; consequently the generic theorem
`direct_memberships_imply_row_pattern` cannot be connected to a compact
literal under a direct-compatible valuation.

For the 6,170 four-outer-arc clauses the ledger likewise gives only signed
literals and provenance.  It has no ordered four-`OuterArcAtom` record and no
six pairwise-disjointness witnesses; consequently
`direct_no_four_turn_disjoint_outer_arcs` cannot be applied to those compact
literals.

The separate `unique4-exact-two-core-map/p4.input-core-map.json` appears to
contain semantic candidate provenance for these families.  It is not part of
the stipulated finite-table-plus-ledger ingress and has not been promoted or
used here.  A follow-up may explicitly authenticate that additional source and
generate two new bounded semantic tables; it must not present those as already
available data.

## Validation boundary

No Lean module was created, so there is no new Lean compilation or axiom
closure to report.  No total mirror `CoreValAgreement` was used.
