# FreshThird U3 simultaneous shell-distribution diagnostic (defined smoke)

This is one bounded successor wave of the predecessor
`freshthird_u3_simultaneous_shell_distribution_20260809`.  It keeps the same 12-case
simultaneous six-center abstraction, controls, source-derived 468-pattern
no-good bank, q-deleted distribution cut, and four-valued classifications.

The shell arm is preserved from the predecessor.  The only control change is
that `smoke_sat` now declares `smoke_dummy : Bool`, asserts it true, enables
model production, and requires both engines to return `smoke_dummy = true` in
their independent model readback.  For each `mode = 2`
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
uv run python scratch/p97-consumer-first/freshthird_u3_simultaneous_shell_distribution_smoke_defined_20260809/run_simultaneous.py
```

The runner performs the known SAT/UNSAT smoke controls first, then runs Z3 and
cvc5 strictly sequentially (one host core, 20-second process bound) with
independent model readback.  This namespace is complete after this one wave;
no refinement wave was run.
