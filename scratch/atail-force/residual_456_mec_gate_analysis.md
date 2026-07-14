# Exact `(4,5,6)` residual: minimal MEC gate

Date: 2026-07-13

## Verdict

**PROVEN for the structural residual; not a U-row multiplicity producer.**

The exact strictly convex round-5 `(4,5,6)` residual cannot be a live
circumscribed-MEC frame.  There are two useful levels of this statement.

1. **Witness-specific exact cut.**  In the saved exact coordinates, label `10`
   alone lies outside the circumcircle through labels `0,1,2`.  Its signed
   squared power is the positive rational

   ```text
   dist(10,O)^2 - R^2
     = 20114225415994587966 / 57734544545105764661 > 0,
   ```

   where

   ```text
   O = (1/2, 1000/3341),
   R^2 = 15162281/44649124.
   ```

   Since label `10` is a carrier point, `CircumscribedMECPacket.disk_contains_A`
   would give the opposite weak inequality.  Thus this one exact rational
   inequality already rejects the saved coordinates.  Label `11` supplies a
   second rational rejection; label `7` is also outside but has a
   biquadratic, rather than rational, power certificate.

2. **Coordinate-free reusable cut.**  The existing production theorem
   `Problem97.Census554.MECStraddlingRowCore.metric_orientation_incompatibility`
   proves that the residual equality and order pattern forces at least one of
   labels `10` and `7` outside the candidate disk.  This is the right theorem
   to reuse: it removes all large witness constants and applies to any scale.
   The residual adapter
   `scratch/atail-force/residual_456_mec_producer_adapter.lean` maps the three
   needed rows to that theorem.

The second result is a **survivor-specific structural cut**, not a proof of
`URowCapMultiplicityFields`.  It uses one equality furnished by the selected
`u`-row, but neither its dangerous support count nor any cap-multiplicity
field appears in the theorem.

## Exact label map

The live-label placement recovered by the falsifier is

```text
live p  = 0       live q  = 5
live t1 = 3       live t2 = 1
live t3 = 4       live u  = 2.
```

The four exact rows are

```text
0 : {1,3,4,5}       -- the p-centered dangerous row
1 : {0,2,5,6}       -- the selected u-row, centered at t2
2 : {1,7,8,9}
3 : {0,7,10,11}.
```

For `MECStraddlingRowCore`, take

```text
o=0, a=1, p'=2, s=3, x=10, y=7.
```

Here `p'` is the core theorem's local variable, not the live point `p`; it is
the live point `u`.  Rows centered at `0`, `1`, and `3` give

```text
|oa| = |ap'| = |os| = |sx| = |sy|.
```

The row centered at `2` is unused.  The fixed Moser/MEC triangle is
`(o,a,p')=(p,t2,u)=(0,1,2)`.  The saved cyclic order supplies

```text
area(o,a,p') > 0,
area(o,a,s)  > 0,
area(o,x,s)  > 0,
area(o,s,y)  > 0,
```

so `x` and `y` straddle the ray from `o` through `s`.

## Smallest generic MEC inequality

The most economical reusable conclusion is not `False`, but the statement
that the two straddlers cannot both be in the disk:

```text
not (dist x center <= dist o center
     and dist y center <= dist o center).
```

Equivalently,

```text
dist o center < dist x center
or dist o center < dist y center.
```

In squared-power form, with

```text
Pow(z) = dist(z,center)^2 - dist(o,center)^2,
```

the single scalar inequality is

```text
0 < max(Pow(x), Pow(y)).
```

This is a direct wrapper around the existing kernel theorem: assume both weak
disk inequalities and invoke `metric_orientation_incompatibility`.  If a
consumer-friendly API is wanted, a Lean theorem of the following shape is
enough; it requires no new geometry proof.

```lean
theorem one_straddler_outside
    -- the equality, boundary, nonobtuse, and four orientation hypotheses
    : dist o center < dist x center ∨
      dist o center < dist y center := by
  by_contra h
  push_neg at h
  exact metric_orientation_incompatibility
    hoa hoa_ap hoa_os hoa_sx hoa_sy
    hboundary_oa hboundary_op h.1 h.2
    hnonobtuse_a hoap hoas hoxs hosy
```

The current `false_of_residual456_mec` adapter already obtains both forbidden
weak inequalities from `P.disk_contains_A`, so this wrapper is optional.

## Algebraic proof mechanism

Normalize

```text
o=(0,0), a=(1,0), p'=(A,B), s=(C,D), center=(1/2,K).
```

The equal-radius and boundary equations are

```text
(A-1)^2 + B^2 = 1,
C^2 + D^2 = 1,
A = 2 B K.
```

