# Reverse-row shell-curvature adapter audit

Date: 2026-07-17

Status: **KERNEL-CHECKED CYCLIC ROLE ADAPTER; CURRENT ANGLE-CHART INTERFACE
IS INCOMPATIBLE WITH ITS REQUIRED PERIODIC ENDPOINT.**

This lane owns only
`scratch/atail-force/reverse-shell-curvature-adapter/`.  It treats both
`ShellCurvature.lean` files as read-only and does not edit production Lean,
closure documents, blueprint state, or protected census/refactor lanes.

## Theorem-bank preflight

Before deriving anything, this audit searched the required registries:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

It also ran indexed Lean searches for reverse-shell cyclic roles,
`CounterclockwiseAngleChart`, shell-curvature packing, and repeated outside
pairs.  The closest results were the current production shell-curvature
module, the ordered-cap witness-lap interface, the Kalmanson terminals, and
the already-banked U5 collision consumers.  No indexed theorem constructs the
required angle chart or aggregates several reverse-row curvature budgets.

## Positive result: the exact cyclic roles are derivable

`ReverseShellCurvatureAdapter.lean` first rebuilds the checked cap straddle in
the retained global cap block:

```lean
ReverseRowGlobalBlockStraddle K i

nonempty_reverseRowGlobalBlockStraddle
```

The packet retains the previous `ReverseRowCapStraddle`, the actual
`CGN.StrictCapBlockData`, the actual critical map, and the exact cycle source
identities.  It does not replace the row with an anonymous four-point shell.

The main positive theorem is:

```lean
nonempty_reverseRowCyclicRoles
  (K : PhysicalActualCriticalOmissionCycle H profile)
  (hreverse : ...)
  (i : Fin K.period)
  (P : ReverseRowCapStraddle K i) :
  Nonempty (ReverseRowCyclicRoles K i)
```

It constructs one periodic natural-number boundary window

```text
p < q1 < q2 < q3 < q4 < cycleEnd
point cycleEnd = point p
```

with the exact source-faithful identifications:

```text
point p = actual blocker center
{point q1, point q4} = exact same-cap source pair
{point q2, point q3} = exact outside-cap residual
actual selected support = {point q1, point q2, point q3, point q4}.
```

Thus the cap straddle really does place the outside pair in the two middle
roles consumed by Lemmas 30 and 37.  The role/order bridge is no longer the
missing ingredient.

## Exact chart-interface obstruction

The current production structure contains the unrestricted field

```lean
orderedTriple_sign_neg :
  forall i < j < k, sign(oangle (point i) (point j) (point k)) = -1
```

while its equal-radius wrappers require

```lean
p < q1 < ... < cycleEnd
point cycleEnd = point p.
```

These requirements are inconsistent.  Apply the sign field to
`p < q1 < cycleEnd`; after replacing `point cycleEnd` by `point p`, the
oriented angle has repeated endpoints and sign zero, not `-1`.

This is kernel-checked as:

```lean
false_of_counterclockwiseAngleChart_point_period

not_exists_counterclockwiseAngleChart_for_reverseRowCyclicRoles
```

The second theorem proves that no current `CounterclockwiseAngleChart` can
have its `point` field equal to the source-faithful cyclic point window.
Consequently, constructing such a chart is not merely unfinished: the target
is false as currently typed.  Any downstream use obtained from those
inconsistent hypotheses would be vacuous and cannot count as geometric
closure.

## Minimally sufficient signature repair

The obstruction comes from applying strict cyclic orientation across an
identified full-period endpoint.  The minimally local repair is to restrict
the chart's ordered-triple sign field to non-period-wrapping triples.  Two
equivalent practical interfaces are:

1. add the premise `chart.point i != chart.point k` to
   `orderedTriple_sign_neg`; or
2. parameterize the chart by a fundamental window and require the sign only
   for `windowStart <= i < j < k < windowEnd`.

The existing shell-curvature proof only needs orientation for triples strictly
inside the open fundamental window.  The endpoint equality is used separately
to transport the last metric pair.  Therefore either repair preserves the
intended mathematics while excluding the contradictory triple containing both
period representatives.

The first option is the smaller source edit, although its callers must supply
the endpoint-distinctness facts already available from the positive shell
radius.  The second option is the cleaner invariant.

## Aggregate consumer status

An aggregate multirow curvature consumer was not soundly reachable in this
lane because the sole current chart type cannot represent even one periodic
row window.  The correct next order is:

1. repair the chart signature and re-kernel-check its Lemma 30/37 wrappers;
2. construct the compatible unwrapped edge/chord lifts for
   `ReverseRowCyclicRoles`; then
3. audit a genuinely shared multirow packing statement.

At step 3, per-row inequalities alone are insufficient.  The consumer must
retain a shared global turn measure and a checked overlap-multiplicity or
disjointness statement for the middle arcs.  Without that shared packing
field, distinct two-point outside residuals can simply occupy overlapping or
nested arcs; the marginal `< pi` budgets do not imply a repeated pair, a U5
incidence, or `False`.

## Epistemic status

| Claim | Status |
|---|---|
| Same-cap source pair straddles the actual blocker | **PROVEN previously and retained** |
| Exact outside residual occupies the cyclic `q2,q3` roles | **PROVEN** |
| Full actual support occupies `q1,q2,q3,q4` | **PROVEN** |
| A current `CounterclockwiseAngleChart` realizes this periodic window | **DISPROVEN** |
| Current Lemma 30/37 wrappers are non-vacuous here | **BLOCKED by interface bug** |
| Curvature marginals alone force a collision | **NOT PROVEN; insufficient interface** |

## Validation

The predecessor scratch olean and the owned adapter were compiled in an
isolated temporary olean directory.  The owned file exits successfully.
Every printed theorem has axiom closure exactly:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorry`, `admit`, custom axiom, native computation, or unsafe
declaration in the owned Lean file.
