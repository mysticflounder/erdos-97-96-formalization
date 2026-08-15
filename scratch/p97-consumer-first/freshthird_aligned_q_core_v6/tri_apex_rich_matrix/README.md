# v6 tri-apex rich deletion matrix

Scratch-only extension of `freshthird_aligned_q_core_v6.py`; no production Lean
or authoritative documentation is modified.

The three abstract rich witnesses are represented for `oppApex1`,
`oppApex2`, and `surplusApex`, with one shared deletion vertex across all
three witnesses, as required by `TriApexRichDeletionPattern`.  Each query
fixes every witness to one of the source theorem's two arms:

- S6: one positive-radius support has cardinality at least six.  A Boolean
  `deleted` support selects exactly one universe vertex, and the explicit
  survivor support is the class minus that vertex with cardinality at least
  five.
- D44: two disjoint supports have positive distinct radii and cardinality at
  least four.  After the same explicit one-vertex deletion, at least one of
  the two survivor supports still has cardinality at least four.

For every rich selected support, each synchronized v6 x/y shell has
intersection cardinality at most two.  All v6 controls remain inherited:
shell synchronization and endpoint memberships, source absence, row/Q shell
intersection bounds, filler vertices, and equal/distinct blocker relations.
Rich supports belonging to distinct apex centers also have pairwise
intersection cardinality at most two, the finite encoding of the
distinct-center two-circle bound.
The exact survivor clauses follow the scratch theorem
`apexRichDeletionPattern_of_apexRichClassStructure`; this encoding does not
introduce stale exact-five or exact-four equality assumptions.

The `common` tier contains only the shared-deletion strengthening.  The
`interior` tier additionally introduces existential Boolean `capInterior`
membership variables and the source-entitled
`OppositeCapRichDeletionCoupledPattern` for the two off-first-cap witnesses
(`oppApex2` and `surplusApex`).  Its S6 cap slice is taken from the same
post-deletion support and has cardinality at least four; its D44 cap slices
are taken from the same two post-deletion radius supports and have cardinality
at least two each, while the corresponding full survivor disjunction is
retained.  The `separated` tier adds the next source-entitled cap facts: the
cap2 and cap3 interiors are pointwise disjoint, and both canonical first-cap
sources are excluded from both off-first-cap interiors.  It still imposes no
complete cap partition, exact cap size, `n = 15`, or exact-four assumption.

## Matrix

The fixed representative v6 arm is common-x+y `(0,0,0,0)`.  All eight
S6/D44 combinations for the three apexes are run under both blocker modes,
for 16 positive queries.  The common tier has five controls: shared-deletion
cardinality, an S6 survivor below five, both D44 survivors below four, a rich
class hitting one shell in three points, and two distinct-apex rich classes
overlapping in three points.  The interior tier adds one S6 and one D44
cap-interior cardinality control.  The separated tier adds controls forcing a
cap2/cap3 overlap and forcing a canonical source into an off-first-cap
interior.

```text
UV_CACHE_DIR=.uv-cache-v5 uv run python scratch/p97-consumer-first/freshthird_aligned_q_core_v6/tri_apex_rich_matrix/tri_apex_rich_deletion_matrix.py --tier all
```

Tiered results are in `tier_common_results.txt`, `tier_interior_results.txt`,
and `tier_separated_results.txt`; manifests, solver logs, and representative
model summaries use the corresponding tier prefix.  Z3 and cvc5 report SAT
for all 16 queries in every tier.  All five common, seven interior, and nine
separated controls are UNSAT in both solvers.  In particular, honest
off-first-cap separation does not remove a single rich-mode arm.  This is a
bounded diagnostic only; it makes no closure claim.
