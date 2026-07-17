# Robust-minimal endpoint theorem-bank audit

Date: 2026-07-16

Status: **ONE ONE-PREMISE CONDITIONAL TERMINAL, NO COMPLETE ENDPOINT
CONSUMER. NO PRODUCTION `sorry` IS CLOSED.**

## Scope

This audit compares the exact endpoints in:

- `robust-second-apex-minimal-deletion/RobustSecondApexMinimalDeletion.lean`;
- `robust-two-radius-geometry/RobustTwoRadiusGeometry.lean`;

against the existing theorem banks required by `AGENTS.md`. It does not run a
new finite search or derive a new incidence pattern.

The checked registries were:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The JSON pass covered all 2,148 sibling candidates, 285 legacy `erdos/97`
candidates, and 297 `erdos-general-theorem/97` candidates. None mentions any
of the new endpoint types. The sibling inventory has 21 statements mentioning
`HasNEquidistantPointsAt`, but none of those statements concludes `False`.
Neither legacy inventory has a statement mentioning
`HasNEquidistantPointsAt`.

Targeted `nthdegree docs search --lean` queries covered:

- shared-radius pairs at two centers with deletion survival;
- reciprocal actual blockers;
- minimal deletion cores and pairwise-disjoint exact shells;
- installed singleton blockers and frontier omissions;
- two support-disjoint rows and deletion-robust centers;
- the U1 two-large-cap seven-equality obstruction;
- outside-pair cap-center uniqueness; and
- same-cap rank/lap nonreturn.

The useful hits are recorded below. No unlisted hit had a closer exact
hypothesis map.

## Result matrix

| Endpoint | Best existing consumer | Match status | Exact first gap |
|---|---|---|---|
| `RobustSecondApexMinimalDeletionCollision` | center rigidity / `oppCap2_escape_gen` | **No match** | The packet gives one fresh-center equality and two independent deletion-survival existentials at `oppApex2`; it does not put the collision pair in one `oppApex2` radius class. The pair is also an arbitrary non-frontier pair of deletion roles, so the first-apex/off-surplus hypotheses of `oppCap2_escape_gen` are absent. |
| `RobustSecondApexMinimalDeletionMultiCore` | no bank terminal | **No match** | The exact shells all have the same center and pairwise-disjoint supports. This proves another robust center, not a contradiction. A terminal cross-center incidence or a decreasing cap-order measure is missing. |
| `RobustSecondApexMinimalDeletionInstalledSingleton` | critical-map omission/survival equivalence | **No match** | One installed row omits one frontier target and survives that target's deletion. Existing critical-map lemmas regard those as equivalent compatible facts. A second independent row/incidence or a nonreturn measure is missing. |
| `SameRowMinimalCollisionTransition` | `eq_of_equidistant_three_noncollinear` | **Conditional terminal** | A third member of the physical row on the fresh-center collision radius gives `False`. This is the impossible three-common-point overlap of two distinct circles, not a premise currently produced by the endpoint. |
| two-radius `MinimalDeletionCore` with `V.card = 1` | singleton installation machinery | **No match** | This endpoint has no distinguished frontier target or installed critical-map omission. It must first be coupled to the live frontier; installation alone is still not a terminal. |
| two-radius fresh `FullyDeletionRobustAt` center | sibling rank/lap interface | **No match** | The bank needs a same-cap incompatible edge and a strict finite rank/lap descent. The endpoint supplies neither cap placement nor a monotone edge from the old robust center to the new one. |

## The one exact bank match

The sibling registry records the source-reachable theorem

```lean
Problem97.eq_of_equidistant_three_noncollinear
```

at `RVOL.P97.U5GlobalIncidenceBasic`. Its exact name and normalized statement
shape already exist in current production
`Erdos9796Proof.P97.U5GlobalIncidenceBasic`, so no promotion is required.

The two-radius collision endpoint already supplies:

```text
source != partner,
source, partner in firstRow.support,
dist freshCenter source = dist freshCenter partner,
dist oppApex2 source = dist oppApex2 partner,
freshCenter != oppApex2.
```

The owned adapter

```lean
false_of_sameRowMinimalCollisionTransition_of_third_common_point
```

proves `False` conditionally from exactly one additional existential:

