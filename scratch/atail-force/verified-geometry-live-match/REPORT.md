# Verified-geometry to live-parent match

Date: 2026-07-17

Status: **THE EARLIEST GEOMETRIC MATCH IS LEMMA 30/37 ON EACH ACTUAL
REVERSE ROW, BUT THE CURRENT LEAN ANGLE-CHART INTERFACE MAKES THAT ADAPTER
IMPOSSIBLE AS TYPED AND THE RESULT IS NONTERMINAL.  THE EARLIEST DIRECT
CONTRADICTION WITH AN EXISTING FORMAL CONSUMER IS LEMMA 81.  ITS
SOURCE-INDEXED LIVE NORMAL FORM IS MISSING EXACTLY ONE RETURN INCIDENCE AND
ONE FIVE-ROLE CYCLIC PLACEMENT.  NO THEOREM IN THE CURRENT `/opt/nfs`
LEDGERS SUPPLIES THOSE FIELDS FROM THE ROBUST PARENT.**

No production Lean, shared document, blueprint state, protected lane, or git
state was changed.  No Lean or Lake command was run.

## Required theorem-bank preflight

Before matching a new local geometric consumer, this audit checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches were also run for the shell-curvature, front-before-
isosceles, internal-diagonal, critical-row, and two-large-cap consumers.  The
search recovers the existing `FivePointCircleIsoscelesOrderCore` consumer,
the reverse-row adapters, `outsidePair_unique_capCenter`, and sibling
`u1TwoLargeCapObstruction`.  It does not recover a producer of the missing
positive cross-row incidence or cyclic placement below.  The certificate
banks contain bounded local consumers, not a classifier of the live robust
parent.

`/opt/nfs/possible-new-geometry.md` is a thematic companion to the numbered
results in `/opt/nfs/verified-results.md`; it does not contain an additional
completed parent theorem.

## Exact live surface used

The cap-strengthened robust surface is the scratch wrapper

```lean
L : FrontierLargeOppositeCapsBiApexRobustResidual B
```

over production objects

```lean
F0 : CriticalPairFrontier D S radius H
R  : FrontierCommonDeletionParentResidual F0
B  : FrontierBiApexRobustResidual R.
```

It retains `D.convex`, `D.K4`, `R.minimal`, `R.noM44`, the concrete
`CriticalShellSystem H`, robustness at both physical apices, and both cap-six
bounds.  On the separate exact-five/all-reverse subarm, the current scratch
surface additionally has

```lean
K        : PhysicalActualCriticalOmissionCycle H profile
hreverse : AllReverseMembership K
```

and hence one actual exact critical row per cycle edge, with a `2 + 2` split:
two adjacent sources in the physical cap and the two-point
`reverseOutsidePair K i` outside it.

## Earliest positive match: Lemmas 30 and 37

For every reverse edge, the checked scratch theorem

```lean
nonempty_reverseRowCyclicRoles K hreverse i P :
  Nonempty (ReverseRowCyclicRoles K i)
```

already constructs the exact geometric roles required by Lemmas 30 and 37:

```text
p < q1 < q2 < q3 < q4 < cycleEnd
point cycleEnd = point p
point p = reverse-row blocker center
{point q1, point q4} = adjacent same-cap source pair
{point q2, point q3} = reverseOutsidePair K i
support = {point q1, point q2, point q3, point q4}.
```

Thus the *mathematical* order and equal-radius hypotheses are sourced from an
actual row, not an anonymous selected quartet.

The current Lean adapter nevertheless stops before a valid application.  The
production type

```lean
CounterclockwiseAngleChart.orderedTriple_sign_neg :
  forall i < j < k,
    sign (oangle (point i) (point j) (point k)) = -1
```

is incompatible with `p < q < cycleEnd` and
`point cycleEnd = point p`: that ordered triple has repeated endpoints and
oriented-angle sign zero.  This is already isolated by the checked scratch
theorems

```lean
false_of_counterclockwiseAngleChart_point_period
not_exists_counterclockwiseAngleChart_for_reverseRowCyclicRoles.
```

The exact adapter repair is to restrict the sign field to one open
fundamental window, or at minimum add `point i != point k`.  After that repair
one still needs one **shared global** angle chart and a multirow
overlap/packing theorem.  Per-row Lemma-30/37 inequalities alone do not imply
a repeated outside pair, a return hit, or `False`.  Therefore this is the
earliest sourceable geometry, but not the earliest usable closer.

## Earliest terminal match: Lemma 81

Lemma 81 says that strict cyclic order

```text
W < F < P < X < Z
```

is incompatible with

```text
WF = WX = WZ
PZ = XZ.
```

