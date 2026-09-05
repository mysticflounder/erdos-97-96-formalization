# Consult 01M1N11H8EYFBSP8VF2ZMXE1VE — B1 derivability audit

## Verdict

The proposed theorem is **not source-faithfully derivable from the current signatures**:

```lean
(C : B1GlobalTransportContext ...)
(W : B1FiveSixWaveIngress C)
(R : B1GoodCanonicalDeletionEndpointResidual C W.escape) :
  B1WinningLiveSliceSignedAreaProductPositive C ∨
    Nonempty (B1EscapeSourceContext C)
```

This is not merely a missing wrapper. The two proposed conclusions require two different pieces of provenance, and neither `W` nor `R` transports the missing data into the other branch.

## 1. Why the signed-area arm does not follow

`B1WinningLiveSliceSignedAreaProductPositive C` asks for one global `BoundaryIndexing` and a *specific named live slice* (`b1USlice C` or `b1VSlice C`) of cardinality two whose signed-area product is positive. The clean bridge

```lean
b1WinningLiveSliceSameBoundaryArc_iff_signedAreaProductPositive
```

is an equivalence/consumer: it converts an already-proved same-boundary-arc packet into the polynomial sign packet and back. It is not a producer of either packet.

The strongest source-clean two-point result currently available is

```lean
b1EscapeSliceEndpointOrderResidual_of_twoPoint
```

which produces, for the escape-source slice, only:

```text
mate lies in a left/right adjacent second-cap block
OR
live-row blocker lies strictly between source and mate.
```

Neither disjunct implies `B1SliceSameBoundaryArc`. In particular, the blocker-between arm is exactly the alternating/hard placement; the adjacent-cap arm does not identify which cyclic side of the apex–blocker cut contains the mate. A valid producer therefore needs a genuinely new exclusion of the alternating cell, not a repackaging of the endpoint residual.

`R.endpoint` is even less suited to this conclusion: it is about the two **canonical deleted sources** and their **common blocker**. The signed-area goal is about `C.u`/`C.v` and their respective live-row blockers. Current signatures contain no equality or transport identifying those pairs.

The canonical branch already has the honest missing interface:

```lean
def B1GoodCanonicalEndpointCardArc
    (C) (W : B1FiveSixWaveIngress C)
    (R : B1GoodCanonicalDeletionEndpointResidual C W.escape) : Prop :=
  match W.cardCase with
  | .cardFive _ => B1CardFiveWinningSliceArc C
  | .cardSix _  => B1CardSixWinningSliceArc C
```

and the existing consumer

```lean
false_of_b1GoodCanonicalEndpointCardArc
```

closes once that card-specific arc packet is produced. Thus the missing geometric theorem is an **alternating-cell exclusion / endpoint-order-to-winning-arc lift**, with additional geometric input. It cannot be proved from `R.endpoint` alone.

## 2. Why the escape-source arm does not follow

`W : B1FiveSixWaveIngress C` contains only:

```lean
escape   : B1EscapeRowProvenanceStar C
cardCase : B1FiveSixWaveCardCase C
```

The local star already carries the escape source's physical-class membership, strict second-cap membership, live/escape-row provenance, distinct escape blocker, and cross omission. The exact neutral adapter

```lean
b1EscapeSourceContext_of_star C W
```

shows what is still missing for that same source:

```lean
houtside : W.escape.escape.source ∈ outsideFirstApexFiber C.R
hsurvives :
  HasNEquidistantPointsAt 4 (D.A.erase C.R.interior_q)
    ((lateFirstApexSystem C.R).centerAt
      W.escape.escape.source.1 W.escape.escape.source.2) ∨
  HasNEquidistantPointsAt 4 (D.A.erase C.R.interior_w)
    ((lateFirstApexSystem C.R).centerAt
      W.escape.escape.source.1 W.escape.escape.source.2)
```

Those two source-indexed facts are the minimal upstream ingress packet if the theorem is to keep `W.escape.escape.source` as its source.