```lean
exists third in firstRow.support,
  third != source and third != partner and
  dist freshCenter source = dist freshCenter third.
```

The physical row supplies the matching `oppApex2` equality automatically.
Convex independence supplies noncollinearity of the three distinct carrier
points. The banked rigidity theorem therefore identifies `freshCenter` with
`oppApex2`, contradicting the transition's center separation.

This is a precise one-premise **conditional terminal**, not a recommended
producer. Because the two centers are already distinct, the third common hit
is exactly the impossible three-common-point overlap that center rigidity
rules out. The reciprocal blocker-survival fields are not used by this
adapter and do not imply that overlap.

A five-point radius class at the fresh center would not by itself discharge
this conditional: it supplies extra fresh-circle points, but no third point
in the physical `firstRow`. The needed cross-circle intersection remains
absent from the endpoint.

## Why the other prominent bank hits do not apply

### `u1TwoLargeCapObstruction`

The sibling-only source-proved theorem is outside the `RVOL` import closure
and has no current exact name or statement-shape match. More importantly, it
requires a fixed five-point network of seven named distance equalities. None
of the new endpoints supplies a field-by-field map to that network. The
collision endpoints expose a shared pair, not the required three-center tail
equalities.

### U5 class and metric incompatibility families

The 96 class-level U5 families and their metric kernels consume named
dangerous-triple/q-deleted classes with several specified cross incidences.
The minimal-deletion endpoints expose existential K4 survival after erasure,
not the selected class, radius, dangerous triple, or incidence labels chosen
by those consumers. The closest normalization theorem can classify an
individual deleted K4, but classification alone leaves the same missing
cross-row producer.

### `outsidePair_unique_capCenter`

This current theorem is an immediate terminal for two distinct centers of one
ordered cap which share two distinct equidistant points outside that cap. The
new collision endpoints do not place the fresh center and physical apex in
one cap, and the robust-minimal collision does not even give one common
physical-apex radius for its collision pair. There is therefore no thin
adapter from the endpoint as stated.

### Singleton-tail metric certificates

The sibling `u5_qcritical_singleton_nontriple_pq_metric_incompatibility` is
source-reachable but consumes twelve named metric equalities on eight points.
`InstalledSingletonFrontierOmission` supplies a critical row, one omitted
target, and one deletion-survival fact; it does not supply that metric graph.
The shared word `singleton` is not a statement match.

### Legacy N9 banks

The two legacy inventories contain no deletion/minimality/robust-center
consumer and no `HasNEquidistantPointsAt` statement. Their contradiction
theorems are fixed `N9Point` coordinate/cell certificates. They are not
adapters for any of the current endpoints.

### Same-cap push/rank/lap interface

The sibling-source-reachable `source_pushout_left/right`, `rank_drop`, and
`strictLapPacket_nonreturn` theorems are credible ingredients only after a
new geometric producer builds a `SameCapIncompatibleEdge`, a minor-cap chain
model, and a strict lap or a finite orbit of strict rank drops. A fresh robust
center by itself supplies none of those fields. This is not a one-premise
adapter at the present interface.

## Closure consequence

The exact conditional bank boundary for the two-radius collision arm is:

```text
a third firstRow point on the fresh-center collision radius implies False.
```

It should not be promoted as the next producer: its content is precisely that
two already-distinct circles cannot acquire a third common noncollinear point.
In particular, a fresh five-point radius class does not establish the needed
intersection with `firstRow`.

The packed-core, installed-singleton, and fresh-robust-center arms still need
a global cap-order/critical-map coupling theorem before any existing bank
terminal applies. Re-running literal row-pattern mining against the current
endpoint statements would target the wrong abstraction.

## Validation

`RobustMinimalConsumerBank.lean` was compiled as an isolated scratch module
against a freshly checked `RobustTwoRadiusGeometry.olean` and current
production oleans. The output was written to:

```text
/private/tmp/p97-robust-minimal-consumer-bank/RobustMinimalConsumerBank.olean
```

The printed axiom closure of the adapter is exactly:

```text
propext
Classical.choice
Quot.sound
```

The owned directory contains no `sorry`, `admit`, declared `axiom`,
`native_decide`, or `unsafe`. No production source, shared closure document,
or proof-blueprint state was edited.
