# Exact-five card-thirteen combined dispatcher

## Status

**SOURCE-CLEAN CONDITIONAL DISPATCHER.**

`ExactFiveCard13CombinedDispatcher.lean` closes the complete exact-card-13
surface conditional only on the direct and mirror distinct-radius source
certificate callbacks. It:

1. extracts one source-faithful `FirstApexShellRolePacket`;
2. sends the equal-radius branch to the existing unconditional
   `false_of_exactFive_card13_sameRadius` theorem;
3. sends the unequal-radius branch to the canonical distinct-radius
   dispatcher;
4. fills that dispatcher's all-one callback with the existing unconditional
   `false_of_exactFive_card13_allRowsOneHit` theorem.

Thus the exact-card-13 closure boundary no longer includes an all-one
certificate obligation. The only remaining callbacks are the `(1,2,3)`
direct source orbit and the `(3,2,1)` mirror source orbit.

The companion theorem
`false_of_exactFiveSecondCapProfile_of_card13_and_ge14_closers` performs the
proved cardinality split. After the two card-13 callbacks are supplied, the
full exact-five profile has exactly one remaining input:

```lean
14 ≤ D.A.card → False
```

This makes the card-at-least-14 mathematical frontier explicit and prevents
the card-specific certificate from being mistaken for uniform closure.

This module does not itself instantiate those two callbacks and therefore
does not yet close a production `sorry`.

## Validation

The module was elaborated with Lean 4.27 under `-DwarningAsError=true`. Its
main theorems have axiom closure:

```text
propext, Classical.choice, Lean.ofReduceBool, Lean.trustCompiler, Quot.sound
```

In particular, it does not depend on `sorryAx`. The two `Lean.*` axioms are
inherited from the already-kernel-checked all-one certificate endpoints; the
new dispatcher itself adds no trusted declaration.
