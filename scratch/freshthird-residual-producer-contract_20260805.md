# FreshThird residual producer contract (2026-08-05)

Status: `PARKED-SPEC`.  This is a construction contract for the next
source-level theorem, not a proof and not a promoted computational result.

## Input

The producer must run **before** the normalized non-hit packet is formed.  Its
input is the full interaction data

```lean
C : TwoCapSourceThirdCanonicalRowSurface P Pρ
Q : FreshThirdBlockerFiber P Pρ
firstInteraction : FreshThirdCapSourceInteraction P Pρ C.firstSource Q
secondInteraction : FreshThirdCapSourceInteraction P Pρ C.secondSource Q
crossRowResidual : FreshThirdCrossRowResidual P Pρ C.firstSource C.secondSource Q
```

The normalized residual is a consumer-facing case split, not a producer input.
In particular, `FreshThirdSameCapCrossRowAlignment` contradicts either
normalized non-hit constructor: it contains both Q endpoints in the source row,
whereas `sourceRowOmission` says one endpoint is absent.  Therefore no sound
lemma can derive alignment from `hremaining` alone.

## Required output

The first target is a source-clean disjunction that can be consumed while
constructing the normalized residual, without introducing another terminal
`sorry`:

1. a cap-wide alignment packet for a source, which the existing
   `false_of_freshThird_*NonHit_of_capWideAlignment` adapters consume;
2. two `FreshThirdCrossRowHit` packets with unequal C centers, consumed by
   `false_of_two_freshThirdCrossRowHits_distinctCenters`; or
3. a proved transport to the common-radius/apex-cap packet consumed by the
   existing common-radius terminal.

The producer must also expose the exceptional arm rather than silently hiding
it: the C source center is in `S.oppIndex1` while the Q blocker center is in a
different cap.  Closing that arm is the one new canonical-source-cap/
different-fresh-cap incidence theorem still required for a complete producer.

The theorem must be stated for arbitrary `P Pρ` satisfying the live source
hypotheses.  A bounded n=17 result can only be a conjecture generator or a
regression test until a general-cardinality ingress and lift are proved.

## Construction order

1. Keep the packet-level incidence lemmas that expose support non-membership,
   blocker-center separation, and retained double-deletion/minimality.  These
   are already source-clean.
2. Split the three `Fin 3` cap-index placements of the C and Q centers.  The
   same-cap branch is discharged by the existing outside-overlap consumer; the
   unequal-center branch is discharged by the two-hit perpendicular-bisector
   consumer; the only surviving placement is canonical C cap versus a
   different Q cap.
3. Prove that canonical-source-cap/different-fresh-cap incidence lemma from
   the full source-row, cap-cardinality, deletion, and no-`(m,4,4)` hypotheses.
   A finite model may test this exact statement, but it is not evidence of a
   universal proof until the Lean theorem exists.
4. Turn that theorem and the preceding cap split into a source-clean producer
   and wire it directly into
   `false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining` in the
   same change, then run the focused build and transitive axiom audit.

## Construction status (2026-08-05)

The first packet-level lemma is now source-clean:
`freshThirdCapSourceNonHit_center_ne_of_sourceRowOmission` derives blocker/
source-center separation from deletion survival.  The retained-radii branch
also has a source-clean producer,
`exists_freshThird_retained_minimalDeletionCoreProducer`, which combines the
existing double-deletion witness with the existing minimal-core extraction.
The missing theorem is consequently narrowed to the cap-wide consumer that
uses one of these packets; the two simplest bounded candidate cuts were SAT and
are not being promoted.

## Promotion gate

Neither an external UNSAT certificate, a bounded census, nor a source-clean
wrapper counts as closure.  Promotion requires a kernel-checked producer, an
on-spine consumer, and (for any finite computation) a proved lift from the
finite representation to the universal cardinality range.
