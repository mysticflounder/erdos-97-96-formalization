# P5 exact-two certificate closure

## Result

`P5ExactTwoClosure.lean` composes the completed source-faithful occurrence
bridge with the full checkpointed RUP replay. It proves:

```lean
Problem97.P5ExactTwoCertificateClosureScratch.false_of_p5ExactTwo
    (R : OriginalUniqueFourResidual F)
    (profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4)
    (distribution : ExactTwoStrictHitDistribution R) : False
```

The composition has three checked layers:

1. `exists_bridge_satisfying_packet` produces a source-faithful direct or
   mirror p5 packet whose geometry satisfies every one of the 8,703 stored
   trimmed clauses.
2. `checkpoint0_clauses_eq_bridgeClauses`, proved by `native_decide`, checks
   that the replay's parsed checkpoint-0 clauses are exactly those stored
   clauses, including order.
3. `WindowedRupReplay.startUnsatisfiable` proves that checkpoint 0 is
   unsatisfiable by composing all 369 independently checked windows.

The generic transfer lemmas in `P5ExactTwoClosure.lean` turn the
proposition-valued source valuation into the LRAT checker's Boolean
`PosFin 617` assignment and prove that signed-DIMACS clause satisfaction
implies the checker's native clause and formula semantics.

## Validation and trust

Run:

```bash
scratch/atail-force/unique4-exact-two-lrat-ingress/validate_p5_exact_two_closure.sh
```

The validation uses the project-pinned Lean 4.27 toolchain, a 16 GiB per-Lean
memory cap, warnings as errors, the already-built 4.27 replay oleans, and the
validated occurrence-bridge oleans.

All three exported composition theorems report the exact axiom closure:

```text
propext
Classical.choice
Quot.sound
Lean.ofReduceBool
Lean.trustCompiler
```

There is no `sorryAx`, custom axiom, `unsafe`, `extern`, or
`implemented_by` dependency.

## Claim boundary

This closes the `(5,5,4)` exact-two p5 residual in the scratch proof stack.
It does not yet make the result clean-checkout importable: the full replay
currently depends on an ignored generated package of roughly 497 MiB. It
therefore does not yet close a production `sorry`.

The live unique-radius-arm theorem additionally retains the p4 exact-two
profile and an arbitrary-cardinality reduction above the fixed-card-11
packet. Those are independent remaining obligations.
