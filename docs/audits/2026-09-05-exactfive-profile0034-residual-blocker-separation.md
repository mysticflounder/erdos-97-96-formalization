# Exact-five profile 0034 residual/blocker separation

Date: 2026-09-05

## Reuse preflight

Concrete candidate: preserve the row-0 residual head's original exclusions
from both `N.retained` and `blocker` while selecting a head separated from the
row-1 head and `S.oppApex2`.  The immediate consumer is
`exists_profile0034_seven_role_boundary_indices`; the next consumer is a
boundary enumeration recut at `blocker`.

One indexed search of the repository Lean corpus at revision
`929cae682e8f38f3fd8e91e19934d6d53f4b5f62` found the existing separated-head
selector as the only direct candidate.  Its proof already selected from a
residual pair avoiding `{N.retained, blocker}`, but its public conclusion had
dropped those two facts.  No stronger declaration was available for reuse.
The first missing antecedent was therefore an API omission, not a new
geometric argument or a circular call to the boundary obstruction.

## Change

`RobustApexFourIncidenceContinuationPacket.exists_profile0034_separated_residual_heads`
now also returns `p ≠ N.retained` and `p ≠ blocker`.  Every branch transports
the corresponding residual-pair freshness fact, including the branches that
switch from `p` to `q`.

`exists_profile0034_seven_role_boundary_indices` retains the strengthened
facts in its own conclusion.  In particular, all seven-role consumers can now
form a carrier label for `p` that is provably distinct from the intended
zero-cut point `U = blocker`.

## Verification and boundary

Focused `lake env lean` compilation of
`ExactFiveDistinctProfile0034SourceAdapter.lean` returns exit code 0 with no
diagnostics.  The edited declarations have Lean docstrings and introduce no
`sorry`, custom axiom, native reduction, or external certificate.

This change does not assert that the packet's existing enumeration starts at
the blocker and does not supply the fixed-role base chain.  The reusable
`exists_isCcwConvexPolygon_cyclicShift_at_zero` theorem can perform the cyclic
recut once a normalized raw enumeration is packaged; the geometric interval
and residual-prefix order remain the true source obligations.
