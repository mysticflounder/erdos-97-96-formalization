# Ingress contract

This is a diagnostic contract, not a Lean ingress theorem. The source packet
is the fixed user-specified common-radius surface in the
`sameBlocker`/`FirstNonHit` branch. No fields from the retained, omission,
boundary-order, old `v*`, `blocked_after_v`, `shared_arm`, `pair*`, or
`core_arm` packets are admitted.

| packet item | diagnostic representation | status |
|---|---|---|
| C sources `c0,c1`, `c0 ≠ c1` | bounded integer identity atoms | encoded |
| Q sources `q0,q1`, `q0 ≠ q1` | bounded integer identity atoms | encoded |
| `K = Q.selectedShell.support`, `card K = 4` | four-valued Boolean set over 16 atoms | encoded |
| `c0,c1,q0,q1 ∈ K` | set membership | encoded |
| `Cap`, `c0,c1,b ∈ Cap` | Boolean set over 16 atoms | encoded |
| `K ∩ Cap = {c0,c1}` | implication for every bounded atom | encoded |
| four distinct `ui ∈ Cap \ K` | four named witnesses only | encoded; not exhaustive |
| common-radius C class | `radius_c0 = radius_c1 > 0` | deliberately weak abstraction |
| alias/exact-shell split | four alias disjuncts or named shell with Q outside `Cap` | encoded |
| blocker-fiber cap bound | named canonical-cap source triples forbidden in fiber `b` | encoded for named sources |
| selected rows | `C0,C1` card4, own source, exact support `K`, blocker `b` | encoded |
| distinct-blocker rows | `R0,R1` card4, own source, overlap `≤2` with `K` | diagnostic named rows only |
| `hingress` | no variable or clause | opaque by contract |

The `Cap \ K` witnesses are not assigned blocker `b`; the regression case
explicitly sets `u0`'s diagnostic blocker different from `b`. This prevents the
invalid inference that being outside `K` implies membership in the `b` fiber.