Positive orientation gives `B>0` and `D>0`.  Nonobtuseness at `a` gives
`A<=1`; the first circle equation then gives `0<A<=B`.  Hence, defining

```text
ell = B(2-C) - A D
    = B(2-C-D) + (B-A)D,
q   = A C - B D,
```

one has `ell>0`.

For any `z=(U,V)` on the unit circle centered at `s`, set

```text
Pow(z) = U^2 + V^2 - U - 2 K V.
```

Using `U^2+V^2=2(CU+DV)` and `A=2BK`, the exact identity is

```text
B Pow(z)
  = (CU+DV) ell + (DU-CV) q.                 (*)
```

The first factor `CU+DV` is strictly positive for either straddler.  For
`x`, orientation gives `DU-CV>0`; therefore `Pow(x)<=0` forces `q<0`.  For
`y`, orientation gives `DW-CZ<0`; therefore `Pow(y)<=0` forces `q>0`.
Both disk inequalities are impossible simultaneously.  This identity is the
smallest algebraic core of the MEC gate.

The production proof in
`lean/Erdos9796Proof/P97/Census554/MECStraddlingRowCore.lean` formalizes
exactly this argument, including the reflected orientation.  It contains no
`sorry` or named axiom.  The repository's existing axiom-audit report records
only `propext`, `Classical.choice`, and `Quot.sound`; no build was rerun in
this audit because the active Lake lock was explicitly off limits.

## Why this does not produce dangerous multiplicity

For the falsifier's chosen row,

```text
uRow.center  = 1,
uRow.support = {0,2,5,6},
dangerous    = {1,3,4,5},
common cap   = O2 = {0,1,8,9,10,11}.
```

Thus only label `5` is both a `u`-row support point and dangerous outside the
common cap.  The MEC core uses the `u`-row only to obtain

```text
dist(1,0) = dist(1,2).
```

It does not mention labels `5` or `6`, the dangerous set, the common cap, or
the relevant cardinality.  Its straddling points are labels `10` and `7`,
neither of which lies in the `u`-row support or the dangerous set.  It also
needs the separate row centered at live `t1=3`.

Consequently the current core theorem establishes neither implication

```text
live MEC hypotheses -> URowCapMultiplicityFields
```

or

```text
not URowCapMultiplicityFields -> MECStraddlingRowCore.Core.
```

The exact residual happens to satisfy both the failed multiplicity predicate
and the equality/orientation part of the straddling core, but co-occurrence in
one survivor is not a producer.
A uniform bridge would additionally have to prove that every failed
multiplicity placement yields a center `s` and two equal-radius points on
opposite sides with the required Moser-boundary linkage.  No current theorem
or bank hit supplies that classification.

## Theorem-bank preflight

The required local/sibling/legacy registries and the indexed Lean corpora were
searched before proposing a new lemma.  The indexed search returns the
current `MECStraddlingRowCore` and its
`metric_orientation_incompatibility` as the exact match.  The closest sibling
MEC results (`rowCrossingLeft_empty_of_rowCircle_mec`,
`fixedLaneLeft_empty_of_uIndex_rowCircle`, and
`no_adjacent_escape_on_apex_radius`) are packet- or coordinate-specific and
do not improve this interface.  No new contradiction theorem is needed.

## Consequence for ATAIL-FORCE

- Keep the exact witness as a valid counterexample to the **MEC-omitted**
  weakened implication.  Do not treat it as a live counterexample.
- Keep `MECStraddlingRowCore` as a CEGAR cut for this residual class.  It is
  cardinality-free after its six points are produced, so it gives no reason
  to raise the card threshold above 12.
- Do not route the U-row closure through this core alone.  The missing object
  is still a **uniform classification/producer**: either produce
  `URowCommonCapOffDangerousConfinement`, or show that every failure branch
  yields one of the already formalized MEC/order cores.
- The common-system replay has already moved past this exact round-5 survivor;
  later `(4,5,6)` survivors need their own target-faithful MEC classification.

## Epistemic labels

- **PROVEN:** the coordinate-free MEC straddling incompatibility in the
  existing Lean module; and the statement-level audit that its hypotheses and
  conclusion contain no cap or dangerous-multiplicity field.
- **EMPIRICALLY VERIFIED, externally exact:** the displayed rational power of
  label `10` and the saved exact-coordinate/cap audit.  These come from the
  standalone exact witness certificate, not a new Lean build in this audit.
- **NUMERICAL DISCOVERY ONLY:** the 16-start MEC optimizer found no feasible
  candidate.  This is superseded for round 5 by the generic Lean cut and is
  not used as proof.
- **CONJECTURED:** a uniform implication from the full live hypotheses to
  `URowCapMultiplicityFields`, or a complete case split from its failure to a
  formalized MEC/order obstruction.
