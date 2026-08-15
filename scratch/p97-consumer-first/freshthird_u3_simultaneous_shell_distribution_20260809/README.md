# FreshThird U3 simultaneous shell-distribution diagnostic

This is one bounded successor wave of the predecessor
`freshthird_u3_simultaneous_sixcenter_20260809`.  It keeps the same 12-case
simultaneous six-center abstraction, controls, source-derived 468-pattern
no-good bank, q-deleted distribution cut, and four-valued classifications.

The only schema change is the shell arm.  For each `mode = 2`
`CriticalFourShell`, the SMT encoding introduces four Boolean support-membership
bits for `insert q T` and one integer count for support points outside that
circle, with:

```text
card(insert-q-T support) ≤ 2
card(outside support) ≥ 2
card(support) = 4
```

The six-center live case remains a finite SAT abstraction.  It is not a
Euclidean realization, counterexample, universal closure, or Lean proof.

Run from the repository root:

```bash
uv run python scratch/p97-consumer-first/freshthird_u3_simultaneous_shell_distribution_20260809/run_simultaneous.py
```

The runner performs the known SAT/UNSAT smoke controls first, then runs Z3 and
cvc5 strictly sequentially (one host core, 20-second process bound) with
independent model readback.  This namespace is complete after this one wave;
no refinement wave was run.
