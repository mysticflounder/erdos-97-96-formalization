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

## Governed PIQD wave

The committed-source run is rooted at
`scratch/runs/b1-full-mec-elimination-wave-20260903/elimination-v1`, with lane
and execution base `d5ccd4812bee1be08b2aae466c3eb51acb028792`.  Its run
manifest binds the target input plus exact endpoint-adapter, producer, and
generic-adapter source captures.

The four-point gauge-MEC control returned SAT in both stages, exact rational
replay reconstructed and accepted the original MEC packet, and offline custody
validation passed.  Its emitted SMT contains 8 point-coordinate declarations
and no MEC declaration.

Target system `82c2dfe781d609472430` returned `UNKNOWN` in all three stages:

| stage | constraints | coordinate terms | solve ms |
|---|---:|---:|---:|
| exact metric | 193 | 36 | 120885 |
| full convex | 481 | 36 | 128698 |
| convex-only | 481 | 36 | 129461 |

Offline custody validation passed.  The result has no model or UNSAT core and
therefore gives no mathematical verdict.  It shows that complete gauge-MEC
variable elimination, like the preceding one-variable normalization, does not
make this monolithic residual decidable within the bounded PIQD/Z3 query.

The required new-wave theorem mine confirmed the exact decomposition
`4 gauge + 14 row equalities + 153 distinctness + 1 height guard + 18 disk + 3
nonobtuse`, with 288 strict-orientation atoms added in the later stages.  The
full-convex and convex-only journals are byte-identical.  No model, core,
assumption subset, or decisive subformula was produced, so there is no new
solver-derived theorem candidate and no changed key requiring another global
Lean-corpus search.
