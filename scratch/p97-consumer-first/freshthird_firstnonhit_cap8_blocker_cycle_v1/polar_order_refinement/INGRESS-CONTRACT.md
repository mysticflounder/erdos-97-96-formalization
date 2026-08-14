# Refinement ingress

The added clause is source-proved in
`lean/scratch/freshthird-firstnonhit-cap-eight/PolarOrderPacket.lean`:

```text
signedArea2 S.oppApex1 p_i p_j < 0  for every 0 ≤ i < j < 6.
```

The direct and mirror zero-cut arms normalize to this same sign in global
boundary order.  The packet's proof uses
`signedArea_strict_of_boundaryIndexing` and the opposite-apex identification;
it is axiom-clean scratch Lean.

The refinement adds precisely these 15 inequalities to the parent query.
No t-order, apex-order, coordinate box, or other solver clause is added.
