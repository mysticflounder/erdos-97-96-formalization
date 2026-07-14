# ATAIL producer readiness after the six-point arc-overtake core

## Verdict

The new arc-overtake theorem is a complete consumer, but the live producer is
not yet proved.

- **PROVEN:** `SixPointTwoCircleArcOvertakeOrderCore` and its arbitrary-carrier
  adapter derive `False` from three selected rows and the cyclic subsequence
  `O,A,D,E,F,C`.
- **PROVEN:** the live `U3FixedTriplePacket` already supplies the first of
  those rows, namely the selected four-class at `p` with support
  `{q,t1,t2,t3}`.
- **PROVEN:** away from center `p`, the sixth live `f2` critical row has at
  least two support points outside `{q,t1,t2,t3}`.  This is the strongest
  selection-robust positive row fact currently forced by the six-row live
  surface (`two_le_f2Row_support_sdiff_dangerousBase`).
- **PROVEN:** already on the five-row pair surface, `rows.uRow.center != p`,
  its support meets the dangerous base in at most two points, and at least two
  of its four support points (including `u`) lie outside the dangerous base.
  No current theorem gives a positive lower bound on that intersection.
- **NOT PROVEN:** the current hypotheses do not select the other two rows, do
  not force their five required named memberships, and do not force the
  required named cyclic order.
- **EMPIRICALLY VERIFIED, FINITE SHADOW ONLY:** the new core matches every
  archived `(5,5,5)` common-system assignment from rounds 10 through 28.
  Those are not nineteen independent occurrences: all nineteen assignments
  retain the same three metric rows.  Registering the new three-row cut at
  round 10 will therefore remove the whole old suffix at once.

The deterministic integration replay is now complete.  It compressed the old
`(5,5,5)` suffix to 19 accepted cuts and exposed a new round-19 assignment,
digest `ef90d3234ee6a42eaebe1728d27a771812e33262b8b098c457f295ef5314d96d`,
with metric rows

```text
0:{1,2,3,4}; 1:{0,2,6,7}; 2:{3,8,9,10};
3:{1,5,6,8}; 4:{0,5,9,11}.
```

The exact-oracle statuses are fail-closed (`TIMEOUT`, `TIMEOUT`, `NONUNIT`).
Thus the current finite shadow can avoid the exact arc-overtake antecedent;
it did not exhaust.  This is an integration/discovery result, not a live
counterexample.  Indefinite additional CEGAR rounds are not a substitute for
deriving the producer from the live MEC/cap/full-filter/no-M44 hypotheses.

## Exact live-facing instance

For the pinned `(5,5,5)` seed, the census labels are

```text
p=0, q=3, t1=2, t2=1, t3=4, u=5.
```

The new core's role map is therefore

```text
(O,A,C,D,E,F) = (p,t2,t1,q,t3,u).
```

The dangerous base class at `p` supplies

```text
{A,C,D,E} = {t2,t1,q,t3} in the p-row,
```

and hence `OA=OC=OD=OE`.  Only the following additional live-facing fields
are missing:

```lean
exists Kt2 : SelectedFourClass D.A t2,
  p  in Kt2.support and
  t1 in Kt2.support

exists Kq : SelectedFourClass D.A q,
  t2 in Kq.support and
  t3 in Kq.support and
  u  in Kq.support

CyclicSubsequence boundary p t2 q t3 u t1
```

Equivalently, after using the already-proved dangerous `p`-row, the consumer
needs only the distance closures

```text
dist t2 p = dist t2 t1,
dist q t2 = dist q t3 = dist q u,
```

and the indicated cyclic order.  The arbitrary-carrier adapter packages the
same information as `ThreeRowSupportData` with nine memberships total; four
of those nine are already supplied by `dangerousBaseSelectedFourClass`.

This is the smallest current theorem-facing incidence alternative.  A robust
production statement should permit cyclic rotation, reflection, and a
permutation of the dangerous triple rather than hard-code this one saved
placement, but it must still produce these two row clusters plus one compatible
six-label cyclic subsequence.

There is a sharper live formulation which matches the actual saved assignment.
Put `B = {q,t1,t2,t3}` and choose one `Hcritical` from `hcritical`.  It is
enough to choose a permutation `{A,C,D,E} = B` such that

```text
rows.uRow.center = D,
A,E are in rows.uRow.support,
Hcritical.centerAt p = A,
C is in the critical row selected for source p,
and p,A,D,E,u,C occur in that cyclic order.
```

The source `p` is automatically in its critical row, and `u` is automatically
in `rows.uRow.support`.  Hence these fields construct the two missing selected
classes above.  A faithful carrier pattern can preserve the dangerous `p`
class, the chosen critical row at `A`, and the supplied `u` row at `D`
simultaneously; no equality between the abstract `hcritical` witness and the
provenance of `rows.uRow` is needed.  In the saved `(5,5,5)` branch the fields
specialize to

```text
(A,C,D,E) = (t2,t1,q,t3).
```

