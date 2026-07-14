# ATAIL Stage-I frontier: common-provenance second opinion

Date: 2026-07-14

## Verdict

Restoring the outer wrapper's common `CriticalShellSystem` provenance does
**not** currently produce either:

1. two dangerous-base equalities at `rows.uRow.center`; or
2. the reciprocal critical-source incidences needed by the endpoint-pair
   perpendicular-bisector consumer.

Consequently it does not exclude either sharp packet in
`stage1_separated_cap_geometry_boundary.lean`.

This is a theorem-interface result, not an independence claim for the full
Euclidean hypotheses.  No production file and no protected file was edited.

## Exact stronger surface checked

The live outer wrapper constructs

```text
rows = CriticalSourceRows.ofCriticalShellSystem
  Hcritical hqA ht1A ht2A ht3A huA.
```

On that surface, common provenance recovers the following facts which the
published K-A-PAIR signature forgets:

- `rows.uRow.center = Hcritical.centerAt u huA`;
- deleting `u` destroys K4 at that center;
- every selected K4 class at that center contains `u` and has the same full
  support as `rows.uRow`;
- `rows.t2Row.center = p` identifies
  `Hcritical.centerAt t2 ht2A = p`;
- deleting `t2` destroys K4 at `p`; and
- rows with equal chosen blocker centers have equal complete supports.

These are diagonal and same-center consequences.  They contain no theorem
placing `q`, `t1`, or `t3` in the `u`-row support and no theorem placing one
endpoint-pair member in the blocker row sourced at the other member.

Moreover, on either separated packet, `p != rows.uRow.center`.  Therefore the
known `t2` and `u` blocker fibers are distinct:

```text
Hcritical.centerAt t2 ht2A = p
Hcritical.centerAt u huA = rows.uRow.center.
```

Same-center rigidity cannot couple those two rows.

## Uniform two-equality closer

Let

```text
c = rows.uRow.center.
```

Use the three dangerous labels `q,t1,t3` (avoiding the already-pinned `t2`
fiber).  The exact label map into
`Problem97.eq_of_equidistant_three_noncollinear` is

```text
a = q, b = t1, d = t3,
x = p, y = c.
```

`hfixed` supplies

```text
signedArea2 q t1 t3 != 0,
dist p q = dist p t1,
dist p q = dist p t3.
```

Center separation supplies `p != c`.  Hence either sharp packet closes if a
producer supplies only

```text
dist c q = dist c t1
dist c q = dist c t3.
```

Common provenance does not supply either equality.  A sufficient but stronger
common-system formulation is

```text
q  in rows.uRow.support
t1 in rows.uRow.support
t3 in rows.uRow.support.
```

Still stronger are the three blocker-fiber collisions

```text
centerAt(q)  = centerAt(u)
centerAt(t1) = centerAt(u)
centerAt(t3) = centerAt(u),
```

because source membership and same-center support rigidity then give the three
support incidences.  None of these collisions follows from all-center K4,
deletion criticality, the blocker-cycle theorem, or the sharp cap packets.

Thus the weakest exact uniform missing theorem is:

```text
SeparatedCapSharpFrontier + common row provenance
  -> dist rows.uRow.center q = dist rows.uRow.center t1
     and
     dist rows.uRow.center q = dist rows.uRow.center t3.
```

No further cap or row bookkeeping is needed after those two equalities.

## Endpoint reciprocal-incidence alternate

For an endpoint-packet witness `x != y`, let `c0` be its already-known
bisector center:

- in the first endpoint arm, `c0 = p` and `x,y` lie in the dangerous
  `p`-shell;
- in the second endpoint arm, `c0 = rows.uRow.center` and `x,y` lie in the
  exact `u`-row shell.

Common provenance gives the diagonal incidences

```text
x in selectedAt(x).support
y in selectedAt(y).support.
```

To instantiate the checked triple-bisector consumer with

```text
a = Hcritical.centerAt x hxA
b = Hcritical.centerAt y hyA,
```

the exact first missing cross-incidences are

```text
y in selectedAt(x).support
x in selectedAt(y).support.
```

The producer must also prove that `c0`, `a`, and `b` are pairwise distinct.
The two cross-incidences turn `a` and `b` into additional bisector centers;
the existing `Dumitrescu.perpBisector_apex_bound` adapter then gives `False`.

Neither deletion-criticality nor all-center K4 creates a cross-incidence.
They say that every K4 class at the blocker chosen for source `x` contains
`x`; they do not say that it contains the unrelated point `y`.  If the two
chosen blocker centers are equal, common provenance identifies the supports
but supplies only one additional geometric center, which is insufficient for
the three-center contradiction.

## Why the banked U5 rows do not fill the gap

The banked U5 incidence incompatibilities are centered at dangerous labels and
are classified relative to deletion of the common point `q`.  A
`CriticalShellSystem` row indexed by source `s` is instead centered at
`Hcritical.centerAt s`; deletion of `s` makes that blocker critical.  These
orientations are not interchangeable.  All-center K4 supplies the existing
q-deleted/q-critical dichotomy, but the bank consumers still require their
mutual support incidences as explicit antecedents.

## Exact next theorem

The smallest uniform target is the two-equality producer above.  If the proof
is instead routed through the endpoint pair, the exact packet-specific target
is:

```text
URowOppositeEndpointInteriorPairFields + common row provenance
  -> y in selectedAt(x).support
     and x in selectedAt(y).support
     and PairwiseDistinct
       [c0, centerAt(x), centerAt(y)].
```

The current library proves every subsequent metric equality and contradiction.
The first unproved content is the first displayed cross-incidence (or,
uniformly, the first dangerous equality at `rows.uRow.center`).

Epistemic labels:

- **PROVEN:** the common-provenance projections, diagonal memberships,
  same-center support rigidity, and named-consumer label maps;
- **NOT PRODUCED:** either dangerous equality and either reciprocal
  cross-incidence;
- **NOT CLAIMED:** independence from the complete Euclidean K-A-PAIR
  antecedents; and
- **CONJECTURED:** a convex/Moser/full-filter theorem can force one of the two
  exact producer packets above.
