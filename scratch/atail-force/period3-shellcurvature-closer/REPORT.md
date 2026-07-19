# Current production ShellCurvature / period-three closure audit

Date: 2026-07-18

Status: **NO SOURCE-FAITHFUL DIRECT CONTRADICTION FROM THE CURRENT TWO
PRODUCTION INTERFACES. THE CURRENT PERIODIC SHELL WRAPPERS HAVE INCONSISTENT
HYPOTHESES; AFTER THE MINIMAL INTERFACE REPAIR, THEIR THREE MARGINAL OUTPUTS
ARE EXACTLY COMPATIBLE WITH ONE SHARED TURN LEDGER.**

This lane owns only
`scratch/atail-force/period3-shellcurvature-closer/`. Production
`ConvexCyclicOrder/ShellCurvature.lean` was treated as read-only.

## Theorem-bank preflight

The required registries were checked before this audit:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches covered an exact-five period-three all-reverse cycle,
one shared cap order, shell curvature, nested outside pairs, and co-radial
outside-pair contradictions. The only immediate terminal found is the existing

```lean
false_of_transitionReverseOutsidePair_coRadial_firstApex
```

in
`ATail/LargeCapUniqueFivePhysicalOmissionTransitionGlobal.lean`. No banked
theorem turns the current three per-row curvature outputs into its missing
first-apex equality or into `False`.

## Kernel-checked current-interface obstruction

The current chart contains the unrestricted field

```lean
orderedTriple_sign_neg :
  forall i < j < k,
    sign (oangle (point i) (point j) (point k)) = -1
```

while both equal-radius shell wrappers require a cut-open periodic window

```lean
p < q1 < ... < cycleEnd
point cycleEnd = point p.
```

These are inconsistent before any radius equality, reverse row, or
period-three fact is used. The owned file kernel-checks the exact statement:

```lean
theorem false_of_counterclockwiseAngleChart_point_period
    (chart : CounterclockwiseAngleChart)
    (hpq : p < q) (hqend : q < cycleEnd)
    (hpointPeriod : chart.point cycleEnd = chart.point p) : False
```

The proof applies `orderedTriple_sign_neg` to `p < q < cycleEnd`, rewrites the
periodic endpoint, and reduces the angle with equal endpoints to sign zero,
contradicting sign `-1`. The companion theorem proves that no current chart can
have a prescribed periodic point window.

Therefore a call to either current equal-radius wrapper on an actual periodic
polygon would be vacuous. This cannot count as closure of the all-reverse leaf,
and production should not be wired through this false chart-construction
target.

The current source hashes are:

```text
859efa86438dc949d12c24095376d188fa6428c89167198fff0d742921dca572  ShellCurvature.lean
926e348b0940038b62c22e0a4c3fc70ed9e9da37be9f629b2fcf130ad9a7d1e6  LargeCapUniqueFivePhysicalOmissionSharedCapOrder.lean
d8f855b54355e49766bb11e5ff0864786cdd0770b3adcbfdad713f2f46fbd362  LargeCapUniqueFivePhysicalOmissionTransitionGlobal.lean
```

## What the production period-three/order packet really supplies

The production results are source-faithful and source-clean:

- `exists_entryZeroPeriodThreeCycle_containing_continuationSources` produces
  an actual critical-map cycle with period exactly three;
- `nonempty_transitionSharedCapOrder_of_all_omissions_reverseMembership`
  chooses one actual strict physical-cap block for every transition source and
  blocker; and
- its `straddle` field puts each actual blocker strictly between its source and
  successor in that one cap order.

The shared-order structure does **not** contain:

- a finite unwrapped edge/chord direction chart;
- a source-faithful ordering of the six outside roles in one shared cyclic
  window; or
- an overlap, coverage, or lower-curvature relation between the three outside
  middle intervals.

Thus it does not repair the chart obstruction and it does not aggregate the
three shell inequalities.

## Repaired-interface regression

Even after replacing the contradictory chart field by a bounded-window or
endpoint-distinct version, the current per-row conclusions are insufficient.
The exact `Fraction` replay in
`../period3-curvature-aggregate/check_fraction_ledger.py` passed on the current
tree. One shared total-turn ledger of `2*pi` supports:

- three distinct blocker centers;
- three distinct, strictly nested outside intervals;
- all twelve quantitative quarter-turn lower bounds; and
- all three middle-plus-center upper budgets.

The exact middle budgets, in units of `pi`, are `29/200`, `21/200`, and
`13/200`; all are below the allowed `9/10`. This is not a Euclidean or
full-critical-map countermodel. It is a decisive countermodel to deriving
`False` from only the shared total turn, the three role windows, pair
distinctness, and the scalar conclusions of the current ShellCurvature
theorems.

## Exact next source-faithful theorem

The smallest theorem that feeds an existing terminal remains the full-parent
occurrence producer:

```lean
theorem exists_transitionReverseOutsidePair_coRadial_firstApex_of_fullParent
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (T : PhysicalActualCriticalOmissionTransition H profile)
    (hallReverse : ...)
    (hperiodThree : ...) :
    ∃ q a b,
      a ≠ b ∧
      a ∈ transitionReverseOutsidePair T q ∧
      b ∈ transitionReverseOutsidePair T q ∧
      dist S.oppApex1 a = dist S.oppApex1 b
```

Its conclusion calls
`false_of_transitionReverseOutsidePair_coRadial_firstApex` immediately. A
curvature route can replace this occurrence only by proving a full-parent,
source-indexed multirow theorem whose conclusion is already terminal, for
example equality of two reverse outside pairs, this first-apex equality, a
complete named U5 sink antecedent, or `False`. Another per-row budget or
conditional chart adapter is nonterminal.

The required extra force must come from data absent from the marginal
ShellCurvature/order interfaces: the shared `CriticalShellSystem`, deletion
criticality/minimality, the first-apex frontier, MEC placement, or the full
`L` packet.

## Validation

Focused production builds passed:

```text
lake-build Erdos9796Proof.P97.ConvexCyclicOrder.ShellCurvature
lake-build Erdos9796Proof.P97.ATail.LargeCapUniqueFivePhysicalOmissionSharedCapOrder
lake-build Erdos9796Proof.P97.ATail.LargeCapUniqueFivePhysicalOmissionSingleOrbit
```

The owned scratch file compiled with warnings as errors. Its two obstruction
theorems and the production period-three/order/ShellCurvature endpoints all
have axiom closure exactly:

```text
propext, Classical.choice, Quot.sound
```

The exact marginal-ledger replay also passed. No source `sorry` is closed by
this audit.
