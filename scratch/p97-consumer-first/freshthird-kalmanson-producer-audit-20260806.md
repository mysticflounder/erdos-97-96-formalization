# FreshThird Kalmanson producer audit (2026-08-06)

## Verdict

No current source theorem turns `FreshThirdExceptionalBoundaryMetricPacket`
into the five cyclically ordered roles required by
`false_of_five_ccw_three_shell_equalities_012_124_314`.

This is an **obstruction audit and producer specification**, not a proof.
The existing exact-`n = 17` CEGAR results are theorem-mining evidence only;
they do not provide a universal or arbitrary-cardinality lift.

## What the packet proves

`FreshThirdExceptionalBoundaryMetricPacket` in
`TwoSourceFreshThirdFiber.lean` provides:

- a `BoundaryIndexing D.A` and the three cap-apex boundary blocks;
- alternating boundary placement of the distinct source and fresh centers
  with the two shared endpoints;
- membership of both endpoints in both selected four-point rows; and
- the canonical source-support placement.

Consequently it gives two same-pair equalities, one centered at the source
center and one at the fresh center.  The alternating placement is already the
only placement left after `selectedFourClass_shared_pair_separated`; the four
nonalternating two-center parity contradictions cannot close this branch.

There is a useful named candidate embedding (up to choosing which shared
endpoint is first and making a cyclic re-cut):

```text
(i0,i1,i2,i3,i4) = (sourceCenter, q1, canonicalSource, freshCenter, q2).
```

For this embedding, `h012` is already source-proved because `q1` and the
deleted canonical source are in the source shell, and `h314` is already
source-proved because `q1,q2` are in the fresh shell.  The genuinely missing
metric fact is only

```text
h124 : dist q1 canonicalSource = dist q1 q2.
```

Equivalently, the canonical source must lie on the circle centered at one
shared endpoint through the other.  The packet also does not yet combine its
endpoint alternation and canonical-source block placement into the precise
cyclic order required by this embedding.

## Why the current global producers do not fill the gap

The relevant global minimality theorem
`exists_center_all_selectedFourClass_escape_of_proper_subset` and its
FreshThird specialization
`exists_freshThird_selectedRow_escape_tripleShellSeed` produce an anonymous
center, an anonymous selected row, and an escaping point.  They do not prove:

1. that the anonymous center is one of the required named cyclic roles;
2. that either named shared endpoint lies in the escaping row; or
3. any strict cyclic position for the escaping point.

This limitation is already recorded in the docstring of
`exists_freshThird_escape_with_sourceFaithful_cover`: seed membership does not
identify the source shell supplying the center, and endpoint-support transport
is missing.

Global K4 gives a four-member equal-radius row at every carrier source, but it
does not force prescribed named endpoints into that row.  Cap/cardinality data
locate roles in blocks and make proper-subset escape available, but do not add
positive row incidence.  Iterating row closure reaches the carrier by
minimality, but no current theorem bounds the number of iterations by a
constant, preserves five named roles, or extracts the required cyclic motif.

## What the CEGAR concentration does and does not say

The batched equal-cross-row-center/aligned artifact
`scratch/retained-omission-e1/round5-general-cegar/artifacts-batched-bank-census-equalCrossRowCenters-aligned/20260806T084051Z.json`
ended at `CUT_LIMIT`: 2,000 learned cuts in 357 checks, including 1,817
instances of the `012_124_314` schema.  Typical ordered labels are
`[a1,a2,p1,q1,s2]`, `[a1,a2,p1,s3,s1]`, and
`[t3,t2,a2,r1,s1]`.

The raw roles vary across models and range over the global carrier labels, so
the artifact itself does not identify a canonical Lean binding.  The named
embedding above is a source-level interpretation, not a common tuple mined
from all survivors.  Moreover the CEGAR equality relation is the full
radius-equivalence relation, not necessarily membership in a chosen K4 row.
Thus the repeated cuts identify a promising universal motif, but do not prove
the missing endpoint-centered incidence.

## Smallest honest Lean producer contract

The safest consumer-complete output is an existential metric occurrence, not
a stronger selected-row packet:

```lean
def FreshThirdKalmanson012124314Occurrence
    {D : CounterexampleData} (B : BoundaryIndexing D.A) : Prop :=
  ∃ i0 i1 i2 i3 i4 : Fin B.n,
    i0 < i1 ∧ i1 < i2 ∧ i2 < i3 ∧ i3 < i4 ∧
    dist (B.boundary i0) (B.boundary i1) =
      dist (B.boundary i0) (B.boundary i2) ∧
    dist (B.boundary i1) (B.boundary i2) =
      dist (B.boundary i1) (B.boundary i4) ∧
    dist (B.boundary i3) (B.boundary i1) =
      dist (B.boundary i3) (B.boundary i4)
```

The proposed universal producer should retain the full live ambient residual,
because the exceptional packet alone stores only selected consequences of
global K4/minimality/cap hypotheses:

