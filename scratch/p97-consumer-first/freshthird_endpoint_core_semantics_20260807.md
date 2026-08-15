# FreshThird endpoint QF_LRA core semantics (2026-08-07)

This is an audit of `freshthird_endpoint_qflra_cvc5_20260807.smt2` and its
cvc5 output. It is diagnostic only: the packet is a single frozen finite
structural model and has no universal Lean lift.

## Replayed result

- configuration: `outside_fresh_between_source_canonical`, endpoint,
  `fresh_cap=1`, `row_cap=1`;
- 18 occupied representatives; 8,886 QF_LRA assertions including
  `core_fixed_d_0_1 = 1`;
- cvc5: `unsat` in 0.264 seconds;
- recorded cvc5 core: 24 assertions (the 23 named metric assertions plus the
  scale normalization);
- exact Z3 deletion replay shrinks the same core to six metric assertions,
  all checks returning `unsat` after each removable assertion; the scale
  normalization is not needed by the final contradiction.

The six-assertion core is:

```text
sourceCenter: dist(sourceCenter,qBetween) = dist(sourceCenter,qOutside)
freshCenter:  dist(freshCenter,qBetween) = dist(freshCenter,qOutside)
pinnedCenter: dist(pinnedCenter,w1) = dist(pinnedCenter,w0)
b1/w0:       dist(b1,w0) = radius(b1)
b1/w1:       dist(b1,w1) = radius(b1)
kalmanson:   dist(qBetween,w1) + dist(qOutside,sourceCenter)
             < dist(qOutside,w1) + dist(qBetween,sourceCenter)
```

The finite model aliases are essential to the replay:

```text
freshCenter = w0,  pinnedCenter = qBetween,  b1 = qOutside.
```

Therefore the second and third equalities give
`dist(w0,qBetween)=dist(w0,qOutside)` and
`dist(qBetween,w0)=dist(qBetween,w1)`; the two b1 assertions give
`dist(qOutside,w0)=dist(qOutside,w1)`. Hence all four distances
`dist(qBetween,w1)`, `dist(qOutside,w1)`, `dist(qBetween,w0)`, and
`dist(qOutside,w0)` are equal. The sourceCenter equality cancels the two
source terms in the strict Kalmanson inequality, leaving `t < t`.

## Smallest parametric consumer suggested by the core

For any symmetric distance function and points `x y s u v`, the following is
impossible:

```text
dist s x = dist s y
dist u x = dist u y
dist y u = dist y v
dist x u = dist x v
dist y v + dist x s < dist x v + dist y s
```

The proof is pure equality substitution followed by `linarith`; it is a
cardinality-independent metric/Kalmanson consumer. It is close in spirit to
the existing `CapCrossingKalmanson` consumers, but its order shape has a
shared bridge `u` between the two endpoint rows, rather than the existing
“shared late pair” order.

## Ingress audit

| premise | status in this packet |
|---|---|
| sourceCenter equality | source exact-four shell incidence (source-produced) |
| freshCenter equality | fresh exact-four shell incidence (source-produced) |
| pinned row equality | selected-row exact-four incidence (source-produced) |
| b1 row equalities | blocker critical-shell incidence (source-produced once blocker is fixed) |
| Kalmanson strict inequality | valid only after a source-proved cyclic-order/convex-boundary lift; finite rank arm is scaffolding |
| `freshCenter=w0` | alias chosen by the frozen finite model; not universal at current ingress |
| `pinnedCenter=qBetween` | endpoint/drow endpoint relabeling is source-produced in this arm |
| `b1=qOutside` | finite blocker/endpoint alias; no current universal producer |

Thus this is a useful consumer-shaped obstruction, not a closed sorry. To
promote it, a source theorem must force (or cover by a proved branch) the two
missing aliases `freshCenter=w0` and `b1=qOutside`, together with a genuine
cyclic-order Kalmanson consumer. Merely enumerating the other finite aliases
does not provide that lift.
