# Retained-omission E1: positive-overlap strategy audit

## Scope

Anchor: `Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`.

This is a source/interface audit only.  It does **not** claim a Euclidean
countermodel or a closure of the anchored `sorry`.

## Result

The present retained-omission interface does not derive a positive
cross-row overlap.  In particular, neither `TriApexAllLargeContext`, the
minimal unique-four cover, nor the global `notRobustCover_card` bound can
force a point of the fresh apex-side deleted row into the reverse critical
shell.

There is, however, an important specialization in the fresh arm which
narrows the missing bridge more precisely than the generic packet interface
suggests.

Let

```text
a = S.oppApex1
d = O.deleted
k = O.kept
b = H.centerAt d
K = (H.selectedAt d).toCriticalFourShell.support
```

and let `freshPacket` be the packet whose centers are `a` and `b`.  Its
second row is not an arbitrary four-set:

```text
freshPacket.B₂ = K.
```

This follows from `qDeletedK4Class_support_eq_selectedShell` (equivalently,
the physical second-apex specialization).  Hence the reverse packet already
has

```text
k, d ∈ freshPacket.B₂,     fresh ∉ freshPacket.B₂,
freshPacket.B₂ ∩ firstCap = {k, d}.
```

The missing positive datum is specifically membership in the *apex-side*
row `freshPacket.B₁`, together with sufficient order/metric information.

## Why the obvious overlap target is unavailable

The packet supplies only

```text
|freshPacket.B₁ ∩ K| ≤ 2.
```

So the strongest purely set-theoretic contradiction would be

```text
3 ≤ |freshPacket.B₁ ∩ K|.
```

No current hypothesis yields even a single member of that intersection.
The common-deletion rows are selected four-point witnesses after deletion;
the apex-side row is not known to be a full shell, and omitted membership in
that chosen witness cannot be converted into shell nonmembership.

Even the hypothetical facts `k, d ∈ freshPacket.B₁` would give only a shared
two-hit pair.  The two-center bisector/Kalmanson package leaves the alternating
cyclic arrangement viable, so that pair alone is not a terminal contradiction.

The paired-common-deletion arm is weaker still and must not be silently
treated as covered by a fresh-arm argument.

## Why cardinality cannot supply the bridge

`TriApexAllLargeContext` supplies the three lower cap bounds, rich-apex
structure, the one-sided bound

```text
D.A.card ≤ 4 * (notRobustCenters D).card,
```

and the no-center-covers-all-apices condition.  None is a lower bound on
intersections of a q-deleted row with another row or a rich slice.  The
minimality/unique-four interfaces similarly provide shell sizes and upper
intersection bounds, not a positive cross-incidence.  Thus a pigeonhole
argument has no common bounded domain into which it can place the relevant
row hits.

The existing finite incidence shadows are consistent with this diagnosis:
they demonstrate that the named-local/count abstraction has no forced positive
cross-hit.  They are not Euclidean counterexamples and are not being promoted
as such.

## Recommended next consumer

The clean source-clean target is not an arbitrary row overlap, but an
other-cap rich double hit of the reverse shell.  A representative theorem is:

```lean
theorem false_of_firstCap_localizedShell_otherCapRichDoubleHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {x : Plane}
    (G : TriApexAllLargeContext D S)
    (hx : x ∈ D.A)
    (hfirst : H.centerAt x hx ∈ S.capInteriorByIndex S.oppIndex1)
    {j : Fin 3} {r : ℝ}
    (hj : S.oppIndex1 ≠ j)
    (htwo : 2 ≤
      ((H.selectedAt x hx).toCriticalFourShell.support ∩
        (SelectedClass D.A (S.oppositeVertexByIndex j) r ∩
          S.capInteriorByIndex j)).card) :
    False
```

Proof route:

1. `criticalShellCenter_mem_capInteriorByIndex_of_two_hits` puts
   `H.centerAt x hx` in cap `j`.
2. `hfirst` puts the same center in the first cap.
3. `capInteriorByIndex_ne_of_mem_of_mem_ne` contradicts `hj`.

In the fresh arm, instantiate `x = d`; the existing reverse-blocker premise
already supplies `hfirst`.

## Exact missing producer

What remains is a genuinely metric/global producer of

```text
∃ j r, firstIndex ≠ j ∧
  2 ≤ |K ∩ (SelectedClass(apex_j, r) ∩ capInterior_j)|.
```

An equivalent bounded-support form says that the two points of `K` outside
the first-cap pair `{k,d}` lie in one rich slice of a single other cap.  That
is a suitable next theorem statement because it is explicit, stable, and
directly feeds a source-clean terminal.  It must not be installed as a new
load-bearing `sorry`: it is not derivable from the current residual fields.

## Consequence for mining

Future mining should target metric information capable of producing this
other-cap double hit: circle-power/rank constraints, Ptolemy or Pluecker
relations on full shells, radical-axis sign variation, or an actual
order-sensitive cross-incidence theorem.  More cap cardinality, generic
packet overlap clauses, or strengthening selected-witness omission masks are
not sound routes to this conclusion.
