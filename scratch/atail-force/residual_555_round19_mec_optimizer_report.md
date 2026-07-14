# Round-19 `(5,5,5)` MEC/nonobtuse discovery probe

Epistemic status: **NUMERICAL DISCOVERY ONLY; NOT A PROOF OR A CLOSED ROW**.

The probe is fail-closed against `common_system_metric_probe.json`, profile
`(5,5,5)`, round `19`, assignment digest
`ef90d3234ee6a42eaebe1728d27a771812e33262b8b098c457f295ef5314d96d`,
the five saved rows, and cyclic order

```text
0,9,10,11,1,3,4,5,2,6,7,8.
```

## Result

No numerical witness was found.  More specifically, a necessary
two-parameter MEC/order gate failed in all 32 deterministic SLSQP starts.  A
separate `401 x 401` dense grid gave the same negative result.  The best
max-min gate value was `-0.1701735873163132` at

```text
angle(3) = 0.4179485572997399 rad  (23.94668838685675 degrees)
angle(4) = 0.8358971145994797 rad  (47.89337677371349 degrees).
```

At that numerical optimum, three lower circle-intersection triangle
inequalities tie at the negative margin:

- label `5`, forced jointly by rows centered at `3` and `4`;
- label `6`, forced jointly by rows centered at `1` and `3`; and
- label `9`, forced jointly by rows centered at `2` and `4`.

The dense-grid best was `-0.17091438250130014`, close to the multistart
optimum.  The downstream five-parameter/full-branch search was intentionally
not run: every full MEC/nonobtuse/order realization must first pass this
necessary gate, and the free angles of labels `7`, `10`, and `11` do not enter
it.

## Why this gate is necessary

Normalize Moser labels `0=(0,0)` and `1=(1,0)`.  Rows `0` and `1` force label
`2` to the upper equilateral point.  Disk containment and the saved strict
order force row-`0` labels `3` and `4` onto the minor unit-circle arc from `1`
to `2`, with

```text
0 < a := angle(3) < b := angle(4) < pi/3.
```

The remaining row equalities require labels `5`, `6`, `8`, and `9` to be
intersections of four specified circle pairs.  The probe maximizes the minimum
of the arc-order margins and all lower/upper triangle inequalities for those
four circle pairs.  The numerical bottleneck is exactly the three lower
inequalities at `5`, `6`, and `9`.

## Closure consequence

This does **not** yet close round 19 or a Lean `sorry`: bounded numerical
optimization is nonterminal.  It does, however, give a small candidate scalar
consumer:

> For `0 < a < b < pi/3`, the lower circle-intersection inequalities forced at
> labels `5`, `6`, and `9` cannot all hold.

A solver-free real/trigonometric proof of that statement would exclude the
round-19 residual using the actual MEC disk and cyclic order directly.  The
probe supplies no evidence that a missing second dangerous hit is needed.

Artifacts:

- `residual_555_round19_mec_optimizer.py`
- `residual_555_round19_mec_optimizer.json`
- `test_residual_555_round19_mec_optimizer.py`