Its metric/order consumer is already formalized by
`FivePointCircleIsoscelesOrderCore` and
`FivePointCircleIsoscelesOrderBridge`.  A repeated blocker fiber of `R`
normalizes almost all of its row data without any anonymous row choices.
Write

```text
P,X = the two fiber sources
Z   = their common blocker
W   = H.centerAt Z
Zrow = H.selectedAt P     -- centered at Z
Wrow = H.selectedAt Z     -- centered at W.
```

Production already gives

```text
P in Zrow,  X in Zrow,  Z in Wrow,
```

so `PZ = XZ` and the `WZ` leg are automatic.  The exact missing live fields
are:

```lean
-- first non-definitional row fact
X_mem_Wrow : X ∈ Wrow.support

-- independent order fact, for some remaining F in Wrow
F_mem_Wrow : F ∈ Wrow.support
cyclic_order : W < F < P < X < Z
```

The first field is exactly `FiberParentReturnHit` after orienting the two
fiber sources.  The second is not finite-set bookkeeping: the corrected
card-14 incidence/order fixture has a genuine return hit and available
choices of `F`, but no compatible Lemma-81 order.  That fixture is only an
exact finite incidence/order regression, not a Euclidean/full-filter
countermodel.

The complete implication chain is therefore

```text
L
  -> first-apex deletion robustness of R
  -> repeated blocker fiber (P,X) with common blocker Z
  -> P,X in Zrow and Z in Wrow
  -- MISSING: X in Wrow and W<F<P<X<Z for some F in Wrow
  -> WF=WX=WZ and PZ=XZ
  -> Lemma 81 / FivePointCircleIsoscelesOrderBridge
  -> False
  -> false_of_largeOppositeCapsBiApexRobust
  -> parent false_of_twoLargeCaps_commonCriticalMap.
```

The honest parent-scoped producer is a late-critical-system statement:

```lean
theorem exists_sourceIndexed_lemma81_occurrence
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    exists Hfav,
      exists fiber : FrontierCommonDeletionCriticalFiber (rebase R Hfav),
        CriticalFiberLemma81Occurrence fiber
```

This theorem is **OPEN**.  It must visibly use Euclidean/full-filter,
MEC/cap, `minimal`, or `noM44` information; blocker multiplicity and cap
cardinalities do not force it.

## Why Lemmas 101 and 113 do not improve the first missing field

### Lemma 101 and the endpoint-group chain

Lemma 101 is a proved global pair-capacity bound conditional on the complete
endpoint witness groups `Y_{t,r}`.  The live objects define the underlying
points and full distance fibers, but do not retain endpoint-group fullness or
the deficit parameters needed by its later consumers.

The exact-five physical row gives at least three strict-cap targets at one
endpoint radius, not `Y_t = B_t`.  The first-apex scratch role packet gives
at least two strict-cap targets, and four in its special same-radius-six arm,
but its current surface does not make two endpoint groups full.  Cap size
`>= 6` is not endpoint-group fullness.  Lemma 101 itself concludes only
inequalities; the first direct global contradiction in that chain, Lemma
152, requires two full endpoint groups.  Those two equalities are absent.

### Lemma 113

Lemma 113 is a valid smaller local contradiction, but it still needs the same
positive return incidence.  In the repeated-fiber notation above, its case 2
would close from

```text
X in Wrow,  F in Wrow,
cyclic order W < Z < X < P < F.
```

Indeed `Wrow` supplies `WZ = WX = WF`, while `Zrow` supplies `ZX = ZP`.
This is a useful second order cell and would merit a small formal consumer if
the producer ever reaches it.  It does not remove `FiberParentReturnHit`, and
the same finite card-14 repeated-fiber regression has no occurrence of this
normalized order either.  Thus adding Lemma 113 now would add a consumer
without a live producer.

Later results such as Lemmas 152, 184, and 194 similarly require full
endpoint groups, fixed outsiders, or ordered multirow ladders not produced by
`L`, `F0/R`, or the all-reverse exact-five packet.  Propositions 189--190 are
the corresponding scope guard: critical cover, pair capacity, and arbitrary
selected-row connectivity still admit unbounded abstract systems.

## Decision

There is no fully sourced direct-`False` theorem in the two `/opt/nfs`
ledgers.  The best live match is:

1. treat the Lemma-30/37 chart repair as supporting infrastructure only;
2. keep the direct parent target at `False`;
3. search specifically for the source-indexed return-and-order disjunction
   (Lemma 81 order or Lemma 113 order) after choosing a favorable critical
   system late; and
4. reject any proposed proof that uses only multiplicity, selected-row
   connectivity, cap sizes, or marginal curvature budgets.

If that producer lands, Lemma 81 already supplies the immediate on-spine
consumer.  If only the Lemma-113 order lands, formalizing its five-point
consumer is routine relative to the producer and is the next smallest
implementation step.
