# General critical-shell cover versus convex Kalmanson

## Scope and result

This is a source-only audit for the live obligation

```lean
ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core
```

in `FrontierLiveClosure.lean`.  No production Lean file was edited and no Lean
or Lake build was run.

The proposed universal route is false:

```lean
ConvexIndep A -> CriticalShellSystem A -> False
```

does not hold.  More strongly, the exact rational eight-point carrier already
checked in `scratch/blocker-cycle-geometry/TwoCycle.lean` supports a *full*
`CriticalShellSystem`, not merely the two displayed cycle rows.  The same two
full exact shells can be reused for all eight sources.

This corrects one scope statement in
`scratch/blocker-cycle-geometry/REPORT.md`: the existing file does not yet
*construct* a `CriticalShellSystem`, but its proved data suffice to construct
one.  The model still is not a `CounterexampleData` and is not a countermodel
to E1.

## Exact eight-point model

The carrier is

```text
p = (0,0)                     q = (1,0)
a = (-3/5,-4/5)               d = (98/85,-84/85)
b = (-85/157,-132/157)        e = (1,-1)
c = (35/37,12/37)             f = (32/41,40/41)
```

with the two disjoint full classes

```text
pShell = {q,a,b,c} = SelectedClass carrier p 1
qShell = {p,d,e,f} = SelectedClass carrier q 1.
```

`TwoCycle.lean` already proves, without `sorry`:

```lean
carrier_convexIndep
selectedClass_p_one
selectedClass_q_one
p_isUniqueFourCenter
q_isUniqueFourCenter
p_criticalShell
q_criticalShell
```

The full system assigns centers as follows:

| source | selected blocker center | full selected class |
|---|---:|---|
| `q,a,b,c` | `p` | `pShell` |
| `p,d,e,f` | `q` | `qShell` |

The two shells partition the carrier.  For each source `x` in the selected
class, `CriticalSelectedFourClass.exists_of_exactSelectedClass` constructs the
named critical row.  The deletion field follows from

```lean
ATailMinimalUniqueFourCover.
  not_hasNEquidistantPointsAt_erase_of_mem_uniqueFourClass
```

after rewriting the appropriate `uniqueFourClass` with `uniqueFourClass_eq`
and `selectedClass_p_one` or `selectedClass_q_one`.

Thus every source receives a distinct-from-source center and a full exact
four-point shell through it, and deleting that source kills K4 at the chosen
center.  `CriticalShellSystem` does **not** require the chosen centers for
different sources to be pairwise distinct, so reusing `p` and `q` is legal.

### Reusable construction lemma

The clean general theorem behind the extension has the following signature.
It would be worth banking only if this construction is needed again:

```lean
theorem nonempty_criticalShellSystem_of_uniqueFourCover
    {A : Finset ℝ²}
    (center : ∀ x : ℝ², x ∈ A -> ℝ²)
    (radius : ∀ x : ℝ², ∀ hx : x ∈ A, ℝ)
    (hunique : ∀ x hx,
      IsUniqueFourCenter A (center x hx))
    (hradius : ∀ x hx, 0 < radius x hx)
    (hcard : ∀ x hx,
      (SelectedClass A (center x hx) (radius x hx)).card = 4)
    (hmem : ∀ x hx,
      x ∈ SelectedClass A (center x hx) (radius x hx)) :
    Nonempty (CriticalShellSystem A)
```

Its proof is just the two existing constructors cited above.  A concrete
specialization would be:

```lean
theorem carrier_has_criticalShellSystem :
    Nonempty (CriticalShellSystem carrier)
```

The specialization has not been typechecked in this audit because the lane
was explicitly source-only.  The base coordinate model and every fact listed
above were previously kernel-checked by `TwoCycle.lean`; only this evident
eight-case packaging remains unchecked source work.

## Consequences for the proposed contradiction mechanisms

### Blocker-map cycles

The constructed center map contains the legal two-cycle `p <-> q` and maps
the other six sources into it.  Hence finiteness plus a blocker-map cycle is
not a contradiction, even with convex independence, full exact classes,
unique K4 radii at the used centers, and the deletion blocker condition.

The checked bridge in
`scratch/atail-force/blocker-cycle-kalmanson-bridge/REPORT.md` obtains only one
row incidence per orbit step: the source belongs to the row whose center is
the next orbit vertex.  Both ordinal Kalmanson constructors in
`ATail/OrdinalKalmansonCycle.lean` require two support incidences in a single
row.  No cycle theorem currently supplies the second one or localizes the
orbit to the named E1 cap vertices.

### Shell-radius potentials

An arrow `x -> c(x)` gives only

```text
dist(c(x),x) = selectedRadius(x).
```

It gives no strict comparison between consecutive selected radii.  In the
model every selected radius is exactly `1`, including around the two-cycle.
Any radius-potential proof therefore needs a new cap/order lemma that turns a
specific cross-incidence or non-incidence into a strict radius comparison.

### Same-shell chord inequalities

At an extreme center, three co-radial points in angular order inside the open
semicircle do satisfy the useful strict inequality

```text
dist(x_i,x_k)^2 >
  dist(x_i,x_j)^2 + dist(x_j,x_k)^2       (i < j < k).
```

This is a valid local theorem, but it compares chords *within one shell*; it
does not compare the shell radius to another row's radius.  A contradiction
requires cross-row equalities identifying the chord terms.  The concrete
model realizes all of these local inequalities, so the inequality alone
cannot exclude a critical-shell cover.