`R.good` does not supply them for that source. Its outside-fibre and retained-deletion facts are attached to the canonical deletion/common-blocker provenance. `R.omittedPeer` supplies a strict-interior live peer with a blocker distinct from the canonical common blocker, but it does not identify that peer with `W.escape.escape.source`, and it carries neither outside-fibre membership nor retained `q/w` survival for the peer. Transporting `R.good` across an unstated source equality would be unsound.

Equivalently, using

```lean
b1EscapeSourceContext_of_normalForm_sourceData
```

requires a six-field packet for one named source: physical class, strict second-cap interior, inequality from both canonical deletions, outside-first-apex-fibre membership, and retained `q/w` survival. The current `W + R` combination never assembles all six fields for one source.

## 3. Correct source-faithful residual

The right upstream split works with the *named* live sources `C.u` and `C.v`, for which the context actually contains the required deletion inequalities and class provenance. It is now formalized as:

```lean
theorem b1_escapeSourceContext_or_liveFirstApexCrossBad
    (C : B1GlobalTransportContext ...)
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (huInterior : C.u.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hvInterior : C.v.1 ∈ S.capInteriorByIndex S.oppIndex2) :
  Nonempty (B1EscapeSourceContext C) ∨
    (C.u ∈ interiorPairBadOutsideSources C.R ∧
      C.v.1 ∈ SelectedClass D.A S.oppApex1 radius) ∨
    (C.u.1 ∈ SelectedClass D.A S.oppApex1 radius ∧
      C.v ∈ interiorPairBadOutsideSources C.R)
```

Location:

```text
lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/
  B1EscapeSourceContextCrossBad.lean
```

Commit reported in the formalization channel: `aa768618f`.

This is a genuine narrowing. In the both-outside arm it selects whichever of `C.u,C.v` has retained `q/w` survival and invokes `b1EscapeSourceContext_of_normalForm_sourceData`; in an asymmetric arm, failure of both survival alternatives is recorded in `interiorPairBadOutsideSources` while the other named source is retained in the first-apex class. No source identity is invented.

## 4. Lean-safe layering

Keep the producer and consumers separated:

1. `B1WinningSliceOrderOutcome.lean` remains the low source/order layer. It owns `B1EscapeSourceContext`, the source-data adapters, endpoint residuals, `B1GoodCanonicalEndpointCardArc`, and its canonical consumer.
2. `B1EscapeSourceContextCrossBad.lean` remains a source-faithful residual module importing only `B1WinningSliceOrderOutcome`. It should not import the signed-area module merely to manufacture a broad disjunction.
3. `B1LiveSignedAreaConsumer.lean` remains the independent order-to-polynomial consumer.
4. Any future final dispatch module may import all three, but only after producers exist for:
   - a card-specific winning live-slice arc / signed-area-positive packet, or
   - the two asymmetric `firstApexClass × interiorPairBadOutsideSources` residuals.

Do not add a theorem whose proof simply assumes or rephrases `B1WinningLiveSliceSignedAreaProductPositive ∨ Nonempty B1EscapeSourceContext`; that would be wrapper-only progress.

## 5. Minimal next obligations

There are two honest, independent next targets:

### Order target

Prove an alternating-cell exclusion that upgrades a card-five/card-six endpoint packet to `B1CardFiveWinningSliceArc C` or `B1CardSixWinningSliceArc C`. The theorem must consume new geometry beyond adjacency/betweenness—likely complete live-shell incidence, a blocker-side exclusion, or a global `noThird`/gap terminal. The current endpoint residual alone is insufficient.

### Source target

Consume the two residual arms of `b1_escapeSourceContext_or_liveFirstApexCrossBad`:

```text
u bad outside + v in first-apex class
OR
u in first-apex class + v bad outside.
```

This is preferable to adding source-specific fields blindly to `B1FiveSixWaveIngress`, because it preserves the exact named-source provenance already present in `B1GlobalTransportContext`.

## Consult disposition

**Reject the proposed `W + R` producer as underpowered.** Use `B1GoodCanonicalEndpointCardArc` for the canonical branch and `b1_escapeSourceContext_or_liveFirstApexCrossBad` for the named-source branch. The remaining work is two real geometric consumers, not an adapter or wrapper theorem.
