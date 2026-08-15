# Schema-v10 non-hit producer audit (fresh-third)

Date: 2026-08-06  
Scope: source-level audit only; no production or documentation declarations were changed.

## Search provenance

The required indexed theorem-bank search was run before concluding absence:

```text
nthdegree docs search --corpus erdos-97-96-formalization-lean --agentic "FreshThirdCapSourceNonHit FreshThirdSameCapCrossRowAlignment FreshThirdAcyclicCanonicalConsumerPacket firstNonHit source proof"
```

The agentic invocation returned no text, so the names were checked with the
non-agentic corpus search.  It found the declarations listed below, but no
producer from a `FreshThirdCapSourceNonHit` arm (or from the retained packet)
to `FreshThirdSameCapCrossRowAlignment`.

## What the existing consumer requires

`TwoSourceFreshThirdFiber.lean:505-518` defines
`FreshThirdSameCapCrossRowAlignment Q source` as the existence of one
`capIndex : Fin 3` with all of the following data:

1. `Q.source₁`'s center and `source`'s center are in the same cap;
2. the two centers are unequal;
3. both endpoint points `Q.source₁.1` and `Q.source₂.1` are outside that cap;
4. both endpoint points are in the selected support of the `source` row.

The source-clean consumer
`false_of_freshThird_sameCapCrossRowAlignment`
(`TwoSourceFreshThirdFiber.lean:525-545`) immediately turns this packet into
`False` by ordered-cap uniqueness.  Thus the missing work is a producer of
this positive packet (or an independent source-clean contradiction), not a
new consumer.

## Data supplied by each non-hit arm

`FreshThirdCapSourceNonHit` (`TwoSourceFreshThirdFiber.lean:1671-1690`) has:

* `sameBlocker`: center equality between `source` and `Q.source₁`, plus equality
  of the two selected supports;
* `sourceRowOmission`: one deleted endpoint is `Q.source₁` or `Q.source₂`, it
  is absent from the `source` support, and deleting it leaves a surviving
  four-point shell.

The existing theorem
`freshThirdCapSourceNonHit_center_ne_of_sourceRowOmission`
(`TwoSourceFreshThirdFiber.lean:1697-1721`) derives only
`center(source) ≠ center(Q.source₁)`.  It derives no cap index, no support
membership for either Q endpoint, and no outside-cap facts.

The `sameBlocker` arm is incompatible with the alignment packet's required
center inequality, and its support equality does not place either Q endpoint
outside a common cap.  It therefore cannot produce alignment or `False` from
the retained ingress alone.

The `sourceRowOmission` arm supplies exactly one omitted endpoint.  The
survival-to-center-inequality adapter is useful, but the omitted endpoint is
explicitly *not* in the source support; the other endpoint's source-row
membership is unconstrained.  Consequently this arm also lacks the common
cap placement, both outside-cap memberships, and both source-row support
memberships required by `FreshThirdSameCapCrossRowAlignment`.

`nonempty_freshThirdCapSourceInteraction_of_noAlignment`
(`TwoSourceFreshThirdFiber.lean:2410-2490`) is a producer in the opposite
direction: assuming `¬ FreshThirdSameCapCrossRowAlignment`, it normalizes to
`sameBlocker`, `sourceRowOmission`, `sameCapWithInternalFiberSource`, or
`distinctBlockersDifferentCaps`.  It does not derive alignment from a non-hit
constructor.

## Retained/common-radius ingress does not fill the gap

`TwoSourceFreshThirdRetainedProducer.lean:465-515` defines and produces
`FreshThirdAcyclicCanonicalConsumerPacket`.  Its aligned branch records apex
radii, two selected-class singleton intersections, and simultaneous source
deletions; its common-radius branch records a common radius, cap cardinality,
and two source rows.  Neither branch contains Q's two endpoint support
memberships, a shared cap index for Q and the source row, or the two
outside-cap facts needed above.

`TwoSourceFreshThirdResidual.lean:171-191` exposes the `firstNonHit` and
`secondNonHit` arms, while the sole load-bearing anchor
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`
(`...Residual.lean:529-538`) consumes those arms and the retained packet.  The
nearby adapters
`false_of_freshThird_firstNonHit_of_capWideAlignment` and
`false_of_freshThird_secondNonHit_of_capWideAlignment`
(`...Residual.lean:488-521`) only consume an already supplied alignment; they
do not construct it.

## Smallest missing producer boundary

For the first non-hit arm, the smallest source-clean addition is an
incidence-transfer theorem from `(C, Q, FreshThirdAcyclicCanonicalConsumerPacket
C, FreshThirdCapSourceNonHit C.firstSource Q)` to either:

* the exact `FreshThirdSameCapCrossRowAlignment Q C.firstSource` packet, which
  can then be closed by the existing ordered-cap consumer; or
* a direct contradiction carrying equivalent cap/support/deletion information.

The second arm needs the symmetric theorem with `C.secondSource`.  These two
should be one side-parametric producer (instantiate the source field), rather
than two unrelated proofs.  Center inequality from omission is not enough;
the missing bridge is transfer of Q's endpoint incidence/cap placement into
the selected support of the retained source row (or a separate
cross-deletion contradiction using that incidence).

No actual Lean proof was attempted in a scratch file: with the declarations
above, the target is underdetermined by the available fields, and any attempted
proof would require introducing exactly this missing producer hypothesis.

