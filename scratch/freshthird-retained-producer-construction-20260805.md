# FreshThird retained producer construction (2026-08-05)

Status: `PARKED-SPEC` until the sharding freeze is lifted.  This is the
construction sheet for the one missing source-level theorem; it is not a
Lean obligation and does not claim closure.

## Radius correction (2026-08-05)

The retained packet's omitted endpoints are not a same-radius pair: `x` comes
from the first collision radius and `y` from the second.  Thus the existing
`RetainedRadiusBlockerMatching` and
`exists_retainedInteriorDirectedOmission_of_matching` interfaces cannot be
instantiated by destructuring this packet.  Any route that silently feeds the
packet into that same-radius producer is invalid.

The retained-arm contract must first prove a cross-radius transport theorem
that creates same-radius matching (or directly creates a named FreshThird
terminal packet).  Independently, the equal-center/different-cap arm remains a
valid alternative, but it needs a strict Kalmanson chain or a third-shell /
reciprocal-incidence witness; shared-pair alternation is only a diagnostic
order fact.

## The change in approach

The retained packet is already produced.  Searching for a theorem with its
conclusion has therefore stopped.  The missing result must be proved from the
packet and the live residual, then wired directly to the on-spine target.

The current facts are deliberately insufficient for a local metric proof:

* `CrossPairDeletionView` supplies only an omission disjunction;
* `freshThird_canonicalDifferentCap_endpointPlacement` supplies a boundary
  order and shared-pair alternation;
* `freshThird_canonicalDifferentCap_sourceSupportPlacement` places the actual
  canonical source point;
* exact-rational bounded probes realize these facts, so order plus the two
  named rows is not a contradiction.

The new theorem must use one genuinely global fact: deletion minimality,
full-carrier K4 robustness, cap cardinality eight, or the no-`(m,4,4)`
condition.  It cannot be another wrapper around the two-row packet.

## Consumer-first contract

Let

```lean
K : FreshThirdRetainedDeletionCorePacket P Pρ C
h : FreshThirdNormalizedResidualRemainingCase P Pρ C Q
```

The producer should be branch-parametric and return only data consumed by an
existing terminal.  Conceptually its type is:

```lean
retainedCore_produces_consumerData K h :
  match h with
  | .firstNonHit data _ =>
      FreshThirdCrossRowHit P Pρ C.firstSource Q ∨
      FreshThirdSameCapCrossRowAlignment P Pρ Q C.firstSource
  | .secondNonHit _ data =>
      FreshThirdCrossRowHit P Pρ C.secondSource Q ∨
      FreshThirdSameCapCrossRowAlignment P Pρ Q C.secondSource
  | .equalCrossRowCenters firstHit secondHit centers_eq firstI secondI =>
      RetainedEqualCenterConsumerPacket P Pρ C Q firstI secondI
```

`RetainedEqualCenterConsumerPacket` is the only new packet type.  It must
contain one of the following, with all witnesses source-derived:

1. a third positive row hit with a center different from the two equal
   centers, so `false_of_two_freshThirdCrossRowHits_distinctCenters` applies;
2. a cap-wide outside-overlap packet consumed by
   `false_of_freshThird_*NonHit_of_capWideAlignment`; or
3. the exact boundary metric equalities and strict order needed by an
   existing Kalmanson consumer.

No `False` field belongs in this packet.  The consumer, not the producer,
performs the contradiction.

## Proof construction

1. Destructure `K` once.  Name the omitted endpoints `x` and `y`, the
   surviving double-deletion K4 at `C.firstSource`, and the nonempty
   `MinimalDeletionCore D.A {x,y} S.oppApex1`.
2. Normalize the residual.  In the first/second non-hit arms, use
   `freshThirdCapSourceNonHit_center_ne_of_sourceRowOmission` immediately;
   this prevents a later proof from silently identifying the source center
   with the fresh blocker center.
3. For each non-hit arm, apply the minimal core to the *omitted* endpoint,
   not to the already-present endpoint.  The required output is either a
   second selected row containing both fresh endpoints (a cross-row hit) or
   the same-cap alignment packet.  This is the one-sided omission-transfer
   lemma to prove first.
4. In the equal-center arm, use
   `freshThirdEqualCenterExactFourRow_of_hits` and
   `commonCollisionEndpointOmission_of_equalCenterHits` to expose the exact
   four-point row and all four omissions.  Then split the two noncanonical
   interactions into same-cap/internal-source and distinct-cap.
5. Discharge the same-cap/internal-source arm by proving that the retained
   minimal core supplies the missing cap-wide incidence (the existing
   common-radius consumer is not valid on the retained branch unless this
   transport is proved).
6. In the distinct-cap arm, combine the canonical source-point placement with
   the minimal-core witness.  The desired global lemma is:

   ```lean
   retainedCore_distinctCaps_produces_thirdIncidence_or_Kalmanson :
     MinimalDeletionCore D.A {x,y} S.oppApex1 ->
     canonicalSourceSupportPlacement ->
     distinctCapInteraction ->
     ThirdIncidencePacket ∨ KalmansonPacket
   ```

   `ThirdIncidencePacket` must name the actual selected shell, its center,
   both fresh endpoints, and the cap-index/outside-cap facts.  `KalmansonPacket`
   must name every equality and strict boundary inequality required by the
   consumer; an alternation flag alone is not enough.
7. Wire the branch consumers into
   `false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining` in
   the same change.  The proof is complete only when the target's direct
   axiom audit contains no `sorryAx`.

## Computational role

Computation is now a validator for this exact contract, not a search over
larger `n`.  Once the source theorem is stated, an exact-rational model may
test whether each proposed global clause is implied by the encoded live
hypotheses.  A SAT witness rejects the clause; an UNSAT result is useful only
after a general-cardinality Lean lift and exact certificate replay exist.

The next useful finite run is therefore not “find the producer”; it is “test
the one-sided omission-transfer or distinct-cap third-incidence clause” with
all fields above present.  Until that clause is source-proved, no fixed-`n`
result is promotion evidence.

## Acceptance gate

The producer is ready for the live shard only when all of these are true:

* no new `sorry` or off-spine proposition is introduced;
* every output branch has a named existing consumer or a separately proved
  terminal;
* the theorem is cardinality-free (or has an explicit arbitrary-cardinality
  lift);
* a focused `lake env lean` check passes on Lean 4.27; and
* the target's transitive axiom audit reports no `sorryAx`.

## 2026-08-05 construction checkpoint

The first producer is now extracted rather than searched for.  The new
upstream module
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceTripleShellEscape.lean`
defines `freshThirdCriticalTripleShellSeed` and proves
`exists_freshThird_selectedRow_escape_tripleShellSeed`.  It preserves both
retained collision shells plus a chosen third source shell, proves the union
is a proper subset using the live `|D.A| ≥ 14` branch, and applies global K4
and deletion minimality to produce a selected row with a point outside the
seed.  The module and the importing residual compile on Lean 4.27.

This is deliberately only a producer.  The next theorem must consume the
escaped row, not merely package it: either force both fresh endpoints into
that row (a cross-row hit), derive cap-wide alignment, or derive a strict
Kalmanson/third-incidence packet for the canonical-source/different-fresh-cap
arm.  Until one of those bridges is proved and called by the anchor, no
closure credit is claimed.
