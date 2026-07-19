# Actual-blocker boundary separation

Date: 2026-07-16

Scope: scratch-only theorem/proof audit. No production Lean file or another
agent's scratch lane was changed.

## Kernel-checked result

`ActualBlockerBoundarySeparation.lean` proves

```text
SurvivorPairRelocationPacket.boundarySeparation_of_crossMembership
```

Let `O` be the first opposite apex, let `b` be the actual blocker selected at
the source `q`, and suppose the survivor mate `w` belongs to the selected
critical shell at `q`. For every compatible convex-boundary indexing,

```text
btw O b q  <->  not (btw O b w).
```

Thus `q,w` lie on opposite open boundary intervals cut out by the chord
`O--b`; equivalently, the two common points alternate with their two common
circle centers. The proof applies the already-banked shared-pair separation
theorem after checking the actual-blocker labels and endpoint exclusions.

The direct Lean check succeeds, and the declaration depends only on
`propext`, `Classical.choice`, and `Quot.sound`.

## What this proves toward the proposed bridge

The local geometric part is **PROVEN**, not conjectural.

For a card-five directed cross hit whose two sources are both strict
`oppCap1`, the existing checked theorem

```text
forward_cross_blocker_mem_strictOppCap1
```

already forces `b` into the same strict cap. The existing checked ordered-cap
theorem

```text
nonempty_equalRadiusOppositeRankData
```

then places the two equal-radius sources on opposite rank sides of `b`.
So the intended one-edge conclusion really is available:

```text
source rank < blocker rank < mate rank
```

or its reverse.

## Why this does not yet close the bridge

The cycle-wide progress conclusion is **not proved** by this datum, and it is
false at the cap-local interface alone.

`strict-oppcap-cross-classifier/directed-cycle-geometry/
DirectedCycleCountermodel.lean` is an exact rational, convex, MEC-compatible
model with three strict-cap sources and three distinct blocker centers
satisfying

```text
d(c0,q0) = d(c0,q1)
d(c1,q1) = d(c1,q2)
d(c2,q2) = d(c2,q0).
```

The countermodel rechecked successfully in this audit with standard axioms
only. It shows that the local between-rank relation can wrap around a directed
three-cycle.

There is also a source-interface mismatch on the live blocker cycle. The
coherent successor mate used by the fixed-radius cycle construction is in the
`ActualBlockerOmissionOutcome` arm, whereas this boundary theorem consumes a
cross-membership/HIT arm. Independently selected HIT mates therefore do not
define one cycle-wide potential.

The missing strengthening must use a genuinely global field absent from the
countermodel, such as deletion-critical shell provenance that forces an
additional reciprocal incidence/shared-center equality, or a coherent
source-only no-wrap potential. Merely adding more cap-order bookkeeping will
not suffice.

## Validation

From `lean/`:

```bash
lake env lean -R .. -M 8192 \
  ../scratch/atail-force/r-actual-blocker-boundary-separation/ActualBlockerBoundarySeparation.lean

lake env lean -R .. -M 16384 \
  ../scratch/atail-force/strict-oppcap-cross-classifier/directed-cycle-geometry/DirectedCycleCountermodel.lean
```

Both commands exited `0`.
