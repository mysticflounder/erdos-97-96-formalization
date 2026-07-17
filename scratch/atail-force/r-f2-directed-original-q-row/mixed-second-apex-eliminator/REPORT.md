# Mixed second-apex eliminator

Status: **KERNEL-CHECKED / BOTH MIXED CONSTRUCTORS CLOSED**

Scope: scratch-only.  No production source, closure document, protected lane,
or sibling scratch file was modified.

## Result

`MixedSecondApexEliminator.lean` closes both non-rerouted mixed outputs of
`SecondApexConstructorReduction`:

- `false_of_qDeleted_qCritical_complementAtX`
- `false_of_qCritical_qDeleted_complementAtY`

It then exposes the source-clean downstream surface
`SecondApexRerouteReduction` and proves:

- `secondApexRerouteReduction_of_constructorReduction`
- `secondApexRerouteReduction`

Thus the equal-source-at-second-apex equilateral arm now reduces to exactly
`rerouteAtX | rerouteAtY`.  The complementary mixed packets are not remaining
research obligations.

This does **not** close the two outside-middle reroutes.  Those are the exact
remaining outputs of this constructor surface.

## Mathematical argument

Write

- `O = S.oppApex2`,
- `x = K.named.x`, `y = K.named.y`,
- `a` for the support-only point in the generated row at `x`, and
- `b` for the support-only point in the generated row at `y`.

The exact residual packet gives `{a,b} = {K.named.s,K.named.t}`.  Hence both
points belong to the physical middle row centered at `O`.  The equilateral
residual and the exact generated-row supports give one positive radius `r`
with

```text
|O-x| = |O-y| = |O-a| = |O-b| = r,
|x-y| = |x-a| = |y-b| = r.
```

The off-live hypotheses give `y != a` and `x != b`.  The checked helper
`opposite_intersections_sum` therefore yields

```text
y + a = O + x,
x + b = O + y.
```

Adding and cancelling gives `a + b = O + O`, so `a,O,b` are collinear.
The residual packet also gives `a != O`, `b != O`, and `{a,b}={s,t}` with
`s != t`, hence the three points are distinct members of `D.A`.  This
contradicts `D.convex.not_three_collinear`.

The proof consumes the full selected rows and the physical middle row.  It
does not reinterpret deletion survival as support membership and it does not
assume an unproved cap-order or critical-map consequence.

## Theorem-bank and corpus preflight

Before deriving the helper, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`
- `certificates/p97_rvol_general_n_mining.{md,json}`
- `certificates/erdos97_legacy_general_n_mining.{md,json}`
- `certificates/erdos_general_theorem_p97_mining.{md,json}`

The relevant existing results found were
`two_circle_third_point_eq`, `twoCircle_midpoint_collinear`, the Kalmanson
five-order consumer, `FourPointTwoCircleBisectorOrderCore`, and the private
`opposite_equilateral_sum`.  None directly states the required unordered
equal-radius intersection sum with the local source-faithful packet, so the
small coordinate helper was proved locally.

The nthdegree Lean corpus was queried for complementary critical/deleted
rows, adjacent equilateral shells, two-circle midpoint/reflection results,
and rhombus/opposite-intersection identities.  The queries confirmed the
same bank surface and found no closer public producer.

## Validation

Focused elaboration was run with the existing scratch `.olean` chain and
Lean's `-M 16384` memory cap.  It exited successfully.

Every exported proof in this lane reports only:

```text
[propext, Classical.choice, Quot.sound]
```

The checked declarations were:

- `opposite_intersections_sum`
- `false_of_mixed_complementary_supports`
- `false_of_qDeleted_qCritical_complementAtX`
- `false_of_qCritical_qDeleted_complementAtY`
- `secondApexRerouteReduction`

A source scan found no `sorry`, `admit`, `axiom`, `native_decide`, or
`unsafe` token in the Lean file.

No commit was made.
