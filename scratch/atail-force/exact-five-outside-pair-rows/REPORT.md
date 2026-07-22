# Exact-five outside-pair actual-row audit

Date: 2026-07-21

Status: **PROVEN NEGATIVE AT THE FINITE INCIDENCE/ORDER BOUNDARY.** This is
not a Euclidean counterexample.

Write `h` for the physical hub, `s,t` for the two physical support points,
and `u,v` for the exact two-point outside-cap complement of the asymmetric
row centered at `h`. Splitting the actual critical rows at `u,v` gives:

1. If `v` is omitted by the `u`-row, deletion of `v` survives both at that
   row's center and at the robust first apex. This gives only the existing
   nonterminal `CommonDeletionTwoCenterPacket`.
2. The symmetric omission gives the same nonterminal packet.
3. If both cross-memberships hold, the two actual blockers and `h` lie on the
   perpendicular bisector of `uv`. Convex position forces one of the two
   blockers to equal `h`, or the blockers to equal each other. All three arms
   are source-consistent and nonterminal.
4. A one-direction membership closes only if the new center is distinct from
   `h` and lies in the physical cap. The surviving source-level alternatives
   may equal `h` or lie outside the cap.

`ExactFiveOutsidePairFiniteBoundary.lean` kernel-checks a ten-role boundary
with total deletion-critical rows, a bijective blocker map, a Hamiltonian
selected-row cycle, the two-edge cover star, exact-five cap order, row
intersection and cap-hit bounds, abstract apex robustness, and the asymmetric
normal form. The actual rows at `u,v` omit each other and no second recorded
row contains both. Its printed dependencies are only `propext`,
`Classical.choice`, and `Quot.sound`.

The smallest direct terminal-strength target remains

```lean
dist S.oppApex1 N.outside₁ = dist S.oppApex1 N.outside₂
```

Alternatively, a distinct center in the physical cap whose complete shell
contains both outside points closes through the existing cap-center
uniqueness theorem. Neither output follows from the actual-row incidence
split. The next producer must use nonlinear Euclidean/MEC geometry, the
retained metric apex rows, or a complete `IsM44` construction.
