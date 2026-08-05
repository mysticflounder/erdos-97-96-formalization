# Proposed FreshThird plan amendment (2026-08-05)

The contract and decision in this scratch note are now promoted to
`docs/computational-closure-plan-2026-07-28.md` §13.10.  This file remains the
working detail, not an independent closure plan.

## Decision after the order-only refutation

The order-only/cyclic-order route is no longer an admissible producer contract.
`scratch/freshthird_exact_incidence_probe.py` finds 36 packet-compatible
alternating orders and an explicit order in which the required strict-late
chain fails.  The exact five-role audit likewise leaves 16/24 orders
Kalmanson-feasible (and the square witness realizes the shared-radius pattern).
Thus alternation, endpoint placement, or a finite order census is diagnostic
only; it cannot be promoted to a Kalmanson consumer without a new strict
boundary chain or an independent metric/incidence theorem.

The live target remains
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`, which
still reports `sorryAx`.  The source-clean
`exists_freshThird_escape_with_sourceFaithful_cover` producer is useful
infrastructure, but its escaped row is not closure until a named seed and
consumer-ready endpoint memberships (or an explicit strict-order/third-
incidence alternative) are returned.

## Binding producer contract

The producer runs before construction of
`FreshThirdNormalizedResidualRemainingCase` and receives the complete
source-level packet:

```text
C : TwoCapSourceThirdCanonicalRowSurface P Pρ
Q : FreshThirdBlockerFiber P Pρ
firstInteraction  : FreshThirdCapSourceInteraction P Pρ C.firstSource Q
secondInteraction : FreshThirdCapSourceInteraction P Pρ C.secondSource Q
crossRowResidual  : FreshThirdCrossRowResidual P Pρ C.firstSource C.secondSource Q
```

It must return a disjunction whose every arm is consumed immediately:

1. `FreshThirdSameCapCrossRowAlignment` for the relevant source, consumed by
   the existing first/second non-hit adapters;
2. two `FreshThirdCrossRowHit` packets plus unequal source centers, consumed by
   `false_of_two_freshThirdCrossRowHits_distinctCenters`;
3. a common-radius packet satisfying the hypotheses of
   `false_of_commonRadius_equalCenters_noncanonicalSameCap_packet`; or
4. for the exceptional canonical-source/different-fresh-cap (or retained-
   radii) arm, a new packet containing either a proved strict metric chain
   accepted by a named terminal, or a named third-shell/reciprocal-incidence
   packet accepted by a new source-clean terminal.  Alternation alone is not
   an output contract.

The producer must preserve the named shell/seed label, both endpoint
memberships, cap indices, source/fresh center equalities or inequalities, and
all deletion/blocker witnesses needed by its selected consumer.  A wrapper,
`Nonempty` shell, anonymous escaped row, bounded-`n` result, or fixed-`q`
deletion packet without a consumer is bookkeeping, not producer progress.

## Computational-to-Lean ingress checklist

1. **Freeze the ingress.** State the arbitrary-cardinality Lean theorem and
   exact hypotheses above before running a solver.  Do not encode only the
   normalized residual or silently assume a fixed `n`.
2. **Name all fields.** Encode the selected shell, source/fresh centers,
   cap indices, endpoint identities, support overlap, deletion survival,
   blocker inequalities, and the exceptional-arm tag.  Include overflow
   buckets whenever a finite cardinality abstraction is used.
3. **Probe one clause at a time.** SAT is a countermodel to that proposed
   producer arm.  UNSAT is only a candidate finite obstruction; retain the
   exact model/certificate and the encoder version.
4. **Authenticate and replay.** DRAT/Farkas/exact-rational output must be
   independently checked, then re-expressed as a source-level Lean lemma
   whose variables are the named ingress fields.  No external solver result
   is itself a theorem.
5. **Prove the universal lift.** Establish in Lean that every live ingress
   packet maps to the encoded abstraction (including overflow/general-
   cardinality cases) and that the certificate's symmetry/coverage is
   exhaustive.
6. **Land a source-clean producer and consumer together.** Wire every output
   arm directly to an existing terminal or to a new proved terminal in the
   normalized residual; do not leave an unconsumed packet or recurse to the
   load-bearing target.
7. **Run trust gates.** Focused `lake env lean` build; `#print axioms` on the
   producer, consumer, and target; reject any transitive `sorryAx`.
8. **Record status honestly.** Mark finite runs `DIAGNOSTIC`, a source theorem
   without a terminal `PRODUCER`, a wired contradiction with a remaining
   proof obligation `CONSUMER`, and only a source-clean terminal with complete
   coverage `CLOSED`.

The next computation, if any, should test the retained-arm transport or the
canonical-source/different-fresh-cap third-incidence clause with this full
contract.  It must not search for another order-only implication.
