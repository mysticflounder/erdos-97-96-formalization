# Exact-five critical-shell curvature/Kalmanson continuation

Date: 2026-07-16

Status: **KERNEL-CHECKED SOURCE-VALID BRIDGE; NEW TWO-ROW ESCAPE OUTPUT;
NO TERMINAL CONSUMER YET; NO PRODUCTION `sorry` CLOSED.**

This lane owns only
`scratch/atail-force/robust-large-radius-exact-five-shell-curvature/`.
It treats `scratch/atail-force/shell-curvature/` and production Lean as
read-only.

## Starting point

The input is the checked

```lean
LargeCapUniqueFiveUnusedCriticalRow D S H profile
```

from the exact-five large-radius consumer. It supplies:

- an unused point `z` in the closed second opposite cap;
- `z` outside the full exact five-point physical-apex radius class;
- the actual critical row `H.selectedAt z` from the retained common map;
- `z` in that row's exact four-point support; and
- a blocker for `z` distinct from the physical second apex.

The stopped `RobustSecondApexMinimalDeletion` scratch lane was inspected as
part of the route audit. It is a nonterminal decomposition and is not
duplicated here.

## New checked bridge

`RobustLargeRadiusExactFiveShellCurvature.lean` proves

```lean
nonempty_orderedUnusedCriticalShell
```

The result `OrderedUnusedCriticalShell` constructs one injective global CCW
boundary enumeration of `D.A`, cuts it at the actual blocker of `z`, and sorts
the complete exact critical support by `Finset.orderEmbOfFin`:

```text
blockerIndex < q1 < q2 < q3 < q4
support = {boundary q1, boundary q2, boundary q3, boundary q4}.
```

The unused source `z` is proved to equal one of these four displayed support
points. No support label or boundary order is assumed independently.

The production convex Kalmanson inequalities then give both endpoint chains:

```text
dist q1 q2 < dist q1 q3 < dist q1 q4
dist q4 q3 < dist q4 q2 < dist q4 q1.
```

These inequalities are actual consequences of the exact critical shell and
convex boundary order.

## New global-K4 consequence

The second checked theorem is

```lean
nonempty_orderedUnusedCriticalShellK4Escape
```

Global K4 selects rows centered at the two extreme shell points `q1` and
`q4`. The strict endpoint chains imply:

```text
card (q1Row.support intersect criticalSupport) <= 1
card (q4Row.support intersect criticalSupport) <= 1
card (q1Row.support \ criticalSupport) >= 3
card (q4Row.support \ criticalSupport) >= 3.
```

This is the first genuine two-row output of this continuation. It uses one
actual retained critical row plus two global-K4 rows and does not return to an
already classified deletion packet.

## Shell-curvature match

The read-only `ShellCurvature.lean` results are mathematically compatible
with the ordered support: the critical-shell equalities provide the two
equal-radius pairs needed by

```lean
two_sided_quarter_turn_separation_of_equal_radius
closed_middle_arc_add_center_turn_lt_pi_of_equal_radius.
```

However, both the scratch report and a fresh corpus search confirm that the
project still lacks the source adapter

```text
IsCcwConvexPolygon
  -> compatible real LiftedPolygonAngleChart.
```

`IsCcwConvexPolygon` exports quotient-angle signs and order. The curvature
theorems require one unwrapped real chart with monotone edge arguments,
chord-argument bounds, and the real period identity. The ordered-shell result
does not manufacture that missing lift.

Even after such a chart is built, the curvature conclusion is not itself a
contradiction. A cap/block or retained-shell consumer is still required.

## Terminal-consumer audit

The closest checked production sink is

```lean
CapCrossingKalmansonBridge.false_of_selected_rows_in_five_ccw_order
```

It requires three selected rows and six named cross-incidences in one
five-point order. The present source supplies one exact critical row and two
new global-K4 rows, but only the cardinal escape facts above. It does not
force either endpoint row to contain any particular named point.

The indexed searches after proving the escape packet found the U5
two-triple-center incompatibility families. They also require named shared or
adjacent incidences, so the cardinal escape output does not instantiate them.

The exact next missing antecedent is therefore one of:

1. a cap/block localization that puts enough of the six escaped witnesses in
   a common ordered arc and forces a named cross-incidence;
2. a direct retained-shell theorem turning the two `>= 3` escape counts into
   a common support point or a removable vertex; or
3. a lifted-chart construction plus a proved consumer of its strict
   curvature bound.

Producing only another anonymous selected row is insufficient.

## Incidence regression

The cardinal output alone has the abstract set-system model

```text
K  = {q1,q2,q3,q4}
R1 = {q2,a,b,c}
R4 = {q3,d,e,f}.
```

Both endpoint rows meet `K` once and have three points outside `K`, while the
two rows have no common point and provide none of the named incidences needed
by the Kalmanson or U5 sinks. This is not asserted to be a Euclidean K4
configuration. It is the regression gate showing that the checked cardinal
facts alone cannot justify a cross-row producer.

## Bank and corpus preflight

Before theorem construction, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Targeted `nthdegree docs search --lean` queries covered:

- exact four-shell cyclic order and curvature;
- real lifted edge/chord directions from `IsCcwConvexPolygon`;
- retained critical-shell consumers;
- sorted four-point supports;
- two endpoint K4 rows escaping one critical support; and
- U5 shared/adjacent selected-row incompatibilities.

No existing declaration constructs the real lifted chart or consumes the new
two-row escape counts without additional named incidences or cap placement.

## Validation

Focused Lean 4.27 check from `lean/`:

```bash
lake env lean -DwarningAsError=true -R .. \
  ../scratch/atail-force/robust-large-radius-exact-five-shell-curvature/\
RobustLargeRadiusExactFiveShellCurvature.lean
```

Result: success with no warnings. Both public theorems report exactly:

```text
propext, Classical.choice, Quot.sound
```

The module contains no `sorry`, `admit`, custom axiom, `native_decide`, or
unsafe declaration.

## Route consequence

- Exact-five critical row to ordered boundary support: **PROVEN**.
- Two-sided strict endpoint distance chains: **PROVEN**.
- Two global-K4 endpoint rows each exporting at least three points outside
  the original critical shell: **PROVEN**.
- `IsCcwConvexPolygon` to real lifted chart: **OPEN**.
- Cap/block or retained-shell terminal consumer: **OPEN**.
- Production `sorry` closed: **NONE**.

The next search object should be the cap placement or named cross-incidence
of the six escaped witnesses, not another anonymous `555/654` support core.
