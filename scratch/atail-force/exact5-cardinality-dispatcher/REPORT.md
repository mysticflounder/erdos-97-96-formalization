# Exact-five cardinality dispatcher

Date: 2026-07-22

Status: **KERNEL-CHECKED SCRATCH ROUTING LEMMAS. NO PRODUCTION `sorry` IS
CLOSED.**

`ExactFiveCardinalityDispatcher.lean` proves from the current production
`FrontierBiApexRobustExactFiveSecondCapResidual` fields that:

1. every exact-five physical second-cap residual has carrier cardinality at
   least thirteen;
2. the branch splits exhaustively into exact card thirteen or card at least
   fourteen;
3. exact card thirteen forces the cap profile `(5, 6, 5)` in
   surplus/first-opposite/second-opposite order;
4. card at least fourteen forces

   ```lean
   7 ≤ S.oppCap1.card ∨ 6 ≤ S.surplusCap.card;
   ```

5. exact card fourteen has precisely the cap profiles `(5, 7, 5)` and
   `(6, 6, 5)`.

The third theorem is the source-clean split needed by a future direct
card-at-least-fourteen exact-five consumer. In particular, a theorem assuming
only `7 ≤ S.oppCap1.card` does not cover the surplus-large `(6, 6, 5)` mode.

## Validation

The module was compiled as an isolated scratch target with warnings treated as
errors. All five declarations depend only on:

```text
propext
Classical.choice
Quot.sound
```

The module contains no `sorry`, `admit`, `native_decide`, `unsafe`, or custom
axiom. The results are routing arithmetic only; the asymmetric, all-one-hit,
and card-at-least-fourteen geometric terminals remain open.