```lean
theorem exists_freshThird_kalmanson012124314_of_exceptional
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hpacket : FreshThirdExceptionalBoundaryMetricPacket P Pρ C Q) :
    ∃ B : BoundaryIndexing D.A,
      FreshThirdKalmanson012124314Occurrence B
```

Exact surrounding parameters should follow the existing
`freshThird_exceptionalBoundaryMetricPacket_of_dual_interactions` signature.

Field provenance:

- `BoundaryIndexing.boundary_injective`, `boundary_image`, and `boundary_ccw`
  already supply the consumer's enumeration interface; `D.convex` supplies
  convex independence.  A small adapter must derive `B.n = D.A.card` from
  `boundary_image` and injectivity, or expose a cardinality-polymorphic form of
  the Kalmanson consumer.
- Strict index order for the named five roles, after an allowed cyclic re-cut,
  is a genuinely missing order extraction.
- `h012` follows from `source₁_mem` plus
  `CriticalFourShell.q_mem_support`, using `support_eq_radius`.
- `h314` follows from the two fresh-shell memberships, again using
  `support_eq_radius`.
- Only `h124`, the endpoint-centered equality, is a new metric incidence for
  the named embedding.
- Role distinctness follows from strict index order and boundary injectivity;
  it need not be a separate field.

Accordingly, the mathematically narrower named producer is:

```lean
def FreshThirdNamed012124314Order
    {D : CounterexampleData} (B : BoundaryIndexing D.A) (cut : Fin B.n)
    (sourceCenter qLeft sourcePoint freshCenter qRight : CarrierLabel D.A) :
    Prop :=
  ∃ i0 i1 i2 i3 i4 : Fin B.n,
    i0 < i1 ∧ i1 < i2 ∧ i2 < i3 ∧ i3 < i4 ∧
    B.boundary (i0 + cut) = sourceCenter.1 ∧
    B.boundary (i1 + cut) = qLeft.1 ∧
    B.boundary (i2 + cut) = sourcePoint.1 ∧
    B.boundary (i3 + cut) = freshCenter.1 ∧
    B.boundary (i4 + cut) = qRight.1

theorem exists_freshThird_namedKalmansonBridge_of_exceptional
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hpacket : FreshThirdExceptionalBoundaryMetricPacket P Pρ C Q) :
    ∃ (B : BoundaryIndexing D.A) (cut : Fin B.n)
      (qLeft qRight : CarrierLabel D.A),
      ((qLeft = ⟨Q.source₁.1, Q.source₁.2⟩ ∧
          qRight = ⟨Q.source₂.1, Q.source₂.2⟩) ∨
       (qLeft = ⟨Q.source₂.1, Q.source₂.2⟩ ∧
          qRight = ⟨Q.source₁.1, Q.source₁.2⟩)) ∧
      -- after `cut`, the five named labels occur in the schema order
      FreshThirdNamed012124314Order B cut
        ⟨H.centerAt C.surface.firstSource.1 C.surface.firstSource.2, by
          exact (Finset.mem_erase.mp
            (H.selectedAt C.surface.firstSource.1
              C.surface.firstSource.2).toCriticalFourShell.center_mem).2⟩
        qLeft ⟨C.surface.firstSource.1, C.surface.firstSource.2⟩
        ⟨H.centerAt Q.source₁.1 Q.source₁.2, by
          exact (Finset.mem_erase.mp
            (H.selectedAt Q.source₁.1
              Q.source₁.2).toCriticalFourShell.center_mem).2⟩
        qRight ∧
      dist qLeft.1 C.surface.firstSource.1 = dist qLeft.1 qRight.1
```

`FreshThirdNamed012124314Order` should say that the cyclically shifted
boundary contains, in increasing order,
`sourceCenter, qLeft, canonicalSource, freshCenter, qRight`.  If the direct
and mirror block cases require genuinely different schema embeddings, define
this as the finite disjunction of those two consumer-ready orders rather than
claiming a reversal preserves the CCW enumeration.  Once this producer is
proved, the two already available shell equalities complete the checked
consumer call.

A selected-row version with three named `SelectedFourClass` witnesses would
be sufficient but unnecessarily stronger, and the CEGAR evidence does not
justify it.  Its cuts may use equalities from full radius classes or
equivalence paths rather than the selected rows.

## Closure alternatives

There are two sound ways forward:

1. Prove the named bridge above: one endpoint-centered incidence plus the
   finite direct/mirror cyclic-order adapter.  This is the most concrete route.
2. Prove a source-level bounded-core/deletion lift showing that every live
   residual contains a bounded subpacket preserving the relevant equalities
   and cyclic order, then certify exhaustive coverage of that bounded object.

No theorem currently found in the Lean corpus supplies either bridge.
Therefore another fixed-`n` CEGAR run, including exact `n = 17`, cannot by
itself close the universal FreshThird obligation.
