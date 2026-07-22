# Exact-two shell-curvature audit

Date: 2026-07-22

Scope: audit whether the production shell-curvature theorems add enough force
to the exact-two `2+1+1` finite survivors to reach an immediate terminal.  No
production file or shared closure document is changed here.

## Verdict

**MATERIAL NEW FORCE, BUT NOT SOURCE COVERAGE.**  Shell curvature refutes the
scalar turn ledger of all 12 banked exact-two `n = 11` survivors.  It does not
force the five-role Kalmanson consumer: eight survivors, including both final
round-six survivors, have no embedding of that schema.

Eleven survivors already contain four quarter-turn arcs satisfying the current
production terminal's stronger endpoint-separation condition.  The remaining
round-one card-five survivor contains four arcs with pairwise disjoint *open
turn supports*.  The cardinality-generic scratch theorem
`false_of_four_turnDisjoint_quarter_turn_arcs` now checks the exact weaker
condition and covers this survivor and, in fact, all 12 survivors.

This is still finite evidence, not a proof that every
`ExactTwoStrictHitDistribution` contains such an occurrence.  The live
mathematics is now an aggregate occurrence theorem, not another local metric
consumer.

## Production status

The old concern that shell curvature depends on an unproved direction-order or
winding certificate is stale:

- `openFundamentalWindowAngleChartOfCcwBoundary` in
  `ShellCurvatureConstruct.lean` constructs the chart from an injective CCW
  convex boundary;
- `exists_shellBoundaryIndexing` in `ShellCurvatureRows.lean` obtains that
  boundary from convex independence and noncollinearity;
- `centeredShell_has_quarterTurnSeparation` proves the four quarter-turn
  inequalities for an actual `CriticalFourShell`; and
- `centeredShell_has_globalShiftedQuarterTurnSeparation` in
  `ShellCurvatureTransport.lean` transports them into one common infinite
  boundary lift.

Thus chart construction and global transport are source-complete for actual
critical shells.  One small row interface is not currently packaged: the
finite search completes every center with a `SelectedFourClass` when that
center is absent from the fixed blocker image, while the production row adapter
accepts `CriticalFourShell`.

The first is plumbing, not new geometry: the underlying theorem
`openWindow_two_sided_quarter_turn_separation_of_equal_radius` uses four
boundary-ordered equal-radius points and therefore applies to a selected four
class after sorting its support.  It must nevertheless be formalized before a
source proof may call curvature on a completion row.  This distinction matters:
four of the 12 recorded survivors have no four-arc witness using blocker-image
centers alone.

The weaker aggregate interface is already kernel-checked in
`scratch/atail-force/unique4-turn-disjoint-curvature-terminal/` with only
`propext`, `Classical.choice`, and `Quot.sound`.  It remains scratch rather than
production, but it is no longer an open proof obligation.

The required theorem-bank preflight covered the registered P97 general-n banks
and `nthdegree docs search --lean` hits for shell-curvature, selected-row, U5,
and residual terminals.  No existing theorem with the weaker turn-support
separation contract was found.

## Exact finite ledger

[`check_curvature_ledger.py`](check_curvature_ledger.py) normalizes
`pi / 2 = 1`, `pi = 2`, and `2 * pi = 4`.  For each selected row it sorts the
four support offsets in the centered reverse boundary order and records the two
strongest production conclusions:

- curvature from the center to the second support is greater than `1`; and
- curvature from the third support to the end of the centered period is greater
  than `1`.

It then imposes positive exterior turns and one full turn of total curvature.
All constraints are rational QF_LRA.  The checker also enumerates five-role
Kalmanson embeddings, current separated-arc witnesses, and the exact weaker
turn-disjoint witnesses.

[`audit_curvature_rounds.py`](audit_curvature_rounds.py) replays all six rounds
and both cap profiles.  The durable output is
[`all_rounds.curvature.json`](all_rounds.curvature.json):

| check | result |
|---|---:|
| survivor ledgers | 12 |
| scalar-turn UNSAT | 12 / 12 |
| current four-separated-arc witness | 11 / 12 |
| weaker four-turn-disjoint witness | 12 / 12 |
| five-role consumer absent | 8 / 12 |
| weaker witness using blocker-image exact shells only | 8 / 12 |

These are exact statements about the recorded finite artifacts.  They are not
Euclidean realizations, exhaustive models of the final Boolean bank, or
arbitrary-cardinality coverage of `OriginalUniqueFourResidual`.

## The exceptional survivor and its checked aggregate consumer

For round one, card five, a deletion-minimal normalized core is

```text
center 0, left:   t0 + t1 + t2 > 1
center 2, left:   t9 + t10 > 1
center 3, left:   t8 > 1
center 6, right:  t3 > 1
t4, t5, t6, t7 > 0
sum(t0,...,t10) = 4.
```

The four strict quarter-turn sums use disjoint turn increments.  They contradict
the full-turn budget.  They fail the current theorem

```lean
ShellCurvature.false_of_four_separated_quarter_turn_arcs
```

only because that theorem asks for `b₁ ≤ a₂`, `b₂ ≤ a₃`, and `b₃ ≤ a₄`.
By definition,

```lean
openWindowArcCurvature chart a b =
  chart.edgeArg (b - 1) - chart.edgeArg a
```

so its proof compares `edgeArg (b - 1)` with `edgeArg a'`.  The exact sufficient
condition is therefore

```text
b₁ - 1 ≤ a₂,  b₂ - 1 ≤ a₃,  b₃ - 1 ≤ a₄.
```

Replacing the three stronger hypotheses by these three conditions leaves the
existing proof unchanged apart from the `omega` obligations.  The checked
scratch theorem is

```lean
Problem97.ShellCurvature
  .false_of_four_turnDisjoint_quarter_turn_arcs
```

in `unique4-turn-disjoint-curvature-terminal/TurnDisjointCurvatureTerminal.lean`.
Its theorem statement also records the exact last-window condition
`b₄ - 1 < chart.windowEnd`.

## Exact first missing source field

After adding the selected-row adapter and using the checked one-index aggregate
generalization, the first unproved source statement is:

> From `OriginalUniqueFourResidual F` plus
> `ExactTwoStrictHitDistribution R`, choose four actual global-K4 rows and one
> of the two strong transported quarter-turn arcs from each row such that, after
> a common cyclic re-cut and period translations, their open turn supports are
> pairwise disjoint.

Equivalently, the four lifted endpoint pairs must lie in one period and satisfy

```text
a1 < b1,  b1 - 1 ≤ a2,
a2 < b2,  b2 - 1 ≤ a3,
a3 < b3,  b3 - 1 ≤ a4,
a4 < b4.
```

A useful dispatcher may weaken the target to a disjunction: either this
turn-disjoint packet occurs, or the six memberships of
`false_of_two_k2_three_selected_classes` occur.  The current finite audit does
not prove either disjunction uniformly.  It only shows that curvature is a
load-bearing discriminator which should be added to the next source-level
occurrence analysis.

Do not resume literal Kalmanson CEGAR as if these 12 ledgers were viable.  The
next computation, if used, should encode the transported curvature arcs and
search for a uniform occurrence schema or a genuine curvature-SAT survivor.

## Replay

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run --with z3-solver python \
  scratch/atail-force/unique4-exact-two-core-port/audit_curvature_rounds.py \
  scratch/atail-force/unique-arm-whole-carrier-source-audit/cegar-exact-two \
  --output \
  scratch/atail-force/unique4-exact-two-core-port/all_rounds.curvature.json
```
