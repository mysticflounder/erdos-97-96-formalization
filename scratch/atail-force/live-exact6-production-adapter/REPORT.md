# Live exact-six production adapter

## Result

The production-facing exact-six adapter is **kernel-checked**.

```lean
theorem false_of_fullParentExactFiveAllReverseData_of_secondCap_card_eq_six
    ...
    (A : FullParentExactFiveAllReverseData L profile continuation)
    (hcap : S.oppCap2.card = 6) : False
```

The proof uses the generic finite endpoint
`false_of_periodThree_straddles_card_le_four`.  The generic endpoint is
reproduced at the top of the same scratch file because sibling scratch files
are not importable Lake modules; the adapter calls it explicitly.

The immediate exact-five dispatcher also checks:

```lean
theorem false_of_fullParentExactFive_of_secondCap_card_eq_six_and_mutualConsumer
    ...
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (hcap : S.oppCap2.card = 6)
    (mutualFalse : FullParentExactFiveMutualData L profile → False) : False
```

Thus an exact-six second opposite cap closes the complete all-reverse sibling.
At this dispatcher boundary, only the independent arbitrary mutual-omission
packet still needs a consumer.

This scratch result does not close a production `sorry`: it is not yet wired
into production, and it says nothing about second opposite caps of cardinality
at least seven.

## Production field map

The adapter uses no guessed point identities.

1. `A.cycle_period` gives `A.cycle.period = 3`; the canonical indices are
   `0`, `1`, and `2` in that dependent finite type.
2. `A.cycle.source_injective` makes the three source vertices distinct.
3. `A.cycle_transition` and `A.cycle.successor_source_eq` identify the three
   total-transition successor edges, including the wrap edge.
4. `A.sharedOrder.source_point`, `blocker_point`, and `straddle` provide one
   ordered closed-cap block and the three strict straddles.
5. `A.allReverse` plus
   `transition_successor_actualBlocker_mem_physicalCapInterior` puts every
   successor blocker in `S.capInteriorByIndex S.oppIndex2`.
6. `A.cycle.source_mem_capInterior` puts every source in the same strict
   interior.
7. The finite carrier is the filtered index set

   ```lean
   Finset.univ.filter fun k ↦
     A.sharedOrder.block.L.points k ∈
       S.capInteriorByIndex S.oppIndex2
   ```

   Its image under the injective ordered-cap point map is exactly the strict
   interior.
8. The standard cap decomposition gives
   `interior.card + 2 = closedCap.card`; the local label identity transports
   `capByIndex oppIndex2` to `oppCap2`.  Therefore `hcap` makes the carrier
   cardinality exactly four.

The generic period-three theorem then forces the same carrier to contain at
least five points, a contradiction.

## Theorem-bank preflight

Before proving the adapter, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- the indexed Lean corpora via `nthdegree docs search --lean`.

No existing declaration provided this production-facing exact-six adapter.
The semantic search did locate the reusable
`capInteriorByIndex_card_add_two` pattern, whose source theorem is private in
the production modules; the three-case proof is therefore restated locally.

## Validation

From `lean/`:

```bash
lake env lean -M 16384 -DwarningAsError=true \
  ../scratch/atail-force/live-exact6-production-adapter/ExactSixProductionAdapter.lean
```

The command exits zero.  Both public theorems print exactly:

```text
[propext, Classical.choice, Quot.sound]
```

There is no `sorryAx` and no custom axiom.

## Immediate production call-site shape

At the existing exact-five relation split, use
`false_of_fullParentExactFive_of_secondCap_card_eq_six_and_mutualConsumer` on
the exact-six cardinality arm.  It consumes the all-reverse branch directly,
so production does not need to manufacture a first-apex co-radial occurrence
on this slice.  The remaining argument supplied at that call site is exactly:

```lean
FullParentExactFiveMutualData L profile → False
```

For a cardinality split, the complementary branch is
`7 ≤ S.oppCap2.card`; this adapter intentionally makes no claim there.
