# Exact-five physical omission-cycle geometry audit

Date: 2026-07-17

Status: **NO EXISTING KALMANSON, SAME-CAP, OR OLD ACTUAL-BLOCKER-CYCLE
CONSUMER MATCHES THE SOURCE-EXACT PHYSICAL OMISSION CYCLE.  THE SMALLEST
HONEST NEXT TARGET IS A DIRECT GLOBAL FALSE THEOREM ON THAT CYCLE.**

This audit owns only
`scratch/atail-force/exact-five-omission-cycle-geometry-audit/`.  It does not
change production Lean or closure documents.

## Verdict

Production now constructs a genuine cycle

```lean
PhysicalActualCriticalOmissionCycle H profile
```

of period two through five.  Every cycle source lies in one physical
second-apex exact-five radius class and in one physical strict cap.  For every
directed edge `q -> w`, production proves:

```text
q != w
w notin H.selectedAt(q).support
K4(D.A.erase w, H.centerAt(q))
H.centerAt(w) != H.centerAt(q)
card(H.selectedAt(w).support inter H.selectedAt(q).support) <= 2.
```

The edge's defining incidence is therefore **negative**: the successor is
omitted from the current actual critical row.  Every existing ordinal
Kalmanson constructor needs **positive** membership of two points in a
selected row.  The old actual-blocker-cycle bank instead iterates
`H.blockerVertex`; the physical omission successor is not that blocker and
production proves no equality between them.

No theorem-bank entry closes this field gap.  Adding either the missing
positive memberships or the successor/blocker equality is not harmless
bookkeeping: exact regressions below show that the first is insufficient
without the global K4/critical-map coupling and the second is false in the
audited exact finite abstraction.

## Existing consumer mismatch

| Candidate consumer | Required field | What the physical omission cycle gives | Result |
|---|---|---|---|
| `false_of_selected_rows_in_five_ccw_order` | Three selected rows with six positive source memberships in one five-point cyclic order | Only one negative successor membership per edge | **Field mismatch** |
| `SelectedRowOrdinalComparison` plus `false_of_strictCycle` | Two positive memberships per comparison row and a cyclic order orienting the comparison | The successor is explicitly absent from the current row; the transition need not follow cap rank | **Field mismatch** |
| `SameCapIncompatibleEdge` family | An endpoint-radius/endpoint-in-row premise, with the bank's same-cap source/blocker roles | No endpoint membership and no identification of the physical successor with the actual blocker | **Field mismatch** |
| `FixedSingleRadiusCycleOrderedCapLift` and the old R-cycle bank | A cycle whose successor is `H.blockerVertex`, plus fixed first-apex/history and endpoint-radius fields | A cycle among omitted physical sources in a fixed second-apex class | **Different edge semantics** |
| `u1TwoLargeCapObstruction` | Seven named cross-row metric equalities | Common physical-radius equalities only; no named cross-row packet | **Field mismatch** |
| shell-curvature endpoint | A finite lifted angle chart and a terminal packing/collision consumer | Neither is supplied by the omission cycle | **Nonterminal** |

The theorem-bank registries and indexed Lean corpus were searched for actual
critical omission successors, same-cap incompatible edges, endpoint
incidences, selected-row Kalmanson cycles, and deletion-survival cycles.  The
entries above are the closest reachable consumers; none accepts the current
packet.

## Why the common physical radius does not make an ordinal cycle

All cycle sources have equal distance from the physical apex.  On a linearly
ordered strict cap, a selected-row equality can force a strict comparison in
another row by the Kalmanson crossing inequality.  But the omission transition
is an arbitrary fixed-point-free self-map of a set of at most five sources; it
is not monotone in cap order.  Every nontrivial directed cycle necessarily
wraps around the linear order.

More importantly, the current edge supplies the wrong polarity for the first
Kalmanson step: `w` is absent from `H.selectedAt(q).support`.  Physical
equal-radius membership at the apex cannot replace membership in the actual
critical row at `q`.  Thus there is no source-faithful route from the existing
cycle packet to an ordinal strict-distance cycle.

## Exhaustive next split

For each edge `q -> w`, inspect the reverse incidence

```text
q in H.selectedAt(w).support.
```

