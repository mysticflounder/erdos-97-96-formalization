# B1 full MEC-elimination audit

Date: 2026-09-03

## Scope

This checkpoint strengthens the gauge normalization used for a declared
circumscribed-MEC packet.  It applies only when labels `0` and `1` form the
directed hull edge in the source order and are both MEC apices.  If the third
apex is `(u,v)`, strict convex order supplies `v > 0`.

Writing the remaining center coordinate as `m`, the third boundary equation
reduces to

```text
2*v*m = u^2 - u + v^2.
```

For an arbitrary point `(x,y)`, disk containment then reduces to the
division-free polynomial inequality

```text
v * (x^2 - x + y^2) <= y * (u^2 - u + v^2).
```

The encoder retains `v > 0` in every relaxation, emits one polynomial disk
atom per ambient point, and retains all three nonobtuse triangle atoms.  All
three MEC boundary atoms and radius positivity are discharged by the exact
substitution.  No MEC variable is declared or read back.  Packets outside this
gauge case retain the previous three-variable encoding.

## Soundness and custody

The direct source parser and runtime system validator both require the directed
hull edge `0 -> 1` before selecting the elimination.  Merely containing labels
`0` and `1` is insufficient, because reflection preserves metric constraints
while reversing the sign of the third-apex height.

On SAT, exact `Fraction` replay reconstructs

```text
m = (u^2 - u + v^2) / (2*v)
r2 = 1/4 + m^2
```

and rechecks the original boundary, disk, radius, and nonobtuse packet.  A
nonpositive denominator fails closed.  Normalization schema v3 and MEC
parameterization schema v2 bind the directed-edge guard, eliminated terms, and
exact reconstruction formulas.  Producer and semantic-verifier descriptors
are version v3, so stale v2 source or journal artifacts are rejected.

The source system ID remains unchanged: it names source rows/order/MEC apices,
not the solver parameterization.  The target assertion ladder becomes
`193/481/481`, with 36 coordinate readback terms and no MEC terms.

## Verification

- focused endpoint suite: 126 tests passed;
- full Ruff on all three changed Python files: clean;
- `git diff --check`: clean; and
- independent adversarial audit, including the directed-edge repair: PASS.

No solver was invoked for this implementation checkpoint.  A fresh committed-
source PIQD control and target run are required before drawing any computational
conclusion.  This change is computational infrastructure, not a B1 closure.
