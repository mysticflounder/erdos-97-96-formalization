# P4 mirror direct-overlay occurrence bridge

This package materializes exactly the compact P4 direct-overlay occurrence
families that are not covered by the core-level generic-family bridges:

| family | clauses | compact shape |
| --- | ---: | --- |
| `direct_memberships_imply_row_pattern` | 1,265 | `[-membership ×4, +row]` |
| `direct_row_pattern_implies_outer_arc` | 3,179 | `[-row, +arc]` |
| `direct_no_four_turn_disjoint_outer_arcs` | 6,170 | `[-arc ×4]` |

Every emitted entry keeps its `output_clause_index`, the compact literals at
that index, and semantic values extracted from the source map's
`named_literals`.  The no-four arc order is exactly `core_clause_literal_order`
(the `named_literals` list is checked against it); candidate provenance order
is deliberately ignored.

For mirror semantics, centers, support points, and turn-mask labels are sent
by `reflFin (10-i)`, while `left` and `right` are swapped.  Each row-to-arc
entry includes its reflected `DirectRowArcFiniteDatum`.  The generator checks
the finite formula before emitting it; generated Lean will prove its `.Valid`
with `native_decide`.  That later theorem must be axiom-audited under the
approved profile and its evaluated code closure reviewed, as required by the
project trust policy.

## Deliberate current boundary

This package is an authenticated materializer/schema, not source satisfaction.
`generated/Main.lean` specifies the required future adapter API from
`P4MirrorOuterArcTransport`:

1. membership-to-row uses `mirror_direct_memberships_imply_row_pattern`;
2. row-to-arc needs the pending mirror row-to-arc transport, fed by
   `DirectRowArcFiniteDatum.toSchema` from the checked reflected datum;
3. no-four uses `mirror_direct_no_four_turn_disjoint_outer_arcs` and the
   generator's reflected pairwise-disjoint mask check.

No Lean compilation is run by this package until the shared compiler gate is
explicitly opened.
