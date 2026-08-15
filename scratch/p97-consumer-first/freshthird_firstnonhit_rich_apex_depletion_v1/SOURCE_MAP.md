# Source map and scope ledger

## Encoded

- Ten pairwise-distinct named carrier roles:
  `q,p,k0,k1,k2,k3,r1a,r1b,r2a,r2b`.
- `q=(0,0)` and the exact critical row
  `K={k0,k1,k2,k3}` on the unit circle about `q`.
- Exact nonmembership of every other named carrier point in that `q`-circle.
- A distinct center `p=(1/2,1)`.
- The deletion set `V={k0,k1,k2} subset K`, with `|V|=3`.
- An exact five-point `p`-class of squared radius `5/4`:
  `{q,k0,k1,r1a,r1b}`. Its intersection with `V` has size two and its
  post-deletion survivors are exactly `{q,r1a,r1b}`.
- An exact four-point `p`-class of squared radius `37/20`:
  `{k2,k3,r2a,r2b}`. Its intersection with `V` has size one and its
  post-deletion survivors are exactly `{k3,r2a,r2b}`.
- The source-allowed aliases `q` in the first surviving triple and `k3` in the
  second surviving triple.
- Restoring each individual member of `V` yields exactly four points in its
  represented `p`-class.
- Both positive radii are distinct, so the represented rich-apex profile is
  the local `D44` arm (class sizes five and four).
- All ten named points occur in one explicit strict CCW boundary enumeration;
  exact positive cross-products put every named point at a strict convex-hull
  vertex.
- The same pinned QF_NRA files are checked by Z3 and cvc5. Both returned models,
  plus the generated witness record, are independently read back and checked
  with exact `Fraction` arithmetic.

## Omitted

- The rest of the ambient carrier and every unnamed deletion row or radius
  class.
- A fixed total carrier cardinality; this named-role quotient is independent
  of ambient `n`.
- Global minimality, all-carrier K4, cap-source, opposite-cap, blocker-fiber,
  cyclic-order, MEC/Moser-triangle, and Kalmanson hypotheses not implied by the
  listed local metric packet.
- Any identification of `p` with the FirstNonHit packet's actual blocker or
  canonical fan-row center beyond the stated local roles.
- Any distinct-center selected-row producer, three-hit Q-row overlap, or direct
  contradiction consumed by the live Lean terminal.
- Lean ingress, coverage, certificate replay, proof-spine wiring, and a
  general-cardinality promotion theorem.

The omissions are intentional. Therefore SAT establishes local packet
consistency only; it cannot be promoted as a P97 counterexample or as evidence
that the universal residual is false.
