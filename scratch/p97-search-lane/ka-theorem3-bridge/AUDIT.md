# K-A to Fishburn-Reeds Theorem 3 bridge audit

Status: **REFUTED AT THE RETAINED FINITE INCIDENCE ABSTRACTION**.

This lane asks whether the currently retained K-A facts alone force a
Fishburn-Reeds C2 cut on fewer than 20 vertices, at one global distance, with
minimum row and column degree at least three.

They do not.  `model.json` is an exact finite edge-coloured countermodel to
that implication at the incidence/cardinality interface.  Run:

```bash
uv run python scratch/p97-search-lane/ka-theorem3-bridge/verify_model.py
```

The verifier checks:

- 15 vertices in a cyclic order and three contiguous six-point caps;
- two distinct four-point radius classes at each of three rich apices;
- four exact critical four-shells covering every source;
- a blocker choice for every source whose selected four-shell is destroyed
  by deleting that source;
- `15 <= 4 * 4` for the four declared non-robust blocker centres;
- two common-deletion packets, each with two exact four-point rows, deleted
  source absent, actual blocker distinct from both packet centres, and row
  overlap at most two;
- the two-circle row-intersection bound for every pair of displayed rows at
  distinct centres;
- no one centre/radius class contains all three apices; and
- every fixed-radius graph has empty 3-core; and
- direct enumeration of all vertex subsets at every nontrivial radius finds
  no induced subgraph of minimum degree at least three.

The last check is stronger than failure of the proposed Theorem 3 consumer.
Any bipartite cut matrix at one distance is a subgraph of that fixed-radius
graph.  A graph contains a subgraph of minimum degree at least three exactly
when its 3-core is nonempty.  Thus no choice of the two C2 arcs can repair the
degree failure in this model.

## What the model means

It isolates the missing producer: **radius synchronization plus reciprocal
incidence**.  Existing K-A interfaces choose a radius independently at each
critical-shell centre, and `ApexRichClassStructure` is likewise a
single-centre disjunction.  Convex cyclic-order producers exist separately,
but they do not identify these radii or give three neighbours on both sides of
one cut.

The weakest useful new bridge would choose two disjoint contiguous boundary
blocks, one global radius `delta`, and at least three cross-block
`delta`-neighbours for every chosen point, with total block size below 20.
No current K-A leaf provides that statement.

## Trust boundary

This is **not** a Euclidean realization and does not satisfy or refute
`CounterexampleData`.  Unspecified edge distances are assigned fresh formal
colours; the model proves only that the retained finite
incidence/cardinality consequences do not logically force the proposed
Theorem 3 antecedent.  A geometric theorem using minimality, `noM44`, or new
distance equalities could still eliminate it.

Accordingly, no production Lean obligation is introduced here.  A
`FRDenseSmallC2Subcut` interface would remain `PARKED-SPEC` until such a
geometric producer is found, and the certificate-backed Theorem 3 conclusion
would still need a Lean-kernel consumer before it could close a live theorem.
