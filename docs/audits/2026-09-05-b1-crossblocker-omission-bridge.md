# B1 cross-blocker omission bridge

The new Lean theorem
`crossBlockerCoincidence_implies_named_cross_omission` case-splits the four
arms of `CrossBlockerCoincidence`.  Each arm identifies a critical-shell
center with one source of the other pair, and
`CriticalFourShell.center_not_mem_support` turns that equality into the
corresponding named source omission.

This is intentionally not a closure of `false_of_crossBlockerCoincidence`:
`CollisionCrossHit` is a four-way disjunction of opposite-shell memberships,
and one equality arm only excludes one matching membership.  The remaining
three memberships are not contradicted by the raw coincidence disjunction.
