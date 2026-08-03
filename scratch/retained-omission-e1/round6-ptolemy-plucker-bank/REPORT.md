# Ptolemy / Pluecker / centered-Gram bank audit for the E1 core

**Scope.** Source-only audit for
`Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`.
No Lean source, solver schema, or build was changed.  I inspected the three
required general-n registries (including their JSON inventories), the main
general-n mining note, and made one focused cross-corpus Lean search:

```text
nthdegree docs search --lean
  "Ptolemy cyclic four points selected shell radius equal centered Gram Plucker concyclic"
```

The search found Mathlib's Ptolemy module and the existing P97 U5 metric
families, but no directly applicable Ptolemy/Pluecker/Gram consumer for this
normal form.

## What is actually available

### PROVEN: which rows are full circles

* A `CriticalFourShell` is the **entire** ambient fixed-radius class and has
  cardinality exactly four (`U1CarrierInjection.lean:542-555`).  Thus the
  shell `K = (H.selectedAt O.deleted _).toCriticalFourShell.support` is a
  genuine four-point circle class.  Its membership and nonmembership can be
  used as power-matrix zero/nonzero information.
* In the `reverseHitFreshCommonDeletion` arm, the second q-deleted row of
  `freshPacket` has actual blocker center `H.centerAt O.deleted _`.  Therefore
  `qDeletedK4Class_support_eq_selectedShell` proves **B2 = K**.  This is the
  only chosen deletion row upgraded to a full class by the present normal
  form.
* A rich apex supplies either a positive selected class of size at least six,
  or two distinct positive selected classes of size at least four
  (`ApexRichClassStructure.lean:50-53`).  Its cap refinement provides a
  four-point same-radius interior slice or two two-point, distinct-radius
  slices (`ApexRichClassStructure.lean:125-145`).  Any four actual members of
  one such slice are concyclic.

### PROVEN: what is only a chosen subset

`CommonDeletionTwoCenterPacket.B1/B2` are `U5QDeletedK4Class` witnesses:
four selected points after deleting `q`, on a circle around their named center,
with pairwise overlap at most two.  In general they are **not** asserted to be
the whole carrier circle class.  In particular:

* `z ∉ B1` never proves `z` is off B1's underlying circle;
* the same is true of B2 except in the fresh arm after applying the special
  actual-blocker equality above;
* the common-deletion data gives no positive cross-membership between B1/B2
  and a rich apex class.

This is decisive for a power-pattern or determinant route as well as for any
attempt to use selected-set complements in a circle argument.

### AVAILABLE, but not instantiated: Ptolemy

Mathlib supplies Ptolemy for a `Cospherical` quadruple
(`Mathlib.Geometry.Euclidean.Sphere.Ptolemy`, found by the Lean search).
It can be applied to four members of `K`, to four members of one rich class,
or to a q-deleted row's four *positive* members.  It yields one chord identity
in six otherwise independent positive chord lengths.

No equality among those chords is supplied by `Q` or `G`: their equalities are
all **center-to-member** radii.  A Ptolemy identity is consequently compatible
with the present data and cannot create a cross-incidence.  A two-point
overlap with a second circle is also compatible (and is already the sharp
generic intersection bound).  Three common points would immediately force the
two circles to coincide / contradict distinct centers, but that is the known
two-circle argument, not a new Ptolemy application.

### AVAILABLE, but not instantiated: positive Pluecker / centered Gram

For points on a fixed circle in an open semicircle, positive Pluecker is a
packaging of all Ptolemy identities.  To use it one additionally needs the
cyclic order of *the shell's individual support points* on that circle and
enough chord equalities to specialize a Pluecker relation.  `Q` orders cap
arcs and records only its listed intersections; it supplies neither such
per-circle order nor chord equalities.

Likewise, the centered Gram matrix of a rich class has rank at most two, but
the available hypotheses name only its common norms (one norm in the S6 arm,
two norms in the D44 arm).  They do not name the off-diagonal inner products,
or equivalently any distances between class members.  Rank two therefore gives
no scalar contradiction at this interface.

The sibling U5 Gram certificate family is a different, finite eight-label
interface: it requires a `U5DangerousTriple`, six propagation-row witnesses,
and a checked certificate.  The P97 registry records it as a real metric
consumer, but `Q/G` produce none of that labelled pattern or certificate.
It is not an adapter for this abstract all-large normal form.

## Existing stronger usable consumer

The closest already-proved global metric consumer is actually strict
Kalmanson, not Ptolemy.  The cardinality-generic theorem
`UniqueFourKalmansonOccurrenceScratch.false_of_two_k2_three_row_triangle`
requires three selected full rows, six cyclically ordered roles, and the three
displayed pairs of **positive** row-support memberships.  Its proof uses only
the three center-to-member equalities plus strict convex order.  The bank audit
shows this target has no way to produce its third row or the required crossing
membership triangle from `Q/G`; the two common-deletion rows only have an
upper overlap bound.

The existing Census-554 `SharedPairSeparationCore` is similarly available but
requires two named centers each equidistant from the same two named points.
`Q/G` do not force such a shared pair (overlap may be zero, one, or two).

## Exact missing producer / recommended next target

There is no Ptolemy-, Pluecker-, or Gram-only contradiction at the current
interface.  The smallest useful **geometric** positive producer is the
following other-cap rich double hit for the actual full shell in the fresh arm:

```lean
∃ (j : Fin 3) (r : ℝ), j ≠ S.oppIndex1 ∧
  2 ≤ ((H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
        (SelectedClass D.A (S.oppositeVertexByIndex j) r ∩
          S.capInteriorByIndex j)).card
```

Here the shell center is already in the strict `oppIndex1` cap.  A double hit
in a distinct rich cap localizes that same center into the distinct strict cap,
contradicting cap disjointness.  This is strictly smaller than asking for a
third common point and is a concrete cross-incidence that the present CEGAR
can mine.  It is **CONJECTURED as a consequence of the open E1 hypotheses**,
not proved by this audit.

For a specifically Ptolemy/Pluecker route, the smallest missing input is
stronger: after choosing four cyclically ordered points from a *single full*
circle class, one needs enough independently forced chord equalities to reduce
its Ptolemy equation to an impossible positive identity.  Presently there are
zero such chord equalities.  Do not promote a chosen `B1` complement to supply
one.

## Conclusion

**PROVEN:** full-shell exactness, rich-slice existence, q-deleted/full-shell
distinction, Ptolemy availability, and the existing Kalmanson/separation
consumers.  **AVAILABLE but uninstantiated:** Ptolemy, positive Pluecker,
centered Gram, and the U5 Gram certificate lane.  **CONJECTURED:** the
other-cap double-hit producer above.  The right next work is to mine/derive
that positive cross-hit (or a Kalmanson triangle); adding generic Ptolemy or
Gram equations to the current named-local abstraction will not be soundly
decisive.
