# Ingress gap: retained endpoint rows versus the Q sources

The proposed clause

> one retained `P` endpoint row contains both `Q.source₁` and `Q.source₂`, and
> one retained `Pρ` endpoint row contains both `Q.source₁` and `Q.source₂`

cannot be queried soundly by the current named-fan encoder.  Do not launch a
wave for it from this package.

The encoder currently has two abstract retained rows, each with six Boolean
point labels (`source0`, `source1`, `x0`, `x1`, `y0`, `y1`).  Its clauses assert
only exact cardinality four, membership of the two labelled source points,
and unequal retained radii.  Those labels are not identified with
`P.source₁`, `P.source₂`, `Pρ.source₁`, `Pρ.source₂`, `Q.source₁`, or
`Q.source₂`; nor is either row identified with a selected row centered at a
retained endpoint.  Consequently the current `retained` symbols cannot
express either conjunct of the proposed clause.

The live Lean ingress supplies the following facts, but no bridge to the
proposed incidence:

* `RetainedInteriorBlockerCollision` supplies the two points of each exact-
  four first-apex class (`P.source₁/P.source₂` and
  `Pρ.source₁/Pρ.source₂`), their cap-interior membership, and equality of
  their actual blockers.
* `FreshThirdBlockerFiber` supplies `Q.source₁/Q.source₂`, their common
  blocker, freshness from all four retained endpoints, and mutual shell
  membership between the two Q rows.
* `FreshThirdAlignedRetainedConsumerPacket` exposes retained exact-four rows,
  singleton slices, unequal radii, and deletion cores, but does not assert
  that either retained row contains either Q source.

To make this a source-faithful solver query, a producer or adapter must first
provide all of the following, with the intended row centers made explicit:

1. identify retained row 0 with the selected row for the `P` endpoint and
   retained row 1 with the selected row for the `Pρ` endpoint (or state the
   exact alternative centers);
2. provide point-level membership of both `Q.source₁` and `Q.source₂` in each
   of those two selected-row supports;
3. provide the support/cardinality and center-distinctness consequences needed
   by the query, rather than encoding them as anonymous Boolean labels; and
4. state the source theorem that transports these memberships from the live
   deletion/blocker packet to the selected-row supports.

The existing Q-row ownership bijection and retained exact-four/radius clauses
do not imply any of (1)--(4).  Adding Boolean equalities between the labels
would manufacture the missing geometry.  Until a source-clean bridge lands,
the correct status is `INGRESS-GAP`, not SAT/UNSAT evidence.