This yields the useful theorem-development split.

1. **Mutual-omission arm.**  Some edge also has
   `q notin H.selectedAt(w).support`.  The two actual blockers are distinct,
   both cross deletions survive, and their exact selected supports have small
   overlap.  These are strong finite critical-map facts, but the exact
   finite-metric regression below realizes a two-cycle of this kind.  A
   terminal proof must therefore use Euclidean convex/MEC geometry or some
   further global selected-row coupling.

2. **Reverse-positive arm.**  Every edge has
   `q in H.selectedAt(w).support`.  This produces a directed cycle of local
   equal-pair/bisector incidences.  The exact Euclidean convex/MEC regression
   below realizes such a cap-local directed cycle.  A terminal proof must
   therefore use the full all-center K4/actual-critical-map content, not just
   cap order and these local bisectors.

This split is source-faithful and exposes the missing ingredient.  Neither arm
is currently a bank consumer by itself.

## Regression gates

### Exact within the finite critical-shell abstraction

`scratch/atail-force/paired-common-deletion-nonreturn-audit/` contains an
exact rational 24-vertex model with digest

```text
db4d45278e5f412212fbef2f5903959a831ef952434ee892642d7f5f779242aa
```

It realizes the physical omission two-cycle `1 -> 2 -> 1`, while the actual
blockers are `20` and `21`.  Hence the proposed extra identity

```text
physical successor = current actual blocker
```

is false in that audited abstraction.  The model is not Euclidean planar and
is not a `CounterexampleData`; its status is **EXACT-WITHIN-MODEL**, not a
Problem-97 counterexample.

### Proven exact Euclidean cap-local regression

`scratch/atail-force/strict-oppcap-cross-classifier/directed-cycle-geometry/`
kernel-checks an exact rational nine-point strictly convex configuration with
a non-obtuse MEC support triangle, an exact five-point physical-apex circle,
and three distinct centers satisfying the directed bisector cycle

```text
c0 equidistant from q0,q1
c1 equidistant from q1,q2
c2 equidistant from q2,q0.
```

Its printed declarations use only `propext`, `Classical.choice`, and
`Quot.sound`.  This is **PROVEN** as a cap-local Euclidean regression.  It is
not global `CounterexampleData`: it deliberately lacks K4 at every center and
a total actual critical map.  Consequently, reverse-positive pair incidence,
convex order, the MEC triangle, and the exact physical radius still do not
close the cycle.

## Exact next theorem

The smallest source-faithful theorem with an immediate on-spine consumer is:

```lean
theorem false_of_physicalActualCriticalOmissionCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile) :
    False
```

Its immediate consumer is already production-complete:

```lean
obtain ⟨K⟩ := nonempty_physicalActualCriticalOmissionCycle H profile
exact false_of_physicalActualCriticalOmissionCycle K
```

This target is **CONJECTURAL / OPEN**.  A valid proof must visibly consume all
of the information excluded by the two regressions:

- `D.K4`, not merely the rows at the cycle sources;
- `D.convex` and the MEC/cap data carried by `S`;
- the complete actual selected supports from `H`;
- the common physical exact-five radius; and
- the negative omission/deletion-survival edges of `K`.

The reverse-incidence split above is the recommended internal proof
decomposition.  It is smaller and more faithful than adding an artificial
row packet to the parent theorem, while still allowing each arm to terminate
at an existing bank if the global coupling produces the bank's exact positive
antecedent.

## Epistemic summary

| Claim | Status |
|---|---|
| Production constructs a physical actual-critical omission cycle of period 2--5 | **PROVEN** |
| Current Kalmanson and same-cap consumers do not type-match that cycle | **SOURCE-VERIFIED** |
| Omission successor equals actual blocker | **REFUTED EXACT-WITHIN-MODEL** |
| A directed local bisector cycle contradicts convex/MEC cap geometry | **REFUTED by a PROVEN exact Euclidean cap-local regression** |
| Global K4 plus the full critical map closes every physical omission cycle | **CONJECTURAL / OPEN** |
| The direct theorem above immediately eliminates the exact-five branch once proved | **PROVEN by the existing cycle constructor and ordinary `False` elimination** |
