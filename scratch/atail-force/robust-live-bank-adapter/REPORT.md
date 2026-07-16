# Robust live forward-bank adapter

Date: 2026-07-15

Status: **KERNEL-CHECKED GENERIC SINK; Q-SHELL PRODUCER STRATEGY IS
EXISTENTIAL; ONE PLACEMENT FIELD AND ONE PRESCRIBED PAIR ROW REMAIN OPEN.**

## Result

`RobustLiveBankAdapter.lean` exposes the weakest global sink behind the
corrected checkpoint bank match, then maps one q-shell-anchored producer
strategy onto the actual parent types.  The sink is more general than the
pinned checkpoint: it permits the second marginal point to be `P.w`.

The exact roles are:

| bank role | live role |
|---|---|
| `O` | `S.oppApex1` |
| `E` | `P.q` |
| `J` | a marginal point `j ≠ P.q` (fresh in the checkpoint, but possibly `P.w` in the weak sink) |
| `I` | any strict-surplus center `z`; q-shell membership is one candidate strategy |

The checkpoint correction is load-bearing for replaying that certificate.  It records the
first-apex row `{A,C,D,E,J}` with `P.q = E` and `P.w = D`; the forward bank
match in `global-k4-extension-unit-replay/bank_match.json` uses
`Q=I, U=J, V=O, Y=E`.  Thus `J` is not `P.w`.

That extra checkpoint freshness is not needed by the theorem.  On any live
parent, `P.w` is already a distinct off-surplus point of the same marginal,
so setting `j = P.w` is allowed.  A fresh card-five `j` remains available as
an optional exact-checkpoint role.

The forward match has centers `O,I` and common points `E,J`.  The first-apex
marginal automatically supplies

```text
dist O E = dist O J.
```

Only one new metric equality is needed:

```text
dist I E = dist I J.
```

A selected row centered at `I` and containing `E,J` supplies that equality.
If `I` is in the strict surplus-cap interior, the production theorem
`CapSelectedRowCounting.outsidePair_unique_capCenter` contradicts the two
distinct surplus-cap centers `O,I` sharing the outside pair `E,J`.

No selected row at `O` or `E`, boundary enumeration, cyclic-order packet, or
finite Census-554 label type is needed.  Nor does the generic consumer need
`z` to come from a blocker shell: that provenance is a proposed production
route, not part of the mathematical contradiction.

## Checked declarations

The file proves:

- `false_of_surplusInterior_bisects_marginalPair`, the smallest metric sink;
- `false_of_surplusInterior_row_contains_marginalPair`, the one-row wrapper;
- `false_of_liveForwardBankProducer`, the q-shell candidate packet consumer;
- `false_of_nonempty_liveForwardBankProducer`, the existential parent sink;
- `exists_zRow_of_globalK4`, showing the row object at `I` is automatic;
- `exists_freshMarginalPoint_of_cardFive`, showing a `J` distinct from both
  stored frontier sources is automatic on the card-five arm; and
- `exists_strict_qShellPoint_of_robustFourCenterPacket`, an optional robust
  extraction that does not infect the consumer packet with the larger
  two-shell object.

The parent-facing packet is:

```lean
structure LiveForwardBankProducer
    (P : SurvivorPairRelocationPacket D S r H) where
  z : ℝ²
  z_mem_qShell : z ∈ qBlockerShell P
  j : ℝ²
  j_mem_marginal : j ∈ marginal
  j_ne_q : j ≠ P.q
  z_mem_surplusInterior : z ∈ S.capInteriorByIndex S.surplusIdx
  zRow : SelectedFourClass D.A z
  q_mem_zRow : P.q ∈ zRow.support
  j_mem_zRow : j ∈ zRow.support
```

The packet owns its existential `z`.  It no longer asks for a completion of
every `StrictTwoBlockerSupportCenters P`, and it does not carry the unused
`zw`, cross-survival, or `j ≠ P.w` fields.  `Nonempty
(LiveForwardBankProducer P)` is therefore the exact q-shell parent target.

This remains only one producer strategy.  The truly weakest checked consumer
is `false_of_surplusInterior_row_contains_marginalPair`: any strict-surplus
`z` and any two distinct points of one off-surplus marginal lying in a row at
`z` close, whether or not `z` belongs to the q-shell.

## Automatic versus open

Automatic from current checked infrastructure:

| field | source |
|---|---|
| `P.q` is an off-surplus first-apex marginal point | `P.q_mem_marginal` |
| `P.q` and `P.w` are distinct | `P.q_ne_w` |
| `P.w` can serve as `j` on every parent | `P.w_mem_marginal` and `P.q_ne_w` |
| a fresh `j` distinct from both exists on card five, if exact checkpoint roles are wanted | card-five count plus `oppApex1_surplusCap_one_hit`; checked here |
| a strict q-shell support point away from `O,P.q,P.w` exists on the robust arm | optional projection through `nonempty_strictTwoBlockerSupportCenters_of_crossSurvival`; checked here |
| any q-shell support point lies in `D.A` | blocker-shell support containment |
| some selected row centered at any such point exists | global K4; checked here |
| `dist O P.q = dist O j` | the two marginal memberships |
| the final contradiction once the missing packet exists | `outsidePair_unique_capCenter`; checked here |

Genuinely open:

1. produce a strict-surplus center `z`;
2. force one selected row centered at `z` to contain two distinct points of
   the same off-surplus first-apex marginal.

For the q-shell-anchored strategy, item 1 specializes to choosing
`z ∈ qShell ∩ surplusInterior`, and item 2 may use `P.q,P.w` directly or
`P.q` and a fresh card-five `j`.  CEGAR/bank cuts remain free to expose a
different strict-surplus center, since q-shell provenance is not consumed by
the generic sink.

The second item is exactly two prescribed row memberships.  Membership of
`z` in the q-blocker shell concerns a circle centered at the actual blocker
`H.centerAt P.q`; it does not constrain a new row centered at `z`.

## Bank preflight

Before writing the adapter, the search covered the required local registries
and indexed Lean corpus, including:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- the sibling, legacy, and older-general-theorem JSON/Markdown registries in
  `certificates/`;
- `FourPointTwoCircleBisectorOrderCore` and its arbitrary-carrier bridge;
- `exists_faithfulCarrierPattern_with_two_classes`; and
- `CapSelectedRowCounting.outsidePair_unique_capCenter` and existing scratch
  adapters to it.

The focused `nthdegree docs search --lean` query returned the production
four-point/two-circle core and carrier bridge.  The live-role audit then
showed that the forward match factors through the smaller ordered-cap sink,
so constructing an artificial selected `O` row would only strengthen the
producer unnecessarily.

## Validation

The two unimported predecessor modules were compiled to `/tmp`, then the
adapter was checked from `lean/` with:

```bash
LEAN_PATH=/tmp/p97-robust-live-modules lake env lean -R .. \
  ../scratch/atail-force/robust-live-bank-adapter/RobustLiveBankAdapter.lean
```

All seven printed axiom sets are exactly:

```text
[propext, Classical.choice, Quot.sound]
```

The adapter itself has no `sorry`, `sorryAx`, production edit, or
`SurplusM44` edit.  Stage only this scratch directory.  The earlier draft
that incorrectly replayed checkpoint `J` as `P.w`, required two selected
rows, and demanded uniform completion of every two-shell choice was deleted
rather than retained as stale evidence.
