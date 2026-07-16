# LowHit residual: exact positive-incidence boundary

Status: **kernel-green scratch reduction; the geometric producer remains
open.**

This lane analyzes only the `LowHit` arm of the current joint-transition
packet. It does not claim A-TAIL or K-A-PAIR closure.

## Proved in current Lean source

[`LowHitResidual.lean`](./LowHitResidual.lean) imports only the current
production `ATail.CriticalPairFrontier` module and proves, without `sorry`,
`admit`, a declared axiom, or `native_decide`:

1. `lowHit_anchor_inter_card_le_one`: a LowHit selected four-row contains at
   most one of its three named anchors.
2. `lowHit_three_le_fresh_support_card`: therefore at least three of its four
   support points lie outside the anchor set.
3. `exists_three_fresh_sources_of_lowHit`: those three fresh points can be
   named pairwise distinctly.
4. `blocker_center_collision_of_mutualCriticalFreshPair`: if two fresh row
   points `z,w` occur reciprocally in the actual critical shells sourced at
   `z,w`, then the original row center and the two chosen blocker centers
   cannot all be distinct.
5. `support_collision_of_mutualCriticalFreshPair`: every center collision is
   upgraded to an exact support identification: the LowHit row equals one
   chosen critical shell, or the two chosen critical shells equal each other.
6. `false_of_distinctMutualCriticalFreshPair`: adding the three explicit
   center-separation facts gives `False` by
   `Dumitrescu.perpBisector_apex_bound`.
7. `false_of_lowHit_of_freshPairClosingProducer`: the resulting producer
   interface closes a LowHit row in one call.

The three bisector centers in item 5 are:

```text
selected LowHit row center
centerAt z
centerAt w
```

The first row already contains `z,w`. The `z`-critical shell already contains
`z`, and the `w`-critical shell already contains `w`. Thus the only missing
positive support incidences are exactly

```text
w in selectedAt z
z in selectedAt w.
```

One cross-incidence would produce only a second bisector center, which is
allowed. Two cross-incidences are the minimum source-specialized positive
data that can expose three centers. The center-separation fields are logically
separate: without them, the checked conclusion is the three-way collision

```text
rowCenter = centerAt z
or rowCenter = centerAt w
or centerAt z = centerAt w.
```

This makes `LowHitFreshPairClosingProducer` the weakest direct
critical-map/perpendicular-bisector producer visible at the current API. It
does not assert that the producer exists.

## Exact abstraction countermodel

[`IncidenceCountermodel.lean`](./IncidenceCountermodel.lean) kernel-checks a
`Fin 19` incidence model with:

- a four-point row disjoint from all three anchors;
- a four-point source row through each of the four fresh points;
- pairwise source-row intersections of cardinality zero, hence at most two;
  and
- no source row containing any other fresh source.

This is exact and exhaustive for the displayed concrete finite structure. It
proves that LowHit cardinality, diagonal source membership, and pairwise
intersection bounds do not imply either missing cross-incidence.

It is **not** a Euclidean counterexample, a `CounterexampleData`, or a total
`CriticalShellSystem`. Actual metric/MEC/cap information could still force a
cross-incidence. The model only blocks a geometry-free or cardinality-only
producer.

## What remains heuristic

The plausible next geometric theorem is to use the full parent
`CriticalPairFrontier`, MEC/cap placement, and retained critical map to select
one pair among the three LowHit fresh sources for which either:

1. both reciprocal cross-incidences hold and cap placement separates the
   three centers, closing through the checked adapter; or
2. reciprocal incidence holds but one of the three center-collision arms is
   forced, after which blocker-row exactness identifies supports and the proof
   continues through an alignment branch.

No current theorem or bank entry produces that selection. In particular,
the following are not proved and must not be documented as consequences of
LowHit:

- existence of even one cross-incidence;
- existence of a reciprocal fresh pair;
- distinctness of the two blocker centers; or
- impossibility of a blocker-center collision.

The mandatory general-n registries and targeted indexed searches were checked
before fixing this interface. The current reusable sink is the production
`Dumitrescu.perpBisector_apex_bound`; sibling q-transport and bisector U5
theorems still require substantially more positive incidence than the two
source-specialized hits above, and they are not present in this working tree's
current source surface.

## Validation

Both files were checked directly from `lean/`:

```text
lake env lean -M 16384 \
  ../scratch/atail-force/low-hit-residual/LowHitResidual.lean

lake env lean -M 16384 \
  ../scratch/atail-force/low-hit-residual/IncidenceCountermodel.lean
```

Both commands exit `0`. The proof declarations report only the accepted core
axioms `propext`, `Classical.choice`, and `Quot.sound` (the finite countermodel
uses only `propext` and `Quot.sound`).