### Equality-quotiented Kalmanson

`GlobalEqualityKalmansonCore.lean` is already the right terminal consumer.  It
needs, for one increasing boundary quadruple `ia < ib < ic < id`, either

```text
dist(b,c) = dist(a,c)   and   dist(a,d) = dist(b,d),
```

or

```text
dist(a,b) = dist(a,c)   and   dist(c,d) = dist(b,d).
```

Its actual API permits each equality to be an `EdgeClosure`, so chains through
many selected rows are allowed.  A generic critical-shell cover does not force
either closure pattern: the eight-point model is a Euclidean realization of
the whole cover.

The theorem-bank registry was checked before this analysis.  Its relevant
generic entries are `CriticalShellSystem.source_eq_named`,
`off_row_named_label_forbidden`, and the constructors of a critical-shell
system from minimality/no-removability.  It contains no universal
critical-shell-cover contradiction or producer of the missing equality
closure.

## What E1/Q/G add, and what is still absent

The anchored theorem has the exact interface

```lean
(R : FrontierCommonDeletionParentResidual F)
(Q : RetainedOmissionAllLargeNormalForm P)
(G : TriApexAllLargeContext D S) : False
```

`G` contributes three cap lower bounds, rich-class structure at all three
apices, the non-robust-center cover bound, and exclusion of one center covering
all three apices.  It does not expose a selected-row equality cycle.

`Q` has two arms.  Its `CommonDeletionTwoCenterPacket`s contain exact
four-subsets in the deleted carrier, two distinct surviving centers, and an
overlap-at-most-two fact.  Those subsets are not asserted to be full ambient
classes, so their complements cannot be treated as circle non-incidences.

In the `reverseHitFreshCommonDeletion` arm, the apex and reverse blocker share
the pair `O.kept,O.deleted`.  This is the ordinary two-center/two-hit geometry:
convexity localizes the reverse blocker to the cap interior and permits the
alternating order.  It does not itself yield a forbidden Kalmanson placement.
The fresh common-deletion packet supplies more surviving rows but no named
positive cross-incidence into them.

In the `pairedCommonDeletion` arm, the reverse relation is explicitly an
omission, and the two deletion packets again do not identify a second common
support point in the cyclic pattern required by the ordinal consumer.

Therefore the missing E1 content is not “a blocker cycle.”  It is a **positive
cross-row incidence/equality producer tied to cyclic order**.

## Sharp next theorem interfaces

### Preferred: four-vertex equality-closure producer

The weakest interface consumed by the existing strict Kalmanson core is the
following source theorem.  This is a specification of the missing mathematics,
not a claimed proof or a closure by repackaging:

```lean
theorem retainedOmission_forces_kalmanson_equalities
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (Q : RetainedOmissionAllLargeNormalForm P)
    (G : TriApexAllLargeContext D S)
    {boundary : Fin D.A.card -> ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = D.A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary) :
    ∃ ia ib ic id, ia < ib ∧ ib < ic ∧ ic < id ∧
      ((dist (boundary ib) (boundary ic) =
          dist (boundary ia) (boundary ic) ∧
        dist (boundary ia) (boundary id) =
          dist (boundary ib) (boundary id)) ∨
       (dist (boundary ia) (boundary ib) =
          dist (boundary ia) (boundary ic) ∧
        dist (boundary ic) (boundary id) =
          dist (boundary ib) (boundary id)))
```

Either disjunct feeds one of the two existing Kalmanson consumers immediately.
For mining, the preferable stronger certificate records the two equalities as
`EqualityCore.EdgeClosure` proofs, because those explicitly inventory which
full selected rows create the chains.

This interface isolates the actual question: can the Q packet incidences,
tri-apex rich classes, and exact full-shell facts force these two closures?
Current source does not do so.

### Alternate: ordinal-cycle producer

The more global route would prove a nonempty transitive cycle in

```lean
FullSelectedRowOrdinalComparison boundary value
```

and feed `false_of_full_transGen_cycle` (or the production orientation-specific
`SelectedRowOrdinalComparison` consumer).  The producer must include, for
every step:

1. two named vertices in the same **full** selected row;
2. the required four-vertex cyclic placement; and
3. identification of the output distance term with the next step's input.

A center-map orbit supplies none of items 1--3 beyond its one source
incidence.  This route should be attempted only after a Q/G lemma supplies a
second hit.

### Local shared-pair consumer

If mining discovers two full selected rows whose centers and common pair have
one of the forbidden nonalternating placements, no new Kalmanson algebra is
needed: use

```lean
CapCrossingKalmansonBridge.false_of_two_selected_rows_shared_late_pair
```

or its middle-row/end-point companion.  The reverse-hit pair in Q is not such
a certificate by itself; its known localization is consistent with the legal
alternating placement.

## Recommendation

Do not pursue a universal `CriticalShellSystem` Kalmanson contradiction or a
bare blocker-cycle/radius-potential argument.  Mine the two constructors of
`RetainedOmissionAllLargeNormalForm` separately for the smallest positive
cross-incidence that completes one of the two four-vertex equality cores.

Concretely, build an equality-quotient graph whose edges come only from full
ambient `CriticalSelectedFourClass` supports (not arbitrary q-deleted
four-subsets), add the rich apex classes from `G`, and ask whether Q forces one
of the two ordered four-vertex closure patterns above.  A SAT survivor would
be a precise certificate that still more metric information is required; an
UNSAT core would directly name the Lean producer to bank.
