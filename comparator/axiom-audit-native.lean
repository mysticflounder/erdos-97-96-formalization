import Solution

/-
Comparator axiom audit — **compiler-trusted tier**. Prints the `#print axioms`
closure for every theorem in `Solution.lean` that `config-native.json` lists in
`theorem_names`. The comparator itself enforces `permitted_axioms` during its
run; this file lets a reviewer (or CI) see the closure directly.

Every report must be a subset of {propext, Classical.choice, Quot.sound,
Lean.ofReduceBool, Lean.trustCompiler} — no `sorryAx` and no custom axioms. The
two compiler axioms are permitted *here only*: these proofs discharge the
exact-ten certificate bank with `native_decide`, under the project's
`bv_decide` standard (see the repository README, `native_decide` policy). The
core-tier manifest `config.json` / `axiom-audit.lean` forbids them.

`Problem97.FiniteN11Closure` joined this tier on 2026-08-01 (commit 553206dc),
when its card-eleven exact-five common-obstruction-center leaf closed; it has
the same five axioms and no `sorryAx`. `counterexample_card_ge_twelve` is the
resulting bound, and `erdos97_of_card_le_eleven` its contrapositive. See
`comparator/README.md`, "The audit boundary", for what is still excluded.

The theorems live in the shared `Headline` namespace in `Solution.lean`, so the
comparator finds them under the same qualified names listed in
`config-native.json`.

Run: lake env lean ../comparator/axiom-audit-native.lean   (from `lean/`)
  or: comparator/check-conformance.sh                       (from the repo root)
-/

#print axioms Headline.finiteN10Closure
#print axioms Headline.counterexample_card_ge_eleven
#print axioms Headline.erdos97_of_card_le_ten
#print axioms Headline.finiteN11Closure
#print axioms Headline.counterexample_card_ge_twelve
#print axioms Headline.erdos97_of_card_le_eleven
