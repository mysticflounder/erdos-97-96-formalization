# B1 endpoint-producer truth audit — checkpoint

Date: 2026-09-02 (America/Los_Angeles)
Current source reported by collaborating agents: HEAD `3d1a6486df6f68c0edd8842c7b4732c4ad69d5d7`

## Candidate implication

```lean
B1CardSixEndpointOrderResidual C E →
  B1WinningLiveSliceSameBoundaryArc C ∨
  ∃ third : ExactFourMutualOmissionJointDeletion C.R C.rho C.u C.v,
    third.deleted ≠ C.first.deleted ∧
    third.deleted ≠ C.second.deleted
```

Typically this is considered together with
`hnormal : B1PhysicalClassFiveSixNormalForm C`.  Since `hnormal.1`
forbids the displayed third-deletion alternative, the proposed producer would
force a winning same-boundary-arc packet and close the B1 normal-form leaf.

## Settled negative result: exported finite/order packet is insufficient

A direct-order SAT countermodel satisfies the active card-six finite and order
projection while both winning arc predicates fail.

Boundary order:

```text
s < d1 < Bc < d2 < u0 < v0 < o1 < Bu < u1 < A < v1 < Bv
  < c0 < c1 < uL < uR < vL < vR
```

Use direct cap blocks `s < o1 < A`, with

```text
opp2Interior    = {d1, Bc, d2, u0, v0}
surplusInterior = {Bu, u1}
opp1Interior    = {v1, Bv}
```

Physical class and exact rows:

```text
physical = {d1,d2,u0,u1,v0,v1}
common   = {d1,d2,c0,c1}
u-row    = {u0,u1,uL,uR}
v-row    = {v0,v1,vL,vR}
```

Set the two canonical deletion blockers equal to `Bc`.  The three physical
pairs are disjoint; the normal-form cover is exact; the row-role
nonmemberships hold; each physical pair is separated across its apex/blocker
cut; the exchanged-cut forms hold; and `btw(d1,d2,Bc)` satisfies
`b1_cardSix_some_pair_blocker_btw`.

Choose the endpoint residual's u-row, source `u0`, mate `u1`, slice
`{u0,u1}`, using the adjacent-cap-mate arm.  For the winning cut `(A,Bu)`,

```text
btw(A,Bu,u0) = false
btw(A,Bu,u1) = true
```

so the u same-arc predicate fails.  The v roles can likewise be ordered so
the v same-arc predicate fails.  Assume the normal-form no-third-deletion
field, making the second proposed conclusion false in this projection.

Independent solver replay:

- target CNF piqd SAT job: `0397319e-bff2-4c2f-a1b1-9c0fbcbaf589`
- model: `[1..8,-9,-10]`
- piqd model check: `SATISFIED`
- SAT smoke job: `5b3d4563-4980-4bc9-be8a-414fa119f3c2`, passed
- UNSAT smoke job: `3a5a4b5a-5c60-474c-9acd-e62a35066cb5`, infrastructure-stuck after CaDiCaL exit 20; irrelevant to target SAT result

## Exact scope

This refutes derivability from the active finite boundary/incidence projection:

- `B1CardSixEndpointOrderResidual`;
- `B1CardSixLocalRolePacket`'s pair/completion data;
- card-six normal-form cover, pair cardinalities and disjointness;
- direct/mirror cap-block order information;
- all currently exported pair `separatedPair` and endpoint `btw` consequences;
- the no-third-deletion Boolean at the projected interface.

It is not yet a full Euclidean inhabitant of `B1GlobalTransportContext` and
therefore does not by itself refute an implication that genuinely uses the
full metric/minimality/deletion fields.

## Remaining truth question

Determine whether the full source-rich context forces an arc through one of:

- `C.R.minimal` / no-qfree consequences;
- first-apex unique-radius and deletion-blocking data;
- escape-source retained q/w deletion survival;
- exact cross-row support membership/omission facts;
- blocker-center metric inequalities.

A valid proof must identify and use such a field.  An order-only proof cannot
exist.
