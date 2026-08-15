# Seven-row cut admission

Compatibility class: **C (new semantics, fresh output namespace)**.

## Cut

For pairwise-distinct point roles
`p1,p2,p3,p4,p5,p6,p8,p9,p11`, forbid the simultaneous memberships

```text
p1: p3 p6 p9       p2: p3 p8 p11
p3: p1 p5 p6 p9    p4: p2 p6 p8 p11
p5: p3 p9 p11      p8: p1 p3
p9: p2 p3 p8
```

Each row role is instantiated only by an actual blocker center of an active
named carrier source.  The two non-center roles `p6,p11` range only over the
same finite set of named carrier sources and actual blocker vertices.  Exact
support/cardinality and absent memberships are irrelevant.

## Provenance and trust status

The task supplies this motif as geometrically impossible and independently
audited.  The exact normalized algebraic endgame is kernel-checked in
`lean/scratch/firstnonhit-sevenrow-lean/SevenRowObstruction.lean`, including
`normalized_k4_membership_impossible`.  Its `sevenRowPattern` records exact
four-point rows containing all memberships above.  The source-to-normalized
geometric adapter is still pending.

There is therefore no production Lean declaration licensing the complete
source-level motif yet.  Under the mandatory admission taxonomy this wave
records the cut as a **relaxation** backed by the task-authorized independent
audit and normalized Lean core.  It is admissible for this discovery probe,
but any cut-dependent UNSAT is `relaxation-UNSAT`, never semantic closure or
Lean promotion.

Antecedent: the nine point roles are pairwise distinct and the listed actual
critical-shell memberships all hold.  Schema arms: `retained`, `common`, and
`common_sameblocker`; no other arm or accumulated bank imports this cut.

## Authentication

The CEGAR detector reads every named vertex and membership value from the exact
Z3 model, checks injectivity and every listed edge independently, and serializes
the witness before admitting its no-good.  A no-good is the literal negation of
that complete named embedding, guarded by its nine-way `distinct` condition.
At most 12 such authenticated no-goods may be admitted in the whole wave.