This is important for scope: unlike the earlier common-provenance proposals,
the arc-overtake producer can in principle be stated on the existing five-row
pair surface.  Retaining `LiveCriticalRowProvenance` may help prove the fields,
but it is not a logical antecedent of the consumer lift.

## Why the current live hypotheses stop short

1. `D.K4` supplies a selected four-class at every carrier center, but does not
   put prescribed points in that class.
2. `hcritical` supplies a blocker row for every deleted source.  On the
   five-row pair surface it is independent of the supplied `rows`; even on the
   stronger outer construction, common-system provenance identifies supports
   only after blocker centers are known to agree.
3. A critical row automatically contains its own source.  It does not
   automatically contain the second point needed in the `t2` row or the two
   additional points needed in the `q` row.
4. Convex independence supplies a cyclic boundary indexing, but not the named
   order `p,t2,q,t3,u,t1` (or a proved orbit-equivalent order).
5. The live MEC, surplus-cap, second-large-cap, exact-filter, and no-M44 fields
   have not yet been connected to either of these membership clusters.

In the live formulation, the particularly sharp missing fact is an aligned
two-hit row: the supplied `u` row must meet the dangerous base in two points
`A,E`, and the critical row for source `p` must be centered at `A` and meet the
dangerous base again at `C`.  The blocker-graph countermodels show why no pure
cardinality argument supplies this alignment: a critical center map can remain
an injective fixed-point-free cycle, with singleton two-center fibers.
Convex/MEC/cap geometry must rule out or redirect that cycle in the named
dangerous/u-row sector.

The recurrence in rounds 10--28 must not be promoted to a forcing theorem.
The incidence solver retained the same three early DFS row choices while later
cuts changed other rows.  The new monotone cut is precisely the test of whether
the finite shadow can choose different rows, and the completed replay answers
yes.  The new assignment keeps the dangerous `p` row and the `t2` row
containing `{p,t1}`, but changes the `q` row from `{t2,t3,u,6}` to
`{t2,u,6,8}`.  In this branch the missing arc field is specifically the second
dangerous membership `t3 in Kq.support` (or an orbit-equivalent replacement).

## Choice among the three primary ATAIL alternatives

The closure plan names three primary incidence alternatives.

1. The sixteen-support five-row pattern is already consumed by
   `false_of_five_selectedFourClasses`, but the provenance audit found no
   learned cut whose rows all alias the five supplied live rows.  It asks the
   producer for substantially more selected-row data.
2. The cyclic-order family is now reduced to the arc-overtake instance above:
   one already-available dangerous row, five additional memberships in two
   rows, and one six-label order.  This is the preferred producer target.
3. `HasGlobalNestedPairProducer` asks for four global-row memberships, but the
   saved `(4,5,6)` coupled census proves that bare global K4 incidence does not
   force them on that placement.  It remains a useful fallback only when MEC,
   cap, or full-filter geometry supplies the missing alignment.

The preferred next theorem is therefore an **arc-overtake-or-alternate
coverage lemma** on the actual live surface: use the exact-radius/cap/MEC data
to force the two row clusters and compatible order above, or immediately
produce one of the already-consumed five-row/global-nested-pair alternatives.
The saved exact strictly-convex `(4,5,6)` witness requires this lemma to use a
field it genuinely omits.  Its concrete omissions are the live MEC disk field
and all-center K4; common blocker provenance, convex order, and cap signs alone
are insufficient.

## Rigor labels and next actions

- **PROVEN:** all consumer-side metric and order implications, dangerous
  `p`-row construction, boundary indexing, same-center support coupling, and
  the off-dangerous pair in the sixth row.
- **EMPIRICALLY VERIFIED / exact within the saved finite shadow:** archived
  round-10--28 coverage by the new core.
- **CONJECTURAL:** the live MEC/cap/full-filter/no-M44 hypotheses force an
  arc-overtake instance or another consumed incidence alternative.
- **COMPLETED:** matcher registration and clean replay from the frozen
  checkpoint; the first avoiding assignment is the round-19 residual above.
- **REQUIRED NOW:** state the live arc-overtake-or-alternate producer interface
  and attack the missing row membership using MEC/all-center-K4 and
  critical-row selection; analyze the new residual only to identify the
  immediate already-consumed alternate or the next small consumer.
- **NOT REQUIRED:** a predetermined number of additional rounds.  Even finite
  exhaustion of the current two fixed, non-target-faithful shadows would not
  prove the arbitrary-cardinality live producer without a sound coverage
  bridge.

## Theorem-bank check

Before this assessment, the required current registry, sibling `p97-rvol`
registry, legacy `erdos/97` registry, older `erdos-general-theorem/97`
registry, and indexed Lean corpora were searched.  No banked theorem produces
the two named row clusters or the six-label order from the current live
hypotheses.  The relevant bank hits are consumers (including the U5
q-critical families and `u1TwoLargeCapObstruction`) or re-exports of residual
declarations; they do not remove the incidence producer obligation.
